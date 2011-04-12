From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ASoC: Tegra: Support more boards
Date: Tue, 12 Apr 2011 11:40:39 -0600
Message-ID: <1302630039-19514-4-git-send-email-swarren@nvidia.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Ventana is identical to Harmony.
* Seaboard, Kaen, and Aebl are all pretty similar, mainly with slightly
  different sets of GPIOs, and slightly different WM8903 pin connectivity.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is for 2.6.40, and for the ASoC subsystem

 sound/soc/tegra/Kconfig        |    7 +-
 sound/soc/tegra/tegra_wm8903.c |  180 +++++++++++++++++++++++++++++++---------
 2 files changed, 145 insertions(+), 42 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 21125b3..14f7119 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -16,12 +16,13 @@ config SND_SOC_TEGRA_I2S
 
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
-	depends on SND_SOC_TEGRA && MACH_HARMONY && I2C
+	depends on SND_SOC_TEGRA && I2C
+	depends on MACH_HARMONY || MACH_VENTANA || MACH_SEABOARD || MACH_KAEN || MACH_AEBL
 	default m
 	select SND_SOC_TEGRA_I2S
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
-	  boards using the WM8093 codec. Currently, the only supported board
-	  is Harmony.
+	  boards using the WM8093 codec. Currently, the supported boards are
+	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
 
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2b38443..37f6010 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -53,8 +53,9 @@
 #define DRV_NAME "tegra-snd-wm8903"
 
 #define GPIO_SPKR_EN    BIT(0)
-#define GPIO_INT_MIC_EN BIT(1)
-#define GPIO_EXT_MIC_EN BIT(2)
+#define GPIO_HP_MUTE    BIT(1)
+#define GPIO_INT_MIC_EN BIT(2)
+#define GPIO_EXT_MIC_EN BIT(3)
 
 struct tegra_wm8903 {
 	struct tegra_asoc_utils_data util_data;
@@ -163,15 +164,35 @@ static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 
+	if (!(machine->gpio_requested & GPIO_SPKR_EN))
+		return 0;
+
 	gpio_set_value_cansleep(pdata->gpio_spkr_en,
 				SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
 }
 
+static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_codec *codec = w->codec;
+	struct snd_soc_card *card = codec->card;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+	struct tegra_wm8903_platform_data *pdata = machine->pdata;
+
+	if (!(machine->gpio_requested & GPIO_HP_MUTE))
+		return 0;
+
+	gpio_set_value_cansleep(pdata->gpio_hp_mute,
+				!SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget tegra_wm8903_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Int Spk", tegra_wm8903_event_int_spk),
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", tegra_wm8903_event_hp),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
@@ -186,6 +207,37 @@ static const struct snd_soc_dapm_route harmony_audio_map[] = {
 	{"IN1L", NULL, "Mic Bias"},
 };
 
+static const struct snd_soc_dapm_route seaboard_audio_map[] = {
+	{"Headphone Jack", NULL, "HPOUTR"},
+	{"Headphone Jack", NULL, "HPOUTL"},
+	{"Int Spk", NULL, "ROP"},
+	{"Int Spk", NULL, "RON"},
+	{"Int Spk", NULL, "LOP"},
+	{"Int Spk", NULL, "LON"},
+	{"Mic Bias", NULL, "Mic Jack"},
+	{"IN1R", NULL, "Mic Bias"},
+};
+
+static const struct snd_soc_dapm_route kaen_audio_map[] = {
+	{"Headphone Jack", NULL, "HPOUTR"},
+	{"Headphone Jack", NULL, "HPOUTL"},
+	{"Int Spk", NULL, "ROP"},
+	{"Int Spk", NULL, "RON"},
+	{"Int Spk", NULL, "LOP"},
+	{"Int Spk", NULL, "LON"},
+	{"Mic Bias", NULL, "Mic Jack"},
+	{"IN2R", NULL, "Mic Bias"},
+};
+
+static const struct snd_soc_dapm_route aebl_audio_map[] = {
+	{"Headphone Jack", NULL, "HPOUTR"},
+	{"Headphone Jack", NULL, "HPOUTL"},
+	{"Int Spk", NULL, "LINEOUTR"},
+	{"Int Spk", NULL, "LINEOUTL"},
+	{"Mic Bias", NULL, "Mic Jack"},
+	{"IN1R", NULL, "Mic Bias"},
+};
+
 static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
 };
@@ -199,34 +251,51 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 	int ret;
 
-	ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
-	if (ret) {
-		dev_err(card->dev, "cannot get spkr_en gpio\n");
-		return ret;
+	if (gpio_is_valid(pdata->gpio_spkr_en)) {
+		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get spkr_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_SPKR_EN;
+
+		gpio_direction_output(pdata->gpio_spkr_en, 0);
 	}
-	machine->gpio_requested |= GPIO_SPKR_EN;
 
-	gpio_direction_output(pdata->gpio_spkr_en, 0);
+	if (gpio_is_valid(pdata->gpio_hp_mute)) {
+		ret = gpio_request(pdata->gpio_hp_mute, "hp_mute");
+		if (ret) {
+			dev_err(card->dev, "cannot get hp_mute gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_HP_MUTE;
 
-	ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
-	if (ret) {
-		dev_err(card->dev, "cannot get int_mic_en gpio\n");
-		return ret;
+		gpio_direction_output(pdata->gpio_hp_mute, 0);
 	}
-	machine->gpio_requested |= GPIO_INT_MIC_EN;
 
-	/* Disable int mic; enable signal is active-high */
-	gpio_direction_output(pdata->gpio_int_mic_en, 0);
+	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
+		ret = gpio_request(pdata->gpio_int_mic_en, "int_mic_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get int_mic_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_INT_MIC_EN;
 
-	ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
-	if (ret) {
-		dev_err(card->dev, "cannot get ext_mic_en gpio\n");
-		return ret;
+		/* Disable int mic; enable signal is active-high */
+		gpio_direction_output(pdata->gpio_int_mic_en, 0);
 	}
-	machine->gpio_requested |= GPIO_EXT_MIC_EN;
 
-	/* Enable ext mic; enable signal is active-low */
-	gpio_direction_output(pdata->gpio_ext_mic_en, 0);
+	if (gpio_is_valid(pdata->gpio_ext_mic_en)) {
+		ret = gpio_request(pdata->gpio_ext_mic_en, "ext_mic_en");
+		if (ret) {
+			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
+			return ret;
+		}
+		machine->gpio_requested |= GPIO_EXT_MIC_EN;
+
+		/* Enable ext mic; enable signal is active-low */
+		gpio_direction_output(pdata->gpio_ext_mic_en, 0);
+	}
 
 	ret = snd_soc_add_controls(codec, tegra_wm8903_controls,
 				   ARRAY_SIZE(tegra_wm8903_controls));
@@ -236,18 +305,31 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_dapm_new_controls(dapm, tegra_wm8903_dapm_widgets,
 					ARRAY_SIZE(tegra_wm8903_dapm_widgets));
 
-	snd_soc_dapm_add_routes(dapm, harmony_audio_map,
-				ARRAY_SIZE(harmony_audio_map));
+	if (machine_is_harmony() || machine_is_ventana()) {
+		snd_soc_dapm_add_routes(dapm, harmony_audio_map,
+					ARRAY_SIZE(harmony_audio_map));
+	} else if (machine_is_seaboard()) {
+		snd_soc_dapm_add_routes(dapm, seaboard_audio_map,
+					ARRAY_SIZE(seaboard_audio_map));
+	} else if (machine_is_kaen()) {
+		snd_soc_dapm_add_routes(dapm, kaen_audio_map,
+					ARRAY_SIZE(kaen_audio_map));
+	} else {
+		snd_soc_dapm_add_routes(dapm, aebl_audio_map,
+					ARRAY_SIZE(aebl_audio_map));
+	}
 
-	tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
-	snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
-			 &tegra_wm8903_hp_jack);
-	snd_soc_jack_add_pins(&tegra_wm8903_hp_jack,
-			      ARRAY_SIZE(tegra_wm8903_hp_jack_pins),
-			      tegra_wm8903_hp_jack_pins);
-	snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
-			       1,
-			       &tegra_wm8903_hp_jack_gpio);
+	if (gpio_is_valid(pdata->gpio_hp_det)) {
+		tegra_wm8903_hp_jack_gpio.gpio = pdata->gpio_hp_det;
+		snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
+				&tegra_wm8903_hp_jack);
+		snd_soc_jack_add_pins(&tegra_wm8903_hp_jack,
+					ARRAY_SIZE(tegra_wm8903_hp_jack_pins),
+					tegra_wm8903_hp_jack_pins);
+		snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
+					1,
+					&tegra_wm8903_hp_jack_gpio);
+	}
 
 	snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
 			 &tegra_wm8903_mic_jack);
@@ -259,10 +341,26 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 
 	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
 
+	/* FIXME: Calculate automatically based on DAPM routes? */
+	if (!machine_is_harmony() && !machine_is_ventana())
+		snd_soc_dapm_nc_pin(dapm, "IN1L");
+	if (!machine_is_seaboard() && !machine_is_aebl())
+		snd_soc_dapm_nc_pin(dapm, "IN1R");
+	snd_soc_dapm_nc_pin(dapm, "IN2L");
+	if (!machine_is_kaen())
+		snd_soc_dapm_nc_pin(dapm, "IN2R");
 	snd_soc_dapm_nc_pin(dapm, "IN3L");
 	snd_soc_dapm_nc_pin(dapm, "IN3R");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUTL");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUTR");
