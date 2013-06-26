From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ASoC: tegra-ac97: Do common and clock init prior to component registration
Date: Wed, 26 Jun 2013 12:28:31 +0100
Message-ID: <1372246111-15781-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Otherwise we may instantiate and hence have something try to access the
device while it is still completing initialisation.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 9043626d..48037f7 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -395,23 +395,9 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->capture_dma_data.maxburst = 4;
 	ac97->capture_dma_data.slave_id = of_dma[0];
 
-	ret = snd_soc_register_component(&pdev->dev, &tegra20_ac97_component,
-					 &tegra20_ac97_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
-		ret = -ENOMEM;
-		goto err_clk_put;
-	}
-
-	ret = tegra_pcm_platform_register(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
-		goto err_unregister_component;
-	}
-
 	ret = tegra_asoc_utils_init(&ac97->util_data, &pdev->dev);
 	if (ret)
-		goto err_unregister_pcm;
+		goto err_clk_put;
 
 	ret = tegra_asoc_utils_set_ac97_rate(&ac97->util_data);
 	if (ret)
@@ -423,17 +409,31 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		goto err_asoc_utils_fini;
 	}
 
+	ret = snd_soc_register_component(&pdev->dev, &tegra20_ac97_component,
+					 &tegra20_ac97_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
+		ret = -ENOMEM;
+		goto err_asoc_utils_fini;
+	}
+
+	ret = tegra_pcm_platform_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
+		goto err_unregister_component;
+	}
+
 	/* XXX: crufty ASoC AC97 API - only one AC97 codec allowed */
 	workdata = ac97;
 
 	return 0;
 
-err_asoc_utils_fini:
-	tegra_asoc_utils_fini(&ac97->util_data);
 err_unregister_pcm:
 	tegra_pcm_platform_unregister(&pdev->dev);
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
+err_asoc_utils_fini:
+	tegra_asoc_utils_fini(&ac97->util_data);
 err_clk_put:
 err:
 	return ret;
-- 
1.8.3.1
