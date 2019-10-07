From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for more
	than 2 channels
Date: Mon,  7 Oct 2019 16:31:32 +0100
Message-ID: <20191007153136.4920-4-ben.dooks@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
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
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>, Edward Cragg <edward.cragg@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

The CIF configuration and clock setting is currently hard coded for 2
channels. Since the hardware is capable of supporting 1-8 channels add
support for reading the channel count from the supplied parameters to
allow for better TDM support. It seems the original implementation of this
driver was fixed at 2 channels for simplicity, and not implementing TDM.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
[ben.dooks@codethink.co.uk: merge edge control into set-format]
[ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 063f34c882af..7382f7949bf4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
+	unsigned int ch_mask, ch_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
+	ch_mask = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK;
 	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
@@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		TEGRA30_I2S_CTRL_LRCK_MASK;
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
+		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
 		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
+		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
 		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
 		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
 		break;
@@ -115,6 +119,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 
 	pm_runtime_get_sync(dai->dev);
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
+	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL, ch_mask, ch_val);
 	pm_runtime_put(dai->dev);
 
 	return 0;
@@ -127,10 +132,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
+	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
 	struct tegra30_ahub_cif_conf cif_conf;
 
-	if (params_channels(params) != 2)
+	channels = params_channels(params);
+	if (channels > 8)
 		return -EINVAL;
 
 	mask = TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
@@ -157,9 +163,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
 
 	srate = params_rate(params);
-
 	/* Final "* 2" required by Tegra hardware */
-	i2sclock = srate * params_channels(params) * sample_size * 2;
+	i2sclock = srate * channels * sample_size * 2;
 
 	bitcnt = (i2sclock / (2 * srate)) - 1;
 	if (bitcnt < 0 || bitcnt > TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
@@ -179,8 +184,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
+	cif_conf.audio_channels = channels;
+	cif_conf.client_channels = channels;
 	cif_conf.audio_bits = audio_bits;
 	cif_conf.client_bits = audio_bits;
 	cif_conf.expand = 0;
@@ -315,7 +320,7 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S32_LE |
 			   SNDRV_PCM_FMTBIT_S24_LE |
@@ -324,7 +329,7 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S32_LE |
 			   SNDRV_PCM_FMTBIT_S24_LE |
-- 
2.23.0
