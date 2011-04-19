From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] ASoC: Process card->widgets after all probe routines
Date: Tue, 19 Apr 2011 12:46:16 -0600
Message-ID: <1303238777-14277-4-git-send-email-swarren@nvidia.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303238777-14277-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Without this, if tegra_wm8903 is modified to provide controls,
widgets, and routes through data rather than calling registration
functions, tegra_wm8903_event_* will crash, because w->codec==NULL.

Within snd_soc_instantiate_card, something inside soc_probe_dai_link is
required for snd_soc_dapm_new_controls to set up the new widgets
correctly, although I haven't tracked down what exactly. (For
tegra_wm8903, there is no card->probe, and no aux_devs, so those calls
aren't relevant).

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/soc-core.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3b3a377..8ce40a1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1878,10 +1878,6 @@ static void snd_soc_instantiate_card(struct snd_soc_card *card)
 	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
 #endif
 
-	if (card->dapm_widgets)
-		snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
-					  card->num_dapm_widgets);
-
 	/* initialise the sound card only once */
 	if (card->probe) {
 		ret = card->probe(card);
@@ -1907,6 +1903,10 @@ static void snd_soc_instantiate_card(struct snd_soc_card *card)
 		}
 	}
 
+	if (card->dapm_widgets)
+		snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
+					  card->num_dapm_widgets);
+
 	/* We should have a non-codec control add function but we don't */
 	if (card->controls)
 		snd_soc_add_controls(list_first_entry(&card->codec_dev_list,
-- 
1.7.1
