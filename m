From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 6/8] ASoC: tegra: set i2s_offset to 0 for tdm
Date: Tue, 17 Sep 2019 19:12:31 +0100
Message-ID: <20190917181233.534-7-ben.dooks@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190917181233.534-1-ben.dooks@codethink.co.uk>
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

Set the offset to 0 for TDM mode, as per the current setup.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/tegra/tegra30_i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d75ce12fe177..3efef87ed8d8 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -206,8 +206,11 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
 
-	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
-	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
+	if (i2s->is_tdm)
+		val = 0;
+	else
+		val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
+		      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
 	regmap_write(i2s->regmap, TEGRA30_I2S_OFFSET, val);
 
 	return 0;
-- 
2.23.0
