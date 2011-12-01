From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 4/6] ASoC: WM8903: Remove conditionals checking pdata != NULL
Date: Thu,  1 Dec 2011 13:49:22 -0700
Message-ID: <1322772564-27343-4-git-send-email-swarren@nvidia.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322772564-27343-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In probe(), the pdata pointer is now always valid. Remove any conditions
that check its validity.

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
 sound/soc/codecs/wm8903.c |   70 ++++++++++++++++++++++-----------------------
 1 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 04d2393..38e1137 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1907,6 +1907,7 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
+	bool mic_gpio = false;
 
 	wm8903->codec = codec;
 
@@ -1941,51 +1942,48 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	if (!pdata)
 		pdata = &defpdata;
 
-	/* Set up GPIOs and microphone detection */
-	if (pdata) {
-		bool mic_gpio = false;
+	/* Set up GPIOs, detect if any are MIC detect outputs */
+	for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
+		if (pdata->gpio_cfg[i] > 0x7fff)
+			continue;
 
-		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
-			if (pdata->gpio_cfg[i] > 0x7fff)
-				continue;
-
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
+
+	/* Set up microphone detection */
+	snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
+			pdata->micdet_cfg);
 
-		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
-			      pdata->micdet_cfg);
+	/* Microphone detection needs the WSEQ clock */
+	if (pdata->micdet_cfg)
+		snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
+				    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
 
-		/* Microphone detection needs the WSEQ clock */
-		if (pdata->micdet_cfg)
-			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
-					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
+	/* If microphone detection is enabled by pdata but
+	    * detected via IRQ then interrupts can be lost before
+	    * the machine driver has set up microphone detection
+	    * IRQs as the IRQs are clear on read.  The detection
+	    * will be enabled when the machine driver configures.
+	    */
+	WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
 
-		/* If microphone detection is enabled by pdata but
-		 * detected via IRQ then interrupts can be lost before
-		 * the machine driver has set up microphone detection
-		 * IRQs as the IRQs are clear on read.  The detection
-		 * will be enabled when the machine driver configures.
-		 */
-		WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
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
