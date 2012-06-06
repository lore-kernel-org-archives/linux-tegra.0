From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ASoC: tegra: use regmap more directly
Date: Wed,  6 Jun 2012 17:15:06 -0600
Message-ID: <1339024507-5096-2-git-send-email-swarren@wwwdotorg.org>
References: <1339024507-5096-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339024507-5096-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Stop open-coding the caching of the ctrl registers; instead, use
regmap_update_bits() to update parts of the register from different
places. The removal of the open-coded cache will allow controls to be
created which touch registers, which will be necessary if any of these
modules are converted to CODECs.

Get rid of tegra*_read/write; just call regmap_read/write directly.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra20_i2s.c   |   90 ++++++++++++++++++--------------------
 sound/soc/tegra/tegra20_i2s.h   |    1 -
 sound/soc/tegra/tegra20_spdif.c |   33 +++++---------
 sound/soc/tegra/tegra20_spdif.h |    1 -
 sound/soc/tegra/tegra30_i2s.c   |   81 +++++++++++++++++------------------
 sound/soc/tegra/tegra30_i2s.h   |    1 -
 6 files changed, 95 insertions(+), 112 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index eb547aa..d67c684 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -46,18 +46,6 @@
 
 #define DRV_NAME "tegra20-i2s"
 
-static inline void tegra20_i2s_write(struct tegra20_i2s *i2s, u32 reg, u32 val)
-{
-	regmap_write(i2s->regmap, reg, val);
-}
-
-static inline u32 tegra20_i2s_read(struct tegra20_i2s *i2s, u32 reg)
-{
-	u32 val;
-	regmap_read(i2s->regmap, reg, &val);
-	return val;
-}
-
 static int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
@@ -85,6 +73,7 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -93,10 +82,10 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_MASTER_ENABLE;
+	mask = TEGRA20_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
+		val = TEGRA20_I2S_CTRL_MASTER_ENABLE;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
@@ -104,33 +93,35 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~(TEGRA20_I2S_CTRL_BIT_FORMAT_MASK |
-			   TEGRA20_I2S_CTRL_LRCK_MASK);
+	mask |= TEGRA20_I2S_CTRL_BIT_FORMAT_MASK |
+		TEGRA20_I2S_CTRL_LRCK_MASK;
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
+		val |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_R_LOW;
+		val |= TEGRA20_I2S_CTRL_BIT_FORMAT_DSP;
+		val |= TEGRA20_I2S_CTRL_LRCK_R_LOW;
 		break;
 	case SND_SOC_DAIFMT_I2S:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_I2S;
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA20_I2S_CTRL_BIT_FORMAT_I2S;
+		val |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_RJM;
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA20_I2S_CTRL_BIT_FORMAT_RJM;
+		val |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_FORMAT_LJM;
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA20_I2S_CTRL_BIT_FORMAT_LJM;
+		val |= TEGRA20_I2S_CTRL_LRCK_L_LOW;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL, mask, val);
+
 	return 0;
 }
 
@@ -140,27 +131,32 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct device *dev = dai->dev;
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	u32 reg;
+	unsigned int mask, val;
 	int ret, sample_size, srate, i2sclock, bitcnt;
 
-	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
+	mask = TEGRA20_I2S_CTRL_BIT_SIZE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_16;
+		val = TEGRA20_I2S_CTRL_BIT_SIZE_16;
 		sample_size = 16;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_24;
+		val = TEGRA20_I2S_CTRL_BIT_SIZE_24;
 		sample_size = 24;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
-		i2s->reg_ctrl |= TEGRA20_I2S_CTRL_BIT_SIZE_32;
+		val = TEGRA20_I2S_CTRL_BIT_SIZE_32;
 		sample_size = 32;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	mask |= TEGRA20_I2S_CTRL_FIFO_FORMAT_MASK;
+	val |= TEGRA20_I2S_CTRL_FIFO_FORMAT_PACKED;
+
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL, mask, val);
+
 	srate = params_rate(params);
 
 	/* Final "* 2" required by Tegra hardware */