+
+	if (machine_is_aebl()) {
+		snd_soc_dapm_nc_pin(dapm, "LON");
+		snd_soc_dapm_nc_pin(dapm, "RON");
+		snd_soc_dapm_nc_pin(dapm, "ROP");
+		snd_soc_dapm_nc_pin(dapm, "LOP");
+	} else {
+		snd_soc_dapm_nc_pin(dapm, "LINEOUTR");
+		snd_soc_dapm_nc_pin(dapm, "LINEOUTL");
+	}
 
 	snd_soc_dapm_sync(dapm);
 
@@ -293,14 +391,16 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
-	if (!machine_is_harmony()) {
-		dev_err(&pdev->dev, "Not running on Tegra Harmony!\n");
+	if (!machine_is_harmony() && !machine_is_ventana() &&
+	    !machine_is_seaboard() && !machine_is_kaen() &&
+	    !machine_is_aebl()) {
+		dev_err(&pdev->dev, "Not running on a supported board!\n");
 		return -ENODEV;
 	}
 
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data supplied\n");
+		dev_err(&pdev->dev, "No platform data supplied\n");
 		return -EINVAL;
 	}
 
@@ -357,6 +457,8 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 		gpio_free(pdata->gpio_ext_mic_en);
 	if (machine->gpio_requested & GPIO_INT_MIC_EN)
 		gpio_free(pdata->gpio_int_mic_en);
+	if (machine->gpio_requested & GPIO_HP_MUTE)
+		gpio_free(pdata->gpio_hp_mute);
 	if (machine->gpio_requested & GPIO_SPKR_EN)
 		gpio_free(pdata->gpio_spkr_en);
 
-- 
1.7.1
