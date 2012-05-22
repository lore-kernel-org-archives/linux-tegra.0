From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/5] ASoC: tegra+wm8903: Use devm_gpio_request_one
Date: Tue, 22 May 2012 16:08:55 -0600
Message-ID: <1337724536-12349-4-git-send-email-swarren@wwwdotorg.org>
References: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724536-12349-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

By using this function, the driver no longer needs to explicitly free
the GPIOs. Hence, we can also remove the flags we use to track whether
we allocated these GPIOs.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   42 +++++++++------------------------------
 1 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index c38f09e..d78556a 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -50,10 +50,6 @@
 
 #define DRV_NAME "tegra-snd-wm8903"
 
-#define GPIO_SPKR_EN    BIT(0)
-#define GPIO_HP_MUTE    BIT(1)
-#define GPIO_INT_MIC_EN BIT(2)
-#define GPIO_EXT_MIC_EN BIT(3)
 #define GPIO_HP_DET     BIT(4)
 
 struct tegra_wm8903 {
@@ -401,49 +397,41 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	}
 
 	if (gpio_is_valid(pdata->gpio_spkr_en)) {
-		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
+		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_spkr_en,
+					    GPIOF_OUT_INIT_LOW, "spkr_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get spkr_en gpio\n");
 			return ret;
 		}
-		machine->gpio_requested |= GPIO_SPKR_EN;
-
-		gpio_direction_output(pdata->gpio_spkr_en, 0);
 	}
 
 	if (gpio_is_valid(pdata->gpio_hp_mute)) {
-		ret = gpio_request(pdata->gpio_hp_mute, "hp_mute");
+		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_hp_mute,
+					    GPIOF_OUT_INIT_HIGH, "hp_mute");
 		if (ret) {
 			dev_err(card->dev, "cannot get hp_mute gpio\n");
 			return ret;
 		}
-		machine->gpio_requested |= GPIO_HP_MUTE;
-
-		gpio_direction_output(pdata->gpio_hp_mute, 1);
 	}
 
 	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
-		ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
+		/* Disable int mic; enable signal is active-high */
+		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_int_mic_en,
+					    GPIOF_OUT_INIT_LOW, "int_mic_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get int_mic_en gpio\n");
 			return ret;
 		}
-		machine->gpio_requested |= GPIO_INT_MIC_EN;
-
-		/* Disable int mic; enable signal is active-high */
-		gpio_direction_output(pdata->gpio_int_mic_en, 0);
 	}
 
 	if (gpio_is_valid(pdata->gpio_ext_mic_en)) {
-		ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
+		/* Enable ext mic; enable signal is active-low */
+		ret = devm_gpio_request_one(&pdev->dev, pdata->gpio_ext_mic_en,
+					    GPIOF_OUT_INIT_LOW, "ext_mic_en");
 		if (ret) {
 			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
 			return ret;
 		}
-		machine->gpio_requested |= GPIO_EXT_MIC_EN;
-
-		/* Enable ext mic; enable signal is active-low */
-		gpio_direction_output(pdata->gpio_ext_mic_en, 0);
 	}
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
@@ -469,21 +457,11 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
 	if (machine->gpio_requested & GPIO_HP_DET)
 		snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack,
 					1,
 					&tegra_wm8903_hp_jack_gpio);
-	if (machine->gpio_requested & GPIO_EXT_MIC_EN)
-		gpio_free(pdata->gpio_ext_mic_en);
-	if (machine->gpio_requested & GPIO_INT_MIC_EN)
-		gpio_free(pdata->gpio_int_mic_en);
-	if (machine->gpio_requested & GPIO_HP_MUTE)
-		gpio_free(pdata->gpio_hp_mute);
-	if (machine->gpio_requested & GPIO_SPKR_EN)
-		gpio_free(pdata->gpio_spkr_en);
-	machine->gpio_requested = 0;
 
 	snd_soc_unregister_card(card);
 
-- 
1.7.0.4