@@ -175,42 +171,44 @@ static int tegra20_i2s_hw_params(struct snd_pcm_substream *substream,
 	bitcnt = (i2sclock / (2 * srate)) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
 		return -EINVAL;
-	reg = bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
+	val = bitcnt << TEGRA20_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
 
 	if (i2sclock % (2 * srate))
-		reg |= TEGRA20_I2S_TIMING_NON_SYM_ENABLE;
+		val |= TEGRA20_I2S_TIMING_NON_SYM_ENABLE;
 
-	tegra20_i2s_write(i2s, TEGRA20_I2S_TIMING, reg);
+	regmap_write(i2s->regmap, TEGRA20_I2S_TIMING, val);
 
-	tegra20_i2s_write(i2s, TEGRA20_I2S_FIFO_SCR,
-		TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
-		TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
+	regmap_write(i2s->regmap, TEGRA20_I2S_FIFO_SCR,
+		     TEGRA20_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
+		     TEGRA20_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
 
 	return 0;
 }
 
 static void tegra20_i2s_start_playback(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl |= TEGRA20_I2S_CTRL_FIFO1_ENABLE;
-	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+			   TEGRA20_I2S_CTRL_FIFO1_ENABLE,
+			   TEGRA20_I2S_CTRL_FIFO1_ENABLE);
 }
 
 static void tegra20_i2s_stop_playback(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_FIFO1_ENABLE;
-	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+			   TEGRA20_I2S_CTRL_FIFO1_ENABLE, 0);
 }
 
 static void tegra20_i2s_start_capture(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl |= TEGRA20_I2S_CTRL_FIFO2_ENABLE;
-	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+			   TEGRA20_I2S_CTRL_FIFO2_ENABLE,
+			   TEGRA20_I2S_CTRL_FIFO2_ENABLE);
 }
 
 static void tegra20_i2s_stop_capture(struct tegra20_i2s *i2s)
 {
-	i2s->reg_ctrl &= ~TEGRA20_I2S_CTRL_FIFO2_ENABLE;
-	tegra20_i2s_write(i2s, TEGRA20_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA20_I2S_CTRL,
+			   TEGRA20_I2S_CTRL_FIFO2_ENABLE, 0);
 }
 
 static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -412,8 +410,6 @@ static __devinit int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	i2s->playback_dma_data.width = 32;
 	i2s->playback_dma_data.req_sel = dma_ch;
 
-	i2s->reg_ctrl = TEGRA20_I2S_CTRL_FIFO_FORMAT_PACKED;
-
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra20_i2s_runtime_resume(&pdev->dev);
diff --git a/sound/soc/tegra/tegra20_i2s.h b/sound/soc/tegra/tegra20_i2s.h
index a57efc6..c27069d 100644
--- a/sound/soc/tegra/tegra20_i2s.h
+++ b/sound/soc/tegra/tegra20_i2s.h
@@ -158,7 +158,6 @@ struct tegra20_i2s {
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
 	struct regmap *regmap;
-	u32 reg_ctrl;
 };
 
 #endif
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8e5d25b..014eb74 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -37,19 +37,6 @@
 
 #define DRV_NAME "tegra20-spdif"
 
-static inline void tegra20_spdif_write(struct tegra20_spdif *spdif, u32 reg,
-					u32 val)
-{
-	regmap_write(spdif->regmap, reg, val);
-}
-
-static inline u32 tegra20_spdif_read(struct tegra20_spdif *spdif, u32 reg)
-{
-	u32 val;
-	regmap_read(spdif->regmap, reg, &val);
-	return val;
-}
-
 static int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
@@ -79,19 +66,22 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 {
 	struct device *dev = dai->dev;
 	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
 	int ret, spdifclock;
 
-	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_PACK;
-	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
+	mask = TEGRA20_SPDIF_CTRL_PACK |
+	       TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_PACK;
-		spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT;
+		val = TEGRA20_SPDIF_CTRL_PACK |
+		      TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL, mask, val);
+
 	switch (params_rate(params)) {
 	case 32000:
 		spdifclock = 4096000;
@@ -129,14 +119,15 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 static void tegra20_spdif_start_playback(struct tegra20_spdif *spdif)
 {
-	spdif->reg_ctrl |= TEGRA20_SPDIF_CTRL_TX_EN;
-	tegra20_spdif_write(spdif, TEGRA20_SPDIF_CTRL, spdif->reg_ctrl);
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL,
+			   TEGRA20_SPDIF_CTRL_TX_EN,
+			   TEGRA20_SPDIF_CTRL_TX_EN);
 }
 
 static void tegra20_spdif_stop_playback(struct tegra20_spdif *spdif)
 {
-	spdif->reg_ctrl &= ~TEGRA20_SPDIF_CTRL_TX_EN;
-	tegra20_spdif_write(spdif, TEGRA20_SPDIF_CTRL, spdif->reg_ctrl);
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL,
+			   TEGRA20_SPDIF_CTRL_TX_EN, 0);
 }
 
 static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index ed75652..b48d699 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -465,7 +465,6 @@ struct tegra20_spdif {
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
 	struct regmap *regmap;
-	u32 reg_ctrl;
 };
 
 #endif
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index f88fc63..7a84e93 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -44,18 +44,6 @@
 
 #define DRV_NAME "tegra30-i2s"
 
