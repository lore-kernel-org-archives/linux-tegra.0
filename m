From: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Subject: [PATCH 3/4] ASoC: tegra: Allow 32-bit and 24-bit
	samples
Date: Fri, 27 Jul 2018 13:59:30 +0100
Message-ID: <20180727125931.9794-4-jorge.sanjuan@codethink.co.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Edward Cragg <edward.cragg@codethink.co.uk>

The tegra3 audio can support 32 and 24 bit sample sizes so add
the option to the tegra30_i2s_hw_params to configure the S32_LE/S24_LE
format when requested.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
[jorge.sanjuan@codethink.co.uk: Squashed multiple patches]
Signed-off-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index ff1996f215ed..e26c19ef7439 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -150,6 +150,15 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
 		sample_size = 16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
+		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
+		sample_size = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
+		sample_size = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -322,14 +331,18 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
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
2.11.0
