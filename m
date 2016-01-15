From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V2 09/11] thermal: tegra: add PM support
Date: Fri, 15 Jan 2016 18:26:38 +0800
Message-ID: <1452853598-5343-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, rui.zhang@intel.com
Cc: MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add suspend/resume function in soctherm driver.
And enable it for Tegra124 and Tegra210.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/tegra/soctherm.c | 161 +++++++++++++++++++++++++++------------
 1 file changed, 112 insertions(+), 49 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a14935c91695..cc8ab437f985 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -91,17 +91,11 @@ struct tegra_soctherm {
 	struct tegra_soctherm_soc *soc;
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
@@ -113,8 +107,6 @@ static int enable_tsensor(struct tegra_soctherm *tegra,
 	writel(val, base + SENSOR_CONFIG1);
 
 	writel(sensor->calib, base + SENSOR_CONFIG2);
-
-	return 0;
 }
 
 /*
@@ -534,6 +526,75 @@ static inline void soctherm_debug_init(struct platform_device *pdev)
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
+	struct tegra_tsensor *tsensors = tegra->soc->tsensors;
+	const struct tegra_tsensor_group **ttgs = tegra->soc->ttgs;
+	int i, err;
+	u32 pdiv, hotspot;
+
+	/* Initialize raw sensors */
+	for (i = 0; i < tegra->soc->num_tsensors; ++i)
+		enable_tsensor(tegra, tsensors + i);
+
+	/* Wait for sensor data to be ready */
+	usleep_range(1000, 5000);
+
+	/* program pdiv and hotspot offsets per THERM */
+	pdiv = readl(tegra->regs + SENSOR_PDIV);
+	hotspot = readl(tegra->regs + SENSOR_HOTSPOT_OFF);
+	for (i = 0; i < tegra->soc->num_ttgs; ++i) {
+		pdiv = REG_SET_MASK(pdiv, ttgs[i]->pdiv_mask,
+				    ttgs[i]->pdiv);
+		if (ttgs[i]->id == TEGRA124_SOCTHERM_SENSOR_PLLX)
+			continue;
+		hotspot =  REG_SET_MASK(hotspot,
+					ttgs[i]->pllx_hotspot_mask,
+					ttgs[i]->pllx_hotspot_diff);
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
 static const struct of_device_id tegra_soctherm_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
 	{
@@ -561,7 +622,6 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	struct tegra_soctherm_soc *soc;
 	unsigned int i;
 	int err;
-	u32 pdiv, hotspot;
 
 	match = of_match_node(tegra_soctherm_of_match, pdev->dev.of_node);
 	if (!match)
@@ -602,51 +662,27 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
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
 	err = tegra_soctherm_calculate_shared_calibration(soc->tfuse,
 							  &shared_calib);
 	if (err)
 		goto disable_clocks;
 
+	/* calculate tsensor calibaration data */
 	for (i = 0; i < soc->num_tsensors; ++i) {
-		err = enable_tsensor(tegra, &soc->tsensors[i], &shared_calib);
+		err = tegra_soctherm_calculate_tsensor_calibration(
+							&soc->tsensors[i],
+							&shared_calib);
 		if (err)
 			goto disable_clocks;
 	}
 
-
-	/* program pdiv and hotspot offsets per THERM */
-	pdiv = readl(tegra->regs + SENSOR_PDIV);
-	hotspot = readl(tegra->regs + SENSOR_HOTSPOT_OFF);
-	for (i = 0; i < soc->num_ttgs; ++i) {
-		pdiv = REG_SET_MASK(pdiv, soc->ttgs[i]->pdiv_mask,
-				    soc->ttgs[i]->pdiv);
-		if (soc->ttgs[i]->id == TEGRA124_SOCTHERM_SENSOR_PLLX)
-			continue;
-		hotspot =  REG_SET_MASK(hotspot,
-					soc->ttgs[i]->pllx_hotspot_mask,
-					soc->ttgs[i]->pllx_hotspot_diff);
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
 
 	for (i = 0; i < soc->num_ttgs; ++i) {
 		struct tegra_thermctl_zone *zone =
@@ -682,8 +718,7 @@ unregister_tzs:
 						  tegra->thermctl_tzs[i]);
 
 disable_clocks:
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
 
 	return err;
 }
@@ -698,17 +733,45 @@ static int tegra_soctherm_remove(struct platform_device *pdev)
 						  tegra->thermctl_tzs[i]);
 	}
 
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
+
+	return 0;
+}
+
+static int soctherm_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	soctherm_clk_enable(pdev, false);
 
 	return 0;
 }
 
+static int soctherm_resume(struct device *dev)
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
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tegra_soctherm_pm, soctherm_suspend, soctherm_resume);
+
 static struct platform_driver tegra_soctherm_driver = {
 	.probe = tegra_soctherm_probe,
 	.remove = tegra_soctherm_remove,
 	.driver = {
 		.name = "tegra_soctherm",
+		.pm = &tegra_soctherm_pm,
 		.of_match_table = tegra_soctherm_of_match,
 	},
 };
-- 
1.9.1
