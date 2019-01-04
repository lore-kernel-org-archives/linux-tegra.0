From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 06/20] clk: tegra: dfll: CVB calculation alignment with the
 regulator
Date: Fri, 4 Jan 2019 11:06:48 +0800
Message-ID: <20190104030702.8684-7-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The CVB table contains calibration data for the CPU DFLL based on
process characterization. The regulator step and offset parameters depend
on the regulator supplying vdd-cpu, not on the specific Tegra SKU.

When using a PWM controlled regulator, the voltage step and offset are
determined by the regulator type in use. This is specified in DT. When
using an I2C controlled regulator, we can retrieve them from CPU regulator
Then pass this information to the CVB table calculation function.

Based on the work done of "Peter De Schrijver <pdeschrijver@nvidia.com>"
and "Alex Frid <afrid@nvidia.com>".

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
*V4:
 - add ack tags
*V3:
 - remove redundant variable initialization code in get_alignment_from_dt
 - fix the error handling when retuning error from
 get_alignment_from_regulator
*V2:
 - use the updated DT binding string for parsing
 - update the mechanism for geting regulator data from DT (PWM mode) or
 regulator (I2C mode)
---
 drivers/clk/tegra/clk-dfll.h               |  6 ++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 49 +++++++++++++++++++---
 drivers/clk/tegra/cvb.c                    | 12 +++---
 drivers/clk/tegra/cvb.h                    |  6 +--
 4 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index 83352c8078f2..85d0d95223f3 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -1,6 +1,6 @@
 /*
  * clk-dfll.h - prototypes and macros for the Tegra DFLL clocksource driver
- * Copyright (C) 2013 NVIDIA Corporation.  All rights reserved.
+ * Copyright (C) 2013-2019 NVIDIA Corporation.  All rights reserved.
  *
  * Aleksandr Frid <afrid@nvidia.com>
  * Paul Walmsley <pwalmsley@nvidia.com>
@@ -22,11 +22,14 @@
 #include <linux/reset.h>
 #include <linux/types.h>
 
+#include "cvb.h"
+
 /**
  * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
  * @dev: struct device * that holds the OPP table for the DFLL
  * @max_freq: maximum frequency supported on this SoC
  * @cvb: CPU frequency table for this SoC
+ * @alignment: parameters of the regulator step and offset
  * @init_clock_trimmers: callback to initialize clock trimmers
  * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
  * @set_clock_trimmers_low: callback to tune clock trimmers for low voltage
@@ -35,6 +38,7 @@ struct tegra_dfll_soc_data {
 	struct device *dev;
 	unsigned long max_freq;
 	const struct cvb_table *cvb;
+	struct rail_alignment alignment;
 
 	void (*init_clock_trimmers)(void);
 	void (*set_clock_trimmers_high)(void);
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 2bf6a769e5ce..92b83f50a765 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <soc/tegra/fuse.h>
 
 #include "clk.h"
@@ -50,9 +51,6 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
 		.process_id = -1,
 		.min_millivolts = 900,
 		.max_millivolts = 1260,
-		.alignment = {
-			.step_uv = 10000, /* 10mV */
-		},
 		.speedo_scale = 100,
 		.voltage_scale = 1000,
 		.entries = {
@@ -105,11 +103,42 @@ static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
 	{ },
 };
 
