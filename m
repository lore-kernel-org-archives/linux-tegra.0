From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=205/7=5D=20ASoC=3A=20tegra=3A=20add=20ac97=20host=20driver?=
Date: Thu, 20 Dec 2012 00:17:34 +0100
Message-ID: <1355959056-6009-5-git-send-email-dev@lynxeye.de>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds the driver for the Tegra 2x AC97 host controller.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 sound/soc/tegra/Kconfig        |   8 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra20_ac97.c | 479 +++++++++++++++++++++++++++++++++=
++++++++
 sound/soc/tegra/tegra20_ac97.h |  95 ++++++++
 4 Dateien ge=C3=A4ndert, 584 Zeilen hinzugef=C3=BCgt(+)
 create mode 100644 sound/soc/tegra/tegra20_ac97.c
 create mode 100644 sound/soc/tegra/tegra20_ac97.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 19e5fe7..763c68d 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -6,6 +6,14 @@ config SND_SOC_TEGRA
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
=20
+config SND_SOC_TEGRA20_AC97
+	tristate
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
+	help
+	  Say Y or M if you want to add support for codecs attached to the
+	  Tegra20 AC97 interface. You will also need to select the individual
+	  machine drivers to support below.
+
 config SND_SOC_TEGRA20_DAS
 	tristate
 	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 391e78a..02513d9 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -1,6 +1,7 @@
 # Tegra platform Support
 snd-soc-tegra-pcm-objs :=3D tegra_pcm.o
 snd-soc-tegra-utils-objs +=3D tegra_asoc_utils.o
+snd-soc-tegra20-ac97-objs :=3D tegra20_ac97.o
 snd-soc-tegra20-das-objs :=3D tegra20_das.o
 snd-soc-tegra20-i2s-objs :=3D tegra20_i2s.o
 snd-soc-tegra20-spdif-objs :=3D tegra20_spdif.o
@@ -9,6 +10,7 @@ snd-soc-tegra30-i2s-objs :=3D tegra30_i2s.o
=20
 obj-$(CONFIG_SND_SOC_TEGRA) +=3D snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) +=3D snd-soc-tegra-utils.o
