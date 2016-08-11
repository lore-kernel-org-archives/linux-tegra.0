From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dmaengine: tegra210-adma: Update driver to use of_pm_clk_add_clk
Date: Thu, 11 Aug 2016 11:42:20 +0100
Message-ID: <1470912140-11068-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 498b5fdd40dd ("PM / clk: Add support for adding a specific clock
from device-tree") add a new helper function for adding a clock from
device-tree to a device. Update the ADMA driver to use this new function
to simplify the driver.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra210-adma.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index c4b121c4559d..b10cbaa82ff5 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -670,7 +670,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	const struct tegra_adma_chip_data *cdata;
 	struct tegra_adma *tdma;
 	struct resource	*res;
-	struct clk *clk;
 	int ret, i;
 
 	cdata = of_device_get_match_data(&pdev->dev);
@@ -697,18 +696,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	clk = clk_get(&pdev->dev, "d_audio");
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev, "ADMA clock not found\n");
-		ret = PTR_ERR(clk);
-		goto clk_destroy;
-	}
-
-	ret = pm_clk_add_clk(&pdev->dev, clk);
-	if (ret) {
-		clk_put(clk);
+	ret = of_pm_clk_add_clk(&pdev->dev, "d_audio");
+	if (ret)
 		goto clk_destroy;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.1.4
