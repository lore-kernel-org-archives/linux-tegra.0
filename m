From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Tue,  8 Apr 2014 12:15:33 -0700
Message-ID: <1396984533-13900-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tiwai-l3A5Bk7waGM@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds a driver for the HDA block in Tegra SoCs.  The HDA bus is
used to communicate with the HDMI codec on Tegra124.

Most of the code is re-used from the Intel/PCI HDA driver.  It brings
over only two of thw module params, power_save and probe_mask.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra124-hda.txt         |  20 +
 sound/pci/hda/Kconfig                              |  14 +
 sound/pci/hda/Makefile                             |   2 +
 sound/pci/hda/hda_tegra.c                          | 695 +++++++++++++++++++++
 4 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt
 create mode 100644 sound/pci/hda/hda_tegra.c

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt
new file mode 100644
index 0000000..c9256d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt
@@ -0,0 +1,20 @@
+NVIDIA Tegra124 HDA controller
+
+Required properties:
+- compatible : "nvidia,tegra124-hda"
+- reg : Should contain the HDA registers location and length.
+- interrupts : The interrupt from the hda controller.
+- clocks : Must contain an entry for each required entry in clock-names.
+- clock-names : Must include the following entries: hda, hdacodec_2x, hda2hdmi
+
+Example:
+
+hda@70030000 {
+	compatible = "nvidia,tegra124-hda";
+	reg = <0x0 0x70030000 0x10000>;
+	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA124_CLK_HDA>,
+		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+	clock-names = "hda", "hda2hdmi", "hdacodec_2x";
+};
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index ac17c3f..4f6ee6b 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -20,6 +20,20 @@ config SND_HDA_INTEL
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-intel.
 
+config SND_HDA_TEGRA
+	tristate "Tegra HD Audio"
+	select SND_HDA
+	help
+	  Say Y here to support the HDA controller present in Nvidia
+	  Tegra SoCs
+
+	  This options enables support for the HD Audio controller
+	  present in some Nvidia Tegra SoCs, used to communicate audio
+	  to the HDMI output.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-tegra.
+
 if SND_HDA
 
 config SND_HDA_DSP_LOADER
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index d0d0c19..194f3093 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -1,5 +1,6 @@
 snd-hda-intel-objs := hda_intel.o
 snd-hda-controller-objs := hda_controller.o
+snd-hda-tegra-objs := hda_tegra.o
 # for haswell power well
 snd-hda-intel-$(CONFIG_SND_HDA_I915) +=	hda_i915.o
 
@@ -47,3 +48,4 @@ obj-$(CONFIG_SND_HDA_CODEC_HDMI) += snd-hda-codec-hdmi.o
 # otherwise the codec patches won't be hooked before the PCI probe
 # when built in kernel
 obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
+obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
new file mode 100644
index 0000000..c36bbca
--- /dev/null
+++ b/sound/pci/hda/hda_tegra.c
@@ -0,0 +1,695 @@
+/*
+ *
+ *  Implementation of primary alsa driver code base for Tegra HDA.
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License as published by the Free
+ *  Software Foundation; either version 2 of the License, or (at your option)
+ *  any later version.
+ *
+ *  This program is distributed in the hope that it will be useful, but WITHOUT
+ *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ *  more details.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/clocksource.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dma-mapping.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/reboot.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <linux/of_device.h>
+#include <linux/time.h>
+#include <linux/completion.h>
+
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <linux/firmware.h>
+#include "hda_codec.h"
+#include "hda_controller.h"
+#include "hda_priv.h"
+
+#define DRV_NAME "tegra-hda"
+
+/* Defines for Nvidia Tegra HDA support */
+#define NVIDIA_TEGRA_HDA_BAR0_OFFSET           0x8000
+
+#define NVIDIA_TEGRA_HDA_CFG_CMD_OFFSET        0x1004
+#define NVIDIA_TEGRA_HDA_CFG_BAR0_OFFSET       0x1010
+
+#define NVIDIA_TEGRA_HDA_ENABLE_IO_SPACE       (1 << 0)
+#define NVIDIA_TEGRA_HDA_ENABLE_MEM_SPACE      (1 << 1)
+#define NVIDIA_TEGRA_HDA_ENABLE_BUS_MASTER     (1 << 2)
+#define NVIDIA_TEGRA_HDA_ENABLE_SERR           (1 << 8)
+#define NVIDIA_TEGRA_HDA_DISABLE_INTR          (1 << 10)
+#define NVIDIA_TEGRA_HDA_BAR0_INIT_PROGRAM     0xFFFFFFFF
+#define NVIDIA_TEGRA_HDA_BAR0_FINAL_PROGRAM    (1 << 14)
+
+/* IPFS */
+#define NVIDIA_TEGRA_HDA_IPFS_CONFIG           0x180
+#define NVIDIA_TEGRA_HDA_IPFS_EN_FPCI          0x1
+
+#define NVIDIA_TEGRA_HDA_IPFS_FPCI_BAR0        0x80
+#define NVIDIA_TEGRA_HDA_FPCI_BAR0_START       0x40
+
+#define NVIDIA_TEGRA_HDA_IPFS_INTR_MASK        0x188
+#define NVIDIA_TEGRA_HDA_IPFS_EN_INTR          (1 << 16)
+
+struct hda_tegra_data {
+	struct azx chip;
+	struct platform_device *pdev;
+	struct clk **platform_clks;
+	int platform_clk_count;
+	void __iomem *remap_config_addr;
+};
+
+static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
+module_param_array(probe_mask, int, NULL, 0444);
+MODULE_PARM_DESC(probe_mask, "Bitmask to probe codecs (default = -1).");
+
+static int power_save = CONFIG_SND_HDA_POWER_SAVE_DEFAULT;
+static int *power_save_addr = &power_save;
+module_param(power_save, bint, 0644);
+MODULE_PARM_DESC(power_save,
+		 "Automatic power-saving timeout (in seconds, 0 = disable).");
+
+/*
+ * DMA page allocation ops.
+ */
+static int dma_alloc_pages(struct azx *chip,
+			   int type,
+			   size_t size,
+			   struct snd_dma_buffer *buf)
+{
+	return snd_dma_alloc_pages(type,
+				   chip->card->dev,
+				   size, buf);
+}
+
+static void dma_free_pages(struct azx *chip, struct snd_dma_buffer *buf)
+{
+	snd_dma_free_pages(buf);
+}
+
+static int substream_alloc_pages(struct azx *chip,
+				 struct snd_pcm_substream *substream,
+				 size_t size)
+{
+	struct azx_dev *azx_dev = get_azx_dev(substream);
+
+	azx_dev->bufsize = 0;
+	azx_dev->period_bytes = 0;
+	azx_dev->format_val = 0;
+	return snd_pcm_lib_malloc_pages(substream, size);
+}
+
+static int substream_free_pages(struct azx *chip,
+				struct snd_pcm_substream *substream)
+{
+	return snd_pcm_lib_free_pages(substream);
+}
+
+/*
+ * Register access ops. Tegra HDA register access is DWORD only.
+ */
+#define MASK_LONG_ALIGN		0x3UL
+#define SHIFT_BYTE		3
+#define SHIFT_BITS(addr)	\
+	(((unsigned int)(addr) & MASK_LONG_ALIGN) << SHIFT_BYTE)
+#define ADDR_ALIGN_L(addr)	\
+	(void *)((unsigned int)(addr) & ~MASK_LONG_ALIGN)
+#define MASK(bits)		(BIT(bits) - 1)
+#define MASK_REG(addr, bits)	(MASK(bits) << SHIFT_BITS(addr))
+
+static void tegra_hda_writel(u32 value, u32 *addr)
+{
+	writel(value, addr);
+}
+
+static u32 tegra_hda_readl(u32 *addr)
+{
+	return readl(addr);
+}
+
+static void tegra_hda_writew(u16 value, u16 *addr)
+{
+	unsigned int shift_bits = SHIFT_BITS(addr);
+	writel((readl(ADDR_ALIGN_L(addr)) & ~MASK_REG(addr, 16)) |
+	       ((value) << shift_bits), ADDR_ALIGN_L(addr));
+}
+
+static u16 tegra_hda_readw(u16 *addr)
+{
+	return (readl(ADDR_ALIGN_L(addr)) >> SHIFT_BITS(addr)) & MASK(16);
+}
+
+static void tegra_hda_writeb(u8 value, u8 *addr)
+{
+	writel((readl(ADDR_ALIGN_L(addr)) & ~MASK_REG(addr, 8)) |
+	       ((value) << SHIFT_BITS(addr)), ADDR_ALIGN_L(addr));
+}
+
+static u8 tegra_hda_readb(u8 *addr)
+{
+	return (readl(ADDR_ALIGN_L(addr)) >> SHIFT_BITS(addr)) & MASK(8);
+}
+
+static const struct hda_controller_ops tegra_hda_reg_ops = {
+	.reg_writel = tegra_hda_writel,
+	.reg_readl = tegra_hda_readl,
+	.reg_writew = tegra_hda_writew,
+	.reg_readw = tegra_hda_readw,
+	.reg_writeb = tegra_hda_writeb,
+	.reg_readb = tegra_hda_readb,
+	.dma_alloc_pages = dma_alloc_pages,
+	.dma_free_pages = dma_free_pages,
+	.substream_alloc_pages = substream_alloc_pages,
+	.substream_free_pages = substream_free_pages,
+};
+
+static int tegra_hda_acquire_irq(struct azx *chip, int do_disconnect)
+{
+	struct hda_tegra_data *tdata =
+		container_of(chip, struct hda_tegra_data, chip);
+	int irq_id = platform_get_irq(tdata->pdev, 0);
+
+	if (devm_request_irq(chip->card->dev, irq_id, azx_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
+		dev_err(chip->card->dev,
+			"unable to grab IRQ %d, disabling device\n",
+			irq_id);
+		if (do_disconnect)
+			snd_card_disconnect(chip->card);
+		return -1;
+	}
+	chip->irq = irq_id;
+	return 0;
+}
+
+static void tegra_hda_reg_update_bits(void __iomem *base, unsigned int reg,
+				      unsigned int mask, unsigned int val)
+{
+	unsigned int data;
+
+	data = readl(base + reg);
+	data &= ~mask;
+	data |= (val & mask);
+	writel(data, base + reg);
+}
+
+static void hda_tegra_init(struct hda_tegra_data *tdata)
+{
+	/*Enable the PCI access */
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_IPFS_CONFIG,
+				  NVIDIA_TEGRA_HDA_IPFS_EN_FPCI,
+				  NVIDIA_TEGRA_HDA_IPFS_EN_FPCI);
+	/* Enable MEM/IO space and bus master */
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_CFG_CMD_OFFSET, 0x507,
+				  NVIDIA_TEGRA_HDA_ENABLE_MEM_SPACE |
+				  NVIDIA_TEGRA_HDA_ENABLE_IO_SPACE |
+				  NVIDIA_TEGRA_HDA_ENABLE_BUS_MASTER |
+				  NVIDIA_TEGRA_HDA_ENABLE_SERR);
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_CFG_BAR0_OFFSET, 0xFFFFFFFF,
+				  NVIDIA_TEGRA_HDA_BAR0_INIT_PROGRAM);
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_CFG_BAR0_OFFSET, 0xFFFFFFFF,
+				  NVIDIA_TEGRA_HDA_BAR0_FINAL_PROGRAM);
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_IPFS_FPCI_BAR0, 0xFFFFFFFF,
+				  NVIDIA_TEGRA_HDA_FPCI_BAR0_START);
+	tegra_hda_reg_update_bits(tdata->remap_config_addr,
+				  NVIDIA_TEGRA_HDA_IPFS_INTR_MASK,
+				  NVIDIA_TEGRA_HDA_IPFS_EN_INTR,
+				  NVIDIA_TEGRA_HDA_IPFS_EN_INTR);
+
+	return;
+}
+
+static void hda_tegra_enable_clocks(struct hda_tegra_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->platform_clk_count; i++)
+		clk_prepare_enable(data->platform_clks[i]);
+}
+
+static void hda_tegra_disable_clocks(struct hda_tegra_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->platform_clk_count; i++)
+		clk_disable_unprepare(data->platform_clks[i]);
+}
+
+#if CONFIG_PM_SLEEP
+/*
+ * power management
+ */
+static int tegra_hda_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct azx_pcm *p;
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	list_for_each_entry(p, &chip->pcm_list, list)
+		snd_pcm_suspend_all(p->pcm);
+	if (chip->initialized)
+		snd_hda_suspend(chip->bus);
+
+	if (pm_runtime_active(card->dev)) {
+		azx_stop_chip(chip);
+		azx_enter_link_reset(chip);
+	}
+
+	return 0;
+}
+
+static int tegra_hda_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct hda_tegra_data *tdata =
+		container_of(chip, struct hda_tegra_data, chip);
+
+	if (pm_runtime_active(card->dev)) {
+		hda_tegra_init(tdata);
+
+		azx_init_chip(chip, 1);
+
+		snd_hda_resume(chip->bus);
+		snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	}
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+#ifdef CONFIG_PM_RUNTIME
+static int tegra_hda_runtime_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct hda_tegra_data *tdata =
+		container_of(chip, struct hda_tegra_data, chip);
+
+	/* enable controller wake up event */
+	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+		  STATESTS_INT_MASK);
+
+	azx_stop_chip(chip);
+	azx_enter_link_reset(chip);
+	hda_tegra_disable_clocks(tdata);
+	return 0;
+}
+
+static int tegra_hda_runtime_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct hda_bus *bus;
+	struct hda_codec *codec;
+	struct hda_tegra_data *tdata =
+		container_of(chip, struct hda_tegra_data, chip);
+	int status;
+
+	hda_tegra_enable_clocks(tdata);
+
+	/* Read STATESTS before controller reset */
+	status = azx_readw(chip, STATESTS);
+
+	hda_tegra_init(tdata);
+
+	azx_init_chip(chip, 1);
+
+	snd_hda_resume(chip->bus);
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+
+	bus = chip->bus;
+	if (status && bus) {
+		list_for_each_entry(codec, &bus->codec_list, list)
+			if (status & (1 << codec->addr))
+				queue_delayed_work(codec->bus->workq,
+						   &codec->jackpoll_work,
+						   codec->jackpoll_interval);
+	}
+
+	/* disable controller Wake Up event*/
+	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) & ~STATESTS_INT_MASK);
+
+	return 0;
+}
+
+#endif /* CONFIG_PM_RUNTIME */
+
+static const struct dev_pm_ops azx_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_hda_suspend, tegra_hda_resume)
+	SET_RUNTIME_PM_OPS(tegra_hda_runtime_suspend,
+			   tegra_hda_runtime_resume,
+			   NULL)
+};
+
+/*
+ * reboot notifier for hang-up problem at power-down
+ */
+static int tegra_hda_halt(struct notifier_block *nb, unsigned long event,
+			  void *buf)
+{
+	struct azx *chip = container_of(nb, struct azx, reboot_notifier);
+	snd_hda_bus_reboot_notify(chip->bus);
+	azx_stop_chip(chip);
+	return NOTIFY_OK;
+}
+
+static void tegra_hda_notifier_register(struct azx *chip)
+{
+	chip->reboot_notifier.notifier_call = tegra_hda_halt;
+	register_reboot_notifier(&chip->reboot_notifier);
+}
+
+static void tegra_hda_notifier_unregister(struct azx *chip)
+{
+	if (chip->reboot_notifier.notifier_call)
+		unregister_reboot_notifier(&chip->reboot_notifier);
+}
+
+/*
+ * destructor
+ */
+static int tegra_hda_free(struct azx *chip)
+{
+	int i;
+
+	if (chip->running)
+		pm_runtime_get_noresume(chip->card->dev);
+
+	tegra_hda_notifier_unregister(chip);
+
+	if (chip->initialized) {
+		for (i = 0; i < chip->num_streams; i++)
+			azx_stream_stop(chip, &chip->azx_dev[i]);
+		azx_stop_chip(chip);
+	}
+
+	azx_free_stream_pages(chip);
+
+	return 0;
+}
+
+static int tegra_hda_dev_free(struct snd_device *device)
+{
+	return tegra_hda_free(device->device_data);
+}
+
+static const char * const tegra_clk_names[] = {
+	"hda",
+	"hda2codec_2x",
+	"hda2hdmi",
+};
+
+static int hda_tegra_init_chip(struct azx *chip)
+{
+	struct hda_tegra_data *tdata =
+		container_of(chip, struct hda_tegra_data, chip);
+	struct device *dev = &tdata->pdev->dev;
+	struct resource *res, *region;
+	int i;
+
+	tdata->platform_clk_count = ARRAY_SIZE(tegra_clk_names);
+	tdata->platform_clks = devm_kzalloc(dev,
+					    tdata->platform_clk_count *
+						sizeof(*tdata->platform_clks),
+					    GFP_KERNEL);
+	if (!tdata->platform_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < tdata->platform_clk_count; i++) {
+		tdata->platform_clks[i] = devm_clk_get(dev, tegra_clk_names[i]);
+		if (IS_ERR(tdata->platform_clks[i]))
+			return PTR_ERR(tdata->platform_clks[i]);
+	}
+
+	res = platform_get_resource(tdata->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	region = devm_request_mem_region(dev, res->start,
+					 resource_size(res),
+					 tdata->pdev->name);
+	if (!region)
+		return -ENOMEM;
+
+	chip->addr = res->start;
+	chip->remap_addr = devm_ioremap(dev, res->start, resource_size(res));
+	if (!chip->remap_addr)
+		return -ENXIO;
+
+	tdata->remap_config_addr = chip->remap_addr;
+	chip->remap_addr += NVIDIA_TEGRA_HDA_BAR0_OFFSET;
+	chip->addr += NVIDIA_TEGRA_HDA_BAR0_OFFSET;
+
+	hda_tegra_enable_clocks(tdata);
+
+	hda_tegra_init(tdata);
+
+	return 0;
+}
+
+static void power_down_all_codecs(struct azx *chip)
+{
+	/* The codecs were powered up in snd_hda_codec_new().
+	 * Now all initialization done, so turn them down if possible
+	 */
+	struct hda_codec *codec;
+	list_for_each_entry(codec, &chip->bus->codec_list, list)
+		snd_hda_power_down(codec);
+}
+
+static int tegra_hda_first_init(struct azx *chip)
+{
+	struct snd_card *card = chip->card;
+	int err;
+	unsigned short gcap;
+
+	err = hda_tegra_init_chip(chip);
+	if (err)
+		return err;
+
+	if (tegra_hda_acquire_irq(chip, 0) < 0)
+		return -EBUSY;
+
+	synchronize_irq(chip->irq);
+
+	gcap = azx_readw(chip, GCAP);
+	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
+
+	/* read number of streams from GCAP register instead of using
+	 * hardcoded value
+	 */
+	chip->capture_streams = (gcap >> 8) & 0x0f;
+	chip->playback_streams = (gcap >> 12) & 0x0f;
+	if (!chip->playback_streams && !chip->capture_streams) {
+		/* gcap didn't give any info, switching to old method */
+		chip->playback_streams = ICH6_NUM_PLAYBACK;
+		chip->capture_streams = ICH6_NUM_CAPTURE;
+	}
+	chip->capture_index_offset = 0;
+	chip->playback_index_offset = chip->capture_streams;
+	chip->num_streams = chip->playback_streams + chip->capture_streams;
+	chip->azx_dev = devm_kzalloc(card->dev,
+				     chip->num_streams * sizeof(*chip->azx_dev),
+				     GFP_KERNEL);
+	if (!chip->azx_dev)
+		return -ENOMEM;
+
+	err = azx_alloc_stream_pages(chip);
+	if (err < 0)
+		return err;
+
+	/* initialize streams */
+	azx_init_stream(chip);
+
+	/* initialize chip */
+	azx_init_chip(chip, 1);
+
+	/* codec detection */
+	if (!chip->codec_mask) {
+		dev_err(card->dev, "no codecs found!\n");
+		return -ENODEV;
+	}
+
+	strcpy(card->driver, "HDA-Tegra");
+	strcpy(card->shortname, "HDA-Tegra");
+	snprintf(card->longname, sizeof(card->longname),
+		 "%s at 0x%lx irq %i",
+		 card->shortname, chip->addr, chip->irq);
+
+	return 0;
+}
+
+/*
+ * constructor
+ */
+static int tegra_hda_create(struct snd_card *card,
+			    int dev,
+			    struct platform_device *pdev,
+			    unsigned int driver_caps,
+			    const struct hda_controller_ops *hda_ops,
+			    struct hda_tegra_data *tdata)
+{
+	static struct snd_device_ops ops = {
+		.dev_free = tegra_hda_dev_free,
+	};
+	struct azx *chip;
+	int err;
+
+	chip = &tdata->chip;
+
+	spin_lock_init(&chip->reg_lock);
+	mutex_init(&chip->open_mutex);
+	chip->card = card;
+	chip->ops = hda_ops;
+	chip->irq = -1;
+	chip->driver_caps = driver_caps;
+	chip->driver_type = driver_caps & 0xff;
+	chip->dev_index = dev;
+	INIT_LIST_HEAD(&chip->pcm_list);
+	INIT_LIST_HEAD(&chip->list);
+
+	chip->position_fix[0] = POS_FIX_AUTO;
+	chip->position_fix[1] = POS_FIX_AUTO;
+	chip->codec_probe_mask = probe_mask[dev];
+
+	chip->single_cmd = false;
+	chip->snoop = true;
+
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
+		dev_err(card->dev, "Error creating device [card]!\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static unsigned int tegra_driver_flags = AZX_DCAPS_RIRB_DELAY |
+					 AZX_DCAPS_PM_RUNTIME;
+
+static const struct of_device_id tegra_platform_hda_match[] = {
+	{ .compatible = "nvidia,tegra124-hda", .data = &tegra_driver_flags },
+	{},
+};
+
+static int hda_tegra_probe(struct platform_device *pdev)
+{
+	static int dev;
+	struct snd_card *card;
+	struct azx *chip;
+	struct hda_tegra_data *tdata;
+	const struct of_device_id *of_id;
+	const unsigned int *driver_data;
+	int err;
+
+	if (dev >= SNDRV_CARDS)
+		return -ENODEV;
+
+	of_id = of_match_device(tegra_platform_hda_match, &pdev->dev);
+	if (!of_id)
+		return -EINVAL;
+
+	tdata = devm_kzalloc(&pdev->dev, sizeof(*tdata), GFP_KERNEL);
+	if (!tdata)
+		return -ENOMEM;
+	tdata->pdev = pdev;
+	chip = &tdata->chip;
+
+	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Error creating card!\n");
+		return err;
+	}
+
+	driver_data = of_id->data;
+	err = tegra_hda_create(card, dev, pdev, *driver_data,
+			       &tegra_hda_reg_ops, tdata);
+	if (err < 0)
+		goto out_free;
+	card->private_data = chip;
+
+	dev_set_drvdata(&pdev->dev, card);
+
+	err = tegra_hda_first_init(chip);
+	if (err < 0)
+		goto out_free;
+
+	/* create codec instances */
+	err = azx_codec_create(chip, NULL, 0, power_save_addr);
+	if (err < 0)
+		goto out_free;
+
+	err = azx_codec_configure(chip);
+	if (err < 0)
+		goto out_free;
+
+	/* create PCM streams */
+	err = snd_hda_build_pcms(chip->bus);
+	if (err < 0)
+		goto out_free;
+
+	/* create mixer controls */
+	err = azx_mixer_create(chip);
+	if (err < 0)
+		goto out_free;
+
+	err = snd_card_register(chip->card);
+	if (err < 0)
+		goto out_free;
+
+	chip->running = 1;
+	pm_runtime_enable(chip->card->dev);
+	hda_tegra_disable_clocks(tdata);
+	power_down_all_codecs(chip);
+	tegra_hda_notifier_register(chip);
+
+	dev++;
+	return 0;
+
+out_free:
+	snd_card_free(card);
+	return err;
+}
+
+static int hda_tegra_remove(struct platform_device *pdev)
+{
+	return snd_card_free(dev_get_drvdata(&pdev->dev));
+}
+
+static struct platform_driver tegra_platform_hda = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.pm = &azx_pm,
+		.of_match_table = tegra_platform_hda_match,
+	},
+	.probe = hda_tegra_probe,
+	.remove = hda_tegra_remove,
+};
+module_platform_driver(tegra_platform_hda);
+
+MODULE_DESCRIPTION("Tegra HDA bus driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, tegra_platform_hda_match);
-- 
1.8.1.3.605.g02339dd
