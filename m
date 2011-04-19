From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v2 3/6] ASoC: Tegra: Don't return mclk_changed from utils_set_rate
Date: Tue, 19 Apr 2011 15:25:09 -0600
Message-ID: <1303248312-22664-3-git-send-email-swarren@nvidia.com>
References: <1303248312-22664-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303248312-22664-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Only the clock programming code needs to know whether the clocks changed,
and that is encapsulated within tegra_asoc_utils_set_rate(). The machine
driver's call to snd_soc_dai_set_sysclk(codec_dai, ...) is safe
irrespective of whether the clocks changed.

(Applying Mark's TrimSlice review comments to the existing driver)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_asoc_utils.c |    9 +++++----
 sound/soc/tegra/tegra_asoc_utils.h |    2 +-
 sound/soc/tegra/tegra_wm8903.c     |   17 +++++++----------
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 52f0a3f..dfa85cb 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -28,9 +28,10 @@
 #include "tegra_asoc_utils.h"
 
 int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
-			      int mclk, int *mclk_change)
+			      int mclk)
 {
 	int new_baseclock;
+	bool clk_change;
 	int err;
 
 	switch (srate) {
@@ -52,10 +53,10 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
 		return -EINVAL;
 	}
 
-	*mclk_change = ((new_baseclock != data->set_baseclock) ||
+	clk_change = ((new_baseclock != data->set_baseclock) ||
 			(mclk != data->set_mclk));
-	if (!*mclk_change)
-	    return 0;
+	if (!clk_change)
+		return 0;
 
 	data->set_baseclock = 0;
 	data->set_mclk = 0;
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index bbba7af..4818195 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -36,7 +36,7 @@ struct tegra_asoc_utils_data {
 };
 
 int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
-			      int mclk, int *mclk_change);
+			      int mclk);
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev);
 void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index b12b1fd..988ff50 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -72,7 +72,7 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk, mclk_change;
+	int srate, mclk;
 	int err;
 
 	srate = params_rate(params);
@@ -90,8 +90,7 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 	while (mclk < 6000000)
 		mclk *= 2;
 
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk,
-					&mclk_change);
+	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
 	if (err < 0) {
 		dev_err(card->dev, "Can't configure clocks\n");
 		return err;
@@ -115,13 +114,11 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	if (mclk_change) {
-		err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					     SND_SOC_CLOCK_IN);
-		if (err < 0) {
-			dev_err(card->dev, "codec_dai clock not set\n");
-			return err;
-		}
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set\n");
+		return err;
 	}
 
 	return 0;
-- 
1.7.1
