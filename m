From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra: add tegra+MAX98090 machine driver
Date: Wed,  4 Dec 2013 15:19:27 -0700
Message-ID: <1386195567-24124-2-git-send-email-swarren@wwwdotorg.org>
References: <1386195567-24124-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386195567-24124-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Initially, this binding and driver only describe/support playback to
headphones and speakers, and capture from the external microphone, with
GPIO-based jack detection for the headphone jack only.

This driver is useful for the Venice2 board.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra-audio-max98090.txt |  51 ++++
 sound/soc/tegra/Kconfig                            |  10 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_max98090.c                   | 275 +++++++++++++++++++++
 4 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
 create mode 100644 sound/soc/tegra/tegra_max98090.c

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
new file mode 100644
index 000000000000..9c7c55c71370
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -0,0 +1,51 @@
+NVIDIA Tegra audio complex, with MAX98090 CODEC
+
+Required properties:
+- compatible : "nvidia,tegra-audio-max98090"
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
+  sinks are the MAX98090's pins (as documented in its binding), and the jacks
+  on the board:
+
+  * Headphones
+  * Speakers
+  * Mic Jack
+
+- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
+  connected to the CODEC.
+- nvidia,audio-codec : The phandle of the MAX98090 audio codec.
+
+Optional properties:
+- nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-max98090-venice2",
+		     "nvidia,tegra-audio-max98090";
+	nvidia,model = "NVIDIA Tegra Venice2";
+
+	nvidia,audio-routing =
+		"Headphones", "HPR",
+		"Headphones", "HPL",
+		"Speakers", "SPKR",
+		"Speakers", "SPKL",
+		"Mic Jack", "MICBIAS",
+		"IN34", "Mic Jack";
+
+	nvidia,i2s-controller = <&tegra_i2s1>;
+	nvidia,audio-codec = <&acodec>;
+
+	clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
+		 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+		 <&tegra_car TEGRA124_CLK_EXTERN1>;
+	clock-names = "pll_a", "pll_a_out0", "mclk";
+};
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 896292bb853f..9f9c1856f822 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -118,3 +118,13 @@ config SND_SOC_TEGRA_ALC5632
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
 	  Toshiba AC100 netbook.
+
+config SND_SOC_TEGRA_MAX98090
+	tristate "SoC Audio support for Tegra boards using a MAX98090 codec"
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
+	select SND_SOC_MAX98090
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the MAX98090 codec, such as Venice2.
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 21d2550a08a4..5ae588cd96c4 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -24,6 +24,7 @@ snd-soc-tegra-wm8903-objs := tegra_wm8903.o
 snd-soc-tegra-wm9712-objs := tegra_wm9712.o
 snd-soc-tegra-trimslice-objs := trimslice.o
 snd-soc-tegra-alc5632-objs := tegra_alc5632.o
+snd-soc-tegra-max98090-objs := tegra_max98090.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8753) += snd-soc-tegra-wm8753.o
@@ -31,3 +32,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM9712) += snd-soc-tegra-wm9712.o
 obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
 obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
+obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
new file mode 100644
index 000000000000..0283cfb7c031
--- /dev/null
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -0,0 +1,275 @@
+/*
+ * Tegra machine ASoC driver for boards using a MAX90809 CODEC.
+ *
+ * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
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
+ * Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
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
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra_asoc_utils.h"
+
+#define DRV_NAME "tegra-snd-max98090"
+
+struct tegra_max98090 {
+	struct tegra_asoc_utils_data util_data;
+	int gpio_hp_det;
+};
+
+static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
+	struct snd_soc_card *card = codec->card;
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
+	int srate, mclk;
+	int err;
+
+	srate = params_rate(params);
+	switch (srate) {
+	case 8000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 64000:
+	case 96000:
+		mclk = 12288000;
+		break;
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 11289600;
+		break;
+	default:
+		mclk = 12000000;
+		break;
+	}
+
+	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
+	if (err < 0) {
+		dev_err(card->dev, "Can't configure clocks\n");
+		return err;
+	}
+
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops tegra_max98090_ops = {
+	.hw_params = tegra_max98090_asoc_hw_params,
+};
+
+static struct snd_soc_jack tegra_max98090_hp_jack;
+
+static struct snd_soc_jack_pin tegra_max98090_hp_jack_pins[] = {
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	},
+};
+
+static struct snd_soc_jack_gpio tegra_max98090_hp_jack_gpio = {
+	.name = "Headphone detection",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+	.invert = 1,
+};
+
+static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
+static const struct snd_kcontrol_new tegra_max98090_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+};
+
+static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(codec->card);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		snd_soc_jack_new(codec, "Headphones", SND_JACK_HEADPHONE,
+				&tegra_max98090_hp_jack);
+		snd_soc_jack_add_pins(&tegra_max98090_hp_jack,
+				ARRAY_SIZE(tegra_max98090_hp_jack_pins),
+				tegra_max98090_hp_jack_pins);
+
+		tegra_max98090_hp_jack_gpio.gpio = machine->gpio_hp_det;
+		snd_soc_jack_add_gpios(&tegra_max98090_hp_jack,
+					1,
+					&tegra_max98090_hp_jack_gpio);
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_link tegra_max98090_dai = {
+	.name = "max98090",
+	.stream_name = "max98090 PCM",
+	.codec_dai_name = "HiFi",
+	.init = tegra_max98090_asoc_init,
+	.ops = &tegra_max98090_ops,
+	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+};
+
+static struct snd_soc_card snd_soc_tegra_max98090 = {
+	.name = "tegra-max98090",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_max98090_dai,
+	.num_links = 1,
+	.controls = tegra_max98090_controls,
+	.num_controls = ARRAY_SIZE(tegra_max98090_controls),
+	.dapm_widgets = tegra_max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra_max98090_dapm_widgets),
+	.fully_routed = true,
+};
+
+static int tegra_max98090_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct snd_soc_card *card = &snd_soc_tegra_max98090;
+	struct tegra_max98090 *machine;
+	int ret;
+
+	machine = devm_kzalloc(&pdev->dev,
+			sizeof(struct tegra_max98090), GFP_KERNEL);
+	if (!machine) {
+		dev_err(&pdev->dev, "Can't allocate tegra_max98090\n");
+		return -ENOMEM;
+	}
+
+	card->dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+
+	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+	if (machine->gpio_hp_det == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_max98090_dai.codec_of_node = of_parse_phandle(np,
+			"nvidia,audio-codec", 0);
+	if (!tegra_max98090_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_max98090_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
+	if (!tegra_max98090_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,i2s-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_max98090_dai.platform_of_node = tegra_max98090_dai.cpu_of_node;
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
+static int tegra_max98090_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
+
+	snd_soc_jack_free_gpios(&tegra_max98090_hp_jack, 1,
+				&tegra_max98090_hp_jack_gpio);
+
+	snd_soc_unregister_card(card);
+
+	tegra_asoc_utils_fini(&machine->util_data);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_max98090_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-max98090", },
+	{},
+};
+
+static struct platform_driver tegra_max98090_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_max98090_of_match,
+	},
+	.probe = tegra_max98090_probe,
+	.remove = tegra_max98090_remove,
+};
+module_platform_driver(tegra_max98090_driver);
+
+MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("Tegra max98090 machine ASoC driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_max98090_of_match);
-- 
1.8.1.5
