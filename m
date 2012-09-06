From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra: fix maxburst settings in
	dmaengine code
Date: Thu,  6 Sep 2012 17:47:33 -0600
Message-ID: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

The I2S controllers are programmed with an "attention" level of 4 DWORDs.
This must match the configuration passed to the DMA driver, so that when
they burst in data, they don't overflow the available FIFO space. Also,
the burst size is relevant to the destination for playback, and source
for capture, not vice-versa as originally written.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
Mark, I'd like to take this patch through the Tegra tree, since it's a
dependency for the series that converts Tegra to dmaengine. Thanks.

 sound/soc/tegra/tegra_pcm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 5658bce..8d6900c 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -334,11 +334,11 @@ static int tegra_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		slave_config.dst_addr = dmap->addr;
-		slave_config.src_maxburst = 0;
+		slave_config.dst_maxburst = 4;
 	} else {
 		slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		slave_config.src_addr = dmap->addr;
-		slave_config.dst_maxburst = 0;
+		slave_config.src_maxburst = 4;
 	}
 	slave_config.slave_id = dmap->req_sel;
 
-- 
1.7.0.4
