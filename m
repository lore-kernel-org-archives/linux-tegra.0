From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] ASoC: Tegra: wm8903: s/code/data/ for control/widget/maps
Date: Tue, 19 Apr 2011 12:46:17 -0600
Message-ID: <1303238777-14277-5-git-send-email-swarren@nvidia.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303238777-14277-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Replace calls to a variety of registration functions by updating
struct snd_soc_card snd_soc_tegra_wm8903 to directly point at the
various control/widget/map tables instead. The ASoC core now
performs any required registration based on these data fields.

(Applying Mark's TrimSlice review comments to the existing driver)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   41 ++++++++++++++++++---------------------
 1 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 988ff50..fe83b38 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -294,28 +294,6 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		gpio_direction_output(pdata->gpio_ext_mic_en, 0);
 	}
 
-	ret = snd_soc_add_controls(codec, tegra_wm8903_controls,
-				   ARRAY_SIZE(tegra_wm8903_controls));
-	if (ret < 0)
-		return ret;
-
-	snd_soc_dapm_new_controls(dapm, tegra_wm8903_dapm_widgets,
-					ARRAY_SIZE(tegra_wm8903_dapm_widgets));
-
-	if (machine_is_harmony() || machine_is_ventana()) {
-		snd_soc_dapm_add_routes(dapm, harmony_audio_map,
-					ARRAY_SIZE(harmony_audio_map));
-	} else if (machine_is_seaboard()) {
-		snd_soc_dapm_add_routes(dapm, seaboard_audio_map,
-					ARRAY_SIZE(seaboard_audio_map));
-	} else if (machine_is_kaen()) {
-		snd_soc_dapm_add_routes(dapm, kaen_audio_map,
-					ARRAY_SIZE(kaen_audio_map));
-	} else {
-		snd_soc_dapm_add_routes(dapm, aebl_audio_map,
-					ARRAY_SIZE(aebl_audio_map));
-	}
-
 	if (gpio_is_valid(pdata->gpio_hp_det)) {
 		tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
 		snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
@@ -379,6 +357,11 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.name = "tegra-wm8903",
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
+
+	.controls = tegra_wm8903_controls,
+	.num_controls = ARRAY_SIZE(tegra_wm8903_controls),
+	.dapm_widgets = tegra_wm8903_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra_wm8903_dapm_widgets),
 };
 
 static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
@@ -410,6 +393,20 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
+	if (machine_is_harmony() || machine_is_ventana()) {
+		card->dapm_routes = harmony_audio_map;
+		card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
+	} else if (machine_is_seaboard()) {
+		card->dapm_routes = seaboard_audio_map;
+		card->num_dapm_routes = ARRAY_SIZE(seaboard_audio_map);
+	} else if (machine_is_kaen()) {
+		card->dapm_routes = kaen_audio_map;
+		card->num_dapm_routes = ARRAY_SIZE(kaen_audio_map);
+	} else {
+		card->dapm_routes = aebl_audio_map;
+		card->num_dapm_routes = ARRAY_SIZE(aebl_audio_map);
+	}
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-- 
1.7.1
