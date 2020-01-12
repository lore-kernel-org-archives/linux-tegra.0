From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 09/14] dmaengine: tegra-apb: Clean up runtime PM teardown
Date: Sun, 12 Jan 2020 20:30:01 +0300
Message-ID: <20200112173006.29863-10-digetx@gmail.com>
References: <20200112173006.29863-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112173006.29863-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It's cleaner to teardown RPM by revering the enable sequence, which makes
code much easier to follow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 7158bd3145c4..cc4a9ca20780 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1429,13 +1429,15 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	spin_lock_init(&tdma->global_lock);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev))
+	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra_dma_runtime_resume(&pdev->dev);
-	else
+		if (ret)
+			return ret;
+	} else {
 		ret = pm_runtime_get_sync(&pdev->dev);
-
-	if (ret < 0)
-		goto err_pm_disable;
+		if (ret < 0)
+			goto err_pm_disable;
+	}
 
 	/* Reset DMA controller */
 	reset_control_assert(tdma->rst);
@@ -1545,9 +1547,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&tdma->dma_dev);
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
+	if (!pm_runtime_enabled(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
+	else
+		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
@@ -1558,9 +1561,10 @@ static int tegra_dma_remove(struct platform_device *pdev)
 
 	dma_async_device_unregister(&tdma->dma_dev);
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
+	if (!pm_runtime_enabled(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
+	else
+		pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.24.0
