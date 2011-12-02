From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 5/5] ASoC: WM8903: Add device tree binding
Date: Fri,  2 Dec 2011 15:08:41 -0700
Message-ID: <1322863721-29793-6-git-send-email-swarren@nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document the device tree binding for the WM8903 codec, and modify the
driver to extract platform data from the device tree, if present.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/wm8903.txt |   50 ++++++++++++++++++++
 sound/soc/codecs/wm8903.c                          |   49 +++++++++++++++++++
 2 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt

diff --git a/Documentation/devicetree/bindings/sound/wm8903.txt b/Documentation/devicetree/bindings/sound/wm8903.txt
new file mode 100644
index 0000000..f102cbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wm8903.txt
@@ -0,0 +1,50 @@
+WM8903 audio CODEC
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
+  - gpio-cfg : A list of GPIO configuration register values. The list must
+    be 5 entries long. If absent, no configuration of these registers is
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
+	gpio-cfg = <
+		0x0600 /* DMIC_LR, output */
+		0x0680 /* DMIC_DAT, input */
+		0x0000 /* GPIO, output, low */
+		0x0200 /* Interrupt, output */
+		0x01a0 /* BCLK, input, active high */
+	>;
+};
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index a44bbfb..c080a87 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -2070,6 +2070,49 @@ static int wm8903_set_pdata_irq_trigger(struct i2c_client *i2c,
 	return 0;
 }
 
+static int wm8903_set_pdata_from_of(struct i2c_client *i2c,
+				    struct wm8903_platform_data *pdata)
+{
+	const struct device_node *np = i2c->dev.of_node;
+	u32 val32;
+	int i;
+
+	if (of_property_read_u32(np, "micdet-cfg", &val32) >= 0)
+		pdata->micdet_cfg = val32;
+
+	if (of_property_read_u32(np, "micdet-delay", &val32) >= 0)
+		pdata->micdet_delay = val32;
+
+	if (of_property_read_u32_array(np, "gpio-cfg", pdata->gpio_cfg,
+				       ARRAY_SIZE(pdata->gpio_cfg)) >= 0) {
+		/*
+		 * In device tree: 0 means "write 0",
+		 * 0xffffffff means "don't touch".
+		 *
+		 * In platform data: 0 means "don't touch",
+		 * 0x8000 means "write 0".
+		 *
+		 * Note: WM8903_GPIO_CONFIG_ZERO == 0x8000.
+		 *
+		 *  Convert from DT to pdata representation here,
+		 * so no other code needs to change.
+		 */
+		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
+			if (pdata->gpio_cfg[i] == 0) {
+				pdata->gpio_cfg[i] = WM8903_GPIO_CONFIG_ZERO;
+			} else if (pdata->gpio_cfg[i] == 0xffffffff) {
+				pdata->gpio_cfg[i] = 0;
+			} else if (pdata->gpio_cfg[i] > 0x7fff) {
+				dev_err(&i2c->dev, "Invalid gpio-cfg[%d] %x\n",
+					i, pdata->gpio_cfg[i]);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 				      const struct i2c_device_id *id)
 {
@@ -2111,6 +2154,12 @@ static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 			if (ret != 0)
 				return ret;
 		}
+
+		if (i2c->dev.of_node) {
+			ret = wm8903_set_pdata_from_of(i2c, wm8903->pdata);
+			if (ret != 0)
+				return ret;
+		}
 	}
 
 	ret = regmap_read(wm8903->regmap, WM8903_SW_RESET_AND_ID, &val);
-- 
1.7.0.4
