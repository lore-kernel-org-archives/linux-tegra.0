From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] drm/tegra: Fix the error handling in tegra_dsi_probe()
Date: Fri, 20 Dec 2013 10:50:53 +0800
Message-ID: <CAPgLHd-FVD8fOrQFexWDMcr7RSkuuxQDRgbQeJbfQMvg4DpM7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Fix the error handling to release all alloced resources before
return from tegra_dsi_probe() in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c | 53 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index d452faab..677ebca 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -847,61 +847,70 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	dsi->lanes = 4;
 
 	dsi->rst = devm_reset_control_get(&pdev->dev, "dsi");
-	if (IS_ERR(dsi->rst))
-		return PTR_ERR(dsi->rst);
+	if (IS_ERR(dsi->rst)) {
+		err = PTR_ERR(dsi->rst);
+		goto err_reset_control_get;
+	}
 
 	dsi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dsi->clk)) {
 		dev_err(&pdev->dev, "cannot get DSI clock\n");
-		return PTR_ERR(dsi->clk);
+		err = PTR_ERR(dsi->clk);
+		goto err_reset_control_get;
 	}
 
 	err = clk_prepare_enable(dsi->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "cannot enable DSI clock\n");
-		return err;
+		goto err_reset_control_get;
 	}
 
 	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		dev_err(&pdev->dev, "cannot get low-power clock\n");
-		return PTR_ERR(dsi->clk_lp);
+		err = PTR_ERR(dsi->clk_lp);
+		goto err_clk_get_lp;
 	}
 
 	err = clk_prepare_enable(dsi->clk_lp);
 	if (err < 0) {
 		dev_err(&pdev->dev, "cannot enable low-power clock\n");
-		return err;
+		goto err_clk_get_lp;
 	}
 
 	dsi->clk_parent = devm_clk_get(&pdev->dev, "parent");
 	if (IS_ERR(dsi->clk_parent)) {
 		dev_err(&pdev->dev, "cannot get parent clock\n");
-		return PTR_ERR(dsi->clk_parent);
+		err = PTR_ERR(dsi->clk_parent);
+		goto err_clk_get_parent;
 	}
 
 	err = clk_prepare_enable(dsi->clk_parent);
 	if (err < 0) {
 		dev_err(&pdev->dev, "cannot enable parent clock\n");
-		return err;
+		goto err_clk_get_parent;
 	}
 
 	err = tegra_dsi_setup_clocks(dsi);
 	if (err < 0) {
 		dev_err(&pdev->dev, "cannot setup clocks\n");
-		return err;
+		goto err_setup_clocks;
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dsi->regs = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(dsi->regs))
-		return PTR_ERR(dsi->regs);
+	if (IS_ERR(dsi->regs)) {
+		err = PTR_ERR(dsi->regs);
+		goto err_setup_clocks;
+	}
 
 	tegra_dsi_initialize(dsi);
 
 	dsi->mipi = tegra_mipi_request(&pdev->dev);
-	if (IS_ERR(dsi->mipi))
-		return PTR_ERR(dsi->mipi);
+	if (IS_ERR(dsi->mipi)) {
+		err = PTR_ERR(dsi->mipi);
+		goto err_setup_clocks;
+	}
 
 	dsi->host.ops = &tegra_dsi_host_ops;
 	dsi->host.dev = &pdev->dev;
@@ -909,7 +918,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	err = mipi_dsi_host_register(&dsi->host);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register DSI host: %d\n", err);
-		return err;
+		goto err_host_register;
 	}
 
 	INIT_LIST_HEAD(&dsi->client.list);
@@ -920,12 +929,26 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto err_client_register;
 	}
 
 	platform_set_drvdata(pdev, dsi);
 
 	return 0;
+
+err_client_register:
+	mipi_dsi_host_unregister(&dsi->host);
+err_host_register:
+	tegra_mipi_free(dsi->mipi);
+err_setup_clocks:
+	clk_disable_unprepare(dsi->clk_parent);
+err_clk_get_parent:
+	clk_disable_unprepare(dsi->clk_lp);
+err_clk_get_lp:
+	clk_disable_unprepare(dsi->clk);
+err_reset_control_get:
+	tegra_output_remove(&dsi->output);
+	return err;
 }
 
 static int tegra_dsi_remove(struct platform_device *pdev)
