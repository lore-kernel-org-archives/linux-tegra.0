From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3] ASoC: tegra: add tegra machine driver using wm9712 codec
Date: Wed, 16 Jan 2013 13:05:12 +0100
Message-ID: <1358337912-27673-1-git-send-email-dev@lynxeye.de>
References: <1357348725-32139-4-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357348725-32139-4-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This adds a very simple machine driver using the Wolfson wm9712 AC97
codec.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
v2:
- manually probe codec driver without using DT
- fixup Kconfig for select and depends
v3:
- correctly tear down codec platform device in error and remove paths
- simplify init function
---
 .../bindings/sound/nvidia,tegra-audio-wm9712.txt   |  51 ++++++
 sound/soc/tegra/Kconfig                            |   9 ++
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_wm9712.c                     | 176 +++++++++++++++++++++
 4 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
 create mode 100644 sound/soc/tegra/tegra_wm9712.c

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
new file mode 100644
index 0000000..be35d34
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
@@ -0,0 +1,51 @@
+NVIDIA Tegra audio complex
+
+Required properties:
+- compatible : "nvidia,tegra-audio-wm9712"
+- nvidia,model : The user-visible name of this sound complex.
+- nvidia,audio-routing : A list of the connections between audio components.
+  Each entry is a pair of strings, the first being the connection's sink,
+  the second being the connection's source. Valid names for sources and
+  sinks are the WM9712's pins, and the jacks on the board:
+
+  WM9712 pins:
+
+  * MONOOUT
+  * HPOUTL
+  * HPOUTR
+  * LOUT2
+  * ROUT2
+  * OUT3
+  * LINEINL
+  * LINEINR
+  * PHONE
+  * PCBEEP
+  * MIC1
+  * MIC2
+  * Mic Bias
+
+  Board connectors:
+
+  * Headphone
+  * LineIn
+  * Mic
+
+- nvidia,ac97-controller : The phandle of the Tegra AC97 controller
+
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
+		         "nvidia,tegra-audio-wm9712";
+	nvidia,model = "Toradex Colibri T20";
+
+	nvidia,audio-routing =
+		"Headphone", "HPOUTL",
+		"Headphone", "HPOUTR",
+		"LineIn", "LINEINL",
+		"LineIn", "LINEINR",
+		"Mic", "MIC1";
+
+	nvidia,ac97-controller = <&ac97>;
+};
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 19e5fe7..2cb45d0 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -70,6 +70,15 @@ config SND_SOC_TEGRA_WM8903
 	  boards using the WM8093 codec. Currently, the supported boards are
 	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
 
+config SND_SOC_TEGRA_WM9712
+	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA20_AC97
+	select SND_SOC_WM9712
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the WM9712 (or compatible) codec.
+
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
 	depends on SND_SOC_TEGRA && I2C
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 391e78a..6ef663f 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -18,10 +18,12 @@ obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
 # Tegra machine Support
 snd-soc-tegra-wm8753-objs := tegra_wm8753.o
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
+snd-soc-tegra-wm9712-objs := tegra_wm9712.o
 snd-soc-tegra-trimslice-objs := trimslice.o
 snd-soc-tegra-alc5632-objs := tegra_alc5632.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8753) += snd-soc-tegra-wm8753.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM9712) += snd-soc-tegra-wm9712.o
 obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
new file mode 100644
index 0000000..cdbd2f0
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -0,0 +1,176 @@
+/*
+ * tegra20_wm9712.c - Tegra machine ASoC driver for boards using WM9712 codec.
+ *
+ * Copyright 2012 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
+ *
+ * Partly based on code copyright/by:
+ * Copyright 2011,2012 Toradex Inc.
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
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define DRV_NAME "tegra-snd-wm9712"
+
+struct tegra_wm9712 {
+	struct platform_device *codec;
+};
+
+static const struct snd_soc_dapm_widget tegra_wm9712_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_LINE("LineIn", NULL),
+	SND_SOC_DAPM_MIC("Mic", NULL),
+};
+
+static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
+	struct snd_soc_dapm_context *dapm = &codec->dapm;
+
+	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
+
+	return snd_soc_dapm_sync(dapm);
+}
+
+static struct snd_soc_dai_link tegra_wm9712_dai = {
+	.name = "AC97 HiFi",
+	.stream_name = "AC97 HiFi",
+	.cpu_dai_name = "tegra-ac97-pcm",
+	.codec_dai_name = "wm9712-hifi",
+	.codec_name = "wm9712-codec",
+	.init = tegra_wm9712_init,
+};
+
+static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.name = "tegra-wm9712",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_wm9712_dai,
+	.num_links = 1,
+
+	.dapm_widgets = tegra_wm9712_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra_wm9712_dapm_widgets),
+	.fully_routed = true,
+};
+
+static int tegra_wm9712_driver_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct snd_soc_card *card = &snd_soc_tegra_wm9712;
+	struct tegra_wm9712 *machine;
+	int ret;
+
+	if (!pdev->dev.of_node) {
+		dev_err(&pdev->dev, "No platform data supplied\n");
+		return -EINVAL;
+	}
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
+			       GFP_KERNEL);
+	if (!machine) {
+		dev_err(&pdev->dev, "Can't allocate tegra_wm9712 struct\n");
+		return -ENOMEM;
+	}
+
+	card->dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+
+	machine->codec = platform_device_alloc("wm9712-codec", -1);
+	if (!machine->codec) {
+		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
+		return -ENOMEM;
+	}
+
+	ret = platform_device_add(machine->codec);
+	if (ret)
+		goto codec_put;
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto codec_unregister;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto codec_unregister;
+
+	tegra_wm9712_dai.cpu_of_node = of_parse_phandle(np,
+				       "nvidia,ac97-controller", 0);
+	if (!tegra_wm9712_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,ac97-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto codec_unregister;
+	}
+
+	tegra_wm9712_dai.platform_of_node = tegra_wm9712_dai.cpu_of_node;
+
+	ret = snd_soc_register_card(card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+			ret);
+		goto codec_unregister;
+	}
+
+	return 0;
+
+codec_unregister:
+	platform_device_del(machine->codec);
+codec_put:
+	platform_device_put(machine->codec);
+	return ret;
+}
+
+static int tegra_wm9712_driver_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct tegra_wm9712 *machine = snd_soc_card_get_drvdata(card);
+
+	snd_soc_unregister_card(card);
+
+	platform_device_unregister(machine->codec);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_wm9712_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra-audio-wm9712", },
+	{},
+};
+
+static struct platform_driver tegra_wm9712_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_wm9712_of_match,
+	},
+	.probe = tegra_wm9712_driver_probe,
+	.remove = tegra_wm9712_driver_remove,
+};
+module_platform_driver(tegra_wm9712_driver);
+
+MODULE_AUTHOR("Lucas Stach");
+MODULE_DESCRIPTION("Tegra+WM9712 machine ASoC driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_wm9712_of_match);
-- 
1.8.0.2
