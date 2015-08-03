From: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Use devm_clk_get
Date: Mon, 3 Aug 2015 17:27:34 +0530
Message-ID: <20150803115734.GA32440@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch introduces the use of managed resource function
devm_clk_get instead of clk_get and removes corresponding calls
to clk_put in the probe and remove functions.

To be compatible with the change various gotos are replaced with
direct returns, and unneeded labels are dropped.

Signed-off-by: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra30_ahub.c | 49 ++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index bc94e5d..989b1e8 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -549,54 +549,51 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Can't get reset %s\n",
 				configlink_mods[i].rst_name);
 			ret = PTR_ERR(rst);
-			goto err;
+			return ret;
 		}
 
 		ret = reset_control_deassert(rst);
 		reset_control_put(rst);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub) {
 		dev_err(&pdev->dev, "Can't allocate tegra30_ahub\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
 	dev_set_drvdata(&pdev->dev, ahub);
 
 	ahub->soc_data = soc_data;
 	ahub->dev = &pdev->dev;
 
-	ahub->clk_d_audio = clk_get(&pdev->dev, "d_audio");
+	ahub->clk_d_audio = devm_clk_get(&pdev->dev, "d_audio");
 	if (IS_ERR(ahub->clk_d_audio)) {
 		dev_err(&pdev->dev, "Can't retrieve ahub d_audio clock\n");
 		ret = PTR_ERR(ahub->clk_d_audio);
-		goto err;
+		return ret;
 	}
 
-	ahub->clk_apbif = clk_get(&pdev->dev, "apbif");
+	ahub->clk_apbif = devm_clk_get(&pdev->dev, "apbif");
 	if (IS_ERR(ahub->clk_apbif)) {
 		dev_err(&pdev->dev, "Can't retrieve ahub apbif clock\n");
 		ret = PTR_ERR(ahub->clk_apbif);
-		goto err_clk_put_d_audio;
+		return ret;
 	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res0) {
 		dev_err(&pdev->dev, "No apbif memory resource\n");
-		ret = -ENODEV;
-		goto err_clk_put_apbif;
+		return -ENODEV;
 	}
 
 	region = devm_request_mem_region(&pdev->dev, res0->start,
 					 resource_size(res0), DRV_NAME);
 	if (!region) {
 		dev_err(&pdev->dev, "request region apbif failed\n");
-		ret = -EBUSY;
-		goto err_clk_put_apbif;
+		return -EBUSY;
 	}
 	ahub->apbif_addr = res0->start;
 
@@ -604,8 +601,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 				  resource_size(res0));
 	if (!regs_apbif) {
 		dev_err(&pdev->dev, "ioremap apbif failed\n");
-		ret = -ENOMEM;
-		goto err_clk_put_apbif;
+		return -ENOMEM;
 	}
 
 	ahub->regmap_apbif = devm_regmap_init_mmio(&pdev->dev, regs_apbif,
@@ -613,31 +609,28 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (IS_ERR(ahub->regmap_apbif)) {
 		dev_err(&pdev->dev, "apbif regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_apbif);
-		goto err_clk_put_apbif;
+		return ret;
 	}
 	regcache_cache_only(ahub->regmap_apbif, true);
 
 	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res1) {
 		dev_err(&pdev->dev, "No ahub memory resource\n");
-		ret = -ENODEV;
-		goto err_clk_put_apbif;
+		return -ENODEV;
 	}
 
 	region = devm_request_mem_region(&pdev->dev, res1->start,
 					 resource_size(res1), DRV_NAME);
 	if (!region) {
 		dev_err(&pdev->dev, "request region ahub failed\n");
-		ret = -EBUSY;
-		goto err_clk_put_apbif;
+		return -EBUSY;
 	}
 
 	regs_ahub = devm_ioremap(&pdev->dev, res1->start,
 				 resource_size(res1));
 	if (!regs_ahub) {
 		dev_err(&pdev->dev, "ioremap ahub failed\n");
-		ret = -ENOMEM;
-		goto err_clk_put_apbif;
+		return -ENOMEM;
 	}
 
 	ahub->regmap_ahub = devm_regmap_init_mmio(&pdev->dev, regs_ahub,
@@ -645,7 +638,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (IS_ERR(ahub->regmap_ahub)) {
 		dev_err(&pdev->dev, "ahub regmap init failed\n");
 		ret = PTR_ERR(ahub->regmap_ahub);
-		goto err_clk_put_apbif;
+		return ret;
 	}
 	regcache_cache_only(ahub->regmap_ahub, true);
 
@@ -662,12 +655,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_clk_put_apbif:
-	clk_put(ahub->clk_apbif);
-err_clk_put_d_audio:
-	clk_put(ahub->clk_d_audio);
-	ahub = NULL;
-err:
+
 	return ret;
 }
 
@@ -680,11 +668,6 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra30_ahub_runtime_suspend(&pdev->dev);
 
-	clk_put(ahub->clk_apbif);
-	clk_put(ahub->clk_d_audio);
-
-	ahub = NULL;
-
 	return 0;
 }
 
-- 
1.9.1