+static void get_alignment_from_dt(struct device *dev,
+				  struct rail_alignment *align)
+{
+	if (of_property_read_u32(dev->of_node,
+				 "nvidia,pwm-voltage-step-microvolts",
+				 &align->step_uv))
+		align->step_uv = 0;
+
+	if (of_property_read_u32(dev->of_node,
+				 "nvidia,pwm-min-microvolts",
+				 &align->offset_uv))
+		align->offset_uv = 0;
+}
+
+static int get_alignment_from_regulator(struct device *dev,
+					 struct rail_alignment *align)
+{
+	struct regulator *reg = devm_regulator_get(dev, "vdd-cpu");
+
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	align->offset_uv = regulator_list_voltage(reg, 0);
+	align->step_uv = regulator_get_linear_step(reg);
+
+	devm_regulator_put(reg);
+
+	return 0;
+}
+
 static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 {
 	int process_id, speedo_id, speedo_value, err;
 	struct tegra_dfll_soc_data *soc;
 	const struct dfll_fcpu_data *fcpu_data;
+	struct rail_alignment align;
 
 	fcpu_data = of_device_get_match_data(&pdev->dev);
 	if (!fcpu_data)
@@ -135,12 +164,22 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "nvidia,pwm-to-pmic")) {
+		get_alignment_from_dt(&pdev->dev, &align);
+	} else {
+		err = get_alignment_from_regulator(&pdev->dev, &align);
+		if (err)
+			return err;
+	}
+
 	soc->max_freq = fcpu_data->cpu_max_freq_table[speedo_id];
 
 	soc->cvb = tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tables,
 					   fcpu_data->cpu_cvb_tables_size,
-					   process_id, speedo_id, speedo_value,
-					   soc->max_freq);
+					   &align, process_id, speedo_id,
+					   speedo_value, soc->max_freq);
+	soc->alignment = align;
+
 	if (IS_ERR(soc->cvb)) {
 		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
 			PTR_ERR(soc->cvb));
diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index da9e8e7b5ce5..35eeb6adc68e 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -1,7 +1,7 @@
 /*
  * Utility functions for parsing Tegra CVB voltage tables
  *
- * Copyright (C) 2012-2014 NVIDIA Corporation.  All rights reserved.
+ * Copyright (C) 2012-2019 NVIDIA Corporation.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -62,9 +62,9 @@ static int round_voltage(int mv, const struct rail_alignment *align, int up)
 }
 
 static int build_opp_table(struct device *dev, const struct cvb_table *table,
+			   struct rail_alignment *align,
 			   int speedo_value, unsigned long max_freq)
 {
-	const struct rail_alignment *align = &table->alignment;
 	int i, ret, dfll_mv, min_mv, max_mv;
 
 	min_mv = round_voltage(table->min_millivolts, align, UP);
@@ -109,8 +109,9 @@ static int build_opp_table(struct device *dev, const struct cvb_table *table,
  */
 const struct cvb_table *
 tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *tables,
-			size_t count, int process_id, int speedo_id,
-			int speedo_value, unsigned long max_freq)
+			size_t count, struct rail_alignment *align,
+			int process_id, int speedo_id, int speedo_value,
+			unsigned long max_freq)
 {
 	size_t i;
 	int ret;
@@ -124,7 +125,8 @@ tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *tables,
 		if (table->process_id != -1 && table->process_id != process_id)
 			continue;
 
-		ret = build_opp_table(dev, table, speedo_value, max_freq);
+		ret = build_opp_table(dev, table, align, speedo_value,
+				      max_freq);
 		return ret ? ERR_PTR(ret) : table;
 	}
 
diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
index c1f077993b2a..bcf15a089b93 100644
--- a/drivers/clk/tegra/cvb.h
+++ b/drivers/clk/tegra/cvb.h
@@ -49,7 +49,6 @@ struct cvb_table {
 
 	int min_millivolts;
 	int max_millivolts;
-	struct rail_alignment alignment;
 
 	int speedo_scale;
 	int voltage_scale;
@@ -59,8 +58,9 @@ struct cvb_table {
 
 const struct cvb_table *
 tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *cvb_tables,
-			size_t count, int process_id, int speedo_id,
-			int speedo_value, unsigned long max_freq);
+			size_t count, struct rail_alignment *align,
+			int process_id, int speedo_id, int speedo_value,
+			unsigned long max_freq);
 void tegra_cvb_remove_opp_table(struct device *dev,
 				const struct cvb_table *table,
 				unsigned long max_freq);
-- 
2.20.1
