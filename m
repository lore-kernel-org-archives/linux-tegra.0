From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/6] ASoC: WM8903: Disallow all invalid gpio_cfg pdata values
Date: Thu,  1 Dec 2011 13:49:19 -0700
Message-ID: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The GPIO registers are 15 bits wide. Hence values, higher than 0x7fff are
not legal GPIO register values. Modify the pdata.gpio_cfg handling code
to reject all illegal values, not just WM8903_GPIO_NO_CONFIG (0x8000). This
will allow the later use of 0xffffffff as an invalid value in future device
tree bindings, meaning "don't touch this GPIO's configuration".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 70a2268..0d1640e 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1936,11 +1936,11 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		bool mic_gpio = false;
 
 		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
-			if (pdata->gpio_cfg[i] == WM8903_GPIO_NO_CONFIG)
+			if (pdata->gpio_cfg[i] > 0x7fff)
 				continue;
 
 			snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
-				      pdata->gpio_cfg[i] & 0xffff);
+				      pdata->gpio_cfg[i] & 0x7fff);
 
 			val = (pdata->gpio_cfg[i] & WM8903_GP1_FN_MASK)
 				>> WM8903_GP1_FN_SHIFT;
-- 
1.7.0.4
