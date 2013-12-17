From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 RESEND 2/2] ASOC: tegra: fix AC97 clock handling
Date: Tue, 17 Dec 2013 11:52:44 +0100
Message-ID: <1387277564-4774-2-git-send-email-dev@lynxeye.de>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387277564-4774-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This corrects the Tegra AC97 clock handling to be in line with
the devicetree. Audio PLL is controlled by the machine driver, only
AC97 host controller clock remains to be independent.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
v2:
- remove redundant clock rate setting
- defer removal of err_clk_put label to avoid conflict with Stephens
  dma channel cleanup

CC: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
CC: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org

This is basically a v2 of "ASOC: tegra: move AC97 clock defines to the
controller node" incorporating the feedback I got from both Stephen and Mark.
---
 sound/soc/tegra/tegra20_ac97.c | 19 +++----------------
 sound/soc/tegra/tegra20_ac97.h |  1 -
 sound/soc/tegra/tegra_wm9712.c | 17 ++++++++++++++++-
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index ae27bcd..297fb17 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -37,7 +37,6 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
 
-#include "tegra_asoc_utils.h"
 #include "tegra20_ac97.h"
 
 #define DRV_NAME "tegra20-ac97"
@@ -387,24 +386,16 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->playback_dma_data.maxburst = 4;
 	ac97->playback_dma_data.slave_id = of_dma[1];
 
-	ret = tegra_asoc_utils_init(&ac97->util_data, &pdev->dev);
-	if (ret)
-		goto err_clk_put;
-
-	ret = tegra_asoc_utils_set_ac97_rate(&ac97->util_data);
-	if (ret)
-		goto err_asoc_utils_fini;
-
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
@@ -412,7 +403,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_asoc_utils_fini;
+		goto err;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -428,8 +419,6 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_asoc_utils_fini:
-	tegra_asoc_utils_fini(&ac97->util_data);
 err_clk_put:
 err:
 	snd_soc_set_ac97_ops(NULL);
@@ -443,8 +432,6 @@ static int tegra20_ac97_platform_remove(struct platform_device *pdev)
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
