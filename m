From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/6] ASoC: WM8903: Pass pdata to wm8903_init_gpio
Date: Thu,  1 Dec 2011 13:49:21 -0700
Message-ID: <1322772564-27343-3-git-send-email-swarren@nvidia.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322772564-27343-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Modify wm8903_init_gpio() so that it's passed the pdata structure rather
than extracting it from the platform device. This allows the caller to
pass in a default pdata structure when the platform device didn't contain
one. wm8903_init_gpio() now uses the centralized default gpio_base
definition added in the previous patch.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 8249571..04d2393 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1863,20 +1863,16 @@ static struct gpio_chip wm8903_template_chip = {
 	.can_sleep		= 1,
 };
 
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct snd_soc_codec *codec,
+			     struct wm8903_platform_data *pdata)
 {
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
-	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
 	int ret;
 
 	wm8903->gpio_chip = wm8903_template_chip;
 	wm8903->gpio_chip.ngpio = WM8903_NUM_GPIO;
 	wm8903->gpio_chip.dev = codec->dev;
-
-	if (pdata && pdata->gpio_base)
-		wm8903->gpio_chip.base = pdata->gpio_base;
-	else
-		wm8903->gpio_chip.base = -1;
+	wm8903->gpio_chip.base = pdata->gpio_base;
 
 	ret = gpiochip_add(&wm8903->gpio_chip);
 	if (ret != 0)
@@ -1893,7 +1889,8 @@ static void wm8903_free_gpio(struct snd_soc_codec *codec)
 		dev_err(codec->dev, "Failed to remove GPIOs: %d\n", ret);
 }
 #else
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct snd_soc_codec *codec,
+			     struct wm8903_platform_data *pdata)
 {
 }
 
@@ -2050,7 +2047,7 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	snd_soc_add_controls(codec, wm8903_snd_controls,
 				ARRAY_SIZE(wm8903_snd_controls));
 
-	wm8903_init_gpio(codec);
+	wm8903_init_gpio(codec, pdata);
 
 	return ret;
 }
-- 
1.7.0.4
