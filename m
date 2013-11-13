From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 3/3] ASOC: tegra: fix AC97 clock handling
Date: Wed, 13 Nov 2013 20:17:23 +0100
Message-ID: <1384370243-17178-3-git-send-email-dev@lynxeye.de>
References: <1384370243-17178-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384370243-17178-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This corrects the Tegra AC97 clock handling to be in line with
the devicetree. Audio PLL is controlled by the machine driver, only
AC97 host controller clock remains to be independent.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
--
CC: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
CC: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org

This is basically a v2 of "ASOC: tegra: move AC97 clock defines to the
controller node" incorporating the feedback I got from both Stephen and Mark.
---
 sound/soc/tegra/tegra20_ac97.c | 32 ++++++++++----------------------
 sound/soc/tegra/tegra20_ac97.h |  1 -
 sound/soc/tegra/tegra_wm9712.c | 17 ++++++++++++++++-
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index ae27bcd..584d8c3 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -37,7 +37,6 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
 
-#include "tegra_asoc_utils.h"
 #include "tegra20_ac97.h"
 
 #define DRV_NAME "tegra20-ac97"
@@ -337,7 +336,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	regs = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
-		goto err_clk_put;
+		goto err;
 	}
 
 	ac97->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -345,7 +344,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(ac97->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(ac97->regmap);
-		goto err_clk_put;
+		goto err;
 	}
 
 	if (of_property_read_u32_array(pdev->dev.of_node,
@@ -353,7 +352,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 				       of_dma, 2) < 0) {
 		dev_err(&pdev->dev, "No DMA resource\n");
 		ret = -ENODEV;
-		goto err_clk_put;
+		goto err;
 	}
 
 	ac97->reset_gpio = of_get_named_gpio(pdev->dev.of_node,
@@ -363,18 +362,18 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 					    GPIOF_OUT_INIT_HIGH, "codec-reset");
 		if (ret) {
 			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
-			goto err_clk_put;
+			goto err;
 		}
 	} else {
 		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
-		goto err_clk_put;
+		goto err;
 	}
 
 	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
 					    "nvidia,codec-sync-gpio", 0);
 	if (!gpio_is_valid(ac97->sync_gpio)) {
 		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
-		goto err_clk_put;
+		goto err;
 	}
 
 	ac97->capture_dma_data.addr = mem->start + TEGRA20_AC97_FIFO_RX1;
@@ -387,24 +386,18 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->playback_dma_data.maxburst = 4;
 	ac97->playback_dma_data.slave_id = of_dma[1];
 
-	ret = tegra_asoc_utils_init(&ac97->util_data, &pdev->dev);
-	if (ret)
-		goto err_clk_put;
-
-	ret = tegra_asoc_utils_set_ac97_rate(&ac97->util_data);
-	if (ret)
-		goto err_asoc_utils_fini;
+	ret = clk_set_rate(ac97->clk_ac97, 24576000);
 
 	ret = clk_prepare_enable(ac97->clk_ac97);
 	if (ret) {
 		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
-		goto err_asoc_utils_fini;
+		goto err;
 	}
 
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set AC'97 ops: %d\n", ret);
-		goto err_asoc_utils_fini;
+		goto err;
 	}
 
 	ret = snd_soc_register_component(&pdev->dev, &tegra20_ac97_component,
@@ -412,7 +405,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_asoc_utils_fini;
+		goto err;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -428,9 +421,6 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_asoc_utils_fini:
-	tegra_asoc_utils_fini(&ac97->util_data);
-err_clk_put:
 err:
 	snd_soc_set_ac97_ops(NULL);
 	return ret;
@@ -443,8 +433,6 @@ static int tegra20_ac97_platform_remove(struct platform_device *pdev)
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
-	tegra_asoc_utils_fini(&ac97->util_data);
-
 	clk_disable_unprepare(ac97->clk_ac97);
 
 	snd_soc_set_ac97_ops(NULL);
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_ac97.h
index 4acb3aa..0a39d82 100644
--- a/sound/soc/tegra/tegra20_ac97.h
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -90,6 +90,5 @@ struct tegra20_ac97 {
 	struct regmap *regmap;
 	int reset_gpio;
 	int sync_gpio;
-	struct tegra_asoc_utils_data util_data;
 };
 #endif /* __TEGRA20_AC97_H__ */
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 45b5789..25a7f82 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -29,10 +29,13 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+#include "tegra_asoc_utils.h"
+
 #define DRV_NAME "tegra-snd-wm9712"
 
 struct tegra_wm9712 {
 	struct platform_device *codec;
+	struct tegra_asoc_utils_data util_data;
 };
 
 static const struct snd_soc_dapm_widget tegra_wm9712_dapm_widgets[] = {
@@ -118,15 +121,25 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 
 	tegra_wm9712_dai.platform_of_node = tegra_wm9712_dai.cpu_of_node;
 
+	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
+	if (ret)
+		goto codec_unregister;
+
+	ret = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
+	if (ret)
+		goto asoc_utils_fini;
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto codec_unregister;
+		goto asoc_utils_fini;
 	}
 
 	return 0;
 
+asoc_utils_fini:
+	tegra_asoc_utils_fini(&machine->util_data);
 codec_unregister:
 	platform_device_del(machine->codec);
 codec_put:
@@ -141,6 +154,8 @@ static int tegra_wm9712_driver_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 
+	tegra_asoc_utils_fini(&machine->util_data);
+
 	platform_device_unregister(machine->codec);
 
 	return 0;
-- 
1.8.3.1
