From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: Allow 24bit and 32bit samples"
	to the asoc tree
Date: Fri, 25 Oct 2019 11:12:12 +0100 (BST)
Message-ID: <20191025101212.C8B002743267@ypsilon.sirena.org.uk>
References: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191018154833.7560-3-ben.dooks@codethink.co.uk>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Edward Cragg <edward.cragg@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: Allow 24bit and 32bit samples

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 Mon Sep 17 00:00:00 2001
From: Edward Cragg <edward.cragg@codethink.co.uk>
Date: Fri, 18 Oct 2019 16:48:28 +0100
Subject: [PATCH] ASoC: tegra: Allow 24bit and 32bit samples

The tegra3 audio can support 24 and 32 bit sample sizes so add the
option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
formats when requested.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
[ben.dooks@codethink.co.uk: add pm calls around ytdm config]
[ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/20191018154833.7560-3-ben.dooks@codethink.co.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index e6d548fa980b..48a09c9d60be 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt;
+	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
@@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 		sample_size = 16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
+		sample_size = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
+		sample_size = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.audio_bits = audio_bits;
+	cif_conf.client_bits = audio_bits;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
@@ -277,14 +288,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra30_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.20.1
