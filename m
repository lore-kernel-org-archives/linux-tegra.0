From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] ASoC: WM8903: Handle micdet_cfg more safely
Date: Thu, 10 Feb 2011 15:37:15 -0700
Message-ID: <1297377439-27382-3-git-send-email-swarren@nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The WM8903 mic detection circuit will interrupt when:
a) It is first enabled, and a mic is detected as present.
b) Whenever a mic is plugged in or removed.

The current code makes it easy to miss case (a) by misconfiguring micdet_cfg
via platform data.

Specifically, if WM8903_MICDET_ENA and WM8903_MICBIAS_ENA are both part of
micdet_cfg, and a mic is plugged in when the driver initializes, the interrupt
will fire almost immediately. However, at that point, the micdet interrupt is
probably still masked, and hence wm8903_irq does not handle it. However, the
act of reading the interrupt status register in the ISR clears the micdet
interrupt status, so it is lost.

To avoid this, refuse to write any fields from micdet_cfg to the register
except those simply configuring detection thresholds; actual enabling of mic
detecion should always be implemented by calling wm8903_mic_detect().

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index a6ca1d4..f1a4665 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1918,12 +1918,9 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		}
 
 		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
-			      pdata->micdet_cfg);
-
-		/* Microphone detection needs the WSEQ clock */
-		if (pdata->micdet_cfg)
-			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
-					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
+			      pdata->micdet_cfg &
+			       (WM8903_MICDET_THR_MASK |
+				WM8903_MICSHORT_THR_MASK));
 
 		wm8903->mic_delay = pdata->micdet_delay;
 	}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
