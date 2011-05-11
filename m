From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 3/3] ARM:Tegra: Device Tree Support: Initialize from wm8903 the
	device tree
Date: Wed, 11 May 2011 16:27:18 -0700
Message-ID: <20110511232711.10362.53256.stgit@riker>
References: <20110511231905.10362.12844.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110511231905.10362.12844.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch makes it so the wm8903 is initialized from it's device tree node.

Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/arm/boot/dts/tegra-harmony.dts |   17 ++++++
 sound/soc/codecs/wm8903.c           |   93 +++++++++++++++++++++++++++++++++--
 sound/soc/tegra/Kconfig             |    2 -
 sound/soc/tegra/harmony.c           |    8 +++
 4 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index af169aa..05521a5 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -19,6 +19,23 @@
 	i2c@7000c000 {
 		status = "ok";
 		clock-frequency = <400000>;
+
+		codec: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupts = < 347 >;
+			irq-active-low = <0>;
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			gpio-base = < 224 >;
+			gpio-num-cfg = < 5 >;
+			/* #define WM8903_GPIO_NO_CONFIG 0x8000 */
+			gpio-cfg = < 0x8000 0x8000 0 0x8000 0x8000 >;
+		};
 	};
 
 	i2c@7000c400 {
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index f52b623..2347201 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1865,10 +1865,14 @@ static void wm8903_init_gpio(struct snd_soc_codec *codec)
 	wm8903->gpio_chip.ngpio = WM8903_NUM_GPIO;
 	wm8903->gpio_chip.dev = codec->dev;
 
-	if (pdata && pdata->gpio_base)
+	wm8903->gpio_chip.base = -1;
+	if (pdata && pdata->gpio_base) {
 		wm8903->gpio_chip.base = pdata->gpio_base;
-	else
-		wm8903->gpio_chip.base = -1;
+	} else if (codec->dev->of_node) {
+		prop = of_get_property(codec->dev->of_node, "gpio-base", NULL);
+		if (prop)
+			wm8903->gpio_chip.base = be32_to_cpup(prop);
+	}
 
 	ret = gpiochip_add(&wm8903->gpio_chip);
 	if (ret != 0)
@@ -1898,6 +1902,11 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 {
 	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
+	const unsigned int *prop;
+	int micdet_cfg = 0;
+	int irq_active_low;
+	int num_gpios = 0;
+	int gpio_cfg = 0;
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
@@ -1964,10 +1973,76 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
 
 		wm8903->mic_delay = pdata->micdet_delay;
+	} else if (codec->dev->of_node) {
+		bool mic_gpio = false;
+
+		prop = of_get_property(codec->dev->of_node, "gpio-num-cfg", NULL);
+		if (prop)
+			num_gpios = be32_to_cpup(prop);
+
+		prop = of_get_property(codec->dev->of_node, "gpio-cfg", NULL);
+		if (num_gpios && prop) {
+			for (i = 0; i < num_gpios; i++) {
+				gpio_cfg = be32_to_cpu(prop[i]);
+
+				if (gpio_cfg == WM8903_GPIO_NO_CONFIG)
+					continue;
+
+				snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
+					      gpio_cfg & 0xffff);
+
+				val = (gpio_cfg & WM8903_GP1_FN_MASK)
+					>> WM8903_GP1_FN_SHIFT;
+
+				switch (val) {
+				case WM8903_GPn_FN_MICBIAS_CURRENT_DETECT:
+				case WM8903_GPn_FN_MICBIAS_SHORT_DETECT:
+					mic_gpio = true;
+					break;
+				default:
+					break;
+				}
+			}
+		}
+
+		prop = of_get_property(codec->dev->of_node, "interrupts", NULL);
+		if (prop)
+			wm8903->irq = be32_to_cpup(prop);
+
+		prop = of_get_property(codec->dev->of_node, "micdet-cfg", NULL);
+		if (prop)
+			micdet_cfg = be32_to_cpup(prop);
+
+		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0, micdet_cfg);
+
+		if (micdet_cfg)
+			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
+					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
+		
+		/* If microphone detection is enabled in device tree but
+		 * detected via IRQ then interrupts can be lost before
+		 * the machine driver has set up microphone detection
+		 * IRQs as the IRQs are clear on read.  The detection
+		 * will be enabled when the machine driver configures.
+		 */
+		WARN_ON(!mic_gpio && (micdet_cfg & WM8903_MICDET_ENA));
+
+		prop = of_get_property(codec->dev->of_node, "micdet-delay", NULL);
+		if (prop)
+			wm8903->mic_delay = be32_to_cpup(prop);
+
 	}
 	
 	if (wm8903->irq) {
-		if (pdata && pdata->irq_active_low) {
+		if (pdata) {
+			irq_active_low = pdata->irq_active_low;
+		} else if (codec->dev->of_node) {
+			prop = of_get_property(codec->dev->of_node, "irq-active-low", NULL);
+			if (prop)
+				irq_active_low = be32_to_cpup(prop);
+		}
+
+		if (irq_active_low) {
 			trigger = IRQF_TRIGGER_LOW;
 			irq_pol = WM8903_IRQ_POL;
 		} else {
@@ -2057,6 +2132,16 @@ static struct snd_soc_codec_driver soc_codec_dev_wm8903 = {
 };
 
 #if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+
+#if defined(CONFIG_OF)
+/* Match table for of_platform binding */
+static const struct of_device_id wm8903_of_match[] __devinitconst = {
+        { .compatible = "wlf,wm8903", },
+        {},
+};
+MODULE_DEVICE_TABLE(of, wm8903_of_match);
+#endif
+
 static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 				      const struct i2c_device_id *id)
 {
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 66b504f..6dc89bc 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -16,7 +16,7 @@ config SND_TEGRA_SOC_I2S
 
 config SND_TEGRA_SOC_HARMONY
 	tristate "SoC Audio support for Tegra Harmony reference board"
-	depends on SND_TEGRA_SOC && MACH_HARMONY && I2C
+	depends on SND_TEGRA_SOC && (MACH_HARMONY || MACH_TEGRA_DT) && I2C
 	default m
 	select SND_TEGRA_SOC_I2S
 	select SND_SOC_WM8903
diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 556a571..f225087 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -292,12 +292,20 @@ static __devinit int tegra_snd_harmony_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &snd_soc_harmony;
 	struct tegra_harmony *harmony;
 	struct harmony_audio_platform_data *pdata;
+	const char *sprop;
 	int ret;
 
+#ifdef CONFIG_OF
+	if ((!of_machine_is_compatible("nvidia,harmony")) && (!machine_is_harmony())) {
+		dev_err(&pdev->dev, "Not running on Tegra Harmony!\n");
+		return -ENODEV;
+	}
+#else
 	if (!machine_is_harmony()) {
 		dev_err(&pdev->dev, "Not running on Tegra Harmony!\n");
 		return -ENODEV;
 	}
+#endif
 
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
