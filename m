From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH 5/5] ASoC: tegra: Remove unused DAPM route structure.
Date: Tue, 31 Jan 2012 09:32:17 +0200
Message-ID: <1327995137-27237-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

All DAPM routes are configured via device tree, and there is no need in
DAPM route structures in board file.

Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 1794139..c000f51 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -104,20 +104,6 @@ static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static const struct snd_soc_dapm_route tegra_alc5632_audio_map[] = {
-	/* Internal Speaker */
-	{"Int Spk", NULL, "SPKOUT"},
-	{"Int Spk", NULL, "SPKOUTN"},
-
-	/* Headset Mic */
-	{"MIC1", NULL, "MICBIAS1"},
-	{"MICBIAS1", NULL, "Headset Mic"},
-
-	/* Headset Stereophone */
-	{"Headset Stereophone", NULL, "HPR"},
-	{"Headset Stereophone", NULL, "HPL"},
-};
-
 static const struct snd_kcontrol_new tegra_alc5632_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
 };
@@ -172,8 +158,6 @@ static struct snd_soc_card snd_soc_tegra_alc5632 = {
 	.num_controls = ARRAY_SIZE(tegra_alc5632_controls),
 	.dapm_widgets = tegra_alc5632_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(tegra_alc5632_dapm_widgets),
-	.dapm_routes = tegra_alc5632_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(tegra_alc5632_audio_map),
 	.fully_routed = true,
 };
 
-- 
1.7.3.4