-static inline void tegra30_i2s_write(struct tegra30_i2s *i2s, u32 reg, u32 val)
-{
-	regmap_write(i2s->regmap, reg, val);
-}
-
-static inline u32 tegra30_i2s_read(struct tegra30_i2s *i2s, u32 reg)
-{
-	u32 val;
-	regmap_read(i2s->regmap, reg, &val);
-	return val;
-}
-
 static int tegra30_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
@@ -128,6 +116,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask, val;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -136,10 +125,10 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_MASTER_ENABLE;
+	mask = TEGRA30_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
+		val = TEGRA30_I2S_CTRL_MASTER_ENABLE;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
@@ -147,33 +136,37 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	i2s->reg_ctrl &= ~(TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
-			   TEGRA30_I2S_CTRL_LRCK_MASK);
+	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
+		TEGRA30_I2S_CTRL_LRCK_MASK;
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
+		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
+		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
+		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
 		break;
 	case SND_SOC_DAIFMT_I2S:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(dai->dev);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
+	pm_runtime_put(dai->dev);
+
 	return 0;
 }
 
@@ -183,22 +176,24 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	u32 val;
+	unsigned int mask, val, reg;
 	int ret, sample_size, srate, i2sclock, bitcnt;
 
 	if (params_channels(params) != 2)
 		return -EINVAL;
 
-	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
+	mask = TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_BIT_SIZE_16;
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
 		sample_size = 16;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
+
 	srate = params_rate(params);
 
 	/* Final "* 2" required by Tegra hardware */
@@ -219,7 +214,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2sclock % (2 * srate))
 		val |= TEGRA30_I2S_TIMING_NON_SYM_ENABLE;
 
-	tegra30_i2s_write(i2s, TEGRA30_I2S_TIMING, val);
+	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
 	val = (0 << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
 	      (1 << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
@@ -229,15 +224,17 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_RX;
-		tegra30_i2s_write(i2s, TEGRA30_I2S_CIF_RX_CTRL, val);
+		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
 		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX;
-		tegra30_i2s_write(i2s, TEGRA30_I2S_CIF_TX_CTRL, val);
+		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	}
 
+	regmap_write(i2s->regmap, reg, val);
+
 	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
 	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
-	tegra30_i2s_write(i2s, TEGRA30_I2S_OFFSET, val);
+	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
 
 	return 0;
 }
@@ -245,29 +242,31 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 static void tegra30_i2s_start_playback(struct tegra30_i2s *i2s)
 {
 	tegra30_ahub_enable_tx_fifo(i2s->playback_fifo_cif);
-	i2s->reg_ctrl |= TEGRA30_I2S_CTRL_XFER_EN_TX;
-	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+			   TEGRA30_I2S_CTRL_XFER_EN_TX,
+			   TEGRA30_I2S_CTRL_XFER_EN_TX);
 }
 
 static void tegra30_i2s_stop_playback(struct tegra30_i2s *i2s)
 {
 	tegra30_ahub_disable_tx_fifo(i2s->playback_fifo_cif);
-	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_XFER_EN_TX;
-	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+			   TEGRA30_I2S_CTRL_XFER_EN_TX, 0);
 }
 
 static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
 {
 	tegra30_ahub_enable_rx_fifo(i2s->capture_fifo_cif);
-	i2s->reg_ctrl |= TEGRA30_I2S_CTRL_XFER_EN_RX;
-	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+			   TEGRA30_I2S_CTRL_XFER_EN_RX,
+			   TEGRA30_I2S_CTRL_XFER_EN_RX);
 }
 
 static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
 {
 	tegra30_ahub_disable_rx_fifo(i2s->capture_fifo_cif);
-	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_XFER_EN_RX;
-	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL,
+			   TEGRA30_I2S_CTRL_XFER_EN_RX, 0);
 }
 
 static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 91adf29..34dc47b 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -236,7 +236,6 @@ struct tegra30_i2s {
 	enum tegra30_ahub_txcif playback_fifo_cif;
 	struct tegra_pcm_dma_params playback_dma_data;
 	struct regmap *regmap;
-	u32 reg_ctrl;
 };
 
 #endif
-- 
1.7.0.4
