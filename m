From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 06/17] ASoC: tegra: fix some checkpatch warnings
Date: Fri, 30 Mar 2012 17:07:21 -0600
Message-ID: <1333148852-17806-7-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

ERROR: trailing whitespace
ERROR: code indent should use tabs where possible
WARNING: please, no spaces at the start of a line
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_das.h |    2 +-
 sound/soc/tegra/tegra_i2s.c |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra_das.h b/sound/soc/tegra/tegra_das.h
index 2c96c7b..1810cd1 100644
--- a/sound/soc/tegra/tegra_das.h
+++ b/sound/soc/tegra/tegra_das.h
@@ -94,7 +94,7 @@ struct tegra_das {
  * DAS: Digital audio switch (HW module controlled by this driver)
  * DAP: Digital audio port (port/pins on Tegra device)
  * DAC: Digital audio controller (e.g. I2S or AC97 controller elsewhere)
- * 
+ *
  * The Tegra DAS is a mux/cross-bar which can connect each DAP to a specific
  * DAC, or another DAP. When DAPs are connected, one must be the master and
  * one the slave. Each DAC allows selection of a specific DAP for input, to
diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 8aafc53..86f5ca4 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -148,7 +148,7 @@ static int tegra_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~(TEGRA_I2S_CTRL_BIT_FORMAT_MASK | 
+	i2s->reg_ctrl &= ~(TEGRA_I2S_CTRL_BIT_FORMAT_MASK |
 				TEGRA_I2S_CTRL_LRCK_MASK);
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
@@ -182,7 +182,7 @@ static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
-        struct device *dev = substream->pcm->card->dev;
+	struct device *dev = substream->pcm->card->dev;
 	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	u32 reg;
 	int ret, sample_size, srate, i2sclock, bitcnt;
@@ -294,7 +294,7 @@ static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static int tegra_i2s_probe(struct snd_soc_dai *dai)
 {
-	struct tegra_i2s * i2s = snd_soc_dai_get_drvdata(dai);
+	struct tegra_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
 	dai->capture_dma_data = &i2s->capture_dma_data;
 	dai->playback_dma_data = &i2s->playback_dma_data;
@@ -328,7 +328,7 @@ static const struct snd_soc_dai_driver tegra_i2s_dai_template = {
 
 static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 {
-	struct tegra_i2s * i2s;
+	struct tegra_i2s *i2s;
 	struct resource *mem, *memregion, *dmareq;
 	u32 of_dma[2];
 	u32 dma_ch;
-- 
1.7.0.4
