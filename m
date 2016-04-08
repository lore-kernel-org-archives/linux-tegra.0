From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/5] clk: tegra: dfll: Reference CVB table instead of copying data
Date: Fri,  8 Apr 2016 15:31:34 +0200
Message-ID: <1460122297-14420-2-git-send-email-thierry.reding@gmail.com>
References: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of copying parts of the CVB table into a separate structure,
keep track of the selected CVB table and directly reference data from
it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.c               | 11 ++++++-----
 drivers/clk/tegra/clk-dfll.h               | 10 ++--------
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 23 +++++++++--------------
 3 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 19bfa07e24b1..f010562534eb 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -55,6 +55,7 @@
 #include <linux/seq_file.h>
 
 #include "clk-dfll.h"
+#include "cvb.h"
 
 /*
  * DFLL control registers - access via dfll_{readl,writel}
@@ -442,8 +443,8 @@ static void dfll_tune_low(struct tegra_dfll *td)
 {
 	td->tune_range = DFLL_TUNE_LOW;
 
-	dfll_writel(td, td->soc->tune0_low, DFLL_TUNE0);
-	dfll_writel(td, td->soc->tune1, DFLL_TUNE1);
+	dfll_writel(td, td->soc->cvb->cpu_dfll_data.tune0_low, DFLL_TUNE0);
+	dfll_writel(td, td->soc->cvb->cpu_dfll_data.tune1, DFLL_TUNE1);
 	dfll_wmb(td);
 
 	if (td->soc->set_clock_trimmers_low)
@@ -1449,7 +1450,7 @@ static int dfll_build_i2c_lut(struct tegra_dfll *td)
 	}
 	v_max = dev_pm_opp_get_voltage(opp);
 
-	v = td->soc->min_millivolts * 1000;
+	v = td->soc->cvb->min_millivolts * 1000;
 	lut = find_vdd_map_entry_exact(td, v);
 	if (lut < 0)
 		goto out;
@@ -1461,7 +1462,7 @@ static int dfll_build_i2c_lut(struct tegra_dfll *td)
 			break;
 		v_opp = dev_pm_opp_get_voltage(opp);
 
-		if (v_opp <= td->soc->min_millivolts * 1000)
+		if (v_opp <= td->soc->cvb->min_millivolts * 1000)
 			td->dvco_rate_min = dev_pm_opp_get_freq(opp);
 
 		for (;;) {
@@ -1490,7 +1491,7 @@ static int dfll_build_i2c_lut(struct tegra_dfll *td)
 
 	if (!td->dvco_rate_min)
 		dev_err(td->dev, "no opp above DFLL minimum voltage %d mV\n",
-			td->soc->min_millivolts);
+			td->soc->cvb->min_millivolts);
 	else
 		ret = 0;
 
diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 7e66c07c4d2b..d192982b1f96 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -25,20 +25,14 @@
 /**
  * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
  * @dev: struct device * that holds the OPP table for the DFLL
- * @min_millivolts: minimum voltage (in mV) that the DFLL can operate
- * @tune0_low: DFLL tuning register 0 (low voltage range)
- * @tune0_high: DFLL tuning register 0 (high voltage range)
- * @tune1: DFLL tuning register 1
+ * @cvb: CPU frequency table for this SoC
  * @init_clock_trimmers: callback to initialize clock trimmers
  * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
  * @set_clock_trimmers_low: callback to tune clock trimmers for low voltage
  */
 struct tegra_dfll_soc_data {
 	struct device *dev;
-	unsigned int min_millivolts;
-	u32 tune0_low;
-	u32 tune0_high;
-	u32 tune1;
+	const struct cvb_table *cvb;
 
 	void (*init_clock_trimmers)(void);
 	void (*set_clock_trimmers_high)(void);
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 61253330c12b..6bfa5ca40d02 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -86,7 +86,6 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 {
 	int process_id, speedo_id, speedo_value;
 	struct tegra_dfll_soc_data *soc;
-	const struct cvb_table *cvb;
 
 	process_id = tegra_sku_info.cpu_process_id;
 	speedo_id = tegra_sku_info.cpu_speedo_id;
@@ -108,21 +107,17 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	cvb = tegra_cvb_build_opp_table(tegra124_cpu_cvb_tables,
-					ARRAY_SIZE(tegra124_cpu_cvb_tables),
-					process_id, speedo_id, speedo_value,
-					cpu_max_freq_table[speedo_id],
-					soc->dev);
-	if (IS_ERR(cvb)) {
-		dev_err(&pdev->dev, "couldn't build OPP table: %ld\n",
-			PTR_ERR(cvb));
-		return PTR_ERR(cvb);
+	soc->cvb = tegra_cvb_build_opp_table(tegra124_cpu_cvb_tables,
+					     ARRAY_SIZE(tegra124_cpu_cvb_tables),
+					     process_id, speedo_id, speedo_value,
+					     cpu_max_freq_table[speedo_id],
+					     soc->dev);
+	if (IS_ERR(soc->cvb)) {
+		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
+			PTR_ERR(soc->cvb));
+		return PTR_ERR(soc->cvb);
 	}
 
-	soc->min_millivolts = cvb->min_millivolts;
-	soc->tune0_low = cvb->cpu_dfll_data.tune0_low;
-	soc->tune0_high = cvb->cpu_dfll_data.tune0_high;
-	soc->tune1 = cvb->cpu_dfll_data.tune1;
 
 	return tegra_dfll_register(pdev, soc);
 }
-- 
2.8.0

