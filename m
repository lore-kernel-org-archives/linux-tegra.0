From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2 5/6] ASoC: snd_soc_dapm_get_pin_status: Match other contexts too
Date: Tue, 19 Apr 2011 15:25:11 -0600
Message-ID: <1303248312-22664-5-git-send-email-swarren@nvidia.com>
References: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303248312-22664-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not all widgets on a card are within the codec's DAPM context. Fix
snd_soc_dapm_get_pin_status to search all contexts when looking for a
widget.

This change is required when modifying tegra_wm8903 to use
snd_soc_card.widgets rather than calling snd_soc_dapm_new_controls; the
former adds the widgets to the card's DAPM context, whereas tegra_wm8903
uses the codec's DAPM context when calling snd_soc_dapm_new_controls.

By code inspection, I suspect this also applies to Samsung Speyside.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/soc-dapm.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2ee738c..4c868f9 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2403,6 +2403,12 @@ int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm,
 			return w->connected;
 	}
 
+	/* Try again in other contexts */
+	list_for_each_entry(w, &dapm->card->widgets, list) {
+		if (!strcmp(w->name, pin))
+			return w->connected;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_status);
-- 
1.7.1
