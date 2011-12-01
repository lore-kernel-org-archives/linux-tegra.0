From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ASoC: Add device tree binding for WM8903
Date: Wed, 30 Nov 2011 17:47:35 -0700
Message-ID: <1322700455-26916-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

This patch makes it so the wm8903 is initialized from it's device tree node.

v2: (swarren) Significantly reworked based on review feedback.
v1: (swarren) Applied the following modifications relative to John's code:
* Cleaned up DT parsing code
* Documented DT binding
* Set up wm8903->gpio_chip.of_node, extracted from another patch by John.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/wm8903.txt |   44 ++++++++
 sound/soc/codecs/wm8903.c                          |  113 ++++++++++++++++----
 2 files changed, 136 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt

diff --git a/Documentation/devicetree/bindings/sound/wm8903.txt b/Documentation/devicetree/bindings/sound/wm8903.txt
new file mode 100644
index 0000000..ef3332a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wm8903.txt
@@ -0,0 +1,44 @@
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
+  - micdet-cfg : Default register value for R6 (Mic Bias). If absent, the
+    default is 0.
+
+  - micdet-delay : The debounce delay for microphone detection in mS. If
+    absent, the default is 100.
+
+  - gpio-cfg : A list of GPIO pin mux register values. The list must be 5
+    entries long. If absent, no configuration of these registers is
+    performed. If any entry has the value 0xffffffff, that GPIO's
+    configuration will not be modified.
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
+	micdet-cfg = <0>;
+	micdet-delay = <100>;
+	gpio-cfg = < 0xffffffff 0xffffffff 0 0xffffffff 0xffffffff >;
+};
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 70a2268..6e380b3 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -24,6 +24,7 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/irq.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -1863,20 +1864,20 @@ static struct gpio_chip wm8903_template_chip = {
 	.can_sleep		= 1,
 };
 
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct snd_soc_codec *codec,
+			     int gpio_base)
 {
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
-	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
 	int ret;
 
 	wm8903->gpio_chip = wm8903_template_chip;
 	wm8903->gpio_chip.ngpio = WM8903_NUM_GPIO;
 	wm8903->gpio_chip.dev = codec->dev;
+	wm8903->gpio_chip.base = gpio_base;
 
-	if (pdata && pdata->gpio_base)
-		wm8903->gpio_chip.base = pdata->gpio_base;
-	else
-		wm8903->gpio_chip.base = -1;
+#ifdef CONFIG_OF_GPIO
+	wm8903->gpio_chip.of_node = codec->dev->of_node;
+#endif
 
 	ret = gpiochip_add(&wm8903->gpio_chip);
 	if (ret != 0)
@@ -1893,7 +1894,7 @@ static void wm8903_free_gpio(struct snd_soc_codec *codec)
 		dev_err(codec->dev, "Failed to remove GPIOs: %d\n", ret);
 }
 #else
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct snd_soc_codec *codec, int gpio_base)
 {
 }
 
@@ -1909,6 +1910,16 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
+	u32 val32;
+	bool have_pdata = false;
+	int gpio_base = -1;
+	bool irq_active_low = false;
+	int micdet_cfg = 0;
+	bool mic_gpio = false;
+	u32 gpio_cfg_storage[WM8903_NUM_GPIO];
+	u32 *gpio_cfg = NULL;
+	const struct device_node *np;
+	struct irq_data *irq_data;
 
 	wm8903->codec = codec;
 
@@ -1931,18 +1942,65 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 
 	wm8903_reset(codec);
 
