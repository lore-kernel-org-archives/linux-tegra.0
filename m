From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra+wm8903: turn of mic detect when
	card is removed
Date: Mon, 11 Jun 2012 11:27:19 -0600
Message-ID: <1339435640-20171-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
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

If mic detect is left enabled and the WM8903 detects a status change,
the WM8903 driver will make a callback against the free()d jack, which
will cause a crash.

This problem can be triggered by fully initializing an audio card, then
removing and re-inserting the machine driver module.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 sound/soc/tegra/tegra_wm8903.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 08b5fef..0c5bb33 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -213,6 +213,17 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int tegra_wm8903_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd = &(card->rtd[0]);
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_codec *codec = codec_dai->codec;
+
+	wm8903_mic_detect(codec, NULL, 0, 0);
+
+	return 0;
+}
+
 static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
@@ -233,6 +244,8 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
 
+	.remove = tegra_wm8903_remove,
+
 	.controls = tegra_wm8903_controls,
 	.num_controls = ARRAY_SIZE(tegra_wm8903_controls),
 	.dapm_widgets = tegra_wm8903_dapm_widgets,
-- 
1.7.0.4
