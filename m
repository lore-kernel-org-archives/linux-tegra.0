From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/6] ASoC: Tegra+WM8903 machine: Add device tree binding
Date: Wed,  7 Dec 2011 13:58:30 -0700
Message-ID: <1323291510-22338-6-git-send-email-swarren@nvidia.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323291510-22338-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This driver is parameterized in two ways:

a) Platform data, which supplies the set of GPIOs used by the driver.
   These GPIOs can now be parsed out of device tree.

b) Machine-specific DAPM route arrays embedded into the ASoC machine
   driver itself. Historically, the driver picks the appropriate array
   to use using machine_is_*(). The driver now requires this array to
   be parsed from device tree when instantiated through device tree,
   using the core ASoC support for this parsing.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Split DAPM map parsing into a core ASoC feature.
* Updating binding to require codec and I2S controller phandles, use new
  ASoC core feature to bind DAI links using OF nodes rather than device
  names.
* Rebase on top of WM8903 MICBIAS supply conversion.
* Other minor cleanups.

 .../bindings/sound/tegra-audio-wm8903.txt          |   72 +++++++++++++
 sound/soc/tegra/tegra_wm8903.c                     |  106 ++++++++++++++++----
 2 files changed, 156 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt

diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt b/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
new file mode 100644
index 0000000..b96639d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
@@ -0,0 +1,72 @@
+NVIDIA Tegra audio complex
+
+Required properties:
+- compatible : "nvidia,tegra-audio-wm8903" (specific HW model)
+               "generic,soc-audio-complex" (generic audio complex)
+- user-visible-name : As defined by soc-audio-complex.txt.
+- audio-routing : As defined by soc-audio-complex.txt.
+  Valid names for sources and sinks are the WM8903's pins, and the jacks
+  on the board:
+
+  WM8903 pins:
+
+  * IN1L
+  * IN1R
+  * IN2L
+  * IN2R
+  * IN3L
+  * IN3R
+  * DMICDAT
+  * HPOUTL
+  * HPOUTR
+  * LINEOUTL
+  * LINEOUTR
+  * LOP
+  * LON
+  * ROP
+  * RON
+  * MICBIAS
+
+  Board connectors:
+
+  * Headphone Jack
+  * Int Spk
+  * Mic Jack
+
+- nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
+- nvidia,audio-codec : The phandle of the WM8903 audio codec
+
+Optional properties:
+- nvidia,spkr-en-gpios : The GPIO that enables the speakers
+- nvidia,hp-mute-gpios : The GPIO that mutes the headphones
+- nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
+- nvidia,int-mic-en-gpios : The GPIO that enables the internal microphone
+- nvidia,ext-mic-en-gpios : The GPIO that enables the external microphone
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-wm8903-harmony",
+		     "nvidia,tegra-audio-wm8903",
+		     "generic,soc-audio-complex";
+	user-visible-name = "tegra-wm8903-harmony";
+
+	audio-routing =
+		"Headphone Jack", "HPOUTR",
+		"Headphone Jack", "HPOUTL",
+		"Int Spk", "ROP",
+		"Int Spk", "RON",
+		"Int Spk", "LOP",
+		"Int Spk", "LON",
+		"Mic Jack", "MICBIAS",
+		"IN1L", "Mic Jack";
+
+	nvidia,i2s-controller = <&i2s1>;
+	nvidia,audio-codec = <&wm8903>;
+
+	nvidia,spkr-en-gpios = <&codec 2 0>;
+	nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
+	nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
+	nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
+};
+
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index ba2d23e..e1534f2 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -34,6 +34,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
+#include <linux/of_gpio.h>
 
 #include <mach/tegra_wm8903_pdata.h>
 
@@ -59,8 +60,9 @@
 #define GPIO_HP_DET     BIT(4)
 
 struct tegra_wm8903 {
+	struct tegra_wm8903_platform_data pdata;
+	struct platform_device *pcm_dev;
 	struct tegra_asoc_utils_data util_data;
-	struct tegra_wm8903_platform_data *pdata;
 	int gpio_requested;
 };
 
@@ -160,7 +162,7 @@ static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = machine->pdata;
+	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
 	if (!(machine->gpio_requested & GPIO_SPKR_EN))
 		return 0;
@@ -177,7 +179,7 @@ static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = machine->pdata;
+	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
 	if (!(machine->gpio_requested & GPIO_HP_MUTE))
 		return 0;
@@ -246,9 +248,36 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = machine->pdata;
+	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
+	struct device_node *np = card->dev->of_node;
 	int ret;
 
