From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v6 10/12] thermal: tegra: add PM support
Date: Mon, 22 Feb 2016 16:12:23 +0800
Message-ID: <1456128743-29194-1-git-send-email-wni@nvidia.com>
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
 drivers/thermal/tegra/soctherm.c | 168 +++++++++++++++++++++++++++------------
 1 file changed, 117 insertions(+), 51 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 86c8ed8048f8..26f895b5d624 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -96,19 +96,11 @@ struct tegra_soctherm {
 	struct dentry *debugfs_dir;
 };
 
-static int enable_tsensor(struct tegra_soctherm *tegra,
-			  unsigned int i,
-			  const struct tsensor_shared_calib *shared)
+static void enable_tsensor(struct tegra_soctherm *tegra, unsigned int i)
 {
 	const struct tegra_tsensor *sensor = &tegra->soc->tsensors[i];
 	void __iomem *base = tegra->regs + sensor->base;
-	u32 *calib = &tegra->calib[i];
 	unsigned int val;
-	int err;
-
-	err = tegra_calc_tsensor_calib(sensor, shared, calib);
-	if (err)
-		return err;
 
 	val = sensor->config->tall << SENSOR_CONFIG0_TALL_SHIFT;
 	writel(val, base + SENSOR_CONFIG0);
@@ -119,9 +111,7 @@ static int enable_tsensor(struct tegra_soctherm *tegra,
 	val |= SENSOR_CONFIG1_TEMP_ENABLE;
 	writel(val, base + SENSOR_CONFIG1);
 
-	writel(*calib, base + SENSOR_CONFIG2);
-
-	return 0;
+	writel(tegra->calib[i], base + SENSOR_CONFIG2);
 }
 
 /*
@@ -426,6 +416,69 @@ static inline void soctherm_debug_init(struct platform_device *pdev)
 }
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
+static void soctherm_init(struct platform_device *pdev)
+{
+	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
+	const struct tegra_tsensor_group **ttgs = tegra->soc->ttgs;
+	int i;
+	u32 pdiv, hotspot;
+
+	/* Initialize raw sensors */
+	for (i = 0; i < tegra->soc->num_tsensors; ++i)
+		enable_tsensor(tegra, i);
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
+}
+
 static const struct of_device_id tegra_soctherm_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
 	{
@@ -453,7 +506,6 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	struct tegra_soctherm_soc *soc;
 	unsigned int i;
 	int err;
-	u32 pdiv, hotspot;
 
 	match = of_match_node(tegra_soctherm_of_match, pdev->dev.of_node);
 	if (!match)
@@ -494,52 +546,31 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
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
 	tegra->calib = devm_kzalloc(&pdev->dev,
 				    sizeof(u32) * soc->num_tsensors,
 				    GFP_KERNEL);
 	if (!tegra->calib)
 		return -ENOMEM;
 
+	/* calculate shared calibration data */
 	err = tegra_calc_shared_calib(soc->tfuse, &shared_calib);
 	if (err)
-		goto disable_clocks;
+		return err;
 
+	/* calculate tsensor calibaration data */
 	for (i = 0; i < soc->num_tsensors; ++i) {
-		err = enable_tsensor(tegra, i, &shared_calib);
+		err = tegra_calc_tsensor_calib(&soc->tsensors[i],
+					       &shared_calib,
+					       &tegra->calib[i]);
 		if (err)
-			goto disable_clocks;
+			return err;
 	}
 
-	/* Program pdiv and hotspot offsets per THERM */
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
-	}
-	writel(pdiv, tegra->regs + SENSOR_PDIV);
-	writel(hotspot, tegra->regs + SENSOR_HOTSPOT_OFF);
+	err = soctherm_clk_enable(pdev, true);
+	if (err)
+		return err;
+
+	soctherm_init(pdev);
 
 	for (i = 0; i < soc->num_ttgs; ++i) {
 		struct tegra_thermctl_zone *zone =
@@ -579,9 +610,7 @@ unregister_tzs:
 		thermal_zone_of_sensor_unregister(&pdev->dev,
 						  tegra->thermctl_tzs[i]);
 
-disable_clocks:
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
 
 	return err;
 }
@@ -598,17 +627,54 @@ static int tegra_soctherm_remove(struct platform_device *pdev)
 						  tegra->thermctl_tzs[i]);
 	}
 
-	clk_disable_unprepare(tegra->clock_tsensor);
-	clk_disable_unprepare(tegra->clock_soctherm);
+	soctherm_clk_enable(pdev, false);
 
 	return 0;
 }
 
+static int soctherm_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	soctherm_clk_enable(pdev, false);
+
+	return 0;
+}
+
+static int soctherm_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct tegra_soctherm *tegra = platform_get_drvdata(pdev);
+	struct tegra_soctherm_soc *soc = tegra->soc;
+	int err, i;
+
+	err = soctherm_clk_enable(pdev, true);
+	if (err) {
+		dev_err(&pdev->dev,
+			"Resume failed: enable clocks failed\n");
+		return err;
+	}
+
+	soctherm_init(pdev);
+
+	for (i = 0; i < soc->num_ttgs; ++i) {
+		struct thermal_zone_device *tz;
+
+		tz = tegra->thermctl_tzs[soc->ttgs[i]->id];
+		tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);
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
