From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 17/17] ASoC: tegra+wm8903 machine: support Tegra30
Date: Fri, 30 Mar 2012 17:07:32 -0600
Message-ID: <1333148852-17806-18-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Modify the Tegra+WM8903 machine driver to add and document device tree
binding enhancements required to feed the Tegra20-vs-Tegra30 flag to the
Tegra ASoC utilities.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/sound/tegra-audio-wm8903.txt          |    8 +++--
 sound/soc/tegra/tegra_wm8903.c                     |   33 +++++++++++++++----
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt b/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
index d5b0da8..a8b6900 100644
--- a/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
+++ b/Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
@@ -1,7 +1,9 @@
 NVIDIA Tegra audio complex
 
 Required properties:
-- compatible : "nvidia,tegra-audio-wm8903"
+- compatible : "nvidia,tegra-audio-wm8903" (Tegra20),
+  "nvidia,tegra20-audio-wm8903" (Tegra20), or
+  "nvidia,tegra30-audio-wm8903" (Tegra30).
 - nvidia,model : The user-visible name of this sound complex.
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
@@ -46,8 +48,8 @@ Optional properties:
 Example:
 
 sound {
-	compatible = "nvidia,tegra-audio-wm8903-harmony",
-		     "nvidia,tegra-audio-wm8903"
+	compatible = "nvidia,tegra20-audio-wm8903-harmony",
+		     "nvidia,tegra20-audio-wm8903"
 	nvidia,model = "tegra-wm8903-harmony";
 
 	nvidia,audio-routing =
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index d2ac5cc..5574453 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -34,6 +34,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 
 #include <mach/tegra_wm8903_pdata.h>
@@ -370,8 +371,26 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.fully_routed = true,
 };
 
+static const struct of_device_id tegra_wm8903_of_match[] __devinitconst = {
+	{
+		.compatible = "nvidia,tegra30-audio-wm8903",
+		.data = (void *)TEGRA_ASOC_UTILS_SOC_TEGRA30
+	},
+	{
+		.compatible = "nvidia,tegra-audio-wm8903",
+		.data = (void *)TEGRA_ASOC_UTILS_SOC_TEGRA20
+	},
+	{
+		.compatible = "nvidia,tegra20-audio-wm8903",
+		.data = (void *)TEGRA_ASOC_UTILS_SOC_TEGRA20
+	},
+	{},
+};
+
 static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
+	enum tegra_asoc_utils_soc soc;
 	struct snd_soc_card *card = &snd_soc_tegra_wm8903;
 	struct tegra_wm8903 *machine;
 	int ret;
@@ -381,6 +400,12 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	match = of_match_device(tegra_wm8903_of_match, &pdev->dev);
+	if (match)
+		soc = (enum tegra_asoc_utils_soc)match->data;
+	else
+		soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
+
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8903),
 			       GFP_KERNEL);
 	if (!machine) {
@@ -442,8 +467,7 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = tegra_asoc_utils_init(&machine->util_data,
-				    TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);
+	ret = tegra_asoc_utils_init(&machine->util_data, soc, &pdev->dev);
 	if (ret)
 		goto err;
 
@@ -489,11 +513,6 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id tegra_wm8903_of_match[] __devinitconst = {
-	{ .compatible = "nvidia,tegra-audio-wm8903", },
-	{},
-};
-
 static struct platform_driver tegra_wm8903_driver = {
 	.driver = {
 		.name = DRV_NAME,
-- 
1.7.0.4
