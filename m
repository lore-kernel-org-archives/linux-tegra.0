From: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Subject: [PATCH 2/4] ASoC: tegra: Add a TDM configuration callback
Date: Fri, 27 Jul 2018 13:59:29 +0100
Message-ID: <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: jonathanh@nvidia.com, thierry.reding@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

Add a callback to configure TDM settings for the Tegra30
I2S ASoC 'platform' driver.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[jorge.sanjuan@codethink.co.uk: Style fixes]
Signed-off-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 0b176ea24914..ff1996f215ed 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -265,6 +265,39 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
+			       unsigned int tx_mask, unsigned int rx_mask,
+			       int slots, int slot_width)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask = 0, val = 0;
+
+	dev_dbg(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x"
+		"slots: 0x%08x width: %d\n",
+		__func__, tx_mask, rx_mask, slots, slot_width);
+
+	/* Set up slots and tx/rx masks */
+	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
+	       TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
+
+	val = (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT) |
+	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
+	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
+
+	pm_runtime_get_sync(dai->dev);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
+
+	/* Set FSYNC width */
+	mask = TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK;
+	val = (slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT;
+
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL, mask, val);
+	pm_runtime_put(dai->dev);
+
+	return 0;
+}
+
 static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -279,6 +312,7 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
+	.set_tdm_slot	= tegra30_i2s_set_tdm,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.11.0
