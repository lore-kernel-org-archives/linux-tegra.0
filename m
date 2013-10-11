From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: support new register layouts in Tegra124
Date: Fri, 11 Oct 2013 15:43:17 -0600
Message-ID: <1381527797-18447-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 introduces some small changes to the layout of some registers.
Modify the affected drivers to program those registers appropriately
based on which SoC they're running on.

Tegra124 also introduced some new modules on the AHUB configlink register
bus. These will require new entries in configlink_clocks[] in the AHUB
driver. However, supporting that change likely relies on switching Tegra
to the common reset framework, so I'll defer that change for now.

Based-on-work-by: Arun Shamanna Lakshmi <aruns-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Based-on-work-by: Songhee Baek <sbaek-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra30_ahub.c     | 115 ++++++++++++++++++++++++++++++++-----
 sound/soc/tegra/tegra30_ahub.h     |  38 +++++++++++-
 sound/soc/tegra/tegra30_i2s.c      |  51 +++++++++++-----
 sound/soc/tegra/tegra30_i2s.h      |   7 +++
 sound/soc/tegra/tegra_asoc_utils.c |   2 +
 sound/soc/tegra/tegra_asoc_utils.h |   1 +
 6 files changed, 186 insertions(+), 28 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d554d46..bdd19db 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -100,6 +100,7 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 {
 	int channel;
 	u32 reg, val;
+	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->rx_usage,
 				      TEGRA30_AHUB_CHANNEL_CTRL_COUNT);
@@ -123,15 +124,21 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
 	tegra30_apbif_write(reg, val);
 
+	cif_conf.threshold = 0;
+	cif_conf.audio_channels = 2;
+	cif_conf.client_channels = 2;
+	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.expand = 0;
+	cif_conf.stereo_conv = 0;
+	cif_conf.replicate = 0;
+	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+	cif_conf.truncate = 0;
+	cif_conf.mono_conv = 0;
+
 	reg = TEGRA30_AHUB_CIF_RX_CTRL +
 	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
-	val = (0 << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
-	      TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_16 |
-	      TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_16 |
-	      TEGRA30_AUDIOCIF_CTRL_DIRECTION_RX;
-	tegra30_apbif_write(reg, val);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
 
 	return 0;
 }
@@ -183,6 +190,7 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 {
 	int channel;
 	u32 reg, val;
+	struct tegra30_ahub_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->tx_usage,
 				      TEGRA30_AHUB_CHANNEL_CTRL_COUNT);
@@ -206,15 +214,21 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 	       TEGRA30_AHUB_CHANNEL_CTRL_TX_PACK_16;
 	tegra30_apbif_write(reg, val);
 
+	cif_conf.threshold = 0;
+	cif_conf.audio_channels = 2;
+	cif_conf.client_channels = 2;
+	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.expand = 0;
+	cif_conf.stereo_conv = 0;
+	cif_conf.replicate = 0;
+	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+	cif_conf.truncate = 0;
+	cif_conf.mono_conv = 0;
+
 	reg = TEGRA30_AHUB_CIF_TX_CTRL +
 	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
-	val = (0 << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
-	      TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_16 |
-	      TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_16 |
-	      TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX;
-	tegra30_apbif_write(reg, val);
+	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
 
 	return 0;
 }
@@ -437,13 +451,21 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
 	.clk_list_mask = CLK_LIST_MASK_TEGRA30,
