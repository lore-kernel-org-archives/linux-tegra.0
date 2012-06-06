From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra: remove usage of rtd->codec
Date: Wed,  6 Jun 2012 17:15:49 -0600
Message-ID: <1339024549-5135-2-git-send-email-swarren@wwwdotorg.org>
References: <1339024549-5135-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339024549-5135-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

rtd->codec_dai->codec can be used instead.

This is a slight step along the way to not needing the rtd->codec field
any more.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |    5 +++--
 sound/soc/tegra/tegra_wm8753.c  |    2 +-
 sound/soc/tegra/tegra_wm8903.c  |    5 +++--
 sound/soc/tegra/trimslice.c     |    2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 417b09b..d684df2 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -43,7 +43,7 @@ static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
 	int srate, mclk;
@@ -105,7 +105,8 @@ static const struct snd_kcontrol_new tegra_alc5632_controls[] = {
 
 static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(codec->card);
 
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index 02bd5a8..ea9166d 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -57,7 +57,7 @@ static int tegra_wm8753_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8753 *machine = snd_soc_card_get_drvdata(card);
 	int srate, mclk;
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 087d3d8..08b5fef 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -58,7 +58,7 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	int srate, mclk;
@@ -181,7 +181,8 @@ static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 
 static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 62bb805..e69a4f7 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -52,7 +52,7 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_codec *codec = codec_dai->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
 	int srate, mclk;
-- 
1.7.0.4
