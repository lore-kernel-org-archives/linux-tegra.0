From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 2/6] dmaengine: tegra-apb: Use dev_get_drvdata()
Date: Fri, 13 Nov 2015 16:39:39 +0000
Message-ID: <1447432783-7466-3-git-send-email-jonathanh@nvidia.com>
References: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In the tegra_dma_runtime_suspend/resume functions, the pdev structure
is not needed, and so just call dev_get_drvdata() to get the device
data structure.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index f68bccf55a24..355dbc354818 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1509,8 +1509,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
 
 static int tegra_dma_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_dma *tdma = platform_get_drvdata(pdev);
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(tdma->dma_clk);
 	return 0;
@@ -1518,8 +1517,7 @@ static int tegra_dma_runtime_suspend(struct device *dev)
 
 static int tegra_dma_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct tegra_dma *tdma = platform_get_drvdata(pdev);
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(tdma->dma_clk);
-- 
2.1.4
