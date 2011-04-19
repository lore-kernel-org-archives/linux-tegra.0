From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2 4/6] ASoC: Tegra: Retrieve card from DAPM context not codec
Date: Tue, 19 Apr 2011 15:25:10 -0600
Message-ID: <1303248312-22664-4-git-send-email-swarren@nvidia.com>
References: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303248312-22664-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Card widgets are created in the card's DAPM context, not any codec's DAPM
context. Hence, w->codec==NULL. Instead, find the card from the widget
through the DAPM context of the widget, not the codec of the widget.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 988ff50..9a439fb 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -156,8 +156,8 @@ static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
 static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_codec *codec = w->codec;
-	struct snd_soc_card *card = codec->card;
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 
@@ -173,8 +173,8 @@ static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_codec *codec = w->codec;
-	struct snd_soc_card *card = codec->card;
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 
-- 
1.7.1
