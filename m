From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/6] ASoC: tegra_wm8753: minor cleanup
Date: Fri, 15 Feb 2013 17:07:31 -0700
Message-ID: <1360973255-344-2-git-send-email-swarren@wwwdotorg.org>
References: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360973255-344-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Various minor cleanups so that the probe() body more closely resembles
other drivers, for easier comparison.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8753.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index c8ef88a6..f87fc53 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -124,6 +124,7 @@ static struct snd_soc_card snd_soc_tegra_wm8753 = {
 
 static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &snd_soc_tegra_wm8753;
 	struct tegra_wm8753 *machine;
 	int ret;
@@ -132,8 +133,7 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 			       GFP_KERNEL);
 	if (!machine) {
 		dev_err(&pdev->dev, "Can't allocate tegra_wm8753 struct\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
 
 	card->dev = &pdev->dev;
@@ -148,8 +148,8 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	tegra_wm8753_dai.codec_of_node = of_parse_phandle(
-			pdev->dev.of_node, "nvidia,audio-codec", 0);
+	tegra_wm8753_dai.codec_of_node = of_parse_phandle(np,
+			"nvidia,audio-codec", 0);
 	if (!tegra_wm8753_dai.codec_of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
@@ -157,8 +157,8 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	tegra_wm8753_dai.cpu_of_node = of_parse_phandle(
-			pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	tegra_wm8753_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
 	if (!tegra_wm8753_dai.cpu_of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
@@ -166,8 +166,7 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	tegra_wm8753_dai.platform_of_node =
-				tegra_wm8753_dai.cpu_of_node;
+	tegra_wm8753_dai.platform_of_node = tegra_wm8753_dai.cpu_of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-- 
1.7.10.4
