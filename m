From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 04/17] ASoC: Add device tree binding for WM8903
Date: Tue, 22 Nov 2011 18:21:12 -0700
Message-ID: <1322011285-4002-5-git-send-email-swarren@nvidia.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322011285-4002-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

This patch makes it so the wm8903 is initialized from it's device tree node.

swarren applied the following modifications:
* Cleaned up DT parsing code
* Documented DT binding
* Set up wm8903->gpio_chip.of_node, extracted from another patch by John.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/wm8903.txt |   48 ++++++++++++++++++++
 sound/soc/codecs/wm8903.c                          |   48 ++++++++++++++++++-
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt

diff --git a/Documentation/devicetree/bindings/sound/wm8903.txt b/Documentation/devicetree/bindings/sound/wm8903.txt
new file mode 100644
index 0000000..96edf6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wm8903.txt
@@ -0,0 +1,48 @@
+WM89033 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+  - compatible : "wlf,wm8903"
+
+  - reg : the I2C address of the device.
+
+  - gpio-controller : Indicates this device is a GPIO controller.
+
+  - #gpio-cells : Should be two. The first cell is the pin number and the
+    second cell is used to specify optional parameters (currently unused).
+
+Optional properties:
+
+  - interrupts : The interrupt line the codec is connected to.
+
+  - irq-active-low : Indicates whether the IRQ output should be active low
+    (property present) or active high (property absent).
+
+  - micdet-cfg : Default register value for R6 (Mic Bias). If absent, the
+    default is 0.
+
+  - micdet-delay : The debounce delay for microphone detection in mS. If
+    absent, the default is 100.
+
+  - gpio-cfg : A list of GPIO pin mux register values. The list must be 5
+    entries long. If absent, no configuration of these registers is
+    performed.
+
+Example:
+
+codec: wm8903@1a {
+	compatible = "wlf,wm8903";
+	reg = <0x1a>;
+	interrupts = < 347 >;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+
+	irq-active-low;
+	micdet-cfg = <0>;
+	micdet-delay = <100>;
+	/* 0x8000 = Not configured */
+	gpio-cfg = < 0x8000 0x8000 0 0x8000 0x8000 >;
+};
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 4ad8ebd..4c2c7ef 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1864,10 +1864,10 @@ static struct gpio_chip wm8903_template_chip = {
 	.can_sleep		= 1,
 };
 
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct snd_soc_codec *codec,
+			     struct wm8903_platform_data *pdata)
 {
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
-	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
 	int ret;
 
 	wm8903->gpio_chip = wm8903_template_chip;
@@ -1879,6 +1879,8 @@ static void wm8903_init_gpio(struct snd_soc_codec *codec)
 	else
 		wm8903->gpio_chip.base = -1;
 
+	wm8903->gpio_chip.of_node = codec->dev->of_node;
+
 	ret = gpiochip_add(&wm8903->gpio_chip);
 	if (ret != 0)
 		dev_err(codec->dev, "Failed to add GPIOs: %d\n", ret);
@@ -1906,10 +1908,13 @@ static void wm8903_free_gpio(struct snd_soc_codec *codec)
 static int wm8903_probe(struct snd_soc_codec *codec)
 {
 	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
+	struct wm8903_platform_data lpdata;
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
+	const struct device_node *np;
+	u32 val32;
 
 	wm8903->codec = codec;
 
@@ -1932,6 +1937,31 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 
 	wm8903_reset(codec);
 
+	if (!pdata && codec->dev->of_node) {
+		lpdata.irq_active_low = 0;
+		lpdata.micdet_cfg = 0;
+		lpdata.micdet_delay = 100;
+		lpdata.gpio_base = -1;
+		for (i = 0; i < 5; i++)
+			lpdata.gpio_cfg[i] = WM8903_GPIO_NO_CONFIG;
+
+		np = codec->dev->of_node;
+
+		if (of_find_property(np, "irq-active-low", NULL))
+			lpdata.irq_active_low = 1;
+
+		if (of_property_read_u32(np, "micdet-cfg", &val32) >= 0)
+			lpdata.micdet_cfg = val32;
+
+		if (of_property_read_u32(np, "micdet-delay", &val32) >= 0)
+			lpdata.micdet_delay = val32;
+
+		of_property_read_u32_array(np, "gpio-cfg", lpdata.gpio_cfg,
+					   WM8903_NUM_GPIO);
+
+		pdata = &lpdata;
+	}
+
 	/* Set up GPIOs and microphone detection */
 	if (pdata) {
 		bool mic_gpio = false;
@@ -2038,7 +2068,7 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	snd_soc_add_controls(codec, wm8903_snd_controls,
 				ARRAY_SIZE(wm8903_snd_controls));
 
-	wm8903_init_gpio(codec);
+	wm8903_init_gpio(codec, pdata);
 
 	return ret;
 }
@@ -2101,6 +2131,17 @@ static __devexit int wm8903_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
+#if defined(CONFIG_OF)
+/* Match table for of_platform binding */
+static const struct of_device_id wm8903_of_match[] __devinitconst = {
+	{ .compatible = "wlf,wm8903", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, wm8903_of_match);
+#else
+#define wm8903_of_match NULL
+#endif
+
 static const struct i2c_device_id wm8903_i2c_id[] = {
 	{ "wm8903", 0 },
 	{ }
@@ -2111,6 +2152,7 @@ static struct i2c_driver wm8903_i2c_driver = {
 	.driver = {
 		.name = "wm8903",
 		.owner = THIS_MODULE,
+		.of_match_table = wm8903_of_match,
 	},
 	.probe =    wm8903_i2c_probe,
 	.remove =   __devexit_p(wm8903_i2c_remove),
-- 
1.7.0.4
