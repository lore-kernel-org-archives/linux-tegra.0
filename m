From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/5] ASoC: WM8903: Remove conditionals checking pdata != NULL
Date: Fri,  2 Dec 2011 15:08:39 -0700
Message-ID: <1322863721-29793-4-git-send-email-swarren@nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The pdata pointer is now always valid. Remove any conditions that check
its validity.

This patch is mostly just removing an indentation level. One variable had
to be moved due to the removal of a scope, and one comment was split into
two. Viewing the patch with git show/diff -b will show that it's actually
very small.

Note that WM8903_MIC_BIAS_CONTROL_0 is now written unconditionally,
whereas it used to be written only if pdata was supplied. Since
defpdata.micdet_cfg = 0, this unconditional write simply echos the HW
defaults in the case where pdata is not supplied.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   74 ++++++++++++++++++++++-----------------------
 1 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 9fd89be..7e3b960 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1842,7 +1842,7 @@ static void wm8903_init_gpio(struct snd_soc_codec *codec)
 	wm8903->gpio_chip.ngpio = WM8903_NUM_GPIO;
 	wm8903->gpio_chip.dev = codec->dev;
 
-	if (pdata && pdata->gpio_base)
+	if (pdata->gpio_base)
 		wm8903->gpio_chip.base = pdata->gpio_base;
 	else
 		wm8903->gpio_chip.base = -1;
@@ -1878,6 +1878,7 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
+	bool mic_gpio = false;
 
 	wm8903->codec = codec;
 	codec->control_data = wm8903->regmap;
@@ -1888,52 +1889,49 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		return ret;
 	}
 
-	/* Set up GPIOs and microphone detection */
-	if (pdata) {
-		bool mic_gpio = false;
-
-		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
-			if ((!pdata->gpio_cfg[i]) ||
-			    (pdata->gpio_cfg[i] > WM8903_GPIO_CONFIG_ZERO))
-				continue;
+	/* Set up GPIOs, detect if any are MIC detect outputs */
+	for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
+		if ((!pdata->gpio_cfg[i]) ||
+		    (pdata->gpio_cfg[i] > WM8903_GPIO_CONFIG_ZERO))
+			continue;
 
-			snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
-				      pdata->gpio_cfg[i] & 0x7fff);
+		snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
+				pdata->gpio_cfg[i] & 0x7fff);
 
-			val = (pdata->gpio_cfg[i] & WM8903_GP1_FN_MASK)
-				>> WM8903_GP1_FN_SHIFT;
+		val = (pdata->gpio_cfg[i] & WM8903_GP1_FN_MASK)
+			>> WM8903_GP1_FN_SHIFT;
 
-			switch (val) {
-			case WM8903_GPn_FN_MICBIAS_CURRENT_DETECT:
-			case WM8903_GPn_FN_MICBIAS_SHORT_DETECT:
-				mic_gpio = true;
-				break;
-			default:
-				break;
-			}
+		switch (val) {
+		case WM8903_GPn_FN_MICBIAS_CURRENT_DETECT:
+		case WM8903_GPn_FN_MICBIAS_SHORT_DETECT:
+			mic_gpio = true;
+			break;
+		default:
+			break;
 		}
+	}
 
-		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
-			      pdata->micdet_cfg);
+	/* Set up microphone detection */
+	snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
+			pdata->micdet_cfg);
 
-		/* Microphone detection needs the WSEQ clock */
-		if (pdata->micdet_cfg)
-			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
-					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
+	/* Microphone detection needs the WSEQ clock */
+	if (pdata->micdet_cfg)
+		snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
+				    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
 
-		/* If microphone detection is enabled by pdata but
-		 * detected via IRQ then interrupts can be lost before
-		 * the machine driver has set up microphone detection
-		 * IRQs as the IRQs are clear on read.  The detection
-		 * will be enabled when the machine driver configures.
-		 */
-		WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
+	/* If microphone detection is enabled by pdata but
+	    * detected via IRQ then interrupts can be lost before
+	    * the machine driver has set up microphone detection
+	    * IRQs as the IRQs are clear on read.  The detection
+	    * will be enabled when the machine driver configures.
+	    */
+	WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
+
+	wm8903->mic_delay = pdata->micdet_delay;
 
-		wm8903->mic_delay = pdata->micdet_delay;
-	}
-	
 	if (wm8903->irq) {
-		if (pdata && pdata->irq_active_low) {
+		if (pdata->irq_active_low) {
 			trigger = IRQF_TRIGGER_LOW;
 			irq_pol = WM8903_IRQ_POL;
 		} else {
-- 
1.7.0.4
