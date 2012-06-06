From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH 3/3] ASoC: tegra: add .stream_name to CPU DAIs
Date: Wed,  6 Jun 2012 17:15:07 -0600
Message-ID: <1339024507-5096-3-git-send-email-swarren@wwwdotorg.org>
References: <1339024507-5096-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339024507-5096-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is certainly required if the I2S and SPDIF controllers are converted
to be CODECs, and is probably good practice irrespective.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I'm not sure if this is technically correct. It's certainly not required
for the drivers to work correctly when they aren't CODECs, but doesn't
appear to harm anything.

Mark, Liam - what are your thoughts on this?

 sound/soc/tegra/tegra20_i2s.c   |    2 ++
 sound/soc/tegra/tegra20_spdif.c |    1 +
 sound/soc/tegra/tegra30_i2s.c   |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d67c684..c5fc6b1 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -259,12 +259,14 @@ static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 	.probe = tegra20_i2s_probe,
 	.playback = {
+		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
+		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 014eb74..5c33c61 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -172,6 +172,7 @@ static struct snd_soc_dai_driver tegra20_spdif_dai = {
 	.name = DRV_NAME,
 	.probe = tegra20_spdif_probe,
 	.playback = {
+		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 7a84e93..b68e27a 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -319,12 +319,14 @@ static struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 	.probe = tegra30_i2s_probe,
 	.playback = {
+		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
+		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-- 
1.7.0.4
