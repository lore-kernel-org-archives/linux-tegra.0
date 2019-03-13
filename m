From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 1/2] dmaengine: tegra210-adma: use devm_clk_*() helpers
Date: Wed, 13 Mar 2019 11:13:13 +0530
Message-ID: <1552455794-24946-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org
Cc: treding@nvidia.com, jonathanh@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

adma driver is using pm_clk_*() interface for managing clock resources.
With this it is observed that clocks remain ON always. This happens on
Tegra devices which use BPMP co-processor to manage clock resources,
where clocks are enabled during prepare phase. This is necessary because
clocks to BPMP are always blocking. When pm_clk_*() interface is used on
such Tegra devices, clock prepare count is not balanced till remove call
happens for the driver and hence clocks are seen ON always. Thus this
patch replaces pm_clk_*() with devm_clk_*() framework.

Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/dma/tegra210-adma.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 5ec0dd9..650cd9c 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -22,7 +22,6 @@
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/of_irq.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
@@ -141,6 +140,7 @@ struct tegra_adma {
 	struct dma_device		dma_dev;
 	struct device			*dev;
 	void __iomem			*base_addr;
+	struct clk			*ahub_clk;
 	unsigned int			nr_channels;
 	unsigned long			rx_requests_reserved;
 	unsigned long			tx_requests_reserved;
@@ -637,8 +637,9 @@ static int tegra_adma_runtime_suspend(struct device *dev)
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 
 	tdma->global_cmd = tdma_read(tdma, ADMA_GLOBAL_CMD);
+	clk_disable_unprepare(tdma->ahub_clk);
 
-	return pm_clk_suspend(dev);
+	return 0;
 }
 
 static int tegra_adma_runtime_resume(struct device *dev)
@@ -646,10 +647,11 @@ static int tegra_adma_runtime_resume(struct device *dev)
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_clk_resume(dev);
-	if (ret)
+	ret = clk_prepare_enable(tdma->ahub_clk);
+	if (ret) {
+		dev_err(dev, "ahub clk_enable failed: %d\n", ret);
 		return ret;
-
+	}
 	tdma_write(tdma, ADMA_GLOBAL_CMD, tdma->global_cmd);
 
 	return 0;
@@ -693,13 +695,11 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	if (IS_ERR(tdma->base_addr))
 		return PTR_ERR(tdma->base_addr);
 
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = of_pm_clk_add_clk(&pdev->dev, "d_audio");
-	if (ret)
-		goto clk_destroy;
+	tdma->ahub_clk = devm_clk_get(&pdev->dev, "d_audio");
+	if (IS_ERR(tdma->ahub_clk)) {
+		dev_err(&pdev->dev, "Error: Missing ahub controller clock\n");
+		return PTR_ERR(tdma->ahub_clk);
+	}
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -776,8 +776,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 rpm_disable:
 	pm_runtime_disable(&pdev->dev);
-clk_destroy:
-	pm_clk_destroy(&pdev->dev);
 
 	return ret;
 }
@@ -794,7 +792,6 @@ static int tegra_adma_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	pm_clk_destroy(&pdev->dev);
 
 	return 0;
 }
-- 
2.7.4
