From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra: fix Tegra30 I2S capture parameter setup
Date: Wed, 14 Aug 2013 14:24:16 -0600
Message-ID: <1376511856-28044-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

The Tegra30 I2S driver was writing the AHUB interface parameters to the
playback path register rather than the capture path register. This
caused the capture parameters not to be configured at all, so if
capturing using non-HW-default parameters (e.g. 16-bit stereo rather
than 8-bit mono) the audio would be corrupted.

With this fixed, audio capture from an analog microphone works correctly
on the Cardhu board.

Cc: stable@vger.kernel.org
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d04146c..47565fd04 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -228,7 +228,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
 		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX;
-		reg = TEGRA30_I2S_CIF_RX_CTRL;
+		reg = TEGRA30_I2S_CIF_TX_CTRL;
 	}
 
 	regmap_write(i2s->regmap, reg, val);
-- 
1.8.1.5
