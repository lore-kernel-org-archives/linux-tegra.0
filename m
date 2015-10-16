From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Fri, 16 Oct 2015 09:25:52 +0100
Message-ID: <1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 50 ++++++++++++++++---------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index c8f79dcaaee8..fe4a006adeb0 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1182,14 +1182,11 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma *tdma = tdc->tdma;
-	int ret;
 
 	dma_cookie_init(&tdc->dma_chan);
 	tdc->config_init = false;
-	ret = clk_prepare_enable(tdma->dma_clk);
-	if (ret < 0)
-		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
-	return ret;
+
+	return pm_runtime_get_sync(tdma->dev);
 }
 
 static void tegra_dma_free_chan_resources(struct dma_chan *dc)
@@ -1232,7 +1229,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 		list_del(&sg_req->node);
 		kfree(sg_req);
 	}
-	clk_disable_unprepare(tdma->dma_clk);
+	pm_runtime_put(tdma->dev);
 
 	tdc->slave_id = 0;
 }
@@ -1356,20 +1353,14 @@ static int tegra_dma_probe(struct platform_device *pdev)
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
-	if (ret < 0) {
-		dev_err(&pdev->dev, "clk_prepare_enable failed: %d\n", ret);
-		goto err_pm_disable;
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
+		return ret;
 	}
 
 	/* Reset DMA controller */
@@ -1382,7 +1373,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
 	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
 
-	clk_disable_unprepare(tdma->dma_clk);
+	pm_runtime_put(&pdev->dev);
 
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
@@ -1485,7 +1476,6 @@ err_irq:
 		tasklet_kill(&tdc->tasklet);
 	}
 
-err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
@@ -1539,11 +1529,10 @@ static int tegra_dma_runtime_resume(struct device *dev)
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
 
@@ -1560,18 +1549,17 @@ static int tegra_dma_pm_suspend(struct device *dev)
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
 
@@ -1592,16 +1580,14 @@ static int tegra_dma_pm_resume(struct device *dev)
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
