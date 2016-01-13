From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 08/10] thermal: tegra: add PM support
Date: Wed, 13 Jan 2016 16:00:43 +0800
Message-ID: <1452672043-475-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add suspend/resume function in soctherm driver.
And enable it for Tegra124 and Tegra210.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/tegra124_soctherm.c |   9 ++
 drivers/thermal/tegra/tegra210_soctherm.c |   9 ++
 drivers/thermal/tegra/tegra_soctherm.c    | 154 +++++++++++++++++++++---------
 drivers/thermal/tegra/tegra_soctherm.h    |   5 +
 4 files changed, 130 insertions(+), 47 deletions(-)

diff --git a/drivers/thermal/tegra/tegra124_soctherm.c b/drivers/thermal/tegra/tegra124_soctherm.c
index 13d7f4e3a3d7..04cb419dbabc 100644
--- a/drivers/thermal/tegra/tegra124_soctherm.c
+++ b/drivers/thermal/tegra/tegra124_soctherm.c
@@ -205,6 +205,14 @@ static const struct of_device_id tegra124_soctherm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
 
+#ifdef CONFIG_PM_SLEEP
+static SIMPLE_DEV_PM_OPS(tegra124_soctherm_pm,
+			 soctherm_suspend, soctherm_resume);
+#define TEGRA124_SOC_THERM_PM      (&tegra124_soctherm_pm)
+#else
+#define TEGRA124_SOC_THERM_PM      NULL
+#endif
+
 static int tegra124_soctherm_probe(struct platform_device *pdev)
 {
 	return tegra_soctherm_probe(pdev,
@@ -218,6 +226,7 @@ static struct platform_driver tegra124_soctherm_driver = {
 	.remove = tegra_soctherm_remove,
 	.driver = {
 		.name = "tegra124_soctherm",
+		.pm = TEGRA124_SOC_THERM_PM,
 		.of_match_table = tegra124_soctherm_of_match,
 	},
 };
diff --git a/drivers/thermal/tegra/tegra210_soctherm.c b/drivers/thermal/tegra/tegra210_soctherm.c
index 91f48990dd8e..551faa3f7a6c 100644
--- a/drivers/thermal/tegra/tegra210_soctherm.c
+++ b/drivers/thermal/tegra/tegra210_soctherm.c
@@ -208,6 +208,14 @@ MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
 
 #define TEGRA210_FUSE_CP_REV 0x90
 
+#ifdef CONFIG_PM_SLEEP
+static SIMPLE_DEV_PM_OPS(tegra210_soctherm_pm,
+			 soctherm_suspend, soctherm_resume);
+#define TEGRA210_SOC_THERM_PM      (&tegra210_soctherm_pm)
+#else
+#define TEGRA210_SOC_THERM_PM      NULL
+#endif
+
 static int tegra210_soctherm_probe(struct platform_device *pdev)
 {
 	u32 rev;
@@ -227,6 +235,7 @@ static struct platform_driver tegra210_soctherm_driver = {
 	.driver = {
 		.name = "tegra210_soctherm",
 		.owner = THIS_MODULE,
+		.pm = TEGRA210_SOC_THERM_PM,
 		.of_match_table = tegra210_soctherm_of_match,
 	},
 };
diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/tegra/tegra_soctherm.c
index 6fd72ceb4865..5b43f1413b35 100644
--- a/drivers/thermal/tegra/tegra_soctherm.c
+++ b/drivers/thermal/tegra/tegra_soctherm.c
@@ -92,17 +92,11 @@ struct tegra_soctherm {
 	const struct tegra_tsensor_group **sensor_groups;
 };
 
-static int enable_tsensor(struct tegra_soctherm *tegra,
-			  struct tegra_tsensor *sensor,
-			  const struct tsensor_shared_calibration *shared)
+static void enable_tsensor(struct tegra_soctherm *tegra,
+			   struct tegra_tsensor *sensor)
 {
 	void __iomem *base = tegra->regs + sensor->base;
 	unsigned int val;
-	int err;
-
-	err = tegra_soctherm_calculate_tsensor_calibration(sensor, shared);
-	if (err)
-		return err;
 
 	val = sensor->config->tall << SENSOR_CONFIG0_TALL_SHIFT;
 	writel(val, base + SENSOR_CONFIG0);
@@ -114,8 +108,6 @@ static int enable_tsensor(struct tegra_soctherm *tegra,
 	writel(val, base + SENSOR_CONFIG1);
 
 	writel(sensor->calib, base + SENSOR_CONFIG2);
-
-	return 0;
 }
 
 /*
@@ -513,6 +505,74 @@ static inline int soctherm_debug_init(struct platform_device *pdev)
 { return 0; }
 #endif
 
+static int soctherm_clk_enable(struct platform_device *pdev, bool enable)
+{
+	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
+	int err;
+
+	if (tegra->clock_soctherm == NULL || tegra->clock_tsensor == NULL)
+		return -EINVAL;
+
+	reset_control_assert(tegra->reset);
+
+	if (enable) {
+		err = clk_prepare_enable(tegra->clock_soctherm);
+		if (err) {
+			reset_control_deassert(tegra->reset);
+			return err;
+		}
+
+		err = clk_prepare_enable(tegra->clock_tsensor);
+		if (err) {
+			clk_disable_unprepare(tegra->clock_soctherm);
+			reset_control_deassert(tegra->reset);
+			return err;
+		}
+	} else {
+		clk_disable_unprepare(tegra->clock_tsensor);
+		clk_disable_unprepare(tegra->clock_soctherm);
+	}
+
+	reset_control_deassert(tegra->reset);
+
+	return 0;
+}
+
+static int soctherm_init(struct platform_device *pdev)
+{
+	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
+	struct tegra_tsensor *tsensors = tegra->tsensors;
+	const struct tegra_tsensor_group **ttgs = tegra->sensor_groups;
+	int i, err;
+	u32 pdiv, hotspot;
+
+	/* Initialize raw sensors */
+	for (i = 0; tsensors[i].name; ++i)
+		enable_tsensor(tegra, tsensors + i);
+
+	/* Wait for sensor data to be ready */
+	usleep_range(1000, 5000);
+
+	/* program pdiv and hotspot offsets per THERM */
+	pdiv = readl(tegra->regs + SENSOR_PDIV);
+	hotspot = readl(tegra->regs + SENSOR_HOTSPOT_OFF);
+	for (i = 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
+		pdiv = REG_SET_MASK(pdiv, ttgs[i]->pdiv_mask,
+				    ttgs[i]->pdiv);
+		if (ttgs[i]->id != TEGRA124_SOCTHERM_SENSOR_PLLX)
+			hotspot =  REG_SET_MASK(hotspot,
+						ttgs[i]->pllx_hotspot_mask,
+						ttgs[i]->pllx_hotspot_diff);
+	}
+	writel(pdiv, tegra->regs + SENSOR_PDIV);
+	writel(hotspot, tegra->regs + SENSOR_HOTSPOT_OFF);
+
+	/* Initialize thermctl sensors */
+	err = tegra_soctherm_thermtrip(&pdev->dev);
+
+	return err;
+}
+
 int tegra_soctherm_probe(struct platform_device *pdev,
 			 struct tegra_tsensor *tsensors,
 			 const struct tegra_tsensor_group **ttgs,
@@ -524,7 +584,6 @@ int tegra_soctherm_probe(struct platform_device *pdev,
 	struct resource *res;
 	unsigned int i;
 	int err;
-	u32 pdiv, hotspot;
 
 	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
 	if (!tegra)
@@ -558,48 +617,25 @@ int tegra_soctherm_probe(struct platform_device *pdev,
 		return PTR_ERR(tegra->clock_soctherm);
 	}
 
-	reset_control_assert(tegra->reset);
-
-	err = clk_prepare_enable(tegra->clock_soctherm);
-	if (err)
-		return err;
-
-	err = clk_prepare_enable(tegra->clock_tsensor);
-	if (err) {
-		clk_disable_unprepare(tegra->clock_soctherm);
-		return err;
-	}
-
-	reset_control_deassert(tegra->reset);
-
-	/* Initialize raw sensors */
-
+	/* calculate shared calibration data */
 	err = tegra_soctherm_calculate_shared_calibration(tfuse, &shared_calib);
 	if (err)
 		goto disable_clocks;
 
+	/* calculate tsensor calibaration data */
 	for (i = 0; tsensors[i].name; ++i) {
-		err = enable_tsensor(tegra, tsensors + i, &shared_calib);
+		err = tegra_soctherm_calculate_tsensor_calibration(tsensors + i,
+								&shared_calib);
 		if (err)
 			goto disable_clocks;
 	}
 
-	/* program pdiv and hotspot offsets per THERM */
-	pdiv = readl(tegra->regs + SENSOR_PDIV);
-	hotspot = readl(tegra->regs + SENSOR_HOTSPOT_OFF);
-	for (i = 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
-		pdiv = REG_SET_MASK(pdiv, ttgs[i]->pdiv_mask,
-				   ttgs[i]->pdiv);
-		if (ttgs[i]->id != TEGRA124_SOCTHERM_SENSOR_PLLX)
-			hotspot =  REG_SET_MASK(hotspot,
-						ttgs[i]->pllx_hotspot_mask,
-						ttgs[i]->pllx_hotspot_diff);
+	soctherm_clk_enable(pdev, true);
+	err = soctherm_init(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "Initialize platform data failed\n");
+		goto disable_clocks;
 	}
-	writel(pdiv, tegra->regs + SENSOR_PDIV);
-	writel(hotspot, tegra->regs + SENSOR_HOTSPOT_OFF);
-
-	/* Initialize thermctl sensors */
-	tegra_soctherm_thermtrip(&pdev->dev);
 
 	for (i = 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
 		struct tegra_thermctl_zone *zone =
@@ -635,8 +671,7 @@ unregister_tzs:
 						  tegra->thermctl_tzs[i]);
 
 disable_clocks:
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
 
 	return err;
 }
@@ -651,8 +686,33 @@ int tegra_soctherm_remove(struct platform_device *pdev)
 						  tegra->thermctl_tzs[i]);
 	}
 
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
+
+	return 0;
+}
+
+int soctherm_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	soctherm_clk_enable(pdev, false);
+
+	return 0;
+}
+
+int soctherm_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	int err;
+
+	soctherm_clk_enable(pdev, true);
+	err = soctherm_init(pdev);
+	if (err) {
+		dev_err(&pdev->dev,
+			"Resume failed: initialize failed\n");
+		soctherm_clk_enable(pdev, false);
+		return err;
+	}
 
 	return 0;
 }
diff --git a/drivers/thermal/tegra/tegra_soctherm.h b/drivers/thermal/tegra/tegra_soctherm.h
index 1017424e6e85..9b3a55f81fdb 100644
--- a/drivers/thermal/tegra/tegra_soctherm.h
+++ b/drivers/thermal/tegra/tegra_soctherm.h
@@ -111,5 +111,10 @@ int tegra_soctherm_probe(struct platform_device *pdev,
 			 const struct tegra_soctherm_fuse *tfuse);
 int tegra_soctherm_remove(struct platform_device *pdev);
 
+#ifdef CONFIG_PM_SLEEP
+int soctherm_suspend(struct device *dev);
+int soctherm_resume(struct device *dev);
+#endif
+
 #endif
 
-- 
1.9.1
