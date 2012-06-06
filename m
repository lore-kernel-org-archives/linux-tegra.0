From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/3] ASoC: tegra: use DAI's not card's dev for dev_err
Date: Wed,  6 Jun 2012 17:15:05 -0600
Message-ID: <1339024507-5096-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is the actual device of the I2S or SPDIF controller reporting the
problem. If a future change converts these controllers to be CODECs, then
there may be no pcm associated with the substream, so this change avoids
a crash.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra20_i2s.c   |    2 +-
 sound/soc/tegra/tegra20_spdif.c |    2 +-
 sound/soc/tegra/tegra30_i2s.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 0c7af63..eb547aa 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -138,7 +138,7 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct device *dev = substream->pcm->card->dev;
+	struct device *dev = dai->dev;
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	u32 reg;
 	int ret, sample_size, srate, i2sclock, bitcnt;
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index f9b5741..8e5d25b 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -77,7 +77,7 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
-	struct device *dev = substream->pcm->card->dev;
+	struct device *dev = dai->dev;
 	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
 	int ret, spdifclock;
 
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8596032..f88fc63 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -181,7 +181,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct device *dev = substream->pcm->card->dev;
+	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	u32 val;
 	int ret, sample_size, srate, i2sclock, bitcnt;
-- 
1.7.0.4
