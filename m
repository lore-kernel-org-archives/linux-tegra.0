From: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Convert to managed resources
Date: Thu, 13 Aug 2015 12:59:21 +0530
Message-ID: <20150813072920.GA17181@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use managed resource functions devm_clk_put and
devm_snd_soc_register_component to simplify error handling.

To be compatible with the change various gotos are replaced
with direct returns, and unneeded labels are dropped.

Signed-off-by: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra20_spdif.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 9141477..f69b2e4 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -273,45 +273,40 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 			     GFP_KERNEL);
 	if (!spdif) {
 		dev_err(&pdev->dev, "Can't allocate tegra20_spdif\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	spdif->clk_spdif_out = clk_get(&pdev->dev, "spdif_out");
+	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		pr_err("Can't retrieve spdif clock\n");
 		ret = PTR_ERR(spdif->clk_spdif_out);
-		goto err;
+		return ret;
 	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
 		dev_err(&pdev->dev, "No memory resource\n");
-		ret = -ENODEV;
-		goto err_clk_put;
+		return -ENODEV;
 	}
 
 	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
 	if (!dmareq) {
 		dev_err(&pdev->dev, "No DMA resource\n");
-		ret = -ENODEV;
-		goto err_clk_put;
+		return -ENODEV;
 	}
 
 	memregion = devm_request_mem_region(&pdev->dev, mem->start,
 					    resource_size(mem), DRV_NAME);
 	if (!memregion) {
 		dev_err(&pdev->dev, "Memory region already claimed\n");
-		ret = -EBUSY;
-		goto err_clk_put;
+		return -EBUSY;
 	}
 
 	regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
 	if (!regs) {
 		dev_err(&pdev->dev, "ioremap failed\n");
-		ret = -ENOMEM;
-		goto err_clk_put;
+		return -ENOMEM;
 	}
 
 	spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
@@ -319,7 +314,7 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		ret = PTR_ERR(spdif->regmap);
-		goto err_clk_put;
+		return ret;
 	}
 
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
@@ -334,8 +329,9 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
-				   &tegra20_spdif_dai, 1);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &tegra20_spdif_component,
+					      &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
@@ -345,21 +341,17 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	ret = tegra_pcm_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
-		goto err_unregister_component;
+		return ret;
 	}
 
 	return 0;
 
-err_unregister_component:
-	snd_soc_unregister_component(&pdev->dev);
 err_suspend:
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_spdif_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put:
-	clk_put(spdif->clk_spdif_out);
-err:
+
 	return ret;
 }
 
@@ -372,9 +364,6 @@ static int tegra20_spdif_platform_remove(struct platform_device *pdev)
 		tegra20_spdif_runtime_suspend(&pdev->dev);
 
 	tegra_pcm_platform_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-
-	clk_put(spdif->clk_spdif_out);
 
 	return 0;
 }
-- 
1.9.1
