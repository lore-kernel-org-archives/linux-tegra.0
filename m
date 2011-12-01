From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/6] ASoC: WM8903: Create default platform data structure
Date: Thu,  1 Dec 2011 13:49:20 -0700
Message-ID: <1322772564-27343-2-git-send-email-swarren@nvidia.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322772564-27343-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When no platform data is supplied, point pdata at a default platform
structure. This enables two future changes:

a) Defines the default platform data values in a single place.
b) There is always a valid pdata pointer, so some conditional code can
   be simplified by a later patch.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 0d1640e..8249571 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1905,6 +1905,7 @@ static void wm8903_free_gpio(struct snd_soc_codec *codec)
 static int wm8903_probe(struct snd_soc_codec *codec)
 {
 	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
+	struct wm8903_platform_data defpdata;
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
 	int ret, i;
 	int trigger, irq_pol;
@@ -1931,6 +1932,18 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 
 	wm8903_reset(codec);
 
+	/* Default platform data, for use if none is supplied */
+	defpdata.irq_active_low = false;
+	defpdata.micdet_cfg = 0;
+	defpdata.micdet_delay = 0;
+	defpdata.gpio_base = -1;
+	for (i = 0; i < ARRAY_SIZE(defpdata.gpio_cfg); i++)
+		defpdata.gpio_cfg[i] = 0xffffffff;
+
+	/* If no platform data was supplied, use the defaults */
+	if (!pdata)
+		pdata = &defpdata;
+
 	/* Set up GPIOs and microphone detection */
 	if (pdata) {
 		bool mic_gpio = false;
-- 
1.7.0.4
