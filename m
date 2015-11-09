From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/6] dmaengine: tegra-apb: Use dev_get_drvdata()
Date: Mon, 9 Nov 2015 13:23:45 +0000
Message-ID: <1447075429-27311-3-git-send-email-jonathanh@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447075429-27311-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In the tegra_dma_runtime_suspend/resume functions, the pdev structure
is not needed, and so just call dev_get_drvdata() to get the device
data structure.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 6007111fac1d..802d66a25de6 100644
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