+	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra114 = {
 	.clk_list_mask = CLK_LIST_MASK_TEGRA114,
+	.set_audio_cif = tegra30_ahub_set_cif,
+};
+
+static struct tegra30_ahub_soc_data soc_data_tegra124 = {
+	.clk_list_mask = CLK_LIST_MASK_TEGRA114,
+	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
 static const struct of_device_id tegra30_ahub_of_match[] = {
+	{ .compatible = "nvidia,tegra124-ahub", .data = &soc_data_tegra124 },
 	{ .compatible = "nvidia,tegra114-ahub", .data = &soc_data_tegra114 },
 	{ .compatible = "nvidia,tegra30-ahub",  .data = &soc_data_tegra30 },
 	{},
@@ -497,6 +519,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, ahub);
 
+	ahub->soc_data = soc_data;
 	ahub->dev = &pdev->dev;
 
 	ahub->clk_d_audio = clk_get(&pdev->dev, "d_audio");
@@ -669,6 +692,70 @@ static struct platform_driver tegra30_ahub_driver = {
 };
 module_platform_driver(tegra30_ahub_driver);
 
+void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
+			  struct tegra30_ahub_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold <<
+			TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
+		((conf->audio_channels - 1) <<
+			TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
+		((conf->client_channels - 1) <<
+			TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
+		(conf->audio_bits <<
+			TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits <<
+			TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand <<
+			TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv <<
+			TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate <<
+			TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT) |
+		(conf->direction <<
+			TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT) |
+		(conf->truncate <<
+			TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv <<
+			TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_write(regmap, reg, value);
+}
+EXPORT_SYMBOL_GPL(tegra30_ahub_set_cif);
+
+void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
+			   struct tegra30_ahub_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold <<
+			TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
+		((conf->audio_channels - 1) <<
+			TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
+		((conf->client_channels - 1) <<
+			TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
+		(conf->audio_bits <<
+			TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits <<
+			TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand <<
+			TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv <<
+			TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate <<
+			TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT) |
+		(conf->direction <<
+			TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT) |
+		(conf->truncate <<
+			TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv <<
+			TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_write(regmap, reg, value);
+}
+EXPORT_SYMBOL_GPL(tegra124_ahub_set_cif);
+
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra30 AHUB driver");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 09766cd..d67321d 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -25,16 +25,30 @@
 #define TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US	0xf
 #define TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK	(TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT)
 
+#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT	24
+#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US	0x3f
+#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK	(TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US << TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT)
+
 /* Channel count minus 1 */
 #define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT	24
 #define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US	7
 #define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT)
 
 /* Channel count minus 1 */
+#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT	20
+#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US	0xf
+#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK	(TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US << TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT)
+
+/* Channel count minus 1 */
 #define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT	16
 #define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US	7
 #define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT)
 
+/* Channel count minus 1 */
+#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT	16
+#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US	0xf
+#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT)
+
 #define TEGRA30_AUDIOCIF_BITS_4				0
 #define TEGRA30_AUDIOCIF_BITS_8				1
 #define TEGRA30_AUDIOCIF_BITS_12			2
@@ -86,7 +100,7 @@
 #define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_CH1		(TEGRA30_AUDIOCIF_STEREO_CONV_CH1 << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
 #define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_AVG		(TEGRA30_AUDIOCIF_STEREO_CONV_AVG << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
 
-#define TEGRA30_AUDIOCIF_CTRL_REPLICATE			3
+#define TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT		3
 
 #define TEGRA30_AUDIOCIF_DIRECTION_TX			0
 #define TEGRA30_AUDIOCIF_DIRECTION_RX			1
@@ -468,8 +482,30 @@ extern int tegra30_ahub_set_rx_cif_source(enum tegra30_ahub_rxcif rxcif,
 					  enum tegra30_ahub_txcif txcif);
 extern int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif);
 
+struct tegra30_ahub_cif_conf {
+	unsigned int threshold;
+	unsigned int audio_channels;
+	unsigned int client_channels;
+	unsigned int audio_bits;
+	unsigned int client_bits;
+	unsigned int expand;
+	unsigned int stereo_conv;
+	unsigned int replicate;
+	unsigned int direction;
+	unsigned int truncate;
+	unsigned int mono_conv;
+};
+
+void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
+			  struct tegra30_ahub_cif_conf *conf);
+void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
+			   struct tegra30_ahub_cif_conf *conf);
+
 struct tegra30_ahub_soc_data {
 	u32 clk_list_mask;
+	void (*set_audio_cif)(struct regmap *regmap,
+			      unsigned int reg,
+			      struct tegra30_ahub_cif_conf *conf);
 	/*
 	 * FIXME: There are many more differences in HW, such as:
 	 * - More APBIF channels.
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 47565fd04..5f20b69 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -179,6 +180,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
 	int ret, sample_size, srate, i2sclock, bitcnt;
+	struct tegra30_ahub_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
 		return -EINVAL;
@@ -217,21 +219,26 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
-	val = (0 << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
-	      (1 << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
-	      TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_16 |
-	      TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_16;
+	cif_conf.threshold = 0;
+	cif_conf.audio_channels = 2;
+	cif_conf.client_channels = 2;
+	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.expand = 0;
+	cif_conf.stereo_conv = 0;
+	cif_conf.replicate = 0;
+	cif_conf.truncate = 0;
+	cif_conf.mono_conv = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_RX;
+		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
-		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX;
+		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
 		reg = TEGRA30_I2S_CIF_TX_CTRL;
 	}
 
-	regmap_write(i2s->regmap, reg, val);
+	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
 
 	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
 	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
@@ -396,9 +403,24 @@ static const struct regmap_config tegra30_i2s_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const struct tegra30_i2s_soc_data tegra30_i2s_config = {
+	.set_audio_cif = tegra30_ahub_set_cif,
+};
+
+static const struct tegra30_i2s_soc_data tegra124_i2s_config = {
+	.set_audio_cif = tegra124_ahub_set_cif,
+};
+
+static const struct of_device_id tegra30_i2s_of_match[] = {
+	{ .compatible = "nvidia,tegra124-i2s", .data = &tegra124_i2s_config },
+	{ .compatible = "nvidia,tegra30-i2s", .data = &tegra30_i2s_config },
+	{},
+};
+
 static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 {
 	struct tegra30_i2s *i2s;
+	const struct of_device_id *match;
 	u32 cif_ids[2];
 	struct resource *mem, *memregion;
 	void __iomem *regs;
@@ -412,6 +434,14 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
+	match = of_match_device(tegra30_i2s_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		ret = -ENODEV;
+		goto err;
+	}
+	i2s->soc_data = (struct tegra30_i2s_soc_data *)match->data;
+
 	i2s->dai = tegra30_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
 
@@ -539,11 +569,6 @@ static int tegra30_i2s_resume(struct device *dev)
 }
 #endif
 
-static const struct of_device_id tegra30_i2s_of_match[] = {
-	{ .compatible = "nvidia,tegra30-i2s", },
-	{},
-};
-
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index bea23af..4d0b0a3 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -225,7 +225,14 @@
 #define TEGRA30_I2S_LCOEF_COEF_MASK_US			0xffff
 #define TEGRA30_I2S_LCOEF_COEF_MASK			(TEGRA30_I2S_LCOEF_COEF_MASK_US << TEGRA30_I2S_LCOEF_COEF_SHIFT)
 
+struct tegra30_i2s_soc_data {
+	void (*set_audio_cif)(struct regmap *regmap,
+			      unsigned int reg,
+			      struct tegra30_ahub_cif_conf *conf);
+};
+
 struct tegra30_i2s {
+	const struct tegra30_i2s_soc_data *soc_data;
 	struct snd_soc_dai_driver dai;
 	int cif_id;
 	struct clk *clk_i2s;
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index d173880..1be311c 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -182,6 +182,8 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA30;
 	else if (of_machine_is_compatible("nvidia,tegra114"))
 		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA114;
+	else if (of_machine_is_compatible("nvidia,tegra124"))
+		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA124;
 	else {
 		dev_err(data->dev, "SoC unknown to Tegra ASoC utils\n");
 		return -EINVAL;
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
index 19fdcaf..9577121 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -30,6 +30,7 @@ enum tegra_asoc_utils_soc {
 	TEGRA_ASOC_UTILS_SOC_TEGRA20,
 	TEGRA_ASOC_UTILS_SOC_TEGRA30,
 	TEGRA_ASOC_UTILS_SOC_TEGRA114,
+	TEGRA_ASOC_UTILS_SOC_TEGRA124,
 };
 
 struct tegra_asoc_utils_data {
-- 
1.8.1.5
