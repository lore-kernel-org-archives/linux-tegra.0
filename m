From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v5 5/7] ASoC: tegra: set i2s_offset to 0 for tdm
Date: Fri, 18 Oct 2019 16:48:31 +0100
Message-ID: <20191018154833.7560-6-ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

Set the offset to 0 for TDM mode, as per the current setup. Note we also
move the data offset programming to the i2s hw_parameters call as per
the suggestion from Jon Hunter.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
 - fix the review comments and move the i2s offset setting
v3:
 - fix data-offset for dsp-a and dsp-b
---
 sound/soc/tegra/tegra30_i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3839e3d955a8..e99126600fc4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -66,7 +66,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask = 0, val = 0;
+	unsigned int mask = 0, val = 0, data_offset = 1;
 	unsigned int ch_mask, ch_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -100,6 +100,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_POS_EDGE;
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
 		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
+		data_offset = 0;
 		break;
 	case SND_SOC_DAIFMT_I2S:
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
@@ -120,6 +121,10 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 	pm_runtime_get_sync(dai->dev);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL, ch_mask, ch_val);
+	val = (data_offset << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
+		(data_offset << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
+	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
+
 	pm_runtime_put(dai->dev);
 
 	return 0;
@@ -203,11 +208,6 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
-
-	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
-	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
-	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
-
 	return 0;
 }
 
-- 
2.23.0
