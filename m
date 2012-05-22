From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/5] ASoC: tegra+wm8903: move all GPIO setup into probe
Date: Tue, 22 May 2012 16:08:54 -0600
Message-ID: <1337724536-12349-3-git-send-email-swarren@wwwdotorg.org>
References: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724536-12349-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now that deferred probe exists, we can parse device tree and request
GPIOs from probe(), rather than deferring this to the DAI link's init().

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |  162 ++++++++++++++++++++-------------------
 1 files changed, 83 insertions(+), 79 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f33fe7c..c38f09e 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -245,80 +245,6 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
-	struct device_node *np = card->dev->of_node;
-	int ret;
-
-	if (card->dev->platform_data) {
-		memcpy(pdata, card->dev->platform_data, sizeof(*pdata));
-	} else if (np) {
-		/*
-		 * This part must be in init() rather than probe() in order to
-		 * guarantee that the WM8903 has been probed, and hence its
-		 * GPIO controller registered, which is a pre-condition for
-		 * of_get_named_gpio() to be able to map the phandles in the
-		 * properties to the controller node. Given this, all
-		 * pdata handling is in init() for consistency.
-		 */
-		pdata->gpio_spkr_en = of_get_named_gpio(np,
-						"nvidia,spkr-en-gpios", 0);
-		pdata->gpio_hp_mute = of_get_named_gpio(np,
-						"nvidia,hp-mute-gpios", 0);
-		pdata->gpio_hp_det = of_get_named_gpio(np,
-						"nvidia,hp-det-gpios", 0);
-		pdata->gpio_int_mic_en = of_get_named_gpio(np,
-						"nvidia,int-mic-en-gpios", 0);
-		pdata->gpio_ext_mic_en = of_get_named_gpio(np,
-						"nvidia,ext-mic-en-gpios", 0);
-	} else {
-		dev_err(card->dev, "No platform data supplied\n");
-		return -EINVAL;
-	}
-
-	if (gpio_is_valid(pdata->gpio_spkr_en)) {
-		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get spkr_en gpio\n");
-			return ret;
-		}
-		machine->gpio_requested |= GPIO_SPKR_EN;
-
-		gpio_direction_output(pdata->gpio_spkr_en, 0);
-	}
-
-	if (gpio_is_valid(pdata->gpio_hp_mute)) {
-		ret = gpio_request(pdata->gpio_hp_mute, "hp_mute");
-		if (ret) {
-			dev_err(card->dev, "cannot get hp_mute gpio\n");
-			return ret;
-		}
-		machine->gpio_requested |= GPIO_HP_MUTE;
-
-		gpio_direction_output(pdata->gpio_hp_mute, 1);
-	}
-
-	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
-		ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get int_mic_en gpio\n");
-			return ret;
-		}
-		machine->gpio_requested |= GPIO_INT_MIC_EN;
-
-		/* Disable int mic; enable signal is active-high */
-		gpio_direction_output(pdata->gpio_int_mic_en, 0);
-	}
-
-	if (gpio_is_valid(pdata->gpio_ext_mic_en)) {
-		ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
-			return ret;
-		}
-		machine->gpio_requested |= GPIO_EXT_MIC_EN;
-
-		/* Enable ext mic; enable signal is active-low */
-		gpio_direction_output(pdata->gpio_ext_mic_en, 0);
-	}
 
 	if (gpio_is_valid(pdata->gpio_hp_det)) {
 		tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
@@ -372,8 +298,10 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 
 static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &snd_soc_tegra_wm8903;
 	struct tegra_wm8903 *machine;
+	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
 	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
@@ -388,12 +316,42 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err;
 	}
+	pdata = &machine->pdata;
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
-	if (pdev->dev.of_node) {
+	if (pdev->dev.platform_data) {
+		memcpy(pdata, card->dev->platform_data, sizeof(*pdata));
+	} else if (np) {
+		pdata->gpio_spkr_en = of_get_named_gpio(np,
+						"nvidia,spkr-en-gpios", 0);
+		if (pdata->gpio_spkr_en == -ENODEV)
+			return -EPROBE_DEFER;
+
+		pdata->gpio_hp_mute = of_get_named_gpio(np,
+						"nvidia,hp-mute-gpios", 0);
+		if (pdata->gpio_hp_mute == -ENODEV)
+			return -EPROBE_DEFER;
+
+		pdata->gpio_hp_det = of_get_named_gpio(np,
+						"nvidia,hp-det-gpios", 0);
+		if (pdata->gpio_hp_det == -ENODEV)
+			return -EPROBE_DEFER;
+
+		pdata->gpio_int_mic_en = of_get_named_gpio(np,
+						"nvidia,int-mic-en-gpios", 0);
+		if (pdata->gpio_int_mic_en == -ENODEV)
+			return -EPROBE_DEFER;
+
+		pdata->gpio_ext_mic_en = of_get_named_gpio(np,
+						"nvidia,ext-mic-en-gpios", 0);
+		if (pdata->gpio_ext_mic_en == -ENODEV)
+			return -EPROBE_DEFER;
+	}
+
+	if (np) {
 		ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 		if (ret)
 			goto err;
@@ -404,8 +362,8 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 			goto err;
 
 		tegra_wm8903_dai.codec_name = NULL;
-		tegra_wm8903_dai.codec_of_node = of_parse_phandle(
-				pdev->dev.of_node, "nvidia,audio-codec", 0);
+		tegra_wm8903_dai.codec_of_node = of_parse_phandle(np,
+				"nvidia,audio-codec", 0);
 		if (!tegra_wm8903_dai.codec_of_node) {
 			dev_err(&pdev->dev,
 				"Property 'nvidia,audio-codec' missing or invalid\n");
@@ -414,8 +372,8 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 
 		tegra_wm8903_dai.cpu_dai_name = NULL;
-		tegra_wm8903_dai.cpu_dai_of_node = of_parse_phandle(
-				pdev->dev.of_node, "nvidia,i2s-controller", 0);
+		tegra_wm8903_dai.cpu_dai_of_node = of_parse_phandle(np,
+				"nvidia,i2s-controller", 0);
 		if (!tegra_wm8903_dai.cpu_dai_of_node) {
 			dev_err(&pdev->dev,
 				"Property 'nvidia,i2s-controller' missing or invalid\n");
@@ -442,6 +400,52 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (gpio_is_valid(pdata->gpio_spkr_en)) {
+		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get spkr_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_SPKR_EN;
+
+		gpio_direction_output(pdata->gpio_spkr_en, 0);
+	}
+
+	if (gpio_is_valid(pdata->gpio_hp_mute)) {
+		ret = gpio_request(pdata->gpio_hp_mute, "hp_mute");
+		if (ret) {
+			dev_err(card->dev, "cannot get hp_mute gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_HP_MUTE;
+
+		gpio_direction_output(pdata->gpio_hp_mute, 1);
+	}
+
+	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
+		ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get int_mic_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_INT_MIC_EN;
+
+		/* Disable int mic; enable signal is active-high */
+		gpio_direction_output(pdata->gpio_int_mic_en, 0);
+	}
+
+	if (gpio_is_valid(pdata->gpio_ext_mic_en)) {
+		ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_EXT_MIC_EN;
+
+		/* Enable ext mic; enable signal is active-low */
+		gpio_direction_output(pdata->gpio_ext_mic_en, 0);
+	}
+
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
 		goto err;
-- 
1.7.0.4
