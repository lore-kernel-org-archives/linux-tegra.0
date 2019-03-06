From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/3] irqchip/gic-pm: use devm_clk_*() helpers
Date: Wed, 6 Mar 2019 16:11:18 +0530
Message-ID: <1551868878-1131-3-git-send-email-spujar@nvidia.com>
References: <1551868878-1131-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551868878-1131-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, mkumard@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

With pm_clk_*() usage, it is seen that clocks always remain ON. This
happens because clocks are managed by BPMP on Tegra devices and clock
enable/disable happens during prepare/unprepare phase. This patch
avoids use of pm_clk_*() and replaces it with devm_clk_*() helpers.

Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/irqchip/irq-gic-pm.c | 69 +++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-gic-pm.c b/drivers/irqchip/irq-gic-pm.c
index ecafd29..1690939 100644
--- a/drivers/irqchip/irq-gic-pm.c
+++ b/drivers/irqchip/irq-gic-pm.c
@@ -19,7 +19,6 @@
 #include <linux/of_irq.h>
 #include <linux/irqchip/arm-gic.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
@@ -28,14 +27,29 @@ struct gic_clk_data {
 	const char *const *clocks;
 };
 
+struct gic_chip_pm {
+	struct gic_chip_data *chip_data;
+	const struct gic_clk_data *clk_data;
+	struct clk **clk_handle;
+};
+
 static int gic_runtime_resume(struct device *dev)
 {
-	struct gic_chip_data *gic = dev_get_drvdata(dev);
-	int ret;
+	struct gic_chip_pm *chip_pm = dev_get_drvdata(dev);
+	struct gic_chip_data *gic = chip_pm->chip_data;
+	const struct gic_clk_data *data = chip_pm->clk_data;
+	int ret, i;
 
-	ret = pm_clk_resume(dev);
-	if (ret)
-		return ret;
+	for (i = 0; i < data->num_clocks; i++) {
+		ret = clk_prepare_enable(chip_pm->clk_handle[i]);
+		if (ret) {
+			while (--i >= 0)
+				clk_disable_unprepare(chip_pm->clk_handle[i]);
+
+			dev_err(dev, " clk_enable failed: %d\n", ret);
+			return ret;
+		}
+	}
 
 	/*
 	 * On the very first resume, the pointer to the driver data
@@ -54,33 +68,39 @@ static int gic_runtime_resume(struct device *dev)
 
 static int gic_runtime_suspend(struct device *dev)
 {
-	struct gic_chip_data *gic = dev_get_drvdata(dev);
+	struct gic_chip_pm *chip_pm = dev_get_drvdata(dev);
+	struct gic_chip_data *gic = chip_pm->chip_data;
+	const struct gic_clk_data *data = chip_pm->clk_data;
+	int i;
 
 	gic_dist_save(gic);
 	gic_cpu_save(gic);
 
-	return pm_clk_suspend(dev);
+	for (i = 0; i < data->num_clocks; i++)
+		clk_disable_unprepare(chip_pm->clk_handle[i]);
+
+	return 0;
 }
 
-static int gic_get_clocks(struct device *dev, const struct gic_clk_data *data)
+static int gic_get_clocks(struct device *dev, struct gic_chip_pm *chip_pm)
 {
 	unsigned int i;
-	int ret;
+	const struct gic_clk_data *data = chip_pm->clk_data;
 
 	if (!dev || !data)
 		return -EINVAL;
 
-	ret = pm_clk_create(dev);
-	if (ret)
-		return ret;
+	chip_pm->clk_handle = devm_kzalloc(dev, data->num_clocks *
+					   sizeof(struct clk *), GFP_KERNEL);
+	if (!chip_pm->clk_handle)
+		return -ENOMEM;
 
 	for (i = 0; i < data->num_clocks; i++) {
-		ret = of_pm_clk_add_clk(dev, data->clocks[i]);
-		if (ret) {
+		chip_pm->clk_handle[i] = devm_clk_get(dev, data->clocks[i]);
+		if (IS_ERR(chip_pm->clk_handle[i])) {
 			dev_err(dev, "failed to add clock %s\n",
 				data->clocks[i]);
-			pm_clk_destroy(dev);
-			return ret;
+			return PTR_ERR(chip_pm->clk_handle[i]);
 		}
 	}
 
@@ -91,14 +111,20 @@ static int gic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct gic_clk_data *data;
-	struct gic_chip_data *gic;
+	struct gic_chip_pm *gic_chip_pm;
 	int ret, irq;
 
+	gic_chip_pm = devm_kzalloc(dev, sizeof(*gic_chip_pm), GFP_KERNEL);
+	if (!gic_chip_pm)
+		return -ENOMEM;
+
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data) {
 		dev_err(&pdev->dev, "no device match found\n");
 		return -ENODEV;
 	}
+	gic_chip_pm->clk_data = data;
+	platform_set_drvdata(pdev, gic_chip_pm);
 
 	irq = irq_of_parse_and_map(dev->of_node, 0);
 	if (!irq) {
@@ -106,7 +132,7 @@ static int gic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = gic_get_clocks(dev, data);
+	ret = gic_get_clocks(dev, gic_chip_pm);
 	if (ret)
 		goto irq_dispose;
 
@@ -116,12 +142,10 @@ static int gic_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rpm_disable;
 
-	ret = gic_of_init_child(dev, &gic, irq);
+	ret = gic_of_init_child(dev, &gic_chip_pm->chip_data, irq);
 	if (ret)
 		goto rpm_put;
 
-	platform_set_drvdata(pdev, gic);
-
 	pm_runtime_put(dev);
 
 	dev_info(dev, "GIC IRQ controller registered\n");
@@ -132,7 +156,6 @@ static int gic_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 rpm_disable:
 	pm_runtime_disable(dev);
-	pm_clk_destroy(dev);
 irq_dispose:
 	irq_dispose_mapping(irq);
 
-- 
2.7.4
