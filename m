From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ASoC: Tegra: Don't store snd_soc_jack_gpio in an array
Date: Tue, 12 Apr 2011 11:40:38 -0600
Message-ID: <1302630039-19514-3-git-send-email-swarren@nvidia.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Storing the struct in an array makes the assignments to the GPIO member a
little non-obvious, and is pointless when there's only a single GPIO.

(I thought I fixed this during the review cycle when first submitting this
driver, but I guess I overlooked that)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is for 2.6.40, and for the ASoC subsystem

 sound/soc/tegra/tegra_wm8903.c |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 0e31925..2b38443 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -139,13 +139,11 @@ static struct snd_soc_jack_pin tegra_wm8903_hp_jack_pins[] = {
 	},
 };
 
-static struct snd_soc_jack_gpio tegra_wm8903_hp_jack_gpios[] = {
-	{
-		.name = "headphone detect",
-		.report = SND_JACK_HEADPHONE,
-		.debounce_time = 150,
-		.invert = 1,
-	}
+static struct snd_soc_jack_gpio tegra_wm8903_hp_jack_gpio = {
+	.name = "headphone detect",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+	.invert = 1,
 };
 
 static struct snd_soc_jack tegra_wm8903_mic_jack;
@@ -241,15 +239,15 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_dapm_add_routes(dapm, harmony_audio_map,
 				ARRAY_SIZE(harmony_audio_map));
 
-	tegra_wm8903_hp_jack_gpios[0].gpio = pdata->gpio_hp_det;
+	tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
 	snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
 			 &tegra_wm8903_hp_jack);
 	snd_soc_jack_add_pins(&tegra_wm8903_hp_jack,
 			      ARRAY_SIZE(tegra_wm8903_hp_jack_pins),
 			      tegra_wm8903_hp_jack_pins);
 	snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
-			       ARRAY_SIZE(tegra_wm8903_hp_jack_gpios),
-			       tegra_wm8903_hp_jack_gpios);
+			       1,
+			       &tegra_wm8903_hp_jack_gpio);
 
 	snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
 			 &tegra_wm8903_mic_jack);
-- 
1.7.1
