From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 6/6] ASoC: tegra_wm8903: assume CONFIG_OF, remove platform data
Date: Fri, 15 Feb 2013 17:07:35 -0700
Message-ID: <1360973255-344-6-git-send-email-swarren@wwwdotorg.org>
References: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360973255-344-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all runtime
checks for DT support from the driver.

This allows removal of the hard-coded Harmony ASoC mapping table, since
Harmony only boots with DT now.

All board-specific configuration now comes from device tree, so there is
no need to have a platform_data structure. Rework the driver to parse the
device tree directly into struct tegra_wm8903.

Also some slight re-ordering of probe() so that the code more closely
resembles other drivers for easier comparison. Inparticular, the GPIO DT
parsing and initial programming are moved together for each GPIO.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/sound/tegra_wm8903.h   |   26 ------
 sound/soc/tegra/tegra_wm8903.c |  179 ++++++++++++++++------------------------
 2 files changed, 70 insertions(+), 135 deletions(-)
 delete mode 100644 include/sound/tegra_wm8903.h

diff --git a/include/sound/tegra_wm8903.h b/include/sound/tegra_wm8903.h
deleted file mode 100644
index 57b202e..0000000
--- a/include/sound/tegra_wm8903.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * Copyright 2011 NVIDIA, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#ifndef __SOUND_TEGRA_WM38903_H
-#define __SOUND_TEGRA_WM38903_H
-
-struct tegra_wm8903_platform_data {
-	int gpio_spkr_en;
-	int gpio_hp_det;
-	int gpio_hp_mute;
-	int gpio_int_mic_en;
-	int gpio_ext_mic_en;
-};
-
-#endif
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index bbd79bf..4ac7373 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -39,7 +39,6 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/tegra_wm8903.h>
 
 #include "../codecs/wm8903.h"
 
@@ -48,7 +47,11 @@
 #define DRV_NAME "tegra-snd-wm8903"
 
 struct tegra_wm8903 {
-	struct tegra_wm8903_platform_data pdata;
+	int gpio_spkr_en;
+	int gpio_hp_det;
+	int gpio_hp_mute;
+	int gpio_int_mic_en;
+	int gpio_ext_mic_en;
 	struct tegra_asoc_utils_data util_data;
 };
 
@@ -129,12 +132,11 @@ static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
-	if (!gpio_is_valid(pdata->gpio_spkr_en))
+	if (!gpio_is_valid(machine->gpio_spkr_en))
 		return 0;
 
