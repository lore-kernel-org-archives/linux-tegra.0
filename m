From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ASoC: WM8903: Free IRQ on device removal
Date: Thu,  4 Aug 2011 16:44:44 -0600
Message-ID: <1312497884-1599-3-git-send-email-swarren@nvidia.com>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312497884-1599-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Without this, request_irq on subsequent device initialization fails, and
the codec cannot be used.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 43e3d76..4ad8ebd 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -2046,8 +2046,13 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 /* power down chip */
 static int wm8903_remove(struct snd_soc_codec *codec)
 {
+	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
+
 	wm8903_free_gpio(codec);
 	wm8903_set_bias_level(codec, SND_SOC_BIAS_OFF);
+	if (wm8903->irq)
+		free_irq(wm8903->irq, codec);
+
 	return 0;
 }
 
-- 
1.7.0.4
