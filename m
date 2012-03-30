From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 11/17] ASoC: tegra: complete Tegra->Tegra20 renaming
Date: Fri, 30 Mar 2012 17:07:26 -0600
Message-ID: <1333148852-17806-12-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rename Tegra20-specific Kconfig variables, module filenames, all internal
symbol names, clocks, and platform devices, to reflect the fact the DAS
and I2S drivers are for a specific HW version.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c |    6 +-
 arch/arm/mach-tegra/devices.c          |    6 +-
 arch/arm/mach-tegra/tegra2_clocks.c    |    4 +-
 sound/soc/tegra/Kconfig                |   26 +-
 sound/soc/tegra/Makefile               |    6 +-
 sound/soc/tegra/tegra20_das.c          |  134 ++++++------
 sound/soc/tegra/tegra20_das.h          |  124 +++++-----
 sound/soc/tegra/tegra20_i2s.c          |  204 ++++++++--------
 sound/soc/tegra/tegra20_i2s.h          |  246 ++++++++++----------
 sound/soc/tegra/tegra20_spdif.c        |  140 ++++++------
 sound/soc/tegra/tegra20_spdif.h        |  398 ++++++++++++++++----------------
 sound/soc/tegra/tegra_wm8903.c         |    4 +-
 sound/soc/tegra/trimslice.c            |    4 +-
 13 files changed, 651 insertions(+), 651 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 5b9d5f4..455b215 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -56,9 +56,9 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", TEGRA_I2C2_BASE, "tegra-i2c.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", TEGRA_I2C3_BASE, "tegra-i2c.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c-dvc", TEGRA_DVC_BASE, "tegra-i2c.3", NULL),
-	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, "tegra-i2s.0", NULL),
-	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S2_BASE, "tegra-i2s.1", NULL),
-	OF_DEV_AUXDATA("nvidia,tegra20-das", TEGRA_APB_MISC_DAS_BASE, "tegra-das", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, "tegra20-i2s.0", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S2_BASE, "tegra20-i2s.1", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-das", TEGRA_APB_MISC_DAS_BASE, "tegra20-das", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB_BASE, "tegra-ehci.0",
 		       &tegra_ehci1_pdata),
 	OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB2_BASE, "tegra-ehci.1",
diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index fcd872d..58e5803 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -674,14 +674,14 @@ static struct resource i2s_resource2[] = {
 };
 
 struct platform_device tegra_i2s_device1 = {
-	.name		= "tegra-i2s",
+	.name		= "tegra20-i2s",
 	.id		= 0,
 	.resource	= i2s_resource1,
 	.num_resources	= ARRAY_SIZE(i2s_resource1),
 };
 
 struct platform_device tegra_i2s_device2 = {
-	.name		= "tegra-i2s",
+	.name		= "tegra20-i2s",
 	.id		= 1,
 	.resource	= i2s_resource2,
 	.num_resources	= ARRAY_SIZE(i2s_resource2),
@@ -696,7 +696,7 @@ static struct resource tegra_das_resources[] = {
 };
 
 struct platform_device tegra_das_device = {
-	.name		= "tegra-das",
+	.name		= "tegra20-das",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(tegra_das_resources),
 	.resource	= tegra_das_resources,
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 592a4ee..cf4999b 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -2142,8 +2142,8 @@ static struct clk tegra_list_clks[] = {
 	PERIPH_CLK("apbdma",	"tegra-dma",		NULL,	34,	0,	108000000, mux_pclk,			0),
 	PERIPH_CLK("rtc",	"rtc-tegra",		NULL,	4,	0,	32768,     mux_clk_32k,			PERIPH_NO_RESET),
 	PERIPH_CLK("timer",	"timer",		NULL,	5,	0,	26000000,  mux_clk_m,			0),
-	PERIPH_CLK("i2s1",	"tegra-i2s.0",		NULL,	11,	0x100,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
-	PERIPH_CLK("i2s2",	"tegra-i2s.1",		NULL,	18,	0x104,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
+	PERIPH_CLK("i2s1",	"tegra20-i2s.0",	NULL,	11,	0x100,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
+	PERIPH_CLK("i2s2",	"tegra20-i2s.1",	NULL,	18,	0x104,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_out",	"spdif_out",		NULL,	10,	0x108,	100000000, mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_in",	"spdif_in",		NULL,	10,	0x10c,	100000000, mux_pllp_pllc_pllm,		MUX | DIV_U71),
 	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71),
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 3aec43d..63603d0 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -4,29 +4,29 @@ config SND_SOC_TEGRA
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
-config SND_SOC_TEGRA_DAS
-	tristate "Tegra Digital Audio Switch driver"
+config SND_SOC_TEGRA20_DAS
+	tristate "Tegra20 Digital Audio Switch driver"
 	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
 	help
-	  Say Y or M if you want to add support for the Tegra DAS module.
+	  Say Y or M if you want to add support for the Tegra20 DAS module.
 	  You will also need to select the individual machine drivers to
 	  support below.
 
-config SND_SOC_TEGRA_I2S
-	tristate "Tegra I2S driver"
+config SND_SOC_TEGRA20_I2S
+	tristate "Tegra20 I2S driver"
 	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
-	select SND_SOC_TEGRA_DAS
+	select SND_SOC_TEGRA20_DAS
 	help
 	  Say Y or M if you want to add support for codecs attached to the
-	  Tegra I2S interface. You will also need to select the individual
+	  Tegra20 I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
-config SND_SOC_TEGRA_SPDIF
-	tristate "Tegra SPDIF driver"
+config SND_SOC_TEGRA20_SPDIF
+	tristate "Tegra20 SPDIF driver"
 	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
 	default m
 	help
-	  Say Y or M if you want to add support for the SPDIF interface.
+	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
 	  You will also need to select the individual machine drivers to support
 	  below.
 
@@ -41,7 +41,7 @@ config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
 	depends on SND_SOC_TEGRA && I2C
 	depends on MACH_HAS_SND_SOC_TEGRA_WM8903
-	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -51,7 +51,7 @@ config SND_SOC_TEGRA_WM8903
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
 	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
-	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TLV320AIC23
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -60,7 +60,7 @@ config SND_SOC_TEGRA_TRIMSLICE
 config SND_SOC_TEGRA_ALC5632
 	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
 	depends on SND_SOC_TEGRA && I2C
-	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_ALC5632
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 4a33884..4726b90 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -7,9 +7,9 @@ snd-soc-tegra20-spdif-objs := tegra20_spdif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
-obj-$(CONFIG_SND_SOC_TEGRA_DAS) += snd-soc-tegra20-das.o
-obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra20-i2s.o
-obj-$(CONFIG_SND_SOC_TEGRA_SPDIF) += snd-soc-tegra20-spdif.o
+obj-$(CONFIG_SND_SOC_TEGRA20_DAS) += snd-soc-tegra20-das.o
+obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
+obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) += snd-soc-tegra20-spdif.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index b5e3698..486d7b2 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -31,21 +31,21 @@
 #include <sound/soc.h>
 #include "tegra20_das.h"
 
-#define DRV_NAME "tegra-das"
+#define DRV_NAME "tegra20-das"
 
-static struct tegra_das *das;
+static struct tegra20_das *das;
 
-static inline void tegra_das_write(u32 reg, u32 val)
+static inline void tegra20_das_write(u32 reg, u32 val)
 {
 	__raw_writel(val, das->regs + reg);
 }
 
-static inline u32 tegra_das_read(u32 reg)
+static inline u32 tegra20_das_read(u32 reg)
 {
 	return __raw_readl(das->regs + reg);
 }
 
-int tegra_das_connect_dap_to_dac(int dap, int dac)
+int tegra20_das_connect_dap_to_dac(int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
@@ -53,18 +53,18 @@ int tegra_das_connect_dap_to_dac(int dap, int dac)
 	if (!das)
 		return -ENODEV;
 
-	addr = TEGRA_DAS_DAP_CTRL_SEL +
-		(dap * TEGRA_DAS_DAP_CTRL_SEL_STRIDE);
-	reg = dac << TEGRA_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
+	addr = TEGRA20_DAS_DAP_CTRL_SEL +
+		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
+	reg = dac << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
 
-	tegra_das_write(addr, reg);
+	tegra20_das_write(addr, reg);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_das_connect_dap_to_dac);
+EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dac);
 
-int tegra_das_connect_dap_to_dap(int dap, int otherdap, int master,
-					int sdata1rx, int sdata2rx)
+int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
+				   int sdata1rx, int sdata2rx)
 {
 	u32 addr;
 	u32 reg;
@@ -72,20 +72,20 @@ int tegra_das_connect_dap_to_dap(int dap, int otherdap, int master,
 	if (!das)
 		return -ENODEV;
 
-	addr = TEGRA_DAS_DAP_CTRL_SEL +
-		(dap * TEGRA_DAS_DAP_CTRL_SEL_STRIDE);
-	reg = otherdap << TEGRA_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
-		!!sdata2rx << TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
-		!!sdata1rx << TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
-		!!master << TEGRA_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P;
+	addr = TEGRA20_DAS_DAP_CTRL_SEL +
+		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
+	reg = otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
+		!!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
+		!!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
+		!!master << TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P;
 
-	tegra_das_write(addr, reg);
+	tegra20_das_write(addr, reg);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_das_connect_dap_to_dap);
+EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dap);
 
-int tegra_das_connect_dac_to_dap(int dac, int dap)
+int tegra20_das_connect_dac_to_dap(int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
@@ -93,78 +93,78 @@ int tegra_das_connect_dac_to_dap(int dac, int dap)
 	if (!das)
 		return -ENODEV;
 
-	addr = TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL +
-		(dac * TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
-	reg = dap << TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P |
-		dap << TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P |
-		dap << TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
+	addr = TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL +
+		(dac * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
+	reg = dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P |
+		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P |
+		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
 
-	tegra_das_write(addr, reg);
+	tegra20_das_write(addr, reg);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_das_connect_dac_to_dap);
+EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
 
 #ifdef CONFIG_DEBUG_FS
-static int tegra_das_show(struct seq_file *s, void *unused)
+static int tegra20_das_show(struct seq_file *s, void *unused)
 {
 	int i;
 	u32 addr;
 	u32 reg;
 
-	for (i = 0; i < TEGRA_DAS_DAP_CTRL_SEL_COUNT; i++) {
-		addr = TEGRA_DAS_DAP_CTRL_SEL +
-			(i * TEGRA_DAS_DAP_CTRL_SEL_STRIDE);
-		reg = tegra_das_read(addr);
-		seq_printf(s, "TEGRA_DAS_DAP_CTRL_SEL[%d] = %08x\n", i, reg);
+	for (i = 0; i < TEGRA20_DAS_DAP_CTRL_SEL_COUNT; i++) {
+		addr = TEGRA20_DAS_DAP_CTRL_SEL +
+			(i * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
+		reg = tegra20_das_read(addr);
+		seq_printf(s, "TEGRA20_DAS_DAP_CTRL_SEL[%d] = %08x\n", i, reg);
 	}
 
-	for (i = 0; i < TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT; i++) {
-		addr = TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL +
-			(i * TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
-		reg = tegra_das_read(addr);
-		seq_printf(s, "TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL[%d] = %08x\n",
-				 i, reg);
+	for (i = 0; i < TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT; i++) {
+		addr = TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL +
+			(i * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
+		reg = tegra20_das_read(addr);
+		seq_printf(s, "TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL[%d] = %08x\n",
+			   i, reg);
 	}
 
 	return 0;
 }
 
-static int tegra_das_debug_open(struct inode *inode, struct file *file)
+static int tegra20_das_debug_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, tegra_das_show, inode->i_private);
+	return single_open(file, tegra20_das_show, inode->i_private);
 }
 
-static const struct file_operations tegra_das_debug_fops = {
-	.open    = tegra_das_debug_open,
+static const struct file_operations tegra20_das_debug_fops = {
+	.open    = tegra20_das_debug_open,
 	.read    = seq_read,
 	.llseek  = seq_lseek,
 	.release = single_release,
 };
 
-static void tegra_das_debug_add(struct tegra_das *das)
+static void tegra20_das_debug_add(struct tegra20_das *das)
 {
 	das->debug = debugfs_create_file(DRV_NAME, S_IRUGO,
 					 snd_soc_debugfs_root, das,
-					 &tegra_das_debug_fops);
+					 &tegra20_das_debug_fops);
 }
 
-static void tegra_das_debug_remove(struct tegra_das *das)
+static void tegra20_das_debug_remove(struct tegra20_das *das)
 {
 	if (das->debug)
 		debugfs_remove(das->debug);
 }
 #else
-static inline void tegra_das_debug_add(struct tegra_das *das)
+static inline void tegra20_das_debug_add(struct tegra20_das *das)
 {
 }
 
-static inline void tegra_das_debug_remove(struct tegra_das *das)
+static inline void tegra20_das_debug_remove(struct tegra20_das *das)
 {
 }
 #endif
 
-static int __devinit tegra_das_probe(struct platform_device *pdev)
+static int __devinit tegra20_das_probe(struct platform_device *pdev)
 {
 	struct resource *res, *region;
 	int ret = 0;
@@ -172,9 +172,9 @@ static int __devinit tegra_das_probe(struct platform_device *pdev)
 	if (das)
 		return -ENODEV;
 
-	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra_das), GFP_KERNEL);
+	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
 	if (!das) {
-		dev_err(&pdev->dev, "Can't allocate tegra_das\n");
+		dev_err(&pdev->dev, "Can't allocate tegra20_das\n");
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -202,20 +202,20 @@ static int __devinit tegra_das_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = tegra_das_connect_dap_to_dac(TEGRA_DAS_DAP_ID_1,
-					   TEGRA_DAS_DAP_SEL_DAC1);
+	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_1,
+					     TEGRA20_DAS_DAP_SEL_DAC1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
 		goto err;
 	}
-	ret = tegra_das_connect_dac_to_dap(TEGRA_DAS_DAC_ID_1,
-					   TEGRA_DAS_DAC_SEL_DAP1);
+	ret = tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_1,
+					     TEGRA20_DAS_DAC_SEL_DAP1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
 		goto err;
 	}
 
-	tegra_das_debug_add(das);
+	tegra20_das_debug_add(das);
 
 	platform_set_drvdata(pdev, das);
 
@@ -226,36 +226,36 @@ err:
 	return ret;
 }
 
-static int __devexit tegra_das_remove(struct platform_device *pdev)
+static int __devexit tegra20_das_remove(struct platform_device *pdev)
 {
 	if (!das)
 		return -ENODEV;
 
-	tegra_das_debug_remove(das);
+	tegra20_das_debug_remove(das);
 
 	das = NULL;
 
 	return 0;
 }
 
-static const struct of_device_id tegra_das_of_match[] __devinitconst = {
+static const struct of_device_id tegra20_das_of_match[] __devinitconst = {
 	{ .compatible = "nvidia,tegra20-das", },
 	{},
 };
 
-static struct platform_driver tegra_das_driver = {
-	.probe = tegra_das_probe,
-	.remove = __devexit_p(tegra_das_remove),
+static struct platform_driver tegra20_das_driver = {
+	.probe = tegra20_das_probe,
+	.remove = __devexit_p(tegra20_das_remove),
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
-		.of_match_table = tegra_das_of_match,
+		.of_match_table = tegra20_das_of_match,
 	},
 };
-module_platform_driver(tegra_das_driver);
+module_platform_driver(tegra20_das_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("Tegra DAS driver");
+MODULE_DESCRIPTION("Tegra20 DAS driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_das_of_match);
+MODULE_DEVICE_TABLE(of, tegra20_das_of_match);
diff --git a/sound/soc/tegra/tegra20_das.h b/sound/soc/tegra/tegra20_das.h
index 896bf03..ade4fe0 100644
--- a/sound/soc/tegra/tegra20_das.h
+++ b/sound/soc/tegra/tegra20_das.h
@@ -2,7 +2,7 @@
  * tegra20_das.h - Definitions for Tegra20 DAS driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -20,70 +20,70 @@
  *
  */
 
-#ifndef __TEGRA_DAS_H__
-#define __TEGRA_DAS_H__
+#ifndef __TEGRA20_DAS_H__
+#define __TEGRA20_DAS_H__
 
-/* Register TEGRA_DAS_DAP_CTRL_SEL */
-#define TEGRA_DAS_DAP_CTRL_SEL				0x00
-#define TEGRA_DAS_DAP_CTRL_SEL_COUNT			5
-#define TEGRA_DAS_DAP_CTRL_SEL_STRIDE			4
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
-#define TEGRA_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
+/* Register TEGRA20_DAS_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_CTRL_SEL			0x00
+#define TEGRA20_DAS_DAP_CTRL_SEL_COUNT			5
+#define TEGRA20_DAS_DAP_CTRL_SEL_STRIDE			4
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
 
-/* Values for field TEGRA_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
-#define TEGRA_DAS_DAP_SEL_DAC1	0
-#define TEGRA_DAS_DAP_SEL_DAC2	1
-#define TEGRA_DAS_DAP_SEL_DAC3	2
-#define TEGRA_DAS_DAP_SEL_DAP1	16
-#define TEGRA_DAS_DAP_SEL_DAP2	17
-#define TEGRA_DAS_DAP_SEL_DAP3	18
-#define TEGRA_DAS_DAP_SEL_DAP4	19
-#define TEGRA_DAS_DAP_SEL_DAP5	20
+/* Values for field TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_SEL_DAC1	0
+#define TEGRA20_DAS_DAP_SEL_DAC2	1
+#define TEGRA20_DAS_DAP_SEL_DAC3	2
+#define TEGRA20_DAS_DAP_SEL_DAP1	16
+#define TEGRA20_DAS_DAP_SEL_DAP2	17
+#define TEGRA20_DAS_DAP_SEL_DAP3	18
+#define TEGRA20_DAS_DAP_SEL_DAP4	19
+#define TEGRA20_DAS_DAP_SEL_DAP5	20
 
-/* Register TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL */
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT			3
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE			4
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P		0
-#define TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S		4
+/* Register TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL */
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT		3
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE		4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P	0
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S	4
 
 /*
  * Values for:
- * TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
- * TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
- * TEGRA_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
  */
-#define TEGRA_DAS_DAC_SEL_DAP1	0
-#define TEGRA_DAS_DAC_SEL_DAP2	1
-#define TEGRA_DAS_DAC_SEL_DAP3	2
-#define TEGRA_DAS_DAC_SEL_DAP4	3
-#define TEGRA_DAS_DAC_SEL_DAP5	4
+#define TEGRA20_DAS_DAC_SEL_DAP1	0
+#define TEGRA20_DAS_DAC_SEL_DAP2	1
+#define TEGRA20_DAS_DAC_SEL_DAP3	2
+#define TEGRA20_DAS_DAC_SEL_DAP4	3
+#define TEGRA20_DAS_DAC_SEL_DAP5	4
 
 /*
  * Names/IDs of the DACs/DAPs.
  */
 
-#define TEGRA_DAS_DAP_ID_1 0
-#define TEGRA_DAS_DAP_ID_2 1
-#define TEGRA_DAS_DAP_ID_3 2
-#define TEGRA_DAS_DAP_ID_4 3
-#define TEGRA_DAS_DAP_ID_5 4
+#define TEGRA20_DAS_DAP_ID_1 0
+#define TEGRA20_DAS_DAP_ID_2 1
+#define TEGRA20_DAS_DAP_ID_3 2
+#define TEGRA20_DAS_DAP_ID_4 3
+#define TEGRA20_DAS_DAP_ID_5 4
 
-#define TEGRA_DAS_DAC_ID_1 0
-#define TEGRA_DAS_DAC_ID_2 1
-#define TEGRA_DAS_DAC_ID_3 2
+#define TEGRA20_DAS_DAC_ID_1 0
+#define TEGRA20_DAS_DAC_ID_2 1
+#define TEGRA20_DAS_DAC_ID_3 2
 
-struct tegra_das {
+struct tegra20_das {
 	struct device *dev;
 	void __iomem *regs;
 	struct dentry *debug;
@@ -107,29 +107,29 @@ struct tegra_das {
 
 /*
  * Connect a DAP to to a DAC
- * dap_id: DAP to connect: TEGRA_DAS_DAP_ID_*
- * dac_sel: DAC to connect to: TEGRA_DAS_DAP_SEL_DAC*
+ * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
+ * dac_sel: DAC to connect to: TEGRA20_DAS_DAP_SEL_DAC*
  */
-extern int tegra_das_connect_dap_to_dac(int dap_id, int dac_sel);
+extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
 
 /*
  * Connect a DAP to to another DAP
- * dap_id: DAP to connect: TEGRA_DAS_DAP_ID_*
- * other_dap_sel: DAP to connect to: TEGRA_DAS_DAP_SEL_DAP*
+ * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
+ * other_dap_sel: DAP to connect to: TEGRA20_DAS_DAP_SEL_DAP*
  * master: Is this DAP the master (1) or slave (0)
  * sdata1rx: Is this DAP's SDATA1 pin RX (1) or TX (0)
  * sdata2rx: Is this DAP's SDATA2 pin RX (1) or TX (0)
  */
-extern int tegra_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
-					int master, int sdata1rx,
-					int sdata2rx);
+extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
+					  int master, int sdata1rx,
+					  int sdata2rx);
 
 /*
  * Connect a DAC's input to a DAP
  * (DAC outputs are selected by the DAP)
- * dac_id: DAC ID to connect: TEGRA_DAS_DAC_ID_*
- * dap_sel: DAP to receive input from: TEGRA_DAS_DAC_SEL_DAP*
+ * dac_id: DAC ID to connect: TEGRA20_DAS_DAC_ID_*
+ * dap_sel: DAP to receive input from: TEGRA20_DAS_DAC_SEL_DAP*
  */
-extern int tegra_das_connect_dac_to_dap(int dac_id, int dap_sel);
+extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
 
 #endif
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index fa71af2..2807ca3 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -45,44 +45,44 @@
 
 #include "tegra20_i2s.h"
 
-#define DRV_NAME "tegra-i2s"
+#define DRV_NAME "tegra20-i2s"
 
-static inline void tegra_i2s_write(struct tegra_i2s *i2s, u32 reg, u32 val)
+static inline void tegra20_i2s_write(struct tegra20_i2s *i2s, u32 reg, u32 val)
 {
 	__raw_writel(val, i2s->regs + reg);
 }
 
-static inline u32 tegra_i2s_read(struct tegra_i2s *i2s, u32 reg)
+static inline u32 tegra20_i2s_read(struct tegra20_i2s *i2s, u32 reg)
 {
 	return __raw_readl(i2s->regs + reg);
 }
 
 #ifdef CONFIG_DEBUG_FS
-static int tegra_i2s_show(struct seq_file *s, void *unused)
+static int tegra20_i2s_show(struct seq_file *s, void *unused)
 {
 #define REG(r) { r, #r }
 	static const struct {
 		int offset;
 		const char *name;
 	} regs[] = {
-		REG(TEGRA_I2S_CTRL),
-		REG(TEGRA_I2S_STATUS),
-		REG(TEGRA_I2S_TIMING),
-		REG(TEGRA_I2S_FIFO_SCR),
-		REG(TEGRA_I2S_PCM_CTRL),
-		REG(TEGRA_I2S_NW_CTRL),
-		REG(TEGRA_I2S_TDM_CTRL),
-		REG(TEGRA_I2S_TDM_TX_RX_CTRL),
+		REG(TEGRA20_I2S_CTRL),
+		REG(TEGRA20_I2S_STATUS),
+		REG(TEGRA20_I2S_TIMING),
+		REG(TEGRA20_I2S_FIFO_SCR),
+		REG(TEGRA20_I2S_PCM_CTRL),
+		REG(TEGRA20_I2S_NW_CTRL),
+		REG(TEGRA20_I2S_TDM_CTRL),
+		REG(TEGRA20_I2S_TDM_TX_RX_CTRL),
 	};
 #undef REG
 
-	struct tegra_i2s *i2s = s->private;
+	struct tegra20_i2s *i2s = s->private;
 	int i;
 
 	clk_enable(i2s->clk_i2s);
 
 	for (i = 0; i < ARRAY_SIZE(regs); i++) {
-		u32 val = tegra_i2s_read(i2s, regs[i].offset);
+		u32 val = tegra20_i2s_read(i2s, regs[i].offset);
 		seq_printf(s, "%s = %08x\n", regs[i].name, val);
 	}
 
@@ -91,44 +91,44 @@ static int tegra_i2s_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int tegra_i2s_debug_open(struct inode *inode, struct file *file)
+static int tegra20_i2s_debug_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, tegra_i2s_show, inode->i_private);
+	return single_open(file, tegra20_i2s_show, inode->i_private);
 }
 
-static const struct file_operations tegra_i2s_debug_fops = {
-	.open    = tegra_i2s_debug_open,
+static const struct file_operations tegra20_i2s_debug_fops = {
+	.open    = tegra20_i2s_debug_open,
 	.read    = seq_read,
 	.llseek  = seq_lseek,
 	.release = single_release,
 };
 
-static void tegra_i2s_debug_add(struct tegra_i2s *i2s)
+static void tegra20_i2s_debug_add(struct tegra20_i2s *i2s)
 {
 	i2s->debug = debugfs_create_file(i2s->dai.name, S_IRUGO,
 					 snd_soc_debugfs_root, i2s,
-					 &tegra_i2s_debug_fops);
+					 &tegra20_i2s_debug_fops);
 }
 
-static void tegra_i2s_debug_remove(struct tegra_i2s *i2s)
+static void tegra20_i2s_debug_remove(struct tegra20_i2s *i2s)
 {
 	if (i2s->debug)
 		debugfs_remove(i2s->debug);
 }
 #else
-static inline void tegra_i2s_debug_add(struct tegra_i2s *i2s, int id)
+static inline void tegra20_i2s_debug_add(struct tegra20_i2s *i2s, int id)
 {
 }
 
-static inline void tegra_i2s_debug_remove(struct tegra_i2s *i2s)
+static inline void tegra20_i2s_debug_remove(struct tegra20_i2s *i2s)
 {
 }
 #endif
 
-static int tegra_i2s_set_fmt(struct snd_soc_dai *dai,
+static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
-	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -137,10 +137,10 @@ static int tegra_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~TEGRA_I2S_CTRL_MASTER_ENABLE;
+	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_MASTER_ENABLE;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
@@ -148,28 +148,28 @@ static int tegra_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~(TEGRA_I2S_CTRL_BIT_FORMAT_MASK |
-				TEGRA_I2S_CTRL_LRCK_MASK);
+	i2s->reg_ctrl &= ~(TEGRA20_I2S_CTRL_BIT_FORMAT_MASK |
+			   TEGRA20_I2S_CTRL_LRCK_MASK);
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_FORMAT_DSP;
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_LRCK_L_LOW;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_FORMAT_DSP;
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_LRCK_R_LOW;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_R_LOW;
 		break;
 	case SND_SOC_DAIFMT_I2S:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_FORMAT_I2S;
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_LRCK_L_LOW;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_I2S;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_FORMAT_RJM;
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_LRCK_L_LOW;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_RJM;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_FORMAT_LJM;
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_LRCK_L_LOW;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_LJM;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	default:
 		return -EINVAL;
@@ -178,27 +178,27 @@ static int tegra_i2s_set_fmt(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
+static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
 {
 	struct device *dev = substream->pcm->card->dev;
-	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	u32 reg;
 	int ret, sample_size, srate, i2sclock, bitcnt;
 
-	i2s->reg_ctrl &= ~TEGRA_I2S_CTRL_BIT_SIZE_MASK;
+	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_SIZE_16;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_16;
 		sample_size = 16;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_SIZE_24;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_24;
 		sample_size = 24;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
-		i2s->reg_ctrl |= TEGRA_I2S_CTRL_BIT_SIZE_32;
+		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_32;
 		sample_size = 32;
 		break;
 	default:
@@ -217,54 +217,54 @@ static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	bitcnt = (i2sclock / (2 * srate)) - 1;
-	if (bitcnt < 0 || bitcnt > TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
+	if (bitcnt < 0 || bitcnt > TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
-	reg = bitcnt << TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
+	reg = bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
 	if (i2sclock % (2 * srate))
-		reg |= TEGRA_I2S_TIMING_NON_SYM_ENABLE;
+		reg |= TEGRA20_I2S_TIMING_NON_SYM_ENABLE;
 
 	clk_enable(i2s->clk_i2s);
 
-	tegra_i2s_write(i2s, TEGRA_I2S_TIMING, reg);
+	tegra20_i2s_write(i2s, TEGRA20_I2S_TIMING, reg);
 
-	tegra_i2s_write(i2s, TEGRA_I2S_FIFO_SCR,
-		TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
-		TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
+	tegra20_i2s_write(i2s, TEGRA20_I2S_FIFO_SCR,
+		TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
+		TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
 
 	clk_disable(i2s->clk_i2s);
 
 	return 0;
 }
 
-static void tegra_i2s_start_playback(struct tegra_i2s *i2s)
+static void tegra20_i2s_start_playback(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl |= TEGRA_I2S_CTRL_FIFO1_ENABLE;
-	tegra_i2s_write(i2s, TEGRA_I2S_CTRL, i2s->reg_ctrl);
+	i2s->reg_ctrl |= TEGRA20_I2S_CTRL_FIFO1_ENABLE;
+	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
 }
 
-static void tegra_i2s_stop_playback(struct tegra_i2s *i2s)
+static void tegra20_i2s_stop_playback(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl &= ~TEGRA_I2S_CTRL_FIFO1_ENABLE;
-	tegra_i2s_write(i2s, TEGRA_I2S_CTRL, i2s->reg_ctrl);
+	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_FIFO1_ENABLE;
+	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
 }
 
-static void tegra_i2s_start_capture(struct tegra_i2s *i2s)
+static void tegra20_i2s_start_capture(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl |= TEGRA_I2S_CTRL_FIFO2_ENABLE;
-	tegra_i2s_write(i2s, TEGRA_I2S_CTRL, i2s->reg_ctrl);
+	i2s->reg_ctrl |= TEGRA20_I2S_CTRL_FIFO2_ENABLE;
+	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
 }
 
-static void tegra_i2s_stop_capture(struct tegra_i2s *i2s)
+static void tegra20_i2s_stop_capture(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl &= ~TEGRA_I2S_CTRL_FIFO2_ENABLE;
-	tegra_i2s_write(i2s, TEGRA_I2S_CTRL, i2s->reg_ctrl);
+	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_FIFO2_ENABLE;
+	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
 }
 
-static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-				struct snd_soc_dai *dai)
+static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *dai)
 {
-	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -272,17 +272,17 @@ static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_RESUME:
 		clk_enable(i2s->clk_i2s);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			tegra_i2s_start_playback(i2s);
+			tegra20_i2s_start_playback(i2s);
 		else
-			tegra_i2s_start_capture(i2s);
+			tegra20_i2s_start_capture(i2s);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			tegra_i2s_stop_playback(i2s);
+			tegra20_i2s_stop_playback(i2s);
 		else
-			tegra_i2s_stop_capture(i2s);
+			tegra20_i2s_stop_capture(i2s);
 		clk_disable(i2s->clk_i2s);
 		break;
 	default:
@@ -292,9 +292,9 @@ static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int tegra_i2s_probe(struct snd_soc_dai *dai)
+static int tegra20_i2s_probe(struct snd_soc_dai *dai)
 {
-	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
 	dai->capture_dma_data = &i2s->capture_dma_data;
 	dai->playback_dma_data = &i2s->playback_dma_data;
@@ -302,14 +302,14 @@ static int tegra_i2s_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops tegra_i2s_dai_ops = {
-	.set_fmt	= tegra_i2s_set_fmt,
-	.hw_params	= tegra_i2s_hw_params,
-	.trigger	= tegra_i2s_trigger,
+static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
+	.set_fmt	= tegra20_i2s_set_fmt,
+	.hw_params	= tegra20_i2s_hw_params,
+	.trigger	= tegra20_i2s_trigger,
 };
 
-static const struct snd_soc_dai_driver tegra_i2s_dai_template = {
-	.probe = tegra_i2s_probe,
+static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
+	.probe = tegra20_i2s_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
@@ -322,27 +322,27 @@ static const struct snd_soc_dai_driver tegra_i2s_dai_template = {
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
-	.ops = &tegra_i2s_dai_ops,
+	.ops = &tegra20_i2s_dai_ops,
 	.symmetric_rates = 1,
 };
 
-static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
+static __devinit int tegra20_i2s_platform_probe(struct platform_device *pdev)
 {
-	struct tegra_i2s *i2s;
+	struct tegra20_i2s *i2s;
 	struct resource *mem, *memregion, *dmareq;
 	u32 of_dma[2];
 	u32 dma_ch;
 	int ret;
 
-	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra_i2s), GFP_KERNEL);
+	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_i2s), GFP_KERNEL);
 	if (!i2s) {
-		dev_err(&pdev->dev, "Can't allocate tegra_i2s\n");
+		dev_err(&pdev->dev, "Can't allocate tegra20_i2s\n");
 		ret = -ENOMEM;
 		goto err;
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	i2s->dai = tegra_i2s_dai_template;
+	i2s->dai = tegra20_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
 
 	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
@@ -388,17 +388,17 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
-	i2s->capture_dma_data.addr = mem->start + TEGRA_I2S_FIFO2;
+	i2s->capture_dma_data.addr = mem->start + TEGRA20_I2S_FIFO2;
 	i2s->capture_dma_data.wrap = 4;
 	i2s->capture_dma_data.width = 32;
 	i2s->capture_dma_data.req_sel = dma_ch;
 
-	i2s->playback_dma_data.addr = mem->start + TEGRA_I2S_FIFO1;
+	i2s->playback_dma_data.addr = mem->start + TEGRA20_I2S_FIFO1;
 	i2s->playback_dma_data.wrap = 4;
 	i2s->playback_dma_data.width = 32;
 	i2s->playback_dma_data.req_sel = dma_ch;
 
-	i2s->reg_ctrl = TEGRA_I2S_CTRL_FIFO_FORMAT_PACKED;
+	i2s->reg_ctrl = TEGRA20_I2S_CTRL_FIFO_FORMAT_PACKED;
 
 	ret = snd_soc_register_dai(&pdev->dev, &i2s->dai);
 	if (ret) {
@@ -413,7 +413,7 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 		goto err_unregister_dai;
 	}
 
-	tegra_i2s_debug_add(i2s);
+	tegra20_i2s_debug_add(i2s);
 
 	return 0;
 
@@ -425,38 +425,38 @@ err:
 	return ret;
 }
 
-static int __devexit tegra_i2s_platform_remove(struct platform_device *pdev)
+static int __devexit tegra20_i2s_platform_remove(struct platform_device *pdev)
 {
-	struct tegra_i2s *i2s = dev_get_drvdata(&pdev->dev);
+	struct tegra20_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
-	tegra_i2s_debug_remove(i2s);
+	tegra20_i2s_debug_remove(i2s);
 
 	clk_put(i2s->clk_i2s);
 
 	return 0;
 }
 
-static const struct of_device_id tegra_i2s_of_match[] __devinitconst = {
+static const struct of_device_id tegra20_i2s_of_match[] __devinitconst = {
 	{ .compatible = "nvidia,tegra20-i2s", },
 	{},
 };
 
-static struct platform_driver tegra_i2s_driver = {
+static struct platform_driver tegra20_i2s_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
-		.of_match_table = tegra_i2s_of_match,
+		.of_match_table = tegra20_i2s_of_match,
 	},
-	.probe = tegra_i2s_platform_probe,
-	.remove = __devexit_p(tegra_i2s_platform_remove),
+	.probe = tegra20_i2s_platform_probe,
+	.remove = __devexit_p(tegra20_i2s_platform_remove),
 };
-module_platform_driver(tegra_i2s_driver);
+module_platform_driver(tegra20_i2s_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("Tegra I2S ASoC driver");
+MODULE_DESCRIPTION("Tegra20 I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_i2s_of_match);
+MODULE_DEVICE_TABLE(of, tegra20_i2s_of_match);
diff --git a/sound/soc/tegra/tegra20_i2s.h b/sound/soc/tegra/tegra20_i2s.h
index 56f1e0f..86ab327 100644
--- a/sound/soc/tegra/tegra20_i2s.h
+++ b/sound/soc/tegra/tegra20_i2s.h
@@ -2,7 +2,7 @@
  * tegra20_i2s.h - Definitions for Tegra20 I2S driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * Based on code copyright/by:
  *
@@ -28,131 +28,131 @@
  *
  */
 
-#ifndef __TEGRA_I2S_H__
-#define __TEGRA_I2S_H__
+#ifndef __TEGRA20_I2S_H__
+#define __TEGRA20_I2S_H__
 
 #include "tegra_pcm.h"
 
-/* Register offsets from TEGRA_I2S1_BASE and TEGRA_I2S2_BASE */
-
-#define TEGRA_I2S_CTRL					0x00
-#define TEGRA_I2S_STATUS				0x04
-#define TEGRA_I2S_TIMING				0x08
-#define TEGRA_I2S_FIFO_SCR				0x0c
-#define TEGRA_I2S_PCM_CTRL				0x10
-#define TEGRA_I2S_NW_CTRL				0x14
-#define TEGRA_I2S_TDM_CTRL				0x20
-#define TEGRA_I2S_TDM_TX_RX_CTRL			0x24
-#define TEGRA_I2S_FIFO1					0x40
-#define TEGRA_I2S_FIFO2					0x80
-
-/* Fields in TEGRA_I2S_CTRL */
-
-#define TEGRA_I2S_CTRL_FIFO2_TX_ENABLE			(1 << 30)
-#define TEGRA_I2S_CTRL_FIFO1_ENABLE			(1 << 29)
-#define TEGRA_I2S_CTRL_FIFO2_ENABLE			(1 << 28)
-#define TEGRA_I2S_CTRL_FIFO1_RX_ENABLE			(1 << 27)
-#define TEGRA_I2S_CTRL_FIFO_LPBK_ENABLE			(1 << 26)
-#define TEGRA_I2S_CTRL_MASTER_ENABLE			(1 << 25)
-
-#define TEGRA_I2S_LRCK_LEFT_LOW				0
-#define TEGRA_I2S_LRCK_RIGHT_LOW			1
-
-#define TEGRA_I2S_CTRL_LRCK_SHIFT			24
-#define TEGRA_I2S_CTRL_LRCK_MASK			(1                        << TEGRA_I2S_CTRL_LRCK_SHIFT)
-#define TEGRA_I2S_CTRL_LRCK_L_LOW			(TEGRA_I2S_LRCK_LEFT_LOW  << TEGRA_I2S_CTRL_LRCK_SHIFT)
-#define TEGRA_I2S_CTRL_LRCK_R_LOW			(TEGRA_I2S_LRCK_RIGHT_LOW << TEGRA_I2S_CTRL_LRCK_SHIFT)
-
-#define TEGRA_I2S_BIT_FORMAT_I2S			0
-#define TEGRA_I2S_BIT_FORMAT_RJM			1
-#define TEGRA_I2S_BIT_FORMAT_LJM			2
-#define TEGRA_I2S_BIT_FORMAT_DSP			3
-
-#define TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT			10
-#define TEGRA_I2S_CTRL_BIT_FORMAT_MASK			(3                        << TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_FORMAT_I2S			(TEGRA_I2S_BIT_FORMAT_I2S << TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_FORMAT_RJM			(TEGRA_I2S_BIT_FORMAT_RJM << TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_FORMAT_LJM			(TEGRA_I2S_BIT_FORMAT_LJM << TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_FORMAT_DSP			(TEGRA_I2S_BIT_FORMAT_DSP << TEGRA_I2S_CTRL_BIT_FORMAT_SHIFT)
-
-#define TEGRA_I2S_BIT_SIZE_16				0
-#define TEGRA_I2S_BIT_SIZE_20				1
-#define TEGRA_I2S_BIT_SIZE_24				2
-#define TEGRA_I2S_BIT_SIZE_32				3
-
-#define TEGRA_I2S_CTRL_BIT_SIZE_SHIFT			8
-#define TEGRA_I2S_CTRL_BIT_SIZE_MASK			(3                     << TEGRA_I2S_CTRL_BIT_SIZE_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_SIZE_16			(TEGRA_I2S_BIT_SIZE_16 << TEGRA_I2S_CTRL_BIT_SIZE_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_SIZE_20			(TEGRA_I2S_BIT_SIZE_20 << TEGRA_I2S_CTRL_BIT_SIZE_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_SIZE_24			(TEGRA_I2S_BIT_SIZE_24 << TEGRA_I2S_CTRL_BIT_SIZE_SHIFT)
-#define TEGRA_I2S_CTRL_BIT_SIZE_32			(TEGRA_I2S_BIT_SIZE_32 << TEGRA_I2S_CTRL_BIT_SIZE_SHIFT)
-
-#define TEGRA_I2S_FIFO_16_LSB				0
-#define TEGRA_I2S_FIFO_20_LSB				1
-#define TEGRA_I2S_FIFO_24_LSB				2
-#define TEGRA_I2S_FIFO_32				3
-#define TEGRA_I2S_FIFO_PACKED				7
-
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT		4
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_MASK			(7                     << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_16_LSB		(TEGRA_I2S_FIFO_16_LSB << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_20_LSB		(TEGRA_I2S_FIFO_20_LSB << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_24_LSB		(TEGRA_I2S_FIFO_24_LSB << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_32			(TEGRA_I2S_FIFO_32     << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-#define TEGRA_I2S_CTRL_FIFO_FORMAT_PACKED		(TEGRA_I2S_FIFO_PACKED << TEGRA_I2S_CTRL_FIFO_FORMAT_SHIFT)
-
-#define TEGRA_I2S_CTRL_IE_FIFO1_ERR			(1 << 3)
-#define TEGRA_I2S_CTRL_IE_FIFO2_ERR			(1 << 2)
-#define TEGRA_I2S_CTRL_QE_FIFO1				(1 << 1)
-#define TEGRA_I2S_CTRL_QE_FIFO2				(1 << 0)
-
-/* Fields in TEGRA_I2S_STATUS */
-
-#define TEGRA_I2S_STATUS_FIFO1_RDY			(1 << 31)
-#define TEGRA_I2S_STATUS_FIFO2_RDY			(1 << 30)
-#define TEGRA_I2S_STATUS_FIFO1_BSY			(1 << 29)
-#define TEGRA_I2S_STATUS_FIFO2_BSY			(1 << 28)
-#define TEGRA_I2S_STATUS_FIFO1_ERR			(1 << 3)
-#define TEGRA_I2S_STATUS_FIFO2_ERR			(1 << 2)
-#define TEGRA_I2S_STATUS_QS_FIFO1			(1 << 1)
-#define TEGRA_I2S_STATUS_QS_FIFO2			(1 << 0)
-
-/* Fields in TEGRA_I2S_TIMING */
-
-#define TEGRA_I2S_TIMING_NON_SYM_ENABLE			(1 << 12)
-#define TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT	0
-#define TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US	0x7fff
-#define TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_MASK		(TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US << TEGRA_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT)
-
-/* Fields in TEGRA_I2S_FIFO_SCR */
-
-#define TEGRA_I2S_FIFO_SCR_FIFO2_FULL_EMPTY_COUNT_SHIFT	24
-#define TEGRA_I2S_FIFO_SCR_FIFO1_FULL_EMPTY_COUNT_SHIFT	16
-#define TEGRA_I2S_FIFO_SCR_FIFO_FULL_EMPTY_COUNT_MASK	0x3f
-
-#define TEGRA_I2S_FIFO_SCR_FIFO2_CLR			(1 << 12)
-#define TEGRA_I2S_FIFO_SCR_FIFO1_CLR			(1 << 8)
-
-#define TEGRA_I2S_FIFO_ATN_LVL_ONE_SLOT			0
-#define TEGRA_I2S_FIFO_ATN_LVL_FOUR_SLOTS		1
-#define TEGRA_I2S_FIFO_ATN_LVL_EIGHT_SLOTS		2
-#define TEGRA_I2S_FIFO_ATN_LVL_TWELVE_SLOTS		3
-
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT		4
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_MASK		(3 << TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_ONE_SLOT	(TEGRA_I2S_FIFO_ATN_LVL_ONE_SLOT     << TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_FOUR_SLOTS   << TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_EIGHT_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_EIGHT_SLOTS  << TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_TWELVE_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_TWELVE_SLOTS << TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
-
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT		0
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_MASK		(3 << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_ONE_SLOT	(TEGRA_I2S_FIFO_ATN_LVL_ONE_SLOT     << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_FOUR_SLOTS   << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_EIGHT_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_EIGHT_SLOTS  << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
-#define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_TWELVE_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_TWELVE_SLOTS << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
-
-struct tegra_i2s {
+/* Register offsets from TEGRA20_I2S1_BASE and TEGRA20_I2S2_BASE */
+
+#define TEGRA20_I2S_CTRL				0x00
+#define TEGRA20_I2S_STATUS				0x04
+#define TEGRA20_I2S_TIMING				0x08
+#define TEGRA20_I2S_FIFO_SCR				0x0c
+#define TEGRA20_I2S_PCM_CTRL				0x10
+#define TEGRA20_I2S_NW_CTRL				0x14
+#define TEGRA20_I2S_TDM_CTRL				0x20
+#define TEGRA20_I2S_TDM_TX_RX_CTRL			0x24
+#define TEGRA20_I2S_FIFO1				0x40
+#define TEGRA20_I2S_FIFO2				0x80
+
+/* Fields in TEGRA20_I2S_CTRL */
+
+#define TEGRA20_I2S_CTRL_FIFO2_TX_ENABLE		(1 << 30)
+#define TEGRA20_I2S_CTRL_FIFO1_ENABLE			(1 << 29)
+#define TEGRA20_I2S_CTRL_FIFO2_ENABLE			(1 << 28)
+#define TEGRA20_I2S_CTRL_FIFO1_RX_ENABLE		(1 << 27)
+#define TEGRA20_I2S_CTRL_FIFO_LPBK_ENABLE		(1 << 26)
+#define TEGRA20_I2S_CTRL_MASTER_ENABLE			(1 << 25)
+
+#define TEGRA20_I2S_LRCK_LEFT_LOW				0
+#define TEGRA20_I2S_LRCK_RIGHT_LOW			1
+
+#define TEGRA20_I2S_CTRL_LRCK_SHIFT			24
+#define TEGRA20_I2S_CTRL_LRCK_MASK			(1                          << TEGRA20_I2S_CTRL_LRCK_SHIFT)
+#define TEGRA20_I2S_CTRL_LRCK_L_LOW			(TEGRA20_I2S_LRCK_LEFT_LOW  << TEGRA20_I2S_CTRL_LRCK_SHIFT)
+#define TEGRA20_I2S_CTRL_LRCK_R_LOW			(TEGRA20_I2S_LRCK_RIGHT_LOW << TEGRA20_I2S_CTRL_LRCK_SHIFT)
+
+#define TEGRA20_I2S_BIT_FORMAT_I2S			0
+#define TEGRA20_I2S_BIT_FORMAT_RJM			1
+#define TEGRA20_I2S_BIT_FORMAT_LJM			2
+#define TEGRA20_I2S_BIT_FORMAT_DSP			3
+
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT		10
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_MASK		(3                          << TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_I2S			(TEGRA20_I2S_BIT_FORMAT_I2S << TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_RJM			(TEGRA20_I2S_BIT_FORMAT_RJM << TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_LJM			(TEGRA20_I2S_BIT_FORMAT_LJM << TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_FORMAT_DSP			(TEGRA20_I2S_BIT_FORMAT_DSP << TEGRA20_I2S_CTRL_BIT_FORMAT_SHIFT)
+
+#define TEGRA20_I2S_BIT_SIZE_16				0
+#define TEGRA20_I2S_BIT_SIZE_20				1
+#define TEGRA20_I2S_BIT_SIZE_24				2
+#define TEGRA20_I2S_BIT_SIZE_32				3
+
+#define TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT			8
+#define TEGRA20_I2S_CTRL_BIT_SIZE_MASK			(3                       << TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_SIZE_16			(TEGRA20_I2S_BIT_SIZE_16 << TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_SIZE_20			(TEGRA20_I2S_BIT_SIZE_20 << TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_SIZE_24			(TEGRA20_I2S_BIT_SIZE_24 << TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA20_I2S_CTRL_BIT_SIZE_32			(TEGRA20_I2S_BIT_SIZE_32 << TEGRA20_I2S_CTRL_BIT_SIZE_SHIFT)
+
+#define TEGRA20_I2S_FIFO_16_LSB				0
+#define TEGRA20_I2S_FIFO_20_LSB				1
+#define TEGRA20_I2S_FIFO_24_LSB				2
+#define TEGRA20_I2S_FIFO_32				3
+#define TEGRA20_I2S_FIFO_PACKED				7
+
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT		4
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_MASK		(7                       << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_16_LSB		(TEGRA20_I2S_FIFO_16_LSB << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_20_LSB		(TEGRA20_I2S_FIFO_20_LSB << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_24_LSB		(TEGRA20_I2S_FIFO_24_LSB << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_32			(TEGRA20_I2S_FIFO_32     << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+#define TEGRA20_I2S_CTRL_FIFO_FORMAT_PACKED		(TEGRA20_I2S_FIFO_PACKED << TEGRA20_I2S_CTRL_FIFO_FORMAT_SHIFT)
+
+#define TEGRA20_I2S_CTRL_IE_FIFO1_ERR			(1 << 3)
+#define TEGRA20_I2S_CTRL_IE_FIFO2_ERR			(1 << 2)
+#define TEGRA20_I2S_CTRL_QE_FIFO1			(1 << 1)
+#define TEGRA20_I2S_CTRL_QE_FIFO2			(1 << 0)
+
+/* Fields in TEGRA20_I2S_STATUS */
+
+#define TEGRA20_I2S_STATUS_FIFO1_RDY			(1 << 31)
+#define TEGRA20_I2S_STATUS_FIFO2_RDY			(1 << 30)
+#define TEGRA20_I2S_STATUS_FIFO1_BSY			(1 << 29)
+#define TEGRA20_I2S_STATUS_FIFO2_BSY			(1 << 28)
+#define TEGRA20_I2S_STATUS_FIFO1_ERR			(1 << 3)
+#define TEGRA20_I2S_STATUS_FIFO2_ERR			(1 << 2)
+#define TEGRA20_I2S_STATUS_QS_FIFO1			(1 << 1)
+#define TEGRA20_I2S_STATUS_QS_FIFO2			(1 << 0)
+
+/* Fields in TEGRA20_I2S_TIMING */
+
+#define TEGRA20_I2S_TIMING_NON_SYM_ENABLE		(1 << 12)
+#define TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT	0
+#define TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US	0x7fff
+#define TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK	(TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT)
+
+/* Fields in TEGRA20_I2S_FIFO_SCR */
+
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_FULL_EMPTY_COUNT_SHIFT	24
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_FULL_EMPTY_COUNT_SHIFT	16
+#define TEGRA20_I2S_FIFO_SCR_FIFO_FULL_EMPTY_COUNT_MASK		0x3f
+
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_CLR			(1 << 12)
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_CLR			(1 << 8)
+
+#define TEGRA20_I2S_FIFO_ATN_LVL_ONE_SLOT		0
+#define TEGRA20_I2S_FIFO_ATN_LVL_FOUR_SLOTS		1
+#define TEGRA20_I2S_FIFO_ATN_LVL_EIGHT_SLOTS		2
+#define TEGRA20_I2S_FIFO_ATN_LVL_TWELVE_SLOTS		3
+
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT	4
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_MASK		(3 << TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_ONE_SLOT	(TEGRA20_I2S_FIFO_ATN_LVL_ONE_SLOT     << TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_FOUR_SLOTS   << TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_EIGHT_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_EIGHT_SLOTS  << TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_TWELVE_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_TWELVE_SLOTS << TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_SHIFT)
+
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT	0
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_MASK		(3 << TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_ONE_SLOT	(TEGRA20_I2S_FIFO_ATN_LVL_ONE_SLOT     << TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_FOUR_SLOTS   << TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_EIGHT_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_EIGHT_SLOTS  << TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
+#define TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_TWELVE_SLOTS	(TEGRA20_I2S_FIFO_ATN_LVL_TWELVE_SLOTS << TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
+
+struct tegra20_i2s {
 	struct snd_soc_dai_driver dai;
 	struct clk *clk_i2s;
 	struct tegra_pcm_dma_params capture_dma_data;
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6b1bbe4..8522cdf 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -36,53 +36,53 @@
 
 #include "tegra20_spdif.h"
 
-#define DRV_NAME "tegra-spdif"
+#define DRV_NAME "tegra20-spdif"
 
-static inline void tegra_spdif_write(struct tegra_spdif *spdif, u32 reg,
+static inline void tegra20_spdif_write(struct tegra20_spdif *spdif, u32 reg,
 					u32 val)
 {
 	__raw_writel(val, spdif->regs + reg);
 }
 
-static inline u32 tegra_spdif_read(struct tegra_spdif *spdif, u32 reg)
+static inline u32 tegra20_spdif_read(struct tegra20_spdif *spdif, u32 reg)
 {
 	return __raw_readl(spdif->regs + reg);
 }
 
 #ifdef CONFIG_DEBUG_FS
-static int tegra_spdif_show(struct seq_file *s, void *unused)
+static int tegra20_spdif_show(struct seq_file *s, void *unused)
 {
 #define REG(r) { r, #r }
 	static const struct {
 		int offset;
 		const char *name;
 	} regs[] = {
-		REG(TEGRA_SPDIF_CTRL),
-		REG(TEGRA_SPDIF_STATUS),
-		REG(TEGRA_SPDIF_STROBE_CTRL),
-		REG(TEGRA_SPDIF_DATA_FIFO_CSR),
-		REG(TEGRA_SPDIF_CH_STA_RX_A),
-		REG(TEGRA_SPDIF_CH_STA_RX_B),
-		REG(TEGRA_SPDIF_CH_STA_RX_C),
-		REG(TEGRA_SPDIF_CH_STA_RX_D),
-		REG(TEGRA_SPDIF_CH_STA_RX_E),
-		REG(TEGRA_SPDIF_CH_STA_RX_F),
-		REG(TEGRA_SPDIF_CH_STA_TX_A),
-		REG(TEGRA_SPDIF_CH_STA_TX_B),
-		REG(TEGRA_SPDIF_CH_STA_TX_C),
-		REG(TEGRA_SPDIF_CH_STA_TX_D),
-		REG(TEGRA_SPDIF_CH_STA_TX_E),
-		REG(TEGRA_SPDIF_CH_STA_TX_F),
+		REG(TEGRA20_SPDIF_CTRL),
+		REG(TEGRA20_SPDIF_STATUS),
+		REG(TEGRA20_SPDIF_STROBE_CTRL),
+		REG(TEGRA20_SPDIF_DATA_FIFO_CSR),
+		REG(TEGRA20_SPDIF_CH_STA_RX_A),
+		REG(TEGRA20_SPDIF_CH_STA_RX_B),
+		REG(TEGRA20_SPDIF_CH_STA_RX_C),
+		REG(TEGRA20_SPDIF_CH_STA_RX_D),
+		REG(TEGRA20_SPDIF_CH_STA_RX_E),
+		REG(TEGRA20_SPDIF_CH_STA_RX_F),
+		REG(TEGRA20_SPDIF_CH_STA_TX_A),
+		REG(TEGRA20_SPDIF_CH_STA_TX_B),
+		REG(TEGRA20_SPDIF_CH_STA_TX_C),
+		REG(TEGRA20_SPDIF_CH_STA_TX_D),
+		REG(TEGRA20_SPDIF_CH_STA_TX_E),
+		REG(TEGRA20_SPDIF_CH_STA_TX_F),
 	};
 #undef REG
 
-	struct tegra_spdif *spdif = s->private;
+	struct tegra20_spdif *spdif = s->private;
 	int i;
 
 	clk_enable(spdif->clk_spdif_out);
 
 	for (i = 0; i < ARRAY_SIZE(regs); i++) {
-		u32 val = tegra_spdif_read(spdif, regs[i].offset);
+		u32 val = tegra20_spdif_read(spdif, regs[i].offset);
 		seq_printf(s, "%s = %08x\n", regs[i].name, val);
 	}
 
@@ -91,54 +91,54 @@ static int tegra_spdif_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int tegra_spdif_debug_open(struct inode *inode, struct file *file)
+static int tegra20_spdif_debug_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, tegra_spdif_show, inode->i_private);
+	return single_open(file, tegra20_spdif_show, inode->i_private);
 }
 
-static const struct file_operations tegra_spdif_debug_fops = {
-	.open    = tegra_spdif_debug_open,
+static const struct file_operations tegra20_spdif_debug_fops = {
+	.open    = tegra20_spdif_debug_open,
 	.read    = seq_read,
 	.llseek  = seq_lseek,
 	.release = single_release,
 };
 
-static void tegra_spdif_debug_add(struct tegra_spdif *spdif)
+static void tegra20_spdif_debug_add(struct tegra20_spdif *spdif)
 {
 	spdif->debug = debugfs_create_file(DRV_NAME, S_IRUGO,
 						snd_soc_debugfs_root, spdif,
-						&tegra_spdif_debug_fops);
+						&tegra20_spdif_debug_fops);
 }
 
-static void tegra_spdif_debug_remove(struct tegra_spdif *spdif)
+static void tegra20_spdif_debug_remove(struct tegra20_spdif *spdif)
 {
 	if (spdif->debug)
 		debugfs_remove(spdif->debug);
 }
 #else
-static inline void tegra_spdif_debug_add(struct tegra_spdif *spdif)
+static inline void tegra20_spdif_debug_add(struct tegra20_spdif *spdif)
 {
 }
 
-static inline void tegra_spdif_debug_remove(struct tegra_spdif *spdif)
+static inline void tegra20_spdif_debug_remove(struct tegra20_spdif *spdif)
 {
 }
 #endif
 
-static int tegra_spdif_hw_params(struct snd_pcm_substream *substream,
+static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
 	struct device *dev = substream->pcm->card->dev;
-	struct tegra_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
 	int ret, spdifclock;
 
-	spdif->reg_ctrl &= ~TEGRA_SPDIF_CTRL_PACK;
-	spdif->reg_ctrl &= ~TEGRA_SPDIF_CTRL_BIT_MODE_MASK;
+	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_PACK;
+	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		spdif->reg_ctrl |= TEGRA_SPDIF_CTRL_PACK;
-		spdif->reg_ctrl |= TEGRA_SPDIF_CTRL_BIT_MODE_16BIT;
+		spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_PACK;
+		spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT;
 		break;
 	default:
 		return -EINVAL;
@@ -179,34 +179,34 @@ static int tegra_spdif_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static void tegra_spdif_start_playback(struct tegra_spdif *spdif)
+static void tegra20_spdif_start_playback(struct tegra20_spdif *spdif)
 {
-	spdif->reg_ctrl |= TEGRA_SPDIF_CTRL_TX_EN;
-	tegra_spdif_write(spdif, TEGRA_SPDIF_CTRL, spdif->reg_ctrl);
+	spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_TX_EN;
+	tegra20_spdif_write(spdif, TEGRA20_SPDIF_CTRL, spdif->reg_ctrl);
 }
 
-static void tegra_spdif_stop_playback(struct tegra_spdif *spdif)
+static void tegra20_spdif_stop_playback(struct tegra20_spdif *spdif)
 {
-	spdif->reg_ctrl &= ~TEGRA_SPDIF_CTRL_TX_EN;
-	tegra_spdif_write(spdif, TEGRA_SPDIF_CTRL, spdif->reg_ctrl);
+	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_TX_EN;
+	tegra20_spdif_write(spdif, TEGRA20_SPDIF_CTRL, spdif->reg_ctrl);
 }
 
-static int tegra_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
+static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
-	struct tegra_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		clk_enable(spdif->clk_spdif_out);
-		tegra_spdif_start_playback(spdif);
+		tegra20_spdif_start_playback(spdif);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		tegra_spdif_stop_playback(spdif);
+		tegra20_spdif_stop_playback(spdif);
 		clk_disable(spdif->clk_spdif_out);
 		break;
 	default:
@@ -216,9 +216,9 @@ static int tegra_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int tegra_spdif_probe(struct snd_soc_dai *dai)
+static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
-	struct tegra_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
 
 	dai->capture_dma_data = NULL;
 	dai->playback_dma_data = &spdif->playback_dma_data;
@@ -226,14 +226,14 @@ static int tegra_spdif_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops tegra_spdif_dai_ops = {
-	.hw_params	= tegra_spdif_hw_params,
-	.trigger	= tegra_spdif_trigger,
+static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
+	.hw_params	= tegra20_spdif_hw_params,
+	.trigger	= tegra20_spdif_trigger,
 };
 
-static struct snd_soc_dai_driver tegra_spdif_dai = {
+static struct snd_soc_dai_driver tegra20_spdif_dai = {
 	.name = DRV_NAME,
-	.probe = tegra_spdif_probe,
+	.probe = tegra20_spdif_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
@@ -241,18 +241,18 @@ static struct snd_soc_dai_driver tegra_spdif_dai = {
 				SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
-	.ops = &tegra_spdif_dai_ops,
+	.ops = &tegra20_spdif_dai_ops,
 };
 
-static __devinit int tegra_spdif_platform_probe(struct platform_device *pdev)
+static __devinit int tegra20_spdif_platform_probe(struct platform_device *pdev)
 {
-	struct tegra_spdif *spdif;
+	struct tegra20_spdif *spdif;
 	struct resource *mem, *memregion, *dmareq;
 	int ret;
 
-	spdif = kzalloc(sizeof(struct tegra_spdif), GFP_KERNEL);
+	spdif = kzalloc(sizeof(struct tegra20_spdif), GFP_KERNEL);
 	if (!spdif) {
-		dev_err(&pdev->dev, "Can't allocate tegra_spdif\n");
+		dev_err(&pdev->dev, "Can't allocate tegra20_spdif\n");
 		ret = -ENOMEM;
 		goto exit;
 	}
@@ -294,12 +294,12 @@ static __devinit int tegra_spdif_platform_probe(struct platform_device *pdev)
 		goto err_release;
 	}
 
-	spdif->playback_dma_data.addr = mem->start + TEGRA_SPDIF_DATA_OUT;
+	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.wrap = 4;
 	spdif->playback_dma_data.width = 32;
 	spdif->playback_dma_data.req_sel = dmareq->start;
 
-	ret = snd_soc_register_dai(&pdev->dev, &tegra_spdif_dai);
+	ret = snd_soc_register_dai(&pdev->dev, &tegra20_spdif_dai);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
@@ -312,7 +312,7 @@ static __devinit int tegra_spdif_platform_probe(struct platform_device *pdev)
 		goto err_unregister_dai;
 	}
 
-	tegra_spdif_debug_add(spdif);
+	tegra20_spdif_debug_add(spdif);
 
 	return 0;
 
@@ -330,15 +330,15 @@ exit:
 	return ret;
 }
 
-static int __devexit tegra_spdif_platform_remove(struct platform_device *pdev)
+static int __devexit tegra20_spdif_platform_remove(struct platform_device *pdev)
 {
-	struct tegra_spdif *spdif = dev_get_drvdata(&pdev->dev);
+	struct tegra20_spdif *spdif = dev_get_drvdata(&pdev->dev);
 	struct resource *res;
 
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
-	tegra_spdif_debug_remove(spdif);
+	tegra20_spdif_debug_remove(spdif);
 
 	iounmap(spdif->regs);
 
@@ -352,18 +352,18 @@ static int __devexit tegra_spdif_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver tegra_spdif_driver = {
+static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
 	},
-	.probe = tegra_spdif_platform_probe,
-	.remove = __devexit_p(tegra_spdif_platform_remove),
+	.probe = tegra20_spdif_platform_probe,
+	.remove = __devexit_p(tegra20_spdif_platform_remove),
 };
 
-module_platform_driver(tegra_spdif_driver);
+module_platform_driver(tegra20_spdif_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
-MODULE_DESCRIPTION("Tegra SPDIF ASoC driver");
+MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index 001f9dc..823af4c 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -23,83 +23,83 @@
  *
  */
 
-#ifndef __TEGRA_SPDIF_H__
-#define __TEGRA_SPDIF_H__
+#ifndef __TEGRA20_SPDIF_H__
+#define __TEGRA20_SPDIF_H__
 
 #include "tegra_pcm.h"
 
-/* Offsets from TEGRA_SPDIF_BASE */
-
-#define TEGRA_SPDIF_CTRL					0x0
-#define TEGRA_SPDIF_STATUS					0x4
-#define TEGRA_SPDIF_STROBE_CTRL					0x8
-#define TEGRA_SPDIF_DATA_FIFO_CSR				0x0C
-#define TEGRA_SPDIF_DATA_OUT					0x40
-#define TEGRA_SPDIF_DATA_IN					0x80
-#define TEGRA_SPDIF_CH_STA_RX_A					0x100
-#define TEGRA_SPDIF_CH_STA_RX_B					0x104
-#define TEGRA_SPDIF_CH_STA_RX_C					0x108
-#define TEGRA_SPDIF_CH_STA_RX_D					0x10C
-#define TEGRA_SPDIF_CH_STA_RX_E					0x110
-#define TEGRA_SPDIF_CH_STA_RX_F					0x114
-#define TEGRA_SPDIF_CH_STA_TX_A					0x140
-#define TEGRA_SPDIF_CH_STA_TX_B					0x144
-#define TEGRA_SPDIF_CH_STA_TX_C					0x148
-#define TEGRA_SPDIF_CH_STA_TX_D					0x14C
-#define TEGRA_SPDIF_CH_STA_TX_E					0x150
-#define TEGRA_SPDIF_CH_STA_TX_F					0x154
-#define TEGRA_SPDIF_USR_STA_RX_A				0x180
-#define TEGRA_SPDIF_USR_DAT_TX_A				0x1C0
-
-/* Fields in TEGRA_SPDIF_CTRL */
+/* Offsets from TEGRA20_SPDIF_BASE */
+
+#define TEGRA20_SPDIF_CTRL					0x0
+#define TEGRA20_SPDIF_STATUS					0x4
+#define TEGRA20_SPDIF_STROBE_CTRL				0x8
+#define TEGRA20_SPDIF_DATA_FIFO_CSR				0x0C
+#define TEGRA20_SPDIF_DATA_OUT					0x40
+#define TEGRA20_SPDIF_DATA_IN					0x80
+#define TEGRA20_SPDIF_CH_STA_RX_A				0x100
+#define TEGRA20_SPDIF_CH_STA_RX_B				0x104
+#define TEGRA20_SPDIF_CH_STA_RX_C				0x108
+#define TEGRA20_SPDIF_CH_STA_RX_D				0x10C
+#define TEGRA20_SPDIF_CH_STA_RX_E				0x110
+#define TEGRA20_SPDIF_CH_STA_RX_F				0x114
+#define TEGRA20_SPDIF_CH_STA_TX_A				0x140
+#define TEGRA20_SPDIF_CH_STA_TX_B				0x144
+#define TEGRA20_SPDIF_CH_STA_TX_C				0x148
+#define TEGRA20_SPDIF_CH_STA_TX_D				0x14C
+#define TEGRA20_SPDIF_CH_STA_TX_E				0x150
+#define TEGRA20_SPDIF_CH_STA_TX_F				0x154
+#define TEGRA20_SPDIF_USR_STA_RX_A				0x180
+#define TEGRA20_SPDIF_USR_DAT_TX_A				0x1C0
+
+/* Fields in TEGRA20_SPDIF_CTRL */
 
 /* Start capturing from 0=right, 1=left channel */
-#define TEGRA_SPDIF_CTRL_CAP_LC					(1 << 30)
+#define TEGRA20_SPDIF_CTRL_CAP_LC				(1 << 30)
 
 /* SPDIF receiver(RX) enable */
-#define TEGRA_SPDIF_CTRL_RX_EN					(1 << 29)
+#define TEGRA20_SPDIF_CTRL_RX_EN				(1 << 29)
 
 /* SPDIF Transmitter(TX) enable */
-#define TEGRA_SPDIF_CTRL_TX_EN					(1 << 28)
+#define TEGRA20_SPDIF_CTRL_TX_EN				(1 << 28)
 
 /* Transmit Channel status */
-#define TEGRA_SPDIF_CTRL_TC_EN					(1 << 27)
+#define TEGRA20_SPDIF_CTRL_TC_EN				(1 << 27)
 
 /* Transmit user Data */
-#define TEGRA_SPDIF_CTRL_TU_EN					(1 << 26)
+#define TEGRA20_SPDIF_CTRL_TU_EN				(1 << 26)
 
 /* Interrupt on transmit error */
-#define TEGRA_SPDIF_CTRL_IE_TXE					(1 << 25)
+#define TEGRA20_SPDIF_CTRL_IE_TXE				(1 << 25)
 
 /* Interrupt on receive error */
-#define TEGRA_SPDIF_CTRL_IE_RXE					(1 << 24)
+#define TEGRA20_SPDIF_CTRL_IE_RXE				(1 << 24)
 
 /* Interrupt on invalid preamble */
-#define TEGRA_SPDIF_CTRL_IE_P					(1 << 23)
+#define TEGRA20_SPDIF_CTRL_IE_P					(1 << 23)
 
 /* Interrupt on "B" preamble */
-#define TEGRA_SPDIF_CTRL_IE_B					(1 << 22)
+#define TEGRA20_SPDIF_CTRL_IE_B					(1 << 22)
 
 /* Interrupt when block of channel status received */
-#define TEGRA_SPDIF_CTRL_IE_C					(1 << 21)
+#define TEGRA20_SPDIF_CTRL_IE_C					(1 << 21)
 
 /* Interrupt when a valid information unit (IU) is received */
-#define TEGRA_SPDIF_CTRL_IE_U					(1 << 20)
+#define TEGRA20_SPDIF_CTRL_IE_U					(1 << 20)
 
 /* Interrupt when RX user FIFO attention level is reached */
-#define TEGRA_SPDIF_CTRL_QE_RU					(1 << 19)
+#define TEGRA20_SPDIF_CTRL_QE_RU				(1 << 19)
 
 /* Interrupt when TX user FIFO attention level is reached */
-#define TEGRA_SPDIF_CTRL_QE_TU					(1 << 18)
+#define TEGRA20_SPDIF_CTRL_QE_TU				(1 << 18)
 
 /* Interrupt when RX data FIFO attention level is reached */
-#define TEGRA_SPDIF_CTRL_QE_RX					(1 << 17)
+#define TEGRA20_SPDIF_CTRL_QE_RX				(1 << 17)
 
 /* Interrupt when TX data FIFO attention level is reached */
-#define TEGRA_SPDIF_CTRL_QE_TX					(1 << 16)
+#define TEGRA20_SPDIF_CTRL_QE_TX				(1 << 16)
 
 /* Loopback test mode enable */
-#define TEGRA_SPDIF_CTRL_LBK_EN					(1 << 15)
+#define TEGRA20_SPDIF_CTRL_LBK_EN				(1 << 15)
 
 /*
  * Pack data mode:
@@ -107,7 +107,7 @@
  *     interface data bit size).
  * 1 = Packeted left/right channel data into a single word.
  */
-#define TEGRA_SPDIF_CTRL_PACK					(1 << 14)
+#define TEGRA20_SPDIF_CTRL_PACK					(1 << 14)
 
 /*
  * 00 = 16bit data
@@ -115,19 +115,19 @@
  * 10 = 24bit data
  * 11 = raw data
  */
-#define TEGRA_SPDIF_BIT_MODE_16BIT				0
-#define TEGRA_SPDIF_BIT_MODE_20BIT				1
-#define TEGRA_SPDIF_BIT_MODE_24BIT				2
-#define TEGRA_SPDIF_BIT_MODE_RAW				3
+#define TEGRA20_SPDIF_BIT_MODE_16BIT				0
+#define TEGRA20_SPDIF_BIT_MODE_20BIT				1
+#define TEGRA20_SPDIF_BIT_MODE_24BIT				2
+#define TEGRA20_SPDIF_BIT_MODE_RAW				3
 
-#define TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT				12
-#define TEGRA_SPDIF_CTRL_BIT_MODE_MASK				(3                          << TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT)
-#define TEGRA_SPDIF_CTRL_BIT_MODE_16BIT				(TEGRA_SPDIF_BIT_MODE_16BIT << TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT)
-#define TEGRA_SPDIF_CTRL_BIT_MODE_20BIT				(TEGRA_SPDIF_BIT_MODE_20BIT << TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT)
-#define TEGRA_SPDIF_CTRL_BIT_MODE_24BIT				(TEGRA_SPDIF_BIT_MODE_24BIT << TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT)
-#define TEGRA_SPDIF_CTRL_BIT_MODE_RAW				(TEGRA_SPDIF_BIT_MODE_RAW   << TEGRA_SPDIF_CTRL_BIT_MODE_SHIFT)
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT			12
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_MASK			(3                            << TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT)
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT			(TEGRA20_SPDIF_BIT_MODE_16BIT << TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT)
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_20BIT			(TEGRA20_SPDIF_BIT_MODE_20BIT << TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT)
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_24BIT			(TEGRA20_SPDIF_BIT_MODE_24BIT << TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT)
+#define TEGRA20_SPDIF_CTRL_BIT_MODE_RAW				(TEGRA20_SPDIF_BIT_MODE_RAW   << TEGRA20_SPDIF_CTRL_BIT_MODE_SHIFT)
 
-/* Fields in TEGRA_SPDIF_STATUS */
+/* Fields in TEGRA20_SPDIF_STATUS */
 
 /*
  * Note: IS_P, IS_B, IS_C, and IS_U are sticky bits. Software must
@@ -142,7 +142,7 @@
  * (a) the end of a frame is reached after RX_EN is deeasserted, or
  * (b) the SPDIF data stream becomes inactive.
  */
-#define TEGRA_SPDIF_STATUS_RX_BSY				(1 << 29)
+#define TEGRA20_SPDIF_STATUS_RX_BSY				(1 << 29)
 
 /*
  * Transmitter(TX) shifter is busy transmitting data.
@@ -150,7 +150,7 @@
  * This bit is deasserted when the end of a frame is reached after
  * TX_EN is deasserted.
  */
-#define TEGRA_SPDIF_STATUS_TX_BSY				(1 << 28)
+#define TEGRA20_SPDIF_STATUS_TX_BSY				(1 << 28)
 
 /*
  * TX is busy shifting out channel status.
@@ -160,7 +160,7 @@
  * (a) the end of a frame is reached after TX_EN is deasserted, or
  * (b) CH_STA_TX_F register is loaded into the internal shifter.
  */
-#define TEGRA_SPDIF_STATUS_TC_BSY				(1 << 27)
+#define TEGRA20_SPDIF_STATUS_TC_BSY				(1 << 27)
 
 /*
  * TX User data FIFO busy.
@@ -169,173 +169,173 @@
  * (a) the end of a frame is reached after TX_EN is deasserted, or
  * (b) there's no data left in the TX user FIFO.
  */
-#define TEGRA_SPDIF_STATUS_TU_BSY				(1 << 26)
+#define TEGRA20_SPDIF_STATUS_TU_BSY				(1 << 26)
 
 /* TX FIFO Underrun error status */
-#define TEGRA_SPDIF_STATUS_TX_ERR				(1 << 25)
+#define TEGRA20_SPDIF_STATUS_TX_ERR				(1 << 25)
 
 /* RX FIFO Overrun error status */
-#define TEGRA_SPDIF_STATUS_RX_ERR				(1 << 24)
+#define TEGRA20_SPDIF_STATUS_RX_ERR				(1 << 24)
 
 /* Preamble status: 0=Preamble OK, 1=bad/missing preamble */
-#define TEGRA_SPDIF_STATUS_IS_P					(1 << 23)
+#define TEGRA20_SPDIF_STATUS_IS_P				(1 << 23)
 
 /* B-preamble detection status: 0=not detected, 1=B-preamble detected */
-#define TEGRA_SPDIF_STATUS_IS_B					(1 << 22)
+#define TEGRA20_SPDIF_STATUS_IS_B				(1 << 22)
 
 /*
  * RX channel block data receive status:
  * 0=entire block not recieved yet.
  * 1=received entire block of channel status,
  */
-#define TEGRA_SPDIF_STATUS_IS_C					(1 << 21)
+#define TEGRA20_SPDIF_STATUS_IS_C				(1 << 21)
 
 /* RX User Data Valid flag:  1=valid IU detected, 0 = no IU detected. */
-#define TEGRA_SPDIF_STATUS_IS_U					(1 << 20)
+#define TEGRA20_SPDIF_STATUS_IS_U				(1 << 20)
 
 /*
  * RX User FIFO Status:
  * 1=attention level reached, 0=attention level not reached.
  */
-#define TEGRA_SPDIF_STATUS_QS_RU				(1 << 19)
+#define TEGRA20_SPDIF_STATUS_QS_RU				(1 << 19)
 
 /*
  * TX User FIFO Status:
  * 1=attention level reached, 0=attention level not reached.
  */
-#define TEGRA_SPDIF_STATUS_QS_TU				(1 << 18)
+#define TEGRA20_SPDIF_STATUS_QS_TU				(1 << 18)
 
 /*
  * RX Data FIFO Status:
  * 1=attention level reached, 0=attention level not reached.
  */
-#define TEGRA_SPDIF_STATUS_QS_RX				(1 << 17)
+#define TEGRA20_SPDIF_STATUS_QS_RX				(1 << 17)
 
 /*
  * TX Data FIFO Status:
  * 1=attention level reached, 0=attention level not reached.
  */
-#define TEGRA_SPDIF_STATUS_QS_TX				(1 << 16)
+#define TEGRA20_SPDIF_STATUS_QS_TX				(1 << 16)
 
-/* Fields in TEGRA_SPDIF_STROBE_CTRL */
+/* Fields in TEGRA20_SPDIF_STROBE_CTRL */
 
 /*
  * Indicates the approximate number of detected SPDIFIN clocks within a
  * bi-phase period.
  */
-#define TEGRA_SPDIF_STROBE_CTRL_PERIOD_SHIFT			16
-#define TEGRA_SPDIF_STROBE_CTRL_PERIOD_MASK			(0xff << TEGRA_SPDIF_STROBE_CTRL_PERIOD_SHIFT)
+#define TEGRA20_SPDIF_STROBE_CTRL_PERIOD_SHIFT			16
+#define TEGRA20_SPDIF_STROBE_CTRL_PERIOD_MASK			(0xff << TEGRA20_SPDIF_STROBE_CTRL_PERIOD_SHIFT)
 
 /* Data strobe mode: 0=Auto-locked 1=Manual locked */
-#define TEGRA_SPDIF_STROBE_CTRL_STROBE				(1 << 15)
+#define TEGRA20_SPDIF_STROBE_CTRL_STROBE			(1 << 15)
 
 /*
  * Manual data strobe time within the bi-phase clock period (in terms of
  * the number of over-sampling clocks).
  */
-#define TEGRA_SPDIF_STROBE_CTRL_DATA_STROBES_SHIFT		8
-#define TEGRA_SPDIF_STROBE_CTRL_DATA_STROBES_MASK		(0x1f << TEGRA_SPDIF_STROBE_CTRL_DATA_STROBES_SHIFT)
+#define TEGRA20_SPDIF_STROBE_CTRL_DATA_STROBES_SHIFT		8
+#define TEGRA20_SPDIF_STROBE_CTRL_DATA_STROBES_MASK		(0x1f << TEGRA20_SPDIF_STROBE_CTRL_DATA_STROBES_SHIFT)
 
 /*
  * Manual SPDIFIN bi-phase clock period (in terms of the number of
  * over-sampling clocks).
  */
-#define TEGRA_SPDIF_STROBE_CTRL_CLOCK_PERIOD_SHIFT		0
-#define TEGRA_SPDIF_STROBE_CTRL_CLOCK_PERIOD_MASK		(0x3f << TEGRA_SPDIF_STROBE_CTRL_CLOCK_PERIOD_SHIFT)
+#define TEGRA20_SPDIF_STROBE_CTRL_CLOCK_PERIOD_SHIFT		0
+#define TEGRA20_SPDIF_STROBE_CTRL_CLOCK_PERIOD_MASK		(0x3f << TEGRA20_SPDIF_STROBE_CTRL_CLOCK_PERIOD_SHIFT)
 
 /* Fields in SPDIF_DATA_FIFO_CSR */
 
 /* Clear Receiver User FIFO (RX USR.FIFO) */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_CLR			(1 << 31)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_CLR			(1 << 31)
 
-#define TEGRA_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT			0
-#define TEGRA_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS			1
-#define TEGRA_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS			2
-#define TEGRA_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS			3
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT			0
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS			1
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS		2
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS			3
 
 /* RU FIFO attention level */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT		29
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_MASK		\
-		(0x3                                    << TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU1_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT    << TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU2_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS   << TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU3_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS << TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU4_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS  << TEGRA_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT		29
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_MASK		\
+		(0x3                                      << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU1_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT    << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU2_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS   << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU3_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_RU4_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS  << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_ATN_LVL_SHIFT)
 
 /* Number of RX USR.FIFO levels with valid data. */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_SHIFT		24
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_MASK		(0x1f << TEGRA_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_SHIFT		24
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_MASK		(0x1f << TEGRA20_SPDIF_DATA_FIFO_CSR_RU_FULL_COUNT_SHIFT)
 
 /* Clear Transmitter User FIFO (TX USR.FIFO) */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_CLR			(1 << 23)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_CLR			(1 << 23)
 
 /* TU FIFO attention level */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT		21
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_MASK		\
-		(0x3                                   << TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU1_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT    << TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU2_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS   << TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU3_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS << TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU4_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS  << TEGRA_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT		21
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_MASK		\
+		(0x3                                      << TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU1_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_ONE_SLOT    << TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU2_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_TWO_SLOTS   << TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU3_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_THREE_SLOTS << TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_TU4_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_U_FOUR_SLOTS  << TEGRA20_SPDIF_DATA_FIFO_CSR_TU_ATN_LVL_SHIFT)
 
 /* Number of TX USR.FIFO levels that could be filled. */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_SHIFT		16
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_MASK		(0x1f << SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_SHIFT	16
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_MASK		(0x1f << SPDIF_DATA_FIFO_CSR_TU_EMPTY_COUNT_SHIFT)
 
 /* Clear Receiver Data FIFO (RX DATA.FIFO) */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_CLR			(1 << 15)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_CLR			(1 << 15)
 
-#define TEGRA_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT			0
-#define TEGRA_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS			1
-#define TEGRA_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS			2
-#define TEGRA_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS			3
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT			0
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS			1
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS		2
+#define TEGRA20_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS		3
 
 /* RU FIFO attention level */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT		13
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_MASK		\
-		(0x3                                     << TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU1_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT     << TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU4_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS   << TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU8_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS  << TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU12_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS << TEGRA_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT		13
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_MASK		\
+		(0x3                                       << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU1_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT     << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU4_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS   << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU8_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS  << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_RU12_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_ATN_LVL_SHIFT)
 
 /* Number of RX DATA.FIFO levels with valid data. */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_SHIFT		8
-#define TEGRA_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_MASK		(0x1f << TEGRA_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_SHIFT		8
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_MASK		(0x1f << TEGRA20_SPDIF_DATA_FIFO_CSR_RX_FULL_COUNT_SHIFT)
 
 /* Clear Transmitter Data FIFO (TX DATA.FIFO) */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_CLR			(1 << 7)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_CLR			(1 << 7)
 
 /* TU FIFO attention level */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT		5
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK		\
-		(0x3                                     << TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU1_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT     << TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS   << TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU8_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS  << TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU12_WORD_FULL	\
-		(TEGRA_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS << TEGRA_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT		5
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK		\
+		(0x3                                       << TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU1_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_ONE_SLOT     << TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_FOUR_SLOTS   << TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU8_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_EIGHT_SLOTS  << TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU12_WORD_FULL	\
+		(TEGRA20_SPDIF_FIFO_ATN_LVL_D_TWELVE_SLOTS << TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_SHIFT)
 
 /* Number of TX DATA.FIFO levels that could be filled. */
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_SHIFT		0
-#define TEGRA_SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_MASK		(0x1f << SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_SHIFT)
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_SHIFT	0
+#define TEGRA20_SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_MASK		(0x1f << SPDIF_DATA_FIFO_CSR_TX_EMPTY_COUNT_SHIFT)
 
-/* Fields in TEGRA_SPDIF_DATA_OUT */
+/* Fields in TEGRA20_SPDIF_DATA_OUT */
 
 /*
  * This register has 5 different formats:
@@ -346,36 +346,36 @@
  * 16-bit packed (BIT_MODE=00, PACK=1)
  */
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_SHIFT			0
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_MASK			(0xffff << TEGRA_SPDIF_DATA_OUT_DATA_16_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_SHIFT			0
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_MASK			(0xffff << TEGRA20_SPDIF_DATA_OUT_DATA_16_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_20_SHIFT			0
-#define TEGRA_SPDIF_DATA_OUT_DATA_20_MASK			(0xfffff << TEGRA_SPDIF_DATA_OUT_DATA_20_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_20_SHIFT			0
+#define TEGRA20_SPDIF_DATA_OUT_DATA_20_MASK			(0xfffff << TEGRA20_SPDIF_DATA_OUT_DATA_20_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_24_SHIFT			0
-#define TEGRA_SPDIF_DATA_OUT_DATA_24_MASK			(0xffffff << TEGRA_SPDIF_DATA_OUT_DATA_24_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_24_SHIFT			0
+#define TEGRA20_SPDIF_DATA_OUT_DATA_24_MASK			(0xffffff << TEGRA20_SPDIF_DATA_OUT_DATA_24_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_P				(1 << 31)
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_C				(1 << 30)
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_U				(1 << 29)
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_V				(1 << 28)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_P			(1 << 31)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_C			(1 << 30)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_U			(1 << 29)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_V			(1 << 28)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_DATA_SHIFT		8
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_DATA_MASK			(0xfffff << TEGRA_SPDIF_DATA_OUT_DATA_RAW_DATA_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_DATA_SHIFT		8
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_DATA_MASK		(0xfffff << TEGRA20_SPDIF_DATA_OUT_DATA_RAW_DATA_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_AUX_SHIFT			4
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_AUX_MASK			(0xf << TEGRA_SPDIF_DATA_OUT_DATA_RAW_AUX_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_AUX_SHIFT		4
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_AUX_MASK		(0xf << TEGRA20_SPDIF_DATA_OUT_DATA_RAW_AUX_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_SHIFT		0
-#define TEGRA_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_MASK		(0xf << TEGRA_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_SHIFT		0
+#define TEGRA20_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_MASK		(0xf << TEGRA20_SPDIF_DATA_OUT_DATA_RAW_PREAMBLE_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_SHIFT		16
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_MASK		(0xffff << TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_SHIFT	16
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_MASK	(0xffff << TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_RIGHT_SHIFT)
 
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_SHIFT		0
-#define TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_MASK		(0xffff << TEGRA_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_SHIFT)
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_SHIFT	0
+#define TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_MASK		(0xffff << TEGRA20_SPDIF_DATA_OUT_DATA_16_PACKED_LEFT_SHIFT)
 
-/* Fields in TEGRA_SPDIF_DATA_IN */
+/* Fields in TEGRA20_SPDIF_DATA_IN */
 
 /*
  * This register has 5 different formats:
@@ -388,44 +388,44 @@
  * Bits 31:24 are common to all modes except 16-bit packed
  */
 
-#define TEGRA_SPDIF_DATA_IN_DATA_P				(1 << 31)
-#define TEGRA_SPDIF_DATA_IN_DATA_C				(1 << 30)
-#define TEGRA_SPDIF_DATA_IN_DATA_U				(1 << 29)
-#define TEGRA_SPDIF_DATA_IN_DATA_V				(1 << 28)
+#define TEGRA20_SPDIF_DATA_IN_DATA_P				(1 << 31)
+#define TEGRA20_SPDIF_DATA_IN_DATA_C				(1 << 30)
+#define TEGRA20_SPDIF_DATA_IN_DATA_U				(1 << 29)
+#define TEGRA20_SPDIF_DATA_IN_DATA_V				(1 << 28)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_PREAMBLE_SHIFT			24
-#define TEGRA_SPDIF_DATA_IN_DATA_PREAMBLE_MASK			(0xf << TEGRA_SPDIF_DATA_IN_DATA_PREAMBLE_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_PREAMBLE_SHIFT		24
+#define TEGRA20_SPDIF_DATA_IN_DATA_PREAMBLE_MASK		(0xf << TEGRA20_SPDIF_DATA_IN_DATA_PREAMBLE_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_16_SHIFT			0
-#define TEGRA_SPDIF_DATA_IN_DATA_16_MASK			(0xffff << TEGRA_SPDIF_DATA_IN_DATA_16_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_SHIFT			0
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_MASK			(0xffff << TEGRA20_SPDIF_DATA_IN_DATA_16_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_20_SHIFT			0
-#define TEGRA_SPDIF_DATA_IN_DATA_20_MASK			(0xfffff << TEGRA_SPDIF_DATA_IN_DATA_20_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_20_SHIFT			0
+#define TEGRA20_SPDIF_DATA_IN_DATA_20_MASK			(0xfffff << TEGRA20_SPDIF_DATA_IN_DATA_20_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_24_SHIFT			0
-#define TEGRA_SPDIF_DATA_IN_DATA_24_MASK			(0xffffff << TEGRA_SPDIF_DATA_IN_DATA_24_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_24_SHIFT			0
+#define TEGRA20_SPDIF_DATA_IN_DATA_24_MASK			(0xffffff << TEGRA20_SPDIF_DATA_IN_DATA_24_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_DATA_SHIFT			8
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_DATA_MASK			(0xfffff << TEGRA_SPDIF_DATA_IN_DATA_RAW_DATA_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_DATA_SHIFT		8
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_DATA_MASK		(0xfffff << TEGRA20_SPDIF_DATA_IN_DATA_RAW_DATA_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_AUX_SHIFT			4
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_AUX_MASK			(0xf << TEGRA_SPDIF_DATA_IN_DATA_RAW_AUX_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_AUX_SHIFT		4
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_AUX_MASK			(0xf << TEGRA20_SPDIF_DATA_IN_DATA_RAW_AUX_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_SHIFT		0
-#define TEGRA_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_MASK		(0xf << TEGRA_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_SHIFT		0
+#define TEGRA20_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_MASK		(0xf << TEGRA20_SPDIF_DATA_IN_DATA_RAW_PREAMBLE_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_SHIFT		16
-#define TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_MASK		(0xffff << TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_SHIFT	16
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_MASK		(0xffff << TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_RIGHT_SHIFT)
 
-#define TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_SHIFT		0
-#define TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_MASK		(0xffff << TEGRA_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_SHIFT)
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_SHIFT		0
+#define TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_MASK		(0xffff << TEGRA20_SPDIF_DATA_IN_DATA_16_PACKED_LEFT_SHIFT)
 
-/* Fields in TEGRA_SPDIF_CH_STA_RX_A */
-/* Fields in TEGRA_SPDIF_CH_STA_RX_B */
-/* Fields in TEGRA_SPDIF_CH_STA_RX_C */
-/* Fields in TEGRA_SPDIF_CH_STA_RX_D */
-/* Fields in TEGRA_SPDIF_CH_STA_RX_E */
-/* Fields in TEGRA_SPDIF_CH_STA_RX_F */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_A */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_B */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_C */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_D */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_E */
+/* Fields in TEGRA20_SPDIF_CH_STA_RX_F */
 
 /*
  * The 6-word receive channel data page buffer holds a block (192 frames) of
@@ -433,12 +433,12 @@
  * bit, and from CH_STA_RX_A to CH_STA_RX_F then back to CH_STA_RX_A.
  */
 
-/* Fields in TEGRA_SPDIF_CH_STA_TX_A */
-/* Fields in TEGRA_SPDIF_CH_STA_TX_B */
-/* Fields in TEGRA_SPDIF_CH_STA_TX_C */
-/* Fields in TEGRA_SPDIF_CH_STA_TX_D */
-/* Fields in TEGRA_SPDIF_CH_STA_TX_E */
-/* Fields in TEGRA_SPDIF_CH_STA_TX_F */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_A */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_B */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_C */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_D */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_E */
+/* Fields in TEGRA20_SPDIF_CH_STA_TX_F */
 
 /*
  * The 6-word transmit channel data page buffer holds a block (192 frames) of
@@ -446,21 +446,21 @@
  * bit, and from CH_STA_TX_A to CH_STA_TX_F then back to CH_STA_TX_A.
  */
 
-/* Fields in TEGRA_SPDIF_USR_STA_RX_A */
+/* Fields in TEGRA20_SPDIF_USR_STA_RX_A */
 
 /*
  * This 4-word deep FIFO receives user FIFO field information. The order of
  * receive is from LSB to MSB bit.
  */
 
-/* Fields in TEGRA_SPDIF_USR_DAT_TX_A */
+/* Fields in TEGRA20_SPDIF_USR_DAT_TX_A */
 
 /*
  * This 4-word deep FIFO transmits user FIFO field information. The order of
  * transmission is from LSB to MSB bit.
  */
 
-struct tegra_spdif {
+struct tegra20_spdif {
 	struct clk *clk_spdif_out;
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2f9e9ff..0b0df49 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -350,8 +350,8 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
 	.codec_name = "wm8903.0-001a",
-	.platform_name = "tegra-i2s.0",
-	.cpu_dai_name = "tegra-i2s.0",
+	.platform_name = "tegra20-i2s.0",
+	.cpu_dai_name = "tegra20-i2s.0",
 	.codec_dai_name = "wm8903-hifi",
 	.init = tegra_wm8903_init,
 	.ops = &tegra_wm8903_ops,
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 8884667..0fd115e 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -116,8 +116,8 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
 	.codec_name = "tlv320aic23-codec.2-001a",
-	.platform_name = "tegra-i2s.0",
-	.cpu_dai_name = "tegra-i2s.0",
+	.platform_name = "tegra20-i2s.0",
+	.cpu_dai_name = "tegra20-i2s.0",
 	.codec_dai_name = "tlv320aic23-hifi",
 	.ops = &trimslice_asoc_ops,
 };
-- 
1.7.0.4
