From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ASoC: Tegra: tegra_pcm_deallocate_dma_buffer: Don't OOPS
Date: Thu,  4 Aug 2011 16:44:42 -0600
Message-ID: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not all PCM devices have all sub-streams. Specifically, the SPDIF driver
only supports playback and hence has no capture substream. Check whether
a substream exists before dereferencing it, when de-allocating DMA
buffers in tegra_pcm_deallocate_dma_buffer.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_pcm.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index ff86e5e..c7cfd96 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -309,9 +309,14 @@ static int tegra_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 
 static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 {
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+
+	substream = pcm->streams[stream].substream;
+	if (!substream)
+		return;
 
+	buf = &substream->dma_buffer;
 	if (!buf->area)
 		return;
 
-- 
1.7.0.4
