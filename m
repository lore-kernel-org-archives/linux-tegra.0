From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH 1/3] ARM: dt: tegra: Enable device tree audio on PAZ00 board.
Date: Wed, 25 Jan 2012 20:49:23 +0200
Message-ID: <1327517363-29698-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds initial device tree support of ALC5632 sound codec and
machine driver for PAZ00 board. The implementation is based on the WM8903 codec.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 .../devicetree/bindings/sound/alc5632.txt          |   24 ++++++
 .../bindings/sound/tegra-audio-alc5632.txt         |   55 ++++++++++++++
 arch/arm/boot/dts/tegra-paz00.dts                  |   29 ++++++--
 sound/soc/tegra/tegra_alc5632.c                    |   78 ++++++++++++++++++--
 4 files changed, 173 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt

diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt
new file mode 100644
index 0000000..8608f74
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/alc5632.txt
@@ -0,0 +1,24 @@
+ALC5632 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+  - compatible : "realtek,alc5632"
+
+  - reg : the I2C address of the device.
+
+  - gpio-controller : Indicates this device is a GPIO controller.
+
+  - #gpio-cells : Should be two. The first cell is the pin number and the
+    second cell is used to specify optional parameters (currently unused).
+
+Example:
+
+alc5632: alc5632@1e {
+	compatible = "realtek,alc5632";
+	reg = <0x1a>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
new file mode 100644
index 0000000..315213f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
@@ -0,0 +1,55 @@
+NVIDIA Tegra audio complex
+
+Required properties:
+- compatible : "nvidia,tegra-audio-alc5632"
+- nvidia,model : The user-visible name of this sound complex.
+- nvidia,audio-routing : A list of the connections between audio components.
+  Each entry is a pair of strings, the first being the connection's sink,
+  the second being the connection's source. Valid names for sources and
+  sinks are the ALC5632's pins:
+
+  ALC5632 pins:
+
+  * SPKOUT
+  * SPKOUTN
+  * HPL
+  * HPR
+  * AUXOUT
+  * LINEINL
+  * LINEINR
+  * PHONEP
+  * PHONEP
+  * MIC1
+  * MIC2
+  * MICBIAS1
+  * MICBIAS2
+
+  Board connectors:
+
+  * Headset Stereophone
+  * Int Spk
+  * MIC1
+  * MICBIAS1
+
+- nvidia,i2s-controller : The phandle of the Tegra I2S controller
+- nvidia,audio-codec : The phandle of the ALC5632 audio codec
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-alc5632-paz00",
+				 "nvidia,tegra-audio-alc5632";
+
+	nvidia,model = "Compal PAZ00";
+
+	nvidia,audio-routing =
+				"Int Spk", "SPKOUT",
+				"Int Spk", "SPKOUTN",
+				"MIC1", "MICBIAS1",
+				"MICBIAS1", "Headset Mic",
+				"Headset Stereophone", "HPR",
+				"Headset Stereophone", "HPL";
+
+	nvidia,i2s-controller = <&tegra_i2s1>;
+	nvidia,audio-codec = <&alc5632>;
+};
diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 4d1bcdc..692d20c 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -12,6 +12,13 @@
 
 	i2c@7000c000 {
 		clock-frequency = <400000>;
+
+		alc5632: alc5632@1e {
+			compatible = "realtek,alc5632";
+			reg = <0x1e>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 
 	i2c@7000c400 {
@@ -37,16 +44,26 @@
 		clock-frequency = <400000>;
 	};
 
-	i2s@70002800 {
-		status = "disable";
-	};
-
 	i2s@70002a00 {
 		status = "disable";
 	};
 
-	das@70000c00 {
-		status = "disable";
+	sound {
+		compatible = "nvidia,tegra-audio-alc5632-paz00",
+		"nvidia,tegra-audio-alc5632";
+
+		nvidia,model = "Compal PAZ00";
+
+		nvidia,audio-routing =
+			"Int Spk", "SPKOUT",
+			"Int Spk", "SPKOUTN",
+			"MIC1", "MICBIAS1",
+			"MICBIAS1", "Headset Mic",
+			"Headset Stereophone", "HPR",
+			"Headset Stereophone", "HPL";
+
+		nvidia,audio-codec = <&alc5632>;
+		nvidia,i2s-controller = <&tegra_i2s1>;
 	};
 
 	serial@70006000 {
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 4a0e805..22348e8 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -36,6 +36,7 @@
 
 struct tegra_alc5632 {
 	struct tegra_asoc_utils_data util_data;
+	struct platform_device *pcm_dev;
 };
 
 static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -163,26 +164,80 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 			sizeof(struct tegra_alc5632), GFP_KERNEL);
 	if (!alc5632) {
 		dev_err(&pdev->dev, "Can't allocate tegra_alc5632\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err;
 	}
 
-	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, alc5632);
 
+	alc5632->pcm_dev = ERR_PTR(-EINVAL);
+
+	if (!(pdev->dev.of_node)) {
+		dev_err(&pdev->dev, "No platform data supplied\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_alc5632_dai.codec_name = NULL;
+	tegra_alc5632_dai.codec_of_node = of_parse_phandle(
+	pdev->dev.of_node, "nvidia,audio-codec", 0);
+
+	if (!tegra_alc5632_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_alc5632_dai.cpu_dai_name = NULL;
+	tegra_alc5632_dai.cpu_dai_of_node = of_parse_phandle(
+	pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	if (!tegra_alc5632_dai.cpu_dai_of_node) {
+		dev_err(&pdev->dev,
+		"Property 'nvidia,i2s-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	alc5632->pcm_dev = platform_device_register_simple(
+		"tegra-pcm-audio", -1, NULL, 0);
+	if (IS_ERR(alc5632->pcm_dev)) {
+		dev_err(&pdev->dev,
+			"Can't instantiate tegra-pcm-audio\n");
+		ret = PTR_ERR(alc5632->pcm_dev);
+		goto err;
+	}
+
+	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
+	if (ret)
+		goto err_unregister;
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		tegra_asoc_utils_fini(&alc5632->util_data);
-		return ret;
+		goto err_fini_utils;
 	}
 
 	return 0;
+
+err_fini_utils:
+	tegra_asoc_utils_fini(&alc5632->util_data);
+err_unregister:
+	if (!IS_ERR(alc5632->pcm_dev))
+		platform_device_unregister(alc5632->pcm_dev);
+err:
+	return ret;
 }
 
 static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
@@ -193,15 +248,23 @@ static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&alc5632->util_data);
+	if (!IS_ERR(alc5632->pcm_dev))
+		platform_device_unregister(alc5632->pcm_dev);
 
 	return 0;
 }
 
+static const struct of_device_id tegra_alc5632_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra-audio-alc5632", },
+	{},
+};
+
 static struct platform_driver tegra_alc5632_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
 		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_alc5632_of_match,
 	},
 	.probe = tegra_alc5632_probe,
 	.remove = __devexit_p(tegra_alc5632_remove),
@@ -212,3 +275,4 @@ MODULE_AUTHOR("Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra+ALC5632 machine ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_alc5632_of_match);
-- 
1.7.3.4
