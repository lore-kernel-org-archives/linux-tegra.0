From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: fix uninitialized variables in set_fmt
Date: Fri,  6 Dec 2013 13:34:50 -0700
Message-ID: <1386362090-29250-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In tegra*_i2s_set_fmt(), in the (fmt == SND_SOC_DAIFMT_CBM_CFM) case,
"val" is never assigned to, but left uninitialized. The other case does
initialized it. Fix this by initializing val at the start of the
function, and only ever ORing into it.

Update the handling of "mask" so it works the same way for consistency.

Update tegra20_spdif.c to use the same code-style for consistency, even
though it doesn't happen to suffer from the same problem at present.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Fixes: 0f163546a772 ("ASoC: tegra: use regmap more directly")
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra20_i2s.c   |  6 +++---
 sound/soc/tegra/tegra20_spdif.c | 10 +++++-----
 sound/soc/tegra/tegra30_i2s.c   |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 364bf6a907e1..8c819f811470 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -74,7 +74,7 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask, val;
+	unsigned int mask = 0, val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -83,10 +83,10 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	mask = TEGRA20_I2S_CTRL_MASTER_ENABLE;
+	mask |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		val = TEGRA20_I2S_CTRL_MASTER_ENABLE;
+		val |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 08bc6931c7c7..8c7c1028e579 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -67,15 +67,15 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 {
 	struct device *dev = dai->dev;
 	struct tegra20_spdif *spdif = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask, val;
+	unsigned int mask = 0, val = 0;
 	int ret, spdifclock;
 
-	mask = TEGRA20_SPDIF_CTRL_PACK |
-	       TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
+	mask |= TEGRA20_SPDIF_CTRL_PACK |
+		TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		val = TEGRA20_SPDIF_CTRL_PACK |
-		      TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT;
+		val |= TEGRA20_SPDIF_CTRL_PACK |
+		       TEGRA20_SPDIF_CTRL_BIT_MODE_16BIT;
 		break;
 	default:
 		return -EINVAL;
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 231a785b3921..02247fee1cf7 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -118,7 +118,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask, val;
+	unsigned int mask = 0, val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -127,10 +127,10 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	mask = TEGRA30_I2S_CTRL_MASTER_ENABLE;
+	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		val = TEGRA30_I2S_CTRL_MASTER_ENABLE;
+		val |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
-- 
1.8.1.5
