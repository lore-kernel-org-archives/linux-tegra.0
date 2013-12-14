From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] drm/tegra: fix the error handling in tegra_dc_probe()
Date: Sat, 14 Dec 2013 22:29:19 +0800
Message-ID: <CAPgLHd8M+8pqRRidRTQM0aP1xb7mT_Fxqzu4pw-Sb5UGpMYr7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Add the missing clk_disable_unprepare() and tegra_dc_rgb_remove()
before return from tegra_dc_probe() in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index cd7f1e4..4d93cf8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1199,13 +1199,16 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(dc->regs))
-		return PTR_ERR(dc->regs);
+	if (IS_ERR(dc->regs)) {
+		err = PTR_ERR(dc->regs);
+		goto err_clk_disable_unprepare;
+	}
 
 	dc->irq = platform_get_irq(pdev, 0);
 	if (dc->irq < 0) {
 		dev_err(&pdev->dev, "failed to get IRQ\n");
-		return -ENXIO;
+		err = -ENXIO;
+		goto err_clk_disable_unprepare;
 	}
 
 	INIT_LIST_HEAD(&dc->client.list);
@@ -1215,19 +1218,24 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
-		return err;
+		goto err_clk_disable_unprepare;
 	}
 
 	err = host1x_client_register(&dc->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto err_rgb_remove;
 	}
 
 	platform_set_drvdata(pdev, dc);
 
 	return 0;
+err_rgb_remove:
+	tegra_dc_rgb_remove(dc);
+err_clk_disable_unprepare:
+	clk_disable_unprepare(dc->clk);
+	return err;
 }
 
 static int tegra_dc_remove(struct platform_device *pdev)