-	gpio_set_value_cansleep(pdata->gpio_spkr_en,
+	gpio_set_value_cansleep(machine->gpio_spkr_en,
 				SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
@@ -146,12 +148,11 @@ static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
-	if (!gpio_is_valid(pdata->gpio_hp_mute))
+	if (!gpio_is_valid(machine->gpio_hp_mute))
 		return 0;
 
-	gpio_set_value_cansleep(pdata->gpio_hp_mute,
+	gpio_set_value_cansleep(machine->gpio_hp_mute,
 				!SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
@@ -163,17 +164,6 @@ static const struct snd_soc_dapm_widget tegra_wm8903_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
-static const struct snd_soc_dapm_route harmony_audio_map[] = {
-	{"Headphone Jack", NULL, "HPOUTR"},
-	{"Headphone Jack", NULL, "HPOUTL"},
-	{"Int Spk", NULL, "ROP"},
-	{"Int Spk", NULL, "RON"},
-	{"Int Spk", NULL, "LOP"},
-	{"Int Spk", NULL, "LON"},
-	{"Mic Jack", NULL, "MICBIAS"},
-	{"IN1L", NULL, "Mic Jack"},
-};
-
 static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
 };
@@ -185,10 +175,9 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
-	if (gpio_is_valid(pdata->gpio_hp_det)) {
-		tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		tegra_wm8903_hp_jack_gpio.gpio = machine->gpio_hp_det;
 		snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
 				&tegra_wm8903_hp_jack);
 		snd_soc_jack_add_pins(&tegra_wm8903_hp_jack,
@@ -226,9 +215,6 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
-	.codec_name = "wm8903.0-001a",
-	.platform_name = "tegra20-i2s.0",
-	.cpu_dai_name = "tegra20-i2s.0",
 	.codec_dai_name = "wm8903-hifi",
 	.init = tegra_wm8903_init,
 	.ops = &tegra_wm8903_ops,
@@ -257,96 +243,25 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &snd_soc_tegra_wm8903;
 	struct tegra_wm8903 *machine;
-	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
-	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
-		dev_err(&pdev->dev, "No platform data supplied\n");
-		return -EINVAL;
-	}
-
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8903),
 			       GFP_KERNEL);
 	if (!machine) {
 		dev_err(&pdev->dev, "Can't allocate tegra_wm8903 struct\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
-	pdata = &machine->pdata;
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
-	if (pdev->dev.platform_data) {
-		memcpy(pdata, card->dev->platform_data, sizeof(*pdata));
-	} else if (np) {
-		pdata->gpio_spkr_en = of_get_named_gpio(np,
-						"nvidia,spkr-en-gpios", 0);
-		if (pdata->gpio_spkr_en == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		pdata->gpio_hp_mute = of_get_named_gpio(np,
-						"nvidia,hp-mute-gpios", 0);
-		if (pdata->gpio_hp_mute == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		pdata->gpio_hp_det = of_get_named_gpio(np,
-						"nvidia,hp-det-gpios", 0);
-		if (pdata->gpio_hp_det == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		pdata->gpio_int_mic_en = of_get_named_gpio(np,
-						"nvidia,int-mic-en-gpios", 0);
-		if (pdata->gpio_int_mic_en == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		pdata->gpio_ext_mic_en = of_get_named_gpio(np,
-						"nvidia,ext-mic-en-gpios", 0);
-		if (pdata->gpio_ext_mic_en == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-	}
-
-	if (np) {
-		ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-		if (ret)
-			goto err;
-
-		ret = snd_soc_of_parse_audio_routing(card,
-						     "nvidia,audio-routing");
-		if (ret)
-			goto err;
-
-		tegra_wm8903_dai.codec_name = NULL;
-		tegra_wm8903_dai.codec_of_node = of_parse_phandle(np,
-				"nvidia,audio-codec", 0);
-		if (!tegra_wm8903_dai.codec_of_node) {
-			dev_err(&pdev->dev,
-				"Property 'nvidia,audio-codec' missing or invalid\n");
-			ret = -EINVAL;
-			goto err;
-		}
-
-		tegra_wm8903_dai.cpu_dai_name = NULL;
-		tegra_wm8903_dai.cpu_of_node = of_parse_phandle(np,
-				"nvidia,i2s-controller", 0);
-		if (!tegra_wm8903_dai.cpu_of_node) {
-			dev_err(&pdev->dev,
-				"Property 'nvidia,i2s-controller' missing or invalid\n");
-			ret = -EINVAL;
-			goto err;
-		}
-
-		tegra_wm8903_dai.platform_name = NULL;
-		tegra_wm8903_dai.platform_of_node =
-					tegra_wm8903_dai.cpu_of_node;
-	} else {
-		card->dapm_routes = harmony_audio_map;
-		card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
-	}
-
-	if (gpio_is_valid(pdata->gpio_spkr_en)) {
-		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_spkr_en,
+	machine->gpio_spkr_en = of_get_named_gpio(np, "nvidia,spkr-en-gpios",
+						  0);
+	if (machine->gpio_spkr_en == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(machine->gpio_spkr_en)) {
+		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_spkr_en,
 					    GPIOF_OUT_INIT_LOW, "spkr_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get spkr_en gpio\n");
@@ -354,8 +269,12 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (gpio_is_valid(pdata->gpio_hp_mute)) {
-		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_hp_mute,
+	machine->gpio_hp_mute = of_get_named_gpio(np, "nvidia,hp-mute-gpios",
+						  0);
+	if (machine->gpio_hp_mute == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(machine->gpio_hp_mute)) {
+		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_mute,
 					    GPIOF_OUT_INIT_HIGH, "hp_mute");
 		if (ret) {
 			dev_err(card->dev, "cannot get hp_mute gpio\n");
@@ -363,9 +282,18 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
+	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+	if (machine->gpio_hp_det == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	machine->gpio_int_mic_en = of_get_named_gpio(np,
+						"nvidia,int-mic-en-gpios", 0);
+	if (machine->gpio_int_mic_en == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(machine->gpio_int_mic_en)) {
 		/* Disable int mic; enable signal is active-high */
-		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_int_mic_en,
+		ret = devm_gpio_request_one(&pdev->dev,
+					    machine->gpio_int_mic_en,
 					    GPIOF_OUT_INIT_LOW, "int_mic_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get int_mic_en gpio\n");
@@ -373,9 +301,14 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (gpio_is_valid(pdata->gpio_ext_mic_en)) {
+	machine->gpio_ext_mic_en = of_get_named_gpio(np,
+						"nvidia,ext-mic-en-gpios", 0);
+	if (machine->gpio_ext_mic_en == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(machine->gpio_ext_mic_en)) {
 		/* Enable ext mic; enable signal is active-low */
-		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_ext_mic_en,
+		ret = devm_gpio_request_one(&pdev->dev,
+					    machine->gpio_ext_mic_en,
 					    GPIOF_OUT_INIT_LOW, "ext_mic_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
@@ -383,6 +316,34 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_wm8903_dai.codec_of_node = of_parse_phandle(np,
+						"nvidia,audio-codec", 0);
+	if (!tegra_wm8903_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_wm8903_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
+	if (!tegra_wm8903_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,i2s-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_wm8903_dai.platform_of_node = tegra_wm8903_dai.cpu_of_node;
+
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
 		goto err;
-- 
1.7.10.4
