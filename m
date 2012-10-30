From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] ASoC: tegra: update spdif tx_atn_lvl on hw_params()
Date: Tue, 30 Oct 2012 18:23:59 +0400
Message-ID: <1351607039-9027-1-git-send-email-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@nvidia.com
Cc: digetx@gmail.com, tiwai@suse.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This prevents playing sound with wrong speed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
I'm using deep sleep on my tablet and faced with this bug when played sound via
hdmi after suspend. I know that there is no deep sleep support in upstream kernel,
but will be nice to see that bug fixed.

 sound/soc/tegra/tegra20_spdif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 3ebc867..24b46f1 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -114,6 +114,10 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_DATA_FIFO_CSR,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL);
+
 	return 0;
 }
 
-- 
1.7.12