+	if (card->dev->platform_data) {
+		memcpy(pdata, card->dev->platform_data, sizeof(*pdata));
+	} else if (np) {
+		/*
+		 * This part must be in init() rather than probe() in order to
+		 * guarantee that the WM8903 has been probed, and hence its
+		 * GPIO controller registered, which is a pre-condition for
+		 * of_get_named_gpio() to be able to map the phandles in the
+		 * properties to the controller node. Given this, all
+		 * pdata handling is in init() for consistency.
+		 */
+		pdata->gpio_spkr_en = of_get_named_gpio(np,
+						"nvidia,spkr-en-gpios", 0);
+		pdata->gpio_hp_mute = of_get_named_gpio(np,
+						"nvidia,hp-mute-gpios", 0);
+		pdata->gpio_hp_det = of_get_named_gpio(np,
+						"nvidia,hp-det-gpios", 0);
+		pdata->gpio_int_mic_en = of_get_named_gpio(np,
+						"nvidia,int-mic-en-gpios", 0);
+		pdata->gpio_ext_mic_en = of_get_named_gpio(np,
+						"nvidia,ext-mic-en-gpios", 0);
+	} else {
+		dev_err(card->dev, "No platform data supplied\n");
+		return -EINVAL;
+	}
+
 	if (gpio_is_valid(pdata->gpio_spkr_en)) {
 		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
 		if (ret) {
@@ -348,11 +377,9 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &snd_soc_tegra_wm8903;
 	struct tegra_wm8903 *machine;
-	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
+	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
 		dev_err(&pdev->dev, "No platform data supplied\n");
 		return -EINVAL;
 	}
@@ -364,29 +391,52 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err;
 	}
+	machine->pcm_dev = ERR_PTR(-EINVAL);
+
+	if (pdev->dev.of_node) {
+		machine->pcm_dev = platform_device_register_simple(
+					"tegra-pcm-audio", -1, NULL, 0);
+		if (IS_ERR(machine->pcm_dev)) {
+			dev_err(&pdev->dev, "Can't instantiate ASoC DMA\n");
+			ret = PTR_ERR(machine->pcm_dev);
+			goto err;
+		}
+
+		tegra_wm8903_dai.codec_name = NULL;
+		tegra_wm8903_dai.codec_of_node = of_parse_phandle(
+				pdev->dev.of_node, "nvidia,audio-codec", 0);
 
-	machine->pdata = pdata;
+		tegra_wm8903_dai.cpu_dai_name = NULL;
+		tegra_wm8903_dai.cpu_dai_of_node = of_parse_phandle(
+				pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	}
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		goto err_unregister;
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
-	if (machine_is_harmony()) {
-		card->dapm_routes = harmony_audio_map;
-		card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
-	} else if (machine_is_seaboard()) {
-		card->dapm_routes = seaboard_audio_map;
-		card->num_dapm_routes = ARRAY_SIZE(seaboard_audio_map);
-	} else if (machine_is_kaen()) {
-		card->dapm_routes = kaen_audio_map;
-		card->num_dapm_routes = ARRAY_SIZE(kaen_audio_map);
-	} else {
-		card->dapm_routes = aebl_audio_map;
-		card->num_dapm_routes = ARRAY_SIZE(aebl_audio_map);
+	/*
+	 * With device tree, we require the route table to be parsed from the
+	 * device tree by the ASoC core.
+	 */
+	if (!pdev->dev.of_node) {
+		if (machine_is_harmony()) {
+			card->dapm_routes = harmony_audio_map;
+			card->num_dapm_routes = ARRAY_SIZE(harmony_audio_map);
+		} else if (machine_is_seaboard()) {
+			card->dapm_routes = seaboard_audio_map;
+			card->num_dapm_routes = ARRAY_SIZE(seaboard_audio_map);
+		} else if (machine_is_kaen()) {
+			card->dapm_routes = kaen_audio_map;
+			card->num_dapm_routes = ARRAY_SIZE(kaen_audio_map);
+		} else {
+			card->dapm_routes = aebl_audio_map;
+			card->num_dapm_routes = ARRAY_SIZE(aebl_audio_map);
+		}
 	}
 
 	ret = snd_soc_register_card(card);
@@ -400,6 +450,9 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
+err_unregister:
+	if (!IS_ERR(machine->pcm_dev))
+		platform_device_unregister(machine->pcm_dev);
 err:
 	return ret;
 }
@@ -408,7 +461,7 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	struct tegra_wm8903_platform_data *pdata = machine->pdata;
+	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
 	if (machine->gpio_requested & GPIO_HP_DET)
 		snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack,
@@ -427,15 +480,23 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
+	if (!IS_ERR(machine->pcm_dev))
+		platform_device_unregister(machine->pcm_dev);
 
 	return 0;
 }
 
+static const struct of_device_id tegra_wm8903_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra-audio-wm8903", },
+	{},
+};
+
 static struct platform_driver tegra_wm8903_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
 		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_wm8903_of_match,
 	},
 	.probe = tegra_wm8903_driver_probe,
 	.remove = __devexit_p(tegra_wm8903_driver_remove),
@@ -446,3 +507,4 @@ MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
-- 
1.7.0.4
