From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/7] ASoC: Tegra: Harmony: Explicitly set mic enables
Date: Thu, 10 Feb 2011 15:37:18 -0700
Message-ID: <1297377439-27382-6-git-send-email-swarren@nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Harmony has both an external mic (a regular mic jack) and an internal mic
(a 0.1" two-pin header on the board).

The external mic is connected to the WM8903's IN1L pin, and is supported
by the current driver.

The internal mic is connected to the WM8903's IN1R pin, and is not supported
by the current driver.

It appears that no Harmony systems were shipped with any internal mic
connected; users were expected to provide their own. This makes the
internal mic connection less interesting.

The WM8903's Mic Bias signal is used for both of these mics. For each mic,
a GPIO drives a transistor which gates whether the mic bias signal is
actively connected to that mic, or isolated from it.

The dual use of the mic bias for both mics makes a general-purpose complete
implementation of mic detection using the mic bias complex. So, for
simplicity, the internal mic is currently ignored by the driver.

This patch configures the relevant GPIOs to enable the mic bias connection
to the external mic, and disable the mic bias connection to the internal
mic. Note that in practice, this is the default state if these GPIOs aren't
configured.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/harmony.c |   34 +++++++++++++++++++++++++++++++---
 1 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 6cbb352..c54d420 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -52,10 +52,14 @@
 
 #define DRV_NAME "tegra-snd-harmony"
 
+#define GPIO_SPKR_EN    BIT(0)
+#define GPIO_INT_MIC_EN BIT(1)
+#define GPIO_EXT_MIC_EN BIT(2)
+
 struct tegra_harmony {
 	struct tegra_asoc_utils_data util_data;
 	struct harmony_audio_platform_data *pdata;
-	int gpio_spkr_en_requested;
+	int gpio_requested;
 };
 
 static int harmony_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -202,10 +206,30 @@ static int harmony_asoc_init(struct snd_soc_pcm_runtime *rtd)
 		dev_err(card->dev, "cannot get spkr_en gpio\n");
 		return ret;
 	}
-	harmony->gpio_spkr_en_requested = 1;
+	harmony->gpio_requested |= GPIO_SPKR_EN;
 
 	gpio_direction_output(pdata->gpio_spkr_en, 0);
 
+	ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
+	if (ret) {
+		dev_err(card->dev, "cannot get int_mic_en gpio\n");
+		return ret;
+	}
+	harmony->gpio_requested |= GPIO_INT_MIC_EN;
+
+	/* Disable int mic; enable signal is active-high */
+	gpio_direction_output(pdata->gpio_int_mic_en, 0);
+
+	ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
+	if (ret) {
+		dev_err(card->dev, "cannot get ext_mic_en gpio\n");
+		return ret;
+	}
+	harmony->gpio_requested |= GPIO_EXT_MIC_EN;
+
+	/* Enable ext mic; enable signal is active-low */
+	gpio_direction_output(pdata->gpio_ext_mic_en, 0);
+
 	ret = snd_soc_add_controls(codec, harmony_controls,
 				   ARRAY_SIZE(harmony_controls));
 	if (ret < 0)
@@ -330,7 +354,11 @@ static int __devexit tegra_snd_harmony_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&harmony->util_data);
 
-	if (harmony->gpio_spkr_en_requested)
+	if (harmony->gpio_requested & GPIO_EXT_MIC_EN)
+		gpio_free(pdata->gpio_ext_mic_en);
+	if (harmony->gpio_requested & GPIO_INT_MIC_EN)
+		gpio_free(pdata->gpio_int_mic_en);
+	if (harmony->gpio_requested & GPIO_SPKR_EN)
 		gpio_free(pdata->gpio_spkr_en);
 
 	kfree(harmony);
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
