From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Mon, 9 Nov 2015 13:23:44 +0000
Message-ID: <1447075429-27311-2-git-send-email-jonathanh@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447075429-27311-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The tegra-apb DMA driver enables runtime-pm but never calls
pm_runtime_get/put and hence the runtime-pm callbacks are never invoked.
The driver manages the clocks by directly calling clk_prepare_enable()
and clk_unprepare_disable().

Fix this by replacing the clk_prepare_enable() and clk_disable_unprepare()
with pm_runtime_get_sync() and pm_runtime_put(), respectively. Note that
the consequence of this is that if runtime-pm is disabled, then the clocks
will remain on the entire time the driver is loaded. However, if
runtime-pm is disabled, then power is not most likely not a concern.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2 changes:
- Fixed return value for allocating channel
- Fixed test for return value from pm_runtime_get_sync()

 drivers/dma/tegra20-apb-dma.c | 49 ++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index c8f79dcaaee8..6007111fac1d 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1186,10 +1186,12 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
 
 	dma_cookie_init(&tdc->dma_chan);
 	tdc->config_init = false;
-	ret = clk_prepare_enable(tdma->dma_clk);
+
+	ret = pm_runtime_get_sync(tdma->dev);
 	if (ret < 0)
-		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
-	return ret;
+		return ret;
+
+	return 0;
 }
 
 static void tegra_dma_free_chan_resources(struct dma_chan *dc)
@@ -1232,7 +1234,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 		list_del(&sg_req->node);
 		kfree(sg_req);
 	}
-	clk_disable_unprepare(tdma->dma_clk);
+	pm_runtime_put(tdma->dev);
 
 	tdc->slave_id = 0;
 }
@@ -1356,20 +1358,14 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	spin_lock_init(&tdma->global_lock);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
+	if (!pm_runtime_enabled(&pdev->dev))
 		ret = tegra_dma_runtime_resume(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "dma_runtime_resume failed %d\n",
-				ret);
-			goto err_pm_disable;
-		}
-	}
+	else
+		ret = pm_runtime_get_sync(&pdev->dev);
 
-	/* Enable clock before accessing registers */
-	ret = clk_prepare_enable(tdma->dma_clk);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "clk_prepare_enable failed: %d\n", ret);
-		goto err_pm_disable;
+		pm_runtime_disable(&pdev->dev);
+		return ret;
 	}
 
 	/* Reset DMA controller */
@@ -1382,7 +1378,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
 	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
 
-	clk_disable_unprepare(tdma->dma_clk);
+	pm_runtime_put(&pdev->dev);
 
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
@@ -1485,7 +1481,6 @@ err_irq:
 		tasklet_kill(&tdc->tasklet);
 	}
 
-err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
@@ -1539,11 +1534,10 @@ static int tegra_dma_runtime_resume(struct device *dev)
 static int tegra_dma_pm_suspend(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
-	int i;
-	int ret;
+	int i, ret;
 
 	/* Enable clock before accessing register */
-	ret = tegra_dma_runtime_resume(dev);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		return ret;
 
@@ -1560,18 +1554,17 @@ static int tegra_dma_pm_suspend(struct device *dev)
 	}
 
 	/* Disable clock */
-	tegra_dma_runtime_suspend(dev);
+	pm_runtime_put(dev);
 	return 0;
 }
 
 static int tegra_dma_pm_resume(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
-	int i;
-	int ret;
+	int i, ret;
 
 	/* Enable clock before accessing register */
-	ret = tegra_dma_runtime_resume(dev);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		return ret;
 
@@ -1592,16 +1585,14 @@ static int tegra_dma_pm_resume(struct device *dev)
 	}
 
 	/* Disable clock */
-	tegra_dma_runtime_suspend(dev);
+	pm_runtime_put(dev);
 	return 0;
 }
 #endif
 
 static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
-#ifdef CONFIG_PM
-	.runtime_suspend = tegra_dma_runtime_suspend,
-	.runtime_resume = tegra_dma_runtime_resume,
-#endif
+	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
+			   NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_pm_suspend, tegra_dma_pm_resume)
 };
 
-- 
2.1.4
