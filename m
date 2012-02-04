From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] i2c: tegra: Remove unnecessary clk_get
Date: Fri,  3 Feb 2012 17:10:16 -0700
Message-ID: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The clock table has just one entry for a given i2c controller.
Hence, the second clk_get is not required in the driver.

Originally by Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b is
missing in our internal repo.

[swarren: Reworded commit description, resolved merge issue when cherry-
picking to mainline]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0ab4a95..a546ede 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -123,7 +123,6 @@ struct tegra_i2c_dev {
 	struct device *dev;
 	struct i2c_adapter adapter;
 	struct clk *clk;
-	struct clk *i2c_clk;
 	struct resource *iomem;
 	void __iomem *base;
 	int cont_id;
@@ -565,7 +564,6 @@ static int __devinit tegra_i2c_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource *iomem;
 	struct clk *clk;
-	struct clk *i2c_clk;
 	const unsigned int *prop;
 	void __iomem *base;
 	int irq;
@@ -603,22 +601,14 @@ static int __devinit tegra_i2c_probe(struct platform_device *pdev)
 		goto err_release_region;
 	}
 
-	i2c_clk = clk_get(&pdev->dev, "i2c");
-	if (IS_ERR(i2c_clk)) {
-		dev_err(&pdev->dev, "missing bus clock");
-		ret = PTR_ERR(i2c_clk);
-		goto err_clk_put;
-	}
-
 	i2c_dev = kzalloc(sizeof(struct tegra_i2c_dev), GFP_KERNEL);
 	if (!i2c_dev) {
 		ret = -ENOMEM;
-		goto err_i2c_clk_put;
+		goto err_clk_put;
 	}
 
 	i2c_dev->base = base;
 	i2c_dev->clk = clk;
-	i2c_dev->i2c_clk = i2c_clk;
 	i2c_dev->iomem = iomem;
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->irq = irq;
@@ -657,7 +647,7 @@ static int __devinit tegra_i2c_probe(struct platform_device *pdev)
 		goto err_free;
 	}
 
-	clk_enable(i2c_dev->i2c_clk);
+	clk_enable(i2c_dev->clk);
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.owner = THIS_MODULE;
@@ -682,8 +672,6 @@ err_free_irq:
 	free_irq(i2c_dev->irq, i2c_dev);
 err_free:
 	kfree(i2c_dev);
-err_i2c_clk_put:
-	clk_put(i2c_clk);
 err_clk_put:
 	clk_put(clk);
 err_release_region:
@@ -698,7 +686,6 @@ static int __devexit tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 	i2c_del_adapter(&i2c_dev->adapter);
 	free_irq(i2c_dev->irq, i2c_dev);
-	clk_put(i2c_dev->i2c_clk);
 	clk_put(i2c_dev->clk);
 	release_mem_region(i2c_dev->iomem->start,
 		resource_size(i2c_dev->iomem));
-- 
1.7.0.4
