From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] bus/aconnect: Update driver to use of_pm_clk_add_clk
Date: Tue, 16 Aug 2016 11:17:36 +0100
Message-ID: <1471342656-8367-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 498b5fdd40dd ("PM / clk: Add support for adding a specific clock
from device-tree") add a new helper function for adding a clock from
device-tree to a device. Update the ACONNECT driver to use this new
function to simplify the driver.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/bus/tegra-aconnect.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 7e4104b74fa8..084ae286fa23 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -15,24 +15,6 @@
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 
-static int tegra_aconnect_add_clock(struct device *dev, char *name)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = clk_get(dev, name);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "%s clock not found\n", name);
-		return PTR_ERR(clk);
-	}
-
-	ret = pm_clk_add_clk(dev, clk);
-	if (ret)
-		clk_put(clk);
-
-	return ret;
-}
-
 static int tegra_aconnect_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -44,11 +26,11 @@ static int tegra_aconnect_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = tegra_aconnect_add_clock(&pdev->dev, "ape");
+	ret = of_pm_clk_add_clk(&pdev->dev, "ape");
 	if (ret)
 		goto clk_destroy;
 
-	ret = tegra_aconnect_add_clock(&pdev->dev, "apb2ape");
+	ret = of_pm_clk_add_clk(&pdev->dev, "apb2ape");
 	if (ret)
 		goto clk_destroy;
 
-- 
2.1.4
