From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 1/2] bus: tegra-aconnect: use devm_clk_*() helpers
Date: Wed, 13 Mar 2019 10:11:58 +0530
Message-ID: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: treding@nvidia.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

aconnect bus driver is using pm_clk_*() interface for managing clocks.
With this, clocks seem to be always ON. This happens on Tegra devices
which use BPMP co-processor to manage clock resources, where clocks
are enabled during prepare phase. This is necessary because calls to
BPMP are always blocking. When pm_clk_*() interface is used on such
Tegra devices, clock prepare count is not balanced till driver remove()
gets executed and hence clocks are seen ON always. Thus this patch
replaces pm_clk_*() with devm_clk_*() framework.

Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/bus/tegra-aconnect.c | 64 ++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 084ae28..9349157 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -12,28 +12,38 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 
+struct tegra_aconnect {
+	struct clk	*ape_clk;
+	struct clk	*apb2ape_clk;
+};
+
 static int tegra_aconnect_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct tegra_aconnect *aconnect;
 
 	if (!pdev->dev.of_node)
 		return -EINVAL;
 
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
+	aconnect = devm_kzalloc(&pdev->dev, sizeof(struct tegra_aconnect),
+				GFP_KERNEL);
+	if (!aconnect)
+		return -ENOMEM;
 
-	ret = of_pm_clk_add_clk(&pdev->dev, "ape");
-	if (ret)
-		goto clk_destroy;
+	aconnect->ape_clk = devm_clk_get(&pdev->dev, "ape");
+	if (IS_ERR(aconnect->ape_clk)) {
+		dev_err(&pdev->dev, "Can't retrieve ape clock\n");
+		return PTR_ERR(aconnect->ape_clk);
+	}
 
-	ret = of_pm_clk_add_clk(&pdev->dev, "apb2ape");
-	if (ret)
-		goto clk_destroy;
+	aconnect->apb2ape_clk = devm_clk_get(&pdev->dev, "apb2ape");
+	if (IS_ERR(aconnect->apb2ape_clk)) {
+		dev_err(&pdev->dev, "Can't retrieve apb2ape clock\n");
+		return PTR_ERR(aconnect->apb2ape_clk);
+	}
 
+	dev_set_drvdata(&pdev->dev, aconnect);
 	pm_runtime_enable(&pdev->dev);
 
 	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
@@ -41,30 +51,44 @@ static int tegra_aconnect_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Tegra ACONNECT bus registered\n");
 
 	return 0;
-
-clk_destroy:
-	pm_clk_destroy(&pdev->dev);
-
-	return ret;
 }
 
 static int tegra_aconnect_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
-	pm_clk_destroy(&pdev->dev);
-
 	return 0;
 }
 
 static int tegra_aconnect_runtime_resume(struct device *dev)
 {
-	return pm_clk_resume(dev);
+	struct tegra_aconnect *aconnect = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(aconnect->ape_clk);
+	if (ret) {
+		dev_err(dev, "ape clk_enable failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(aconnect->apb2ape_clk);
+	if (ret) {
+		clk_disable_unprepare(aconnect->ape_clk);
+		dev_err(dev, "apb2ape clk_enable failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int tegra_aconnect_runtime_suspend(struct device *dev)
 {
-	return pm_clk_suspend(dev);
+	struct tegra_aconnect *aconnect = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(aconnect->ape_clk);
+	clk_disable_unprepare(aconnect->apb2ape_clk);
+
+	return 0;
 }
 
 static const struct dev_pm_ops tegra_aconnect_pm_ops = {
-- 
2.7.4