+obj-$(CONFIG_SND_SOC_TEGRA20_AC97) +=3D snd-soc-tegra20-ac97.o
 obj-$(CONFIG_SND_SOC_TEGRA20_DAS) +=3D snd-soc-tegra20-das.o
 obj-$(CONFIG_SND_SOC_TEGRA20_I2S) +=3D snd-soc-tegra20-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) +=3D snd-soc-tegra20-spdif.o
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_a=
c97.c
new file mode 100644
index 0000000..a2f71cf
--- /dev/null
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -0,0 +1,479 @@
+/*
+ * tegra20_ac97.c - Tegra20 AC97 platform driver
+ *
+ * Copyright (c) 2012 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
+ *
+ * Partly based on code copyright/by:
+ *
+ * Copyright (c) 2011,2012 Toradex Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra_asoc_utils.h"
+#include "tegra20_ac97.h"
+
+#define DRV_NAME "tegra20-ac97"
+
+static struct tegra20_ac97 *workdata;
+
+static void tegra20_ac97_codec_reset(struct snd_ac97 *ac97)
+{
+	u32 readback;
+	unsigned long timeout;
+
+	/* reset line is not driven by DAC pad group, have to toggle GPIO */
+	gpio_set_value(workdata->reset_gpio, 0);
+	udelay(2);
+
+	gpio_set_value(workdata->reset_gpio, 1);
+	udelay(2);
+
+	timeout =3D jiffies + msecs_to_jiffies(100);
+
+	do {
+		regmap_read(workdata->regmap, TEGRA20_AC97_STATUS1, &readback);
+		if (readback & TEGRA20_AC97_STATUS1_CODEC1_RDY)
+			break;
+		usleep_range(1000, 2000);
+	} while (!time_after(jiffies, timeout));
+}
+
+static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
+{
+	u32 readback;
+	unsigned long timeout;
+
+	/*
+	 * although sync line is driven by the DAC pad group warm reset using
+	 * the controller cmd is not working, have to toggle sync line
+	 * manually.
+	 */
+	gpio_request(workdata->sync_gpio, "codec-sync");
+
+	gpio_direction_output(workdata->sync_gpio, 1);
+
+	udelay(2);
+	gpio_set_value(workdata->sync_gpio, 0);
+	udelay(2);
+	gpio_free(workdata->sync_gpio);
+
+	timeout =3D jiffies + msecs_to_jiffies(100);
+
+	do {
+		regmap_read(workdata->regmap, TEGRA20_AC97_STATUS1, &readback);
+		if (readback & TEGRA20_AC97_STATUS1_CODEC1_RDY)
+			break;
+		usleep_range(1000, 2000);
+	} while (!time_after(jiffies, timeout));
+}
+
+static unsigned short tegra20_ac97_codec_read(struct snd_ac97 *ac97_sn=
d,
+					      unsigned short reg)
+{
+	u32 readback;
+	unsigned long timeout;
+
+	regmap_write(workdata->regmap, TEGRA20_AC97_CMD,
+		     (((reg | 0x80) << TEGRA20_AC97_CMD_CMD_ADDR_SHIFT) &
+		      TEGRA20_AC97_CMD_CMD_ADDR_MASK) |
+		     TEGRA20_AC97_CMD_BUSY);
+
+	timeout =3D jiffies + msecs_to_jiffies(100);
+
+	do {
+		regmap_read(workdata->regmap, TEGRA20_AC97_STATUS1, &readback);
+		if (readback & TEGRA20_AC97_STATUS1_STA_VALID1)
+			break;
+		usleep_range(1000, 2000);
+	} while (!time_after(jiffies, timeout));
+
+	return ((readback & TEGRA20_AC97_STATUS1_STA_DATA1_MASK) >>
+		TEGRA20_AC97_STATUS1_STA_DATA1_SHIFT);
+}
+
+static void tegra20_ac97_codec_write(struct snd_ac97 *ac97_snd,
+				     unsigned short reg, unsigned short val)
+{
+	u32 readback;
+	unsigned long timeout;
+
+	regmap_write(workdata->regmap, TEGRA20_AC97_CMD,
+		     ((reg << TEGRA20_AC97_CMD_CMD_ADDR_SHIFT) &
+		      TEGRA20_AC97_CMD_CMD_ADDR_MASK) |
+		     ((val << TEGRA20_AC97_CMD_CMD_DATA_SHIFT) &
+		      TEGRA20_AC97_CMD_CMD_DATA_MASK) |
+		     TEGRA20_AC97_CMD_BUSY);
+
+	timeout =3D jiffies + msecs_to_jiffies(100);
+
+	do {
+		regmap_read(workdata->regmap, TEGRA20_AC97_CMD, &readback);
+		if (!(readback & TEGRA20_AC97_CMD_BUSY))
+			break;
+		usleep_range(1000, 2000);
+	} while (!time_after(jiffies, timeout));
+}
+
+struct snd_ac97_bus_ops soc_ac97_ops =3D {
+	.read		=3D tegra20_ac97_codec_read,
+	.write		=3D tegra20_ac97_codec_write,
+	.reset		=3D tegra20_ac97_codec_reset,
+	.warm_reset	=3D tegra20_ac97_codec_warm_reset,
+};
+EXPORT_SYMBOL_GPL(soc_ac97_ops);
+
+static inline void tegra20_ac97_start_playback(struct tegra20_ac97 *ac=
97)
+{
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
+			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN,
+			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN);
+
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
+			   TEGRA20_AC97_CTRL_PCM_DAC_EN | TEGRA20_AC97_CTRL_STM_EN,
+			   TEGRA20_AC97_CTRL_PCM_DAC_EN | TEGRA20_AC97_CTRL_STM_EN);
+}
+
+static inline void tegra20_ac97_stop_playback(struct tegra20_ac97 *ac9=
7)
+{
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
+			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN, 0);
+
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
+			   TEGRA20_AC97_CTRL_PCM_DAC_EN, 0);
+}
+
+static inline void tegra20_ac97_start_capture(struct tegra20_ac97 *ac9=
7)
+{
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
+			   TEGRA20_AC97_FIFO_SCR_REC_FULL_EN,
+			   TEGRA20_AC97_FIFO_SCR_REC_FULL_EN);
+}
+
+static inline void tegra20_ac97_stop_capture(struct tegra20_ac97 *ac97=
)
+{
+	regmap_update_bits(ac97->regmap, TEGRA20_AC97_FIFO1_SCR,
+			   TEGRA20_AC97_FIFO_SCR_REC_FULL_EN, 0);
+}
+
+static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, i=
nt cmd,
+				struct snd_soc_dai *dai)
+{
+	struct tegra20_ac97 *ac97 =3D snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+			tegra20_ac97_start_playback(ac97);
+		else
+			tegra20_ac97_start_capture(ac97);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
+			tegra20_ac97_stop_playback(ac97);
+		else
+			tegra20_ac97_stop_capture(ac97);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tegra20_ac97_dai_ops =3D {
+	.trigger	=3D tegra20_ac97_trigger,
+};
+
+static int tegra20_ac97_probe(struct snd_soc_dai *dai)
+{
+	struct tegra20_ac97 *ac97 =3D snd_soc_dai_get_drvdata(dai);
+
+	dai->capture_dma_data =3D &ac97->capture_dma_data;
+	dai->playback_dma_data =3D &ac97->playback_dma_data;
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver tegra20_ac97_dai =3D {
+	.name =3D "tegra-ac97-pcm",
+	.ac97_control =3D 1,
+	.probe =3D tegra20_ac97_probe,
+	.playback =3D {
+		.stream_name =3D "PCM Playback",
+		.channels_min =3D 2,
+		.channels_max =3D 2,
+		.rates =3D SNDRV_PCM_RATE_8000_48000,
+		.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture =3D {
+		.stream_name =3D "PCM Capture",
+		.channels_min =3D 2,
+		.channels_max =3D 2,
+		.rates =3D SNDRV_PCM_RATE_8000_48000,
+		.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops =3D &tegra20_ac97_dai_ops,
+};
+
+static bool tegra20_ac97_wr_rd_reg(struct device *dev, unsigned int re=
g)
+{
+	switch (reg) {
+	case TEGRA20_AC97_CTRL:
+	case TEGRA20_AC97_CMD:
+	case TEGRA20_AC97_STATUS1:
+	case TEGRA20_AC97_FIFO1_SCR:
+	case TEGRA20_AC97_FIFO_TX1:
+	case TEGRA20_AC97_FIFO_RX1:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static bool tegra20_ac97_volatile_reg(struct device *dev, unsigned int=
 reg)
+{
+	switch (reg) {
+	case TEGRA20_AC97_CMD:
+	case TEGRA20_AC97_STATUS1:
+	case TEGRA20_AC97_FIFO1_SCR:
+	case TEGRA20_AC97_FIFO_TX1:
+	case TEGRA20_AC97_FIFO_RX1:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static bool tegra20_ac97_precious_reg(struct device *dev, unsigned int=
 reg)
+{
+	switch (reg) {
+	case TEGRA20_AC97_FIFO_TX1:
+	case TEGRA20_AC97_FIFO_RX1:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tegra20_ac97_regmap_config =3D {
+	.reg_bits =3D 32,
+	.reg_stride =3D 4,
+	.val_bits =3D 32,
+	.max_register =3D TEGRA20_AC97_FIFO_RX1,
+	.writeable_reg =3D tegra20_ac97_wr_rd_reg,
+	.readable_reg =3D tegra20_ac97_wr_rd_reg,
+	.volatile_reg =3D tegra20_ac97_volatile_reg,
+	.precious_reg =3D tegra20_ac97_precious_reg,
+	.cache_type =3D REGCACHE_RBTREE,
+};
+
+static int tegra20_ac97_platform_probe(struct platform_device *pdev)
+{
+	struct tegra20_ac97 *ac97;
+	struct resource *mem, *memregion;
+	u32 of_dma[2];
+	void __iomem *regs;
+	int ret =3D 0;
+
+	ac97 =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra20_ac97),
+			    GFP_KERNEL);
+	if (!ac97) {
+		dev_err(&pdev->dev, "Can't allocate tegra20_ac97\n");
+		ret =3D -ENOMEM;
+		goto err;
+	}
+	dev_set_drvdata(&pdev->dev, ac97);
+
+	ac97->clk_ac97 =3D clk_get(&pdev->dev, NULL);
+	if (IS_ERR(ac97->clk_ac97)) {
+		dev_err(&pdev->dev, "Can't retrieve ac97 clock\n");
+		ret =3D PTR_ERR(ac97->clk_ac97);
+		goto err;
+	}
+
+	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		dev_err(&pdev->dev, "No memory resource\n");
+		ret =3D -ENODEV;
+		goto err_clk_put;
+	}
+
+	memregion =3D devm_request_mem_region(&pdev->dev, mem->start,
+					    resource_size(mem), DRV_NAME);
+	if (!memregion) {
+		dev_err(&pdev->dev, "Memory region already claimed\n");
+		ret =3D -EBUSY;
+		goto err_clk_put;
+	}
+
+	regs =3D devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (!regs) {
+		dev_err(&pdev->dev, "ioremap failed\n");
+		ret =3D -ENOMEM;
+		goto err_clk_put;
+	}
+
+	ac97->regmap =3D devm_regmap_init_mmio(&pdev->dev, regs,
+					    &tegra20_ac97_regmap_config);
+	if (IS_ERR(ac97->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		ret =3D PTR_ERR(ac97->regmap);
+		goto err_clk_put;
+	}
+
+	if (of_property_read_u32_array(pdev->dev.of_node,
+				       "nvidia,dma-request-selector",
+				       of_dma, 2) < 0) {
+		dev_err(&pdev->dev, "No DMA resource\n");
+		ret =3D -ENODEV;
+		goto err_clk_put;
+	}
+
+	ac97->reset_gpio =3D of_get_named_gpio(pdev->dev.of_node,
+					     "nvidia,codec-reset-gpio", 0);
+	if (gpio_is_valid(ac97->reset_gpio)) {
+		ret =3D devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
+					    GPIOF_OUT_INIT_HIGH, "codec-reset");
+		if (ret) {
+			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
+			goto err_clk_put;
+		}
+	} else {
+		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
+		goto err_clk_put;
+	}
+
+	ac97->sync_gpio =3D of_get_named_gpio(pdev->dev.of_node,
+					    "nvidia,codec-sync-gpio", 0);
+	if (!gpio_is_valid(ac97->sync_gpio)) {
+		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
+		goto err_clk_put;
+	}
+
+	ac97->capture_dma_data.addr =3D mem->start + TEGRA20_AC97_FIFO_RX1;
+	ac97->capture_dma_data.wrap =3D 4;
+	ac97->capture_dma_data.width =3D 32;
+	ac97->capture_dma_data.req_sel =3D of_dma[1];
+
+	ac97->playback_dma_data.addr =3D mem->start + TEGRA20_AC97_FIFO_TX1;
+	ac97->playback_dma_data.wrap =3D 4;
+	ac97->playback_dma_data.width =3D 32;
+	ac97->playback_dma_data.req_sel =3D of_dma[1];
+
+	ret =3D snd_soc_register_dais(&pdev->dev, &tegra20_ac97_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
+		ret =3D -ENOMEM;
+		goto err_clk_put;
+	}
+
+	ret =3D tegra_pcm_platform_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
+		goto err_unregister_dai;
+	}
+
+	ret =3D tegra_asoc_utils_init(&ac97->util_data, &pdev->dev);
+	if (ret)
+		goto err_unregister_pcm;
+
+	ret =3D tegra_asoc_utils_set_ac97_rate(&ac97->util_data);
+	if (ret)
+		goto err_asoc_utils_fini;
+
+	ret =3D clk_prepare_enable(ac97->clk_ac97);
+	if (ret) {
+		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
+		goto err_asoc_utils_fini;
+	}
+
+	/* XXX: crufty ASoC AC97 API - only one AC97 codec allowed */
+	workdata =3D ac97;
+
+	return 0;
+
+err_asoc_utils_fini:
+	tegra_asoc_utils_fini(&ac97->util_data);
+err_unregister_pcm:
+	tegra_pcm_platform_unregister(&pdev->dev);
+err_unregister_dai:
+	snd_soc_unregister_dai(&pdev->dev);
+err_clk_put:
+	clk_put(ac97->clk_ac97);
+err:
+	return ret;
+}
+
+static int tegra20_ac97_platform_remove(struct platform_device *pdev)
+{
+	struct tegra20_ac97 *ac97 =3D dev_get_drvdata(&pdev->dev);
+
+	tegra_pcm_platform_unregister(&pdev->dev);
+	snd_soc_unregister_dai(&pdev->dev);
+
+	tegra_asoc_utils_fini(&ac97->util_data);
+
+	clk_disable_unprepare(ac97->clk_ac97);
+	clk_put(ac97->clk_ac97);
+
+	return 0;
+}
+
+static const struct of_device_id tegra20_ac97_of_match[] __devinitcons=
t =3D {
+	{ .compatible =3D "nvidia,tegra20-ac97", },
+	{},
+};
+
+static struct platform_driver tegra20_ac97_driver =3D {
+	.driver =3D {
+		.name =3D DRV_NAME,
+		.owner =3D THIS_MODULE,
+		.of_match_table =3D tegra20_ac97_of_match,
+	},
+	.probe =3D tegra20_ac97_platform_probe,
+	.remove =3D tegra20_ac97_platform_remove,
+};
+module_platform_driver(tegra20_ac97_driver);
+
+MODULE_AUTHOR("Lucas Stach");
+MODULE_DESCRIPTION("Tegra20 AC97 ASoC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra20_ac97_of_match);
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_a=
c97.h
new file mode 100644
index 0000000..a805aae
--- /dev/null
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -0,0 +1,95 @@
+/*
+ * tegra20_ac97.c - Definitions for the Tegra20 AC97 controller driver
+ *
+ * Copyright (c) 2012 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
+ *
+ * Partly based on code copyright/by:
+ *
+ * Copyright (c) 2011,2012 Toradex Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ */
+
+#ifndef __TEGRA20_AC97_H__
+#define __TEGRA20_AC97_H__
+
+#include "tegra_pcm.h"
+
+#define TEGRA20_AC97_CTRL				0x00
+#define TEGRA20_AC97_CMD				0x04
+#define TEGRA20_AC97_STATUS1				0x08
+/* ... */
+#define TEGRA20_AC97_FIFO1_SCR				0x1c
+/* ... */
+#define TEGRA20_AC97_FIFO_TX1				0x40
+#define TEGRA20_AC97_FIFO_RX1				0x80
+
+/* TEGRA20_AC97_CTRL */
+#define TEGRA20_AC97_CTRL_STM2_EN			(1 << 16)
+#define TEGRA20_AC97_CTRL_DOUBLE_SAMPLING_EN		(1 << 11)
+#define TEGRA20_AC97_CTRL_IO_CNTRL_EN			(1 << 10)
+#define TEGRA20_AC97_CTRL_HSET_DAC_EN			(1 << 9)
+#define TEGRA20_AC97_CTRL_LINE2_DAC_EN			(1 << 8)
+#define TEGRA20_AC97_CTRL_PCM_LFE_EN			(1 << 7)
+#define TEGRA20_AC97_CTRL_PCM_SUR_EN			(1 << 6)
+#define TEGRA20_AC97_CTRL_PCM_CEN_DAC_EN		(1 << 5)
+#define TEGRA20_AC97_CTRL_LINE1_DAC_EN			(1 << 4)
+#define TEGRA20_AC97_CTRL_PCM_DAC_EN			(1 << 3)
+#define TEGRA20_AC97_CTRL_COLD_RESET			(1 << 2)
+#define TEGRA20_AC97_CTRL_WARM_RESET			(1 << 1)
+#define TEGRA20_AC97_CTRL_STM_EN			(1 << 0)
+
+/* TEGRA20_AC97_CMD */
+#define TEGRA20_AC97_CMD_CMD_ADDR_SHIFT			24
+#define TEGRA20_AC97_CMD_CMD_ADDR_MASK			(0xff << TEGRA20_AC97_CMD_CMD=
_ADDR_SHIFT)
+#define TEGRA20_AC97_CMD_CMD_DATA_SHIFT			8
+#define TEGRA20_AC97_CMD_CMD_DATA_MASK			(0xffff << TEGRA20_AC97_CMD_C=
MD_DATA_SHIFT)
+#define TEGRA20_AC97_CMD_CMD_ID_SHIFT			2
+#define TEGRA20_AC97_CMD_CMD_ID_MASK			(0x3 << TEGRA20_AC97_CMD_CMD_ID=
_SHIFT)
+#define TEGRA20_AC97_CMD_BUSY				(1 << 0)
+
+/* TEGRA20_AC97_STATUS1 */
+#define TEGRA20_AC97_STATUS1_STA_ADDR1_SHIFT		24
+#define TEGRA20_AC97_STATUS1_STA_ADDR1_MASK		(0xff << TEGRA20_AC97_STA=
TUS1_STA_ADDR1_SHIFT)
+#define TEGRA20_AC97_STATUS1_STA_DATA1_SHIFT		8
+#define TEGRA20_AC97_STATUS1_STA_DATA1_MASK		(0xffff << TEGRA20_AC97_S=
TATUS1_STA_DATA1_SHIFT)
+#define TEGRA20_AC97_STATUS1_STA_VALID1			(1 << 2)
+#define TEGRA20_AC97_STATUS1_STANDBY1			(1 << 1)
+#define TEGRA20_AC97_STATUS1_CODEC1_RDY			(1 << 0)
+
+/* TEGRA20_AC97_FIFO1_SCR */
+#define TEGRA20_AC97_FIFO_SCR_REC_MT_CNT_SHIFT		27
+#define TEGRA20_AC97_FIFO_SCR_REC_MT_CNT_MASK		(0x1f << TEGRA20_AC97_F=
IFO_SCR_REC_MT_CNT_SHIFT)
+#define TEGRA20_AC97_FIFO_SCR_PB_MT_CNT_SHIFT		22
+#define TEGRA20_AC97_FIFO_SCR_PB_MT_CNT_MASK		(0x1f << TEGRA20_AC97_FI=
=46O_SCR_PB_MT_CNT_SHIFT)
+#define TEGRA20_AC97_FIFO_SCR_REC_OVERRUN_INT_STA	(1 << 19)
+#define TEGRA20_AC97_FIFO_SCR_PB_UNDERRUN_INT_STA	(1 << 18)
+#define TEGRA20_AC97_FIFO_SCR_REC_FORCE_MT		(1 << 17)
+#define TEGRA20_AC97_FIFO_SCR_PB_FORCE_MT		(1 << 16)
+#define TEGRA20_AC97_FIFO_SCR_REC_FULL_EN		(1 << 15)
+#define TEGRA20_AC97_FIFO_SCR_REC_3QRT_FULL_EN		(1 << 14)
+#define TEGRA20_AC97_FIFO_SCR_REC_QRT_FULL_EN		(1 << 13)
+#define TEGRA20_AC97_FIFO_SCR_REC_EMPTY_EN		(1 << 12)
+#define TEGRA20_AC97_FIFO_SCR_PB_NOT_FULL_EN		(1 << 11)
+#define TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN		(1 << 10)
+#define TEGRA20_AC97_FIFO_SCR_PB_3QRT_MT_EN		(1 << 9)
+#define TEGRA20_AC97_FIFO_SCR_PB_EMPTY_MT_EN		(1 << 8)
+
+struct tegra20_ac97 {
+	struct clk *clk_ac97;
+	struct tegra_pcm_dma_params capture_dma_data;
+	struct tegra_pcm_dma_params playback_dma_data;
+	struct regmap *regmap;
+	int reset_gpio;
+	int sync_gpio;
+	struct tegra_asoc_utils_data util_data;
+};
+#endif /* __TEGRA20_AC97_H__ */
--=20
1.7.11.7
