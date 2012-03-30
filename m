From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 01/17] ASoC: tegra: remove open-coded clk
	reference counting
Date: Fri, 30 Mar 2012 17:07:16 -0600
Message-ID: <1333148852-17806-2-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

clk_enable/disable() already reference count the enable calls, so there's
no need for the callers to do the same.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 sound/soc/tegra/tegra_i2s.c   |   14 ++++----------
 sound/soc/tegra/tegra_i2s.h   |    1 -
 sound/soc/tegra/tegra_spdif.c |    8 ++------
 sound/soc/tegra/tegra_spdif.h |    1 -
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 546e29b..0a874fb 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -220,8 +220,7 @@ static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2sclock % (2 * srate))
 		reg |= TEGRA_I2S_TIMING_NON_SYM_ENABLE;
 
-	if (!i2s->clk_refs)
-		clk_enable(i2s->clk_i2s);
+	clk_enable(i2s->clk_i2s);
 
 	tegra_i2s_write(i2s, TEGRA_I2S_TIMING, reg);
 
@@ -229,8 +228,7 @@ static int tegra_i2s_hw_params(struct snd_pcm_substream *substream,
 		TEGRA_I2S_FIFO_SCR_FIFO2_ATN_LVL_FOUR_SLOTS |
 		TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_FOUR_SLOTS);
 
-	if (!i2s->clk_refs)
-		clk_disable(i2s->clk_i2s);
+	clk_disable(i2s->clk_i2s);
 
 	return 0;
 }
@@ -268,9 +266,7 @@ static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (!i2s->clk_refs)
-			clk_enable(i2s->clk_i2s);
-		i2s->clk_refs++;
+		clk_enable(i2s->clk_i2s);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			tegra_i2s_start_playback(i2s);
 		else
@@ -283,9 +279,7 @@ static int tegra_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			tegra_i2s_stop_playback(i2s);
 		else
 			tegra_i2s_stop_capture(i2s);
-		i2s->clk_refs--;
-		if (!i2s->clk_refs)
-			clk_disable(i2s->clk_i2s);
+		clk_disable(i2s->clk_i2s);
 		break;
 	default:
 		return -EINVAL;
diff --git a/sound/soc/tegra/tegra_i2s.h b/sound/soc/tegra/tegra_i2s.h
index 15ce1e2..c08e019 100644
--- a/sound/soc/tegra/tegra_i2s.h
+++ b/sound/soc/tegra/tegra_i2s.h
@@ -155,7 +155,6 @@
 struct tegra_i2s {
 	struct snd_soc_dai_driver dai;
 	struct clk *clk_i2s;
-	int clk_refs;
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
 	void __iomem *regs;
diff --git a/sound/soc/tegra/tegra_spdif.c b/sound/soc/tegra/tegra_spdif.c
index cd836cb..3426633 100644
--- a/sound/soc/tegra/tegra_spdif.c
+++ b/sound/soc/tegra/tegra_spdif.c
@@ -196,18 +196,14 @@ static int tegra_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (!spdif->clk_refs)
-			clk_enable(spdif->clk_spdif_out);
-		spdif->clk_refs++;
+		clk_enable(spdif->clk_spdif_out);
 		tegra_spdif_start_playback(spdif);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		tegra_spdif_stop_playback(spdif);
-		spdif->clk_refs--;
-		if (!spdif->clk_refs)
-			clk_disable(spdif->clk_spdif_out);
+		clk_disable(spdif->clk_spdif_out);
 		break;
 	default:
 		return -EINVAL;
diff --git a/sound/soc/tegra/tegra_spdif.h b/sound/soc/tegra/tegra_spdif.h
index 2e03db4..f5fc712 100644
--- a/sound/soc/tegra/tegra_spdif.h
+++ b/sound/soc/tegra/tegra_spdif.h
@@ -462,7 +462,6 @@
 
 struct tegra_spdif {
 	struct clk *clk_spdif_out;
-	int clk_refs;
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
 	void __iomem *regs;
-- 
1.7.0.4
