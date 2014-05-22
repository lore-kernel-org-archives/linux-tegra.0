From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: free jack GPIOs before the sound card is freed
Date: Thu, 22 May 2014 16:14:53 -0600
Message-ID: <1400796893-29540-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

snd_soc_jack_add_gpios() schedules a work queue item to poll the GPIO to
generate an initial jack status report. If sound card initialization
fails, that work item needs to be cancelled, so it doesn't run after the
card has been freed. Specifically, freeing the card calls
snd_jack_dev_free() which calls snd_jack_dev_disconnect() which sets
jack->input_dev = NULL, and input_dev is used by snd_jack_report(), which
is called from the work queue item.

snd_soc_jack_free_gpios() cancels the work item. The Tegra ASoC machine
drivers do call this function in the platform driver remove() callback.
However, this happens after the sound card is freed, at least when the
card is freed due to errors late during snd_soc_instantiate_card(). This
leaves a window where the work item can execute after the card is freed.
In next-20140522, sound card initialization does fail for unrelated
reasons, and hits the problem described above.

To solve this, fix the Tegra ASoC machine drivers to clean up the Jack
GPIOs during the snd_soc_card's .remove() callback, which is executed
before the overall card object is freed. also, gGuard the cleanup call
based on whether we actually setup up the GPIOs in the first place.
Ideally, we'd do the cleanup in a struct snd_soc_dai_link .fini/remove
function to match where the GPIOs get set up. However, there is no such
callback.

This change fixes all Tegra machine drivers. By code inspection, I
believe some non-Tegra machine drivers have the same issue. I'll send a
patch for that separately, once this is reviewed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Should this be Cc: stable?
---
 sound/soc/tegra/tegra_alc5632.c  | 16 +++++++++++++---
 sound/soc/tegra/tegra_max98090.c | 16 +++++++++++++---
 sound/soc/tegra/tegra_rt5640.c   | 16 +++++++++++++---
 sound/soc/tegra/tegra_wm8903.c   | 11 ++++++-----
 4 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index c61ea3a1030f..02734bd4f09b 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -125,6 +125,18 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int tegra_alc5632_card_remove(struct snd_soc_card *card)
+{
+	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		snd_soc_jack_free_gpios(&tegra_alc5632_hs_jack, 1,
+					&tegra_alc5632_hp_jack_gpio);
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link tegra_alc5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
@@ -139,6 +151,7 @@ static struct snd_soc_dai_link tegra_alc5632_dai = {
 static struct snd_soc_card snd_soc_tegra_alc5632 = {
 	.name = "tegra-alc5632",
 	.owner = THIS_MODULE,
+	.remove = tegra_alc5632_card_remove,
 	.dai_link = &tegra_alc5632_dai,
 	.num_links = 1,
 	.controls = tegra_alc5632_controls,
@@ -223,9 +236,6 @@ static int tegra_alc5632_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
 
-	snd_soc_jack_free_gpios(&tegra_alc5632_hs_jack, 1,
-				&tegra_alc5632_hp_jack_gpio);
-
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 0283cfb7c031..ce73e1f62c4b 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -145,6 +145,18 @@ static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int tegra_max98090_card_remove(struct snd_soc_card *card)
+{
+	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		snd_soc_jack_free_gpios(&tegra_max98090_hp_jack, 1,
+					&tegra_max98090_hp_jack_gpio);
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link tegra_max98090_dai = {
 	.name = "max98090",
 	.stream_name = "max98090 PCM",
@@ -158,6 +170,7 @@ static struct snd_soc_dai_link tegra_max98090_dai = {
 static struct snd_soc_card snd_soc_tegra_max98090 = {
 	.name = "tegra-max98090",
 	.owner = THIS_MODULE,
+	.remove = tegra_max98090_card_remove,
 	.dai_link = &tegra_max98090_dai,
 	.num_links = 1,
 	.controls = tegra_max98090_controls,
@@ -241,9 +254,6 @@ static int tegra_max98090_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
 
-	snd_soc_jack_free_gpios(&tegra_max98090_hp_jack, 1,
-				&tegra_max98090_hp_jack_gpio);
-
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 4511c5a875ec..4feb16a99e02 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -128,6 +128,18 @@ static int tegra_rt5640_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int tegra_rt5640_card_remove(struct snd_soc_card *card)
+{
+	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(card);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		snd_soc_jack_free_gpios(&tegra_rt5640_hp_jack, 1,
+					&tegra_rt5640_hp_jack_gpio);
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link tegra_rt5640_dai = {
 	.name = "RT5640",
 	.stream_name = "RT5640 PCM",
@@ -141,6 +153,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
 	.name = "tegra-rt5640",
 	.owner = THIS_MODULE,
+	.remove = tegra_rt5640_card_remove,
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.controls = tegra_rt5640_controls,
@@ -224,9 +237,6 @@ static int tegra_rt5640_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(card);
 
-	snd_soc_jack_free_gpios(&tegra_rt5640_hp_jack, 1,
-				&tegra_rt5640_hp_jack_gpio);
-
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 4ac73730d79a..0939661df60b 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -206,6 +206,12 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd = &(card->rtd[0]);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_codec *codec = codec_dai->codec;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack, 1,
+					&tegra_wm8903_hp_jack_gpio);
+	}
 
 	wm8903_mic_detect(codec, NULL, 0, 0);
 
@@ -228,9 +234,7 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
-
 	.remove = tegra_wm8903_remove,
-
 	.controls = tegra_wm8903_controls,
 	.num_controls = ARRAY_SIZE(tegra_wm8903_controls),
 	.dapm_widgets = tegra_wm8903_dapm_widgets,
@@ -368,9 +372,6 @@ static int tegra_wm8903_driver_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 
-	snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack, 1,
-				&tegra_wm8903_hp_jack_gpio);
-
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
-- 
1.8.1.5
