From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v3] ASOC: tegra: move AC97 clock handling to the machine driver
Date: Tue, 18 Mar 2014 21:30:49 +0100
Message-ID: <1395174649-1493-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tegra the convention is to have a single machine driver
that's controlling the whole audio subsystem. This was
introduced after the AC97 driver was merged and ever since
AC97 has been broken.

Move the clock handling to the machine driver, to be in line
with the other Tegra drivers and give the machine driver
full control over the single Tegra audio PLL.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
v2:
- remove redundant clock rate setting
- defer removal of err_clk_put label to avoid conflict with Stephens
  dma channel cleanup
v3:
- rebased to 3.14-rc1
- no functional change
- reword commit message

CC: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
CC: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
CC: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
---
 sound/soc/tegra/tegra20_ac97.c | 15 +--------------
 sound/soc/tegra/tegra20_ac97.h |  1 -
 sound/soc/tegra/tegra_wm9712.c | 17 ++++++++++++++++-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index cf5e1cf..29f8832 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -37,7 +37,6 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
 
-#include "tegra_asoc_utils.h"
 #include "tegra20_ac97.h"
 
 #define DRV_NAME "tegra20-ac97"
@@ -376,18 +375,10 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	ac97->playback_dma_data.maxburst = 4;
 
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
@@ -419,8 +410,6 @@ err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
 err_clk_disable_unprepare:
 	clk_disable_unprepare(ac97->clk_ac97);
-err_asoc_utils_fini:
-	tegra_asoc_utils_fini(&ac97->util_data);
 err_clk_put:
 err:
 	snd_soc_set_ac97_ops(NULL);
@@ -434,8 +423,6 @@ static int tegra20_ac97_platform_remove(struct platform_device *pdev)
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
1.8.5.3
