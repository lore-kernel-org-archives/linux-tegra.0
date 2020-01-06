From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 09/13] dmaengine: tegra-apb: Remove runtime PM usage
Date: Mon,  6 Jan 2020 04:17:04 +0300
Message-ID: <20200106011708.7463-10-digetx@gmail.com>
References: <20200106011708.7463-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106011708.7463-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no benefit from runtime PM usage for the APB DMA driver because
it enables clock at the time of channel's allocation and thus clock stays
enabled all the time in practice, secondly there is benefit from manually
disabled clock because hardware auto-gates it during idle by itself.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 76 +++++++++++------------------------
 1 file changed, 24 insertions(+), 52 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 804007cbd6f0..840a58e782ec 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -21,7 +21,6 @@
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
@@ -266,8 +265,6 @@ static inline struct device *tdc2dev(struct tegra_dma_channel *tdc)
 }
 
 static dma_cookie_t tegra_dma_tx_submit(struct dma_async_tx_descriptor *tx);
-static int tegra_dma_runtime_suspend(struct device *dev);
-static int tegra_dma_runtime_resume(struct device *dev);
 
 /* Get DMA desc from free list, if not there then allocate it.  */
 static struct tegra_dma_desc *tegra_dma_desc_get(struct tegra_dma_channel *tdc)
@@ -1280,22 +1277,15 @@ tegra_dma_prep_dma_cyclic(struct dma_chan *dc, dma_addr_t buf_addr,
 static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
-	int ret;
 
 	dma_cookie_init(&tdc->dma_chan);
 
-	ret = pm_runtime_get_sync(tdma->dev);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
 static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
-	struct tegra_dma *tdma = tdc->tdma;
 	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	struct list_head dma_desc_list;
@@ -1328,7 +1318,6 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 		list_del(&sg_req->node);
 		kfree(sg_req);
 	}
-	pm_runtime_put(tdma->dev);
 
 	tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 }
@@ -1428,27 +1417,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
 
 	spin_lock_init(&tdma->global_lock);
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev))
-		ret = tegra_dma_runtime_resume(&pdev->dev);
-	else
-		ret = pm_runtime_get_sync(&pdev->dev);
-
-	if (ret < 0)
-		goto err_pm_disable;
-
-	/* Reset DMA controller */
-	reset_control_assert(tdma->rst);
-	udelay(2);
-	reset_control_deassert(tdma->rst);
-
-	/* Enable global DMA registers */
-	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
-	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
-	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
-
-	pm_runtime_put(&pdev->dev);
-
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
@@ -1460,9 +1428,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
-			ret = irq;
 			dev_err(&pdev->dev, "No irq resource for chan %d\n", i);
-			goto err_pm_disable;
+			return irq;
 		}
 
 		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
@@ -1472,7 +1439,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"request_irq failed with err %d channel %d\n",
 				ret, i);
-			goto err_pm_disable;
+			return ret;
 		}
 
 		tdc->dma_chan.device = &tdma->dma_dev;
@@ -1493,6 +1460,20 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&tdc->cb_desc);
 	}
 
+	ret = clk_prepare_enable(tdma->dma_clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Reset DMA controller */
+	reset_control_reset(tdma->rst);
+
+	/* Enable global DMA registers */
+	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
+	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
+	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
+
 	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
@@ -1525,7 +1506,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Tegra20 APB DMA driver registration failed %d\n", ret);
-		goto err_pm_disable;
+		goto err_clk_disable;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node,
@@ -1544,10 +1525,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 err_unregister_dma_dev:
 	dma_async_device_unregister(&tdma->dma_dev);
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_dma_runtime_suspend(&pdev->dev);
+err_clk_disable:
+	clk_disable_unprepare(tdma->dma_clk);
 
 	return ret;
 }
@@ -1557,15 +1536,12 @@ static int tegra_dma_remove(struct platform_device *pdev)
 	struct tegra_dma *tdma = platform_get_drvdata(pdev);
 
 	dma_async_device_unregister(&tdma->dma_dev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_dma_runtime_suspend(&pdev->dev);
+	clk_disable_unprepare(tdma->dma_clk);
 
 	return 0;
 }
 
-static int tegra_dma_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
 	unsigned int i;
@@ -1594,7 +1570,7 @@ static int tegra_dma_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_dma_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_dma_dev_resume(struct device *dev)
 {
 	struct tegra_dma *tdma = dev_get_drvdata(dev);
 	unsigned int i;
@@ -1632,12 +1608,8 @@ static int tegra_dma_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
+static SIMPLE_DEV_PM_OPS(tegra_dma_dev_pm_ops, tegra_dma_dev_suspend,
+			 tegra_dma_dev_resume);
 
 static const struct of_device_id tegra_dma_of_match[] = {
 	{
-- 
2.24.0
