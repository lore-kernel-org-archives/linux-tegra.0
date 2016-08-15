From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: add tegra sgtl5000 machine driver" to the asoc tree
Date: Mon, 15 Aug 2016 15:11:26 +0100
Message-ID: <E1bZIbu-0006s6-7P@debutante>
References: <1466298002-12576-2-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466298002-12576-2-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>Marcel Ziswiler <marcel@ziswiler.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: add tegra sgtl5000 machine driver

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 04445681f710eb3a6a263504fa3e6f4199f12d87 Mon Sep 17 00:00:00 2001
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Date: Sun, 19 Jun 2016 03:00:00 +0200
Subject: [PATCH] ASoC: tegra: add tegra sgtl5000 machine driver

This binding and driver describe/support playback to headphones, and
capture from line-in and microphone.

This driver is useful for the Toradex Apalis T30, Apalis TK1 and
Colibri T30 modules.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |  42 ++++
 sound/soc/tegra/Kconfig                            |  11 ++
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_sgtl5000.c                   | 212 +++++++++++++++++++++
 4 files changed, 267 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
 create mode 100644 sound/soc/tegra/tegra_sgtl5000.c

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
new file mode 100644
index 000000000000..5da7da4ea07a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
@@ -0,0 +1,42 @@
+NVIDIA Tegra audio complex, with SGTL5000 CODEC
+
+Required properties:
+- compatible : "nvidia,tegra-audio-sgtl5000"
+- clocks : Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names : Must include the following entries:
+  - pll_a
+  - pll_a_out0
+  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
+- nvidia,model : The user-visible name of this sound complex.
+- nvidia,audio-routing : A list of the connections between audio components.
+  Each entry is a pair of strings, the first being the connection's sink,
+  the second being the connection's source. Valid names for sources and
+  sinks are the SGTL5000's pins (as documented in its binding), and the jacks
+  on the board:
+
+  * Headphone Jack
+  * Line In Jack
+  * Mic Jack
+
+- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
+  connected to the CODEC.
+- nvidia,audio-codec : The phandle of the SGTL5000 audio codec.
+
+Example:
+
+sound {
+	compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
+		     "nvidia,tegra-audio-sgtl5000";
+	nvidia,model = "Toradex Apalis T30";
+	nvidia,audio-routing =
+		"Headphone Jack", "HP_OUT",
+		"LINE_IN", "Line In Jack",
+		"MIC_IN", "Mic Jack";
+	nvidia,i2s-controller = <&tegra_i2s2>;
+	nvidia,audio-codec = <&sgtl5000>;
+	clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+		 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+		 <&tegra_car TEGRA30_CLK_EXTERN1>;
+	clock-names = "pll_a", "pll_a_out0", "mclk";
+};
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index a6768f832c6f..efbe8d4c019e 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -138,3 +138,14 @@ config SND_SOC_TEGRA_RT5677
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
 	  boards using the RT5677 codec, such as Ryu.
+
+config SND_SOC_TEGRA_SGTL5000
+	tristate "SoC Audio support for Tegra boards using a SGTL5000 codec"
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
+	select SND_SOC_SGTL5000
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the SGTL5000 codec, such as Apalis T30, Apalis TK1 or
+	  Colibri T30.
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 9171655ad843..f214a3fd0024 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -26,6 +26,7 @@ snd-soc-tegra-wm9712-objs := tegra_wm9712.o
 snd-soc-tegra-trimslice-objs := trimslice.o
 snd-soc-tegra-alc5632-objs := tegra_alc5632.o
 snd-soc-tegra-max98090-objs := tegra_max98090.o
+snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
 obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
@@ -35,3 +36,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_WM9712) += snd-soc-tegra-wm9712.o
 obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
 obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
+obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
\ No newline at end of file
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
new file mode 100644
index 000000000000..1e76869dd488
--- /dev/null
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -0,0 +1,212 @@
+/*
+ * tegra_sgtl5000.c - Tegra machine ASoC driver for boards using SGTL5000 codec
+ *
+ * Author: Marcel Ziswiler <marcel@ziswiler.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Based on code copyright/by:
+ *
+ * Copyright (C) 2010-2012 - NVIDIA, Inc.
+ * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
+ * Copyright 2007 Wolfson Microelectronics PLC.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "../codecs/sgtl5000.h"
+
+#include "tegra_asoc_utils.h"
+
+#define DRV_NAME "tegra-snd-sgtl5000"
+
+struct tegra_sgtl5000 {
+	struct tegra_asoc_utils_data util_data;
+};
+
+static int tegra_sgtl5000_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_card *card = rtd->card;
+	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(card);
+	int srate, mclk;
+	int err;
+
+	srate = params_rate(params);
+	switch (srate) {
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 11289600;
+		break;
+	default:
+		mclk = 12288000;
+		break;
+	}
+
+	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
+	if (err < 0) {
+		dev_err(card->dev, "Can't configure clocks\n");
+		return err;
+	}
+
+	err = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, mclk,
+				     SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops tegra_sgtl5000_ops = {
+	.hw_params = tegra_sgtl5000_hw_params,
+};
+
+static const struct snd_soc_dapm_widget tegra_sgtl5000_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_LINE("Line In Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
+static struct snd_soc_dai_link tegra_sgtl5000_dai = {
+	.name = "sgtl5000",
+	.stream_name = "HiFi",
+	.codec_dai_name = "sgtl5000",
+	.ops = &tegra_sgtl5000_ops,
+	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+};
+
+static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.name = "tegra-sgtl5000",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_sgtl5000_dai,
+	.num_links = 1,
+	.dapm_widgets = tegra_sgtl5000_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra_sgtl5000_dapm_widgets),
+	.fully_routed = true,
+};
+
+static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct snd_soc_card *card = &snd_soc_tegra_sgtl5000;
+	struct tegra_sgtl5000 *machine;
+	int ret;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_sgtl5000),
+			       GFP_KERNEL);
+	if (!machine) {
+		dev_err(&pdev->dev, "Can't allocate tegra_sgtl5000 struct\n");
+		return -ENOMEM;
+	}
+
+	card->dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_sgtl5000_dai.codec_of_node = of_parse_phandle(np,
+			"nvidia,audio-codec", 0);
+	if (!tegra_sgtl5000_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_sgtl5000_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
+	if (!tegra_sgtl5000_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,i2s-controller' missing/invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_sgtl5000_dai.platform_of_node = tegra_sgtl5000_dai.cpu_of_node;
+
+	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
+	if (ret)
+		goto err;
+
+	ret = snd_soc_register_card(card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+			ret);
+		goto err_fini_utils;
+	}
+
+	return 0;
+
+err_fini_utils:
+	tegra_asoc_utils_fini(&machine->util_data);
+err:
+	return ret;
+}
+
+static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = snd_soc_unregister_card(card);
+
+	tegra_asoc_utils_fini(&machine->util_data);
+
+	return ret;
+}
+
+static const struct of_device_id tegra_sgtl5000_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-sgtl5000", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver tegra_sgtl5000_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_sgtl5000_of_match,
+	},
+	.probe = tegra_sgtl5000_driver_probe,
+	.remove = tegra_sgtl5000_driver_remove,
+};
+module_platform_driver(tegra_sgtl5000_driver);
+
+MODULE_AUTHOR("Marcel Ziswiler <marcel@ziswiler.com>");
+MODULE_DESCRIPTION("Tegra SGTL5000 machine ASoC driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_sgtl5000_of_match);
-- 
2.8.1
