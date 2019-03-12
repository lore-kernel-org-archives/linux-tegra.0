From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] bus: tegra-aconnect: use devm_clk_*() helpers
Date: Tue, 12 Mar 2019 20:04:09 +0530
Message-ID: <1552401249-29838-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: treding@nvidia.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

aconnect bus driver is using pm_clk_*() for managing required clocks. With
this, clocks seem to be always ON. This happens because, the clock prepare
count is incremented in pm_clock_acquire() which is called during device
probe(). The count is decremented during remove(). Hence the prepare_count
for the clock is non-zero till the remove() gets executed. This is true for
BPMP managed clock sources, where clock enable and disable happens during
prepare and unprepare phases respectively. Thus clocks remain ON always and
that is why pm_clk_*() cannot be used on Tegra.

This patch replaces pm_clk_*() with devm_clk_*() and runtime PM callbacks
reflect this. System suspend/resume can use pm_runtime_force_suspend/resume

Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/bus/tegra-aconnect.c | 66 ++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 084ae28..ac58142 100644
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
@@ -41,35 +51,51 @@ static int tegra_aconnect_probe(struct platform_device *pdev)
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
 	SET_RUNTIME_PM_OPS(tegra_aconnect_runtime_suspend,
 			   tegra_aconnect_runtime_resume, NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra_aconnect_of_match[] = {
-- 
2.7.4
