From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 6/6] ASoC: WM8903: Add device tree binding
Date: Thu,  1 Dec 2011 13:49:24 -0700
Message-ID: <1322772564-27343-6-git-send-email-swarren@nvidia.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322772564-27343-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
 sound/soc/codecs/wm8903.c                          |   15 ++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt

diff --git a/Documentation/devicetree/bindings/sound/wm8903.txt b/Documentation/devicetree/bindings/sound/wm8903.txt
new file mode 100644
index 0000000..14fd3ec
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
+	gpio-cfg = <
+		0x0600 /* DMIC_LR, output */
+		0x0680 /* DMIC_DAT, input */
+		0x0000 /* GPIO, output, low */
+		0x0200 /* Interrupt, output */
+		0x01a0 /* BCLK, input, active high */
+	>;
+};
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 6797b0a..bce94af 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1966,6 +1966,21 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		}
 	}
 
+	/* Override defaults from device tree, if one is present */
+	if (codec->dev->of_node) {
+		const struct device_node *np = codec->dev->of_node;
+		u32 val32;
+
+		if (of_property_read_u32(np, "micdet-cfg", &val32) >= 0)
+			defpdata.micdet_cfg = val32;
+
+		if (of_property_read_u32(np, "micdet-delay", &val32) >= 0)
+			defpdata.micdet_delay = val32;
+
+		of_property_read_u32_array(np, "gpio-cfg", defpdata.gpio_cfg,
+					   ARRAY_SIZE(defpdata.gpio_cfg));
+	}
+
 	/* If no platform data was supplied, use the defaults */
 	if (!pdata)
 		pdata = &defpdata;
-- 
1.7.0.4
