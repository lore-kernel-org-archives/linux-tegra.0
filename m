From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: add device tree support for TrimSlice
Date: Fri, 27 Apr 2012 13:34:19 -0600
Message-ID: <1335555259-9263-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This binding doesn't include the nvidia,model or nvidia,audio-routing
properties the other Tegra audio DT bindings have, because this binding
is targetted at a single machine, rather than for any machine using the
tlv320aic23 codec.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Ideally, the binding would be more generic, but that would require
representing the board's jacks in the binding, and there's no way to do
that yet. That problem actually affects the other two Tegra audio
bindings too:-(

The next step would be to define a binding for the board jacks, and
unify the 3 Tegra bindings/machin-drivers into e.g. tegra_of_simple.
However, I can't promise when that will happen right now.
---
 .../bindings/sound/tegra-audio-trimslice.txt       |   14 ++++++++
 sound/soc/tegra/trimslice.c                        |   34 ++++++++++++++++++++
 2 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-trimslice.txt

diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-trimslice.txt b/Documentation/devicetree/bindings/sound/tegra-audio-trimslice.txt
new file mode 100644
index 0000000..04b14cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-trimslice.txt
@@ -0,0 +1,14 @@
+NVIDIA Tegra audio complex for TrimSlice
+
+Required properties:
+- compatible : "nvidia,tegra-audio-trimslice"
+- nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
+- nvidia,audio-codec : The phandle of the WM8903 audio codec
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-trimslice";
+	nvidia,i2s-controller = <&tegra_i2s1>;
+	nvidia,audio-codec = <&codec>;
+};
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 0fd115e..4a8d5b6 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -27,6 +27,7 @@
 #include <asm/mach-types.h>
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -149,6 +150,32 @@ static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	if (pdev->dev.of_node) {
+		trimslice_tlv320aic23_dai.codec_name = NULL;
+		trimslice_tlv320aic23_dai.codec_of_node = of_parse_phandle(
+				pdev->dev.of_node, "nvidia,audio-codec", 0);
+		if (!trimslice_tlv320aic23_dai.codec_of_node) {
+			dev_err(&pdev->dev,
+				"Property 'nvidia,audio-codec' missing or invalid\n");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		trimslice_tlv320aic23_dai.cpu_dai_name = NULL;
+		trimslice_tlv320aic23_dai.cpu_dai_of_node = of_parse_phandle(
+				pdev->dev.of_node, "nvidia,i2s-controller", 0);
+		if (!trimslice_tlv320aic23_dai.cpu_dai_of_node) {
+			dev_err(&pdev->dev,
+				"Property 'nvidia,i2s-controller' missing or invalid\n");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		trimslice_tlv320aic23_dai.platform_name = NULL;
+		trimslice_tlv320aic23_dai.platform_of_node =
+				trimslice_tlv320aic23_dai.cpu_dai_of_node;
+	}
+
 	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
 	if (ret)
 		goto err;
@@ -184,10 +211,17 @@ static int __devexit tegra_snd_trimslice_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id trimslice_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra-audio-trimslice", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, trimslice_of_match);
+
 static struct platform_driver tegra_snd_trimslice_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
+		.of_match_table = trimslice_of_match,
 	},
 	.probe = tegra_snd_trimslice_probe,
 	.remove = __devexit_p(tegra_snd_trimslice_remove),
-- 
1.7.0.4
