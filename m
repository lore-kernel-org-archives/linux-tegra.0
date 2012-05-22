From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra+wm8903: remove non-DT support for
	Seaboard
Date: Tue, 22 May 2012 16:11:19 -0600
Message-ID: <1337724679-12481-1-git-send-email-swarren@wwwdotorg.org>
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

In kernel 3.6, Seaboard will only be supported when booting using device
tree; the board files are being removed. Hence, remove the non-DT support
for Seaboard and derivatives Kaen and Aebl from the audio driver.

Harmony is the only remaining board supported by this driver when not
using DT. This support is currently scheduled for removal in 3.7.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
This is pretty independent from anything else, but is based on the previous
5-long series I posted in terms of context.

 sound/soc/tegra/tegra_wm8903.c |   48 +--------------------------------------
 1 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 1fd6a41..b75e0e8 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -28,8 +28,6 @@
  *
  */
 
-#include <asm/mach-types.h>
-
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -196,37 +194,6 @@ static const struct snd_soc_dapm_route harmony_audio_map[] = {
 	{"IN1L", NULL, "Mic Jack"},
 };
 
-static const struct snd_soc_dapm_route seaboard_audio_map[] = {
-	{"Headphone Jack", NULL, "HPOUTR"},
-	{"Headphone Jack", NULL, "HPOUTL"},
-	{"Int Spk", NULL, "ROP"},
-	{"Int Spk", NULL, "RON"},
-	{"Int Spk", NULL, "LOP"},
-	{"Int Spk", NULL, "LON"},
-	{"Mic Jack", NULL, "MICBIAS"},
-	{"IN1R", NULL, "Mic Jack"},
-};
-
-static const struct snd_soc_dapm_route kaen_audio_map[] = {
-	{"Headphone Jack", NULL, "HPOUTR"},
-	{"Headphone Jack", NULL, "HPOUTL"},
-	{"Int Spk", NULL, "ROP"},
-	{"Int Spk", NULL, "RON"},
-	{"Int Spk", NULL, "LOP"},
-	{"Int Spk", NULL, "LON"},
-	{"Mic Jack", NULL, "MICBIAS"},
-	{"IN2R", NULL, "Mic Jack"},
-};
-
-static const struct snd_soc_dapm_route aebl_audio_map[] = {
-	{"Headphone Jack", NULL, "HPOUTR"},
-	{"Headphone Jack", NULL, "HPOUTL"},
-	{"Int Spk", NULL, "LINEOUTR"},
-	{"Int Spk", NULL, "LINEOUTL"},
-	{"Mic Jack", NULL, "MICBIAS"},
-	{"IN1R", NULL, "Mic Jack"},
-};
-
 static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
 };
@@ -377,19 +344,8 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		tegra_wm8903_dai.platform_of_node =
 					tegra_wm8903_dai.cpu_dai_of_node;
 	} else {
-		if (machine_is_harmony()) {
-			card->dapm_routes = harmony_audio_map;
-			card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
-		} else if (machine_is_seaboard()) {
-			card->dapm_routes = seaboard_audio_map;
-			card->num_dapm_routes = ARRAY_SIZE(seaboard_audio_map);
-		} else if (machine_is_kaen()) {
-			card->dapm_routes = kaen_audio_map;
-			card->num_dapm_routes = ARRAY_SIZE(kaen_audio_map);
-		} else {
-			card->dapm_routes = aebl_audio_map;
-			card->num_dapm_routes = ARRAY_SIZE(aebl_audio_map);
-		}
+		card->dapm_routes = harmony_audio_map;
+		card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
 	}
 
 	if (gpio_is_valid(pdata->gpio_spkr_en)) {
-- 
1.7.0.4