-	/* Set up GPIOs and microphone detection */
+	/* Get configuration from platform data, or device tree */
 	if (pdata) {
-		bool mic_gpio = false;
+		have_pdata = true;
+		gpio_base = pdata->gpio_base;
+		irq_active_low = pdata->irq_active_low;
+		micdet_cfg = pdata->micdet_cfg;
+		wm8903->mic_delay = pdata->micdet_delay;
+		gpio_cfg = &pdata->gpio_cfg[0];
+	} else if (codec->dev->of_node) {
+		have_pdata = true;
+
+		np = codec->dev->of_node;
+
+		if (wm8903->irq) {
+			irq_data = irq_get_irq_data(wm8903->irq);
+			if (!irq_data) {
+				dev_err(codec->dev, "Invalid IRQ: %d\n",
+					wm8903->irq);
+				return -EINVAL;
+			}
+			trigger = irqd_get_trigger_type(irq_data);
+			switch (trigger) {
+			case IRQ_TYPE_NONE:
+			case IRQ_TYPE_LEVEL_HIGH:
+				irq_active_low = false;
+				break;
+			case IRQ_TYPE_LEVEL_LOW:
+				irq_active_low = true;
+				break;
+			default:
+				dev_err(codec->dev,
+					"Unsupported IRQ trigger: %x\n",
+					trigger);
+				return -EINVAL;
+			}
+		}
+
+		if (of_property_read_u32(np, "micdet-cfg", &val32) >= 0)
+			micdet_cfg = val32;
+
+		if (of_property_read_u32(np, "micdet-delay", &val32) >= 0)
+			wm8903->mic_delay = val32;
 
-		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
-			if (pdata->gpio_cfg[i] == WM8903_GPIO_NO_CONFIG)
+		if (of_property_read_u32_array(np, "gpio-cfg", gpio_cfg_storage,
+					       WM8903_NUM_GPIO) >= 0) {
+			gpio_cfg = &gpio_cfg_storage[0];
+		}
+	}
+
+	/* Set up GPIOs */
+	if (gpio_cfg) {
+		for (i = 0; i < WM8903_NUM_GPIO; i++) {
+			if (gpio_cfg[i] > 0x7fff)
 				continue;
 
 			snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
-				      pdata->gpio_cfg[i] & 0xffff);
+				      gpio_cfg[i] & 0x7fff);
 
-			val = (pdata->gpio_cfg[i] & WM8903_GP1_FN_MASK)
+			val = (gpio_cfg[i] & WM8903_GP1_FN_MASK)
 				>> WM8903_GP1_FN_SHIFT;
 
 			switch (val) {
@@ -1954,12 +2012,15 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 				break;
 			}
 		}
+	}
 
+	/* Set up microphone detection */
+	if (have_pdata) {
 		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0,
-			      pdata->micdet_cfg);
+			      micdet_cfg);
 
 		/* Microphone detection needs the WSEQ clock */
-		if (pdata->micdet_cfg)
+		if (micdet_cfg)
 			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
 					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
 
@@ -1969,13 +2030,11 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		 * IRQs as the IRQs are clear on read.  The detection
 		 * will be enabled when the machine driver configures.
 		 */
-		WARN_ON(!mic_gpio && (pdata->micdet_cfg & WM8903_MICDET_ENA));
-
-		wm8903->mic_delay = pdata->micdet_delay;
+		WARN_ON(!mic_gpio && (micdet_cfg & WM8903_MICDET_ENA));
 	}
-	
+
 	if (wm8903->irq) {
-		if (pdata && pdata->irq_active_low) {
+		if (irq_active_low) {
 			trigger = IRQF_TRIGGER_LOW;
 			irq_pol = WM8903_IRQ_POL;
 		} else {
@@ -2037,7 +2096,7 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 	snd_soc_add_controls(codec, wm8903_snd_controls,
 				ARRAY_SIZE(wm8903_snd_controls));
 
-	wm8903_init_gpio(codec);
+	wm8903_init_gpio(codec, gpio_base);
 
 	return ret;
 }
@@ -2100,6 +2159,17 @@ static __devexit int wm8903_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_OF
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
@@ -2110,6 +2180,7 @@ static struct i2c_driver wm8903_i2c_driver = {
 	.driver = {
 		.name = "wm8903",
 		.owner = THIS_MODULE,
+		.of_match_table = wm8903_of_match,
 	},
 	.probe =    wm8903_i2c_probe,
 	.remove =   __devexit_p(wm8903_i2c_remove),
-- 
1.7.0.4
