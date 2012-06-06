From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ASoC: tegra: statically define DAI link format
Date: Wed,  6 Jun 2012 17:15:48 -0600
Message-ID: <1339024549-5135-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Define the DAI format statically in the dai_link, rather than executing
code to set it each time the hw params are set.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   22 +++-------------------
 sound/soc/tegra/trimslice.c    |   22 +++-------------------
 2 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 1fd71e5..087d3d8 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -58,7 +58,6 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
@@ -86,24 +85,6 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_fmt(codec_dai,
-					SND_SOC_DAIFMT_I2S |
-					SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai fmt not set\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_fmt(cpu_dai,
-					SND_SOC_DAIFMT_I2S |
-					SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS);
-	if (err < 0) {
-		dev_err(card->dev, "cpu_dai fmt not set\n");
-		return err;
-	}
-
 	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
@@ -240,6 +221,9 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.codec_dai_name = "wm8903-hifi",
 	.init = tegra_wm8903_init,
 	.ops = &tegra_wm8903_ops,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 5815430..62bb805 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -52,7 +52,6 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
@@ -68,24 +67,6 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	err = snd_soc_dai_set_fmt(codec_dai,
-					SND_SOC_DAIFMT_I2S |
-					SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai fmt not set\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_fmt(cpu_dai,
-					SND_SOC_DAIFMT_I2S |
-					SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS);
-	if (err < 0) {
-		dev_err(card->dev, "cpu_dai fmt not set\n");
-		return err;
-	}
-
 	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
 					SND_SOC_CLOCK_IN);
 	if (err < 0) {
@@ -121,6 +102,9 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.cpu_dai_name = "tegra20-i2s.0",
 	.codec_dai_name = "tlv320aic23-hifi",
 	.ops = &trimslice_asoc_ops,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
 };
 
 static struct snd_soc_card snd_soc_trimslice = {
-- 
1.7.0.4
