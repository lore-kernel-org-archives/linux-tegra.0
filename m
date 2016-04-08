From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] clk: tegra: dfll: Make code more comprehensible
Date: Fri,  8 Apr 2016 15:31:35 +0200
Message-ID: <1460122297-14420-3-git-send-email-thierry.reding@gmail.com>
References: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460122297-14420-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rename some variables and structure fields to make the code more
comprehensible. Also change the prototype of internal functions to be
more in line with the OPP core functions.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 11 +++---
 drivers/clk/tegra/cvb.c                    | 55 +++++++++++++++---------------
 drivers/clk/tegra/cvb.h                    | 12 +++----
 3 files changed, 37 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 6bfa5ca40d02..c7ffd4fd2231 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -47,7 +47,7 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
 		},
 		.speedo_scale = 100,
 		.voltage_scale = 1000,
-		.cvb_table = {
+		.entries = {
 			{204000000UL,   {1112619, -29295, 402} },
 			{306000000UL,	{1150460, -30585, 402} },
 			{408000000UL,	{1190122, -31865, 402} },
@@ -107,11 +107,10 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	soc->cvb = tegra_cvb_build_opp_table(tegra124_cpu_cvb_tables,
-					     ARRAY_SIZE(tegra124_cpu_cvb_tables),
-					     process_id, speedo_id, speedo_value,
-					     cpu_max_freq_table[speedo_id],
-					     soc->dev);
+	soc->cvb = tegra_cvb_add_opp_table(soc->dev, tegra124_cpu_cvb_tables,
+					   ARRAY_SIZE(tegra124_cpu_cvb_tables),
+					   process_id, speedo_id, speedo_value,
+					   cpu_max_freq_table[speedo_id]);
 	if (IS_ERR(soc->cvb)) {
 		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
 			PTR_ERR(soc->cvb));
diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index 69c74eec3a4b..7a099b18c368 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -61,29 +61,28 @@ static int round_voltage(int mv, const struct rail_alignment *align, int up)
 	return mv;
 }
 
-static int build_opp_table(const struct cvb_table *d,
-			   int speedo_value,
-			   unsigned long max_freq,
-			   struct device *opp_dev)
+static int build_opp_table(struct device *dev, const struct cvb_table *table,
+			   int speedo_value, unsigned long max_freq)
 {
+	const struct rail_alignment *align = &table->alignment;
 	int i, ret, dfll_mv, min_mv, max_mv;
-	const struct cvb_table_freq_entry *table = NULL;
-	const struct rail_alignment *align = &d->alignment;
 
-	min_mv = round_voltage(d->min_millivolts, align, UP);
-	max_mv = round_voltage(d->max_millivolts, align, DOWN);
+	min_mv = round_voltage(table->min_millivolts, align, UP);
+	max_mv = round_voltage(table->max_millivolts, align, DOWN);
 
 	for (i = 0; i < MAX_DVFS_FREQS; i++) {
-		table = &d->cvb_table[i];
-		if (!table->freq || (table->freq > max_freq))
+		const struct cvb_table_freq_entry *entry = &table->entries[i];
+
+		if (!entry->freq || (entry->freq > max_freq))
 			break;
 
-		dfll_mv = get_cvb_voltage(
-			speedo_value, d->speedo_scale, &table->coefficients);
-		dfll_mv = round_cvb_voltage(dfll_mv, d->voltage_scale, align);
+		dfll_mv = get_cvb_voltage(speedo_value, table->speedo_scale,
+					  &entry->coefficients);
+		dfll_mv = round_cvb_voltage(dfll_mv, table->voltage_scale,
+					    align);
 		dfll_mv = clamp(dfll_mv, min_mv, max_mv);
 
-		ret = dev_pm_opp_add(opp_dev, table->freq, dfll_mv * 1000);
+		ret = dev_pm_opp_add(dev, entry->freq, dfll_mv * 1000);
 		if (ret)
 			return ret;
 	}
@@ -92,7 +91,7 @@ static int build_opp_table(const struct cvb_table *d,
 }
 
 /**
- * tegra_cvb_build_opp_table - build OPP table from Tegra CVB tables
+ * tegra_cvb_add_opp_table - build OPP table from Tegra CVB tables
  * @cvb_tables: array of CVB tables
  * @sz: size of the previously mentioned array
  * @process_id: process id of the HW module
@@ -108,25 +107,25 @@ static int build_opp_table(const struct cvb_table *d,
  * given @opp_dev. Returns a pointer to the struct cvb_table that matched
  * or an ERR_PTR on failure.
  */
-const struct cvb_table *tegra_cvb_build_opp_table(
-		const struct cvb_table *cvb_tables,
-		size_t sz, int process_id,
-		int speedo_id, int speedo_value,
-		unsigned long max_rate,
-		struct device *opp_dev)
+const struct cvb_table *
+tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *tables,
+			size_t count, int process_id, int speedo_id,
+			int speedo_value, unsigned long max_freq)
 {
-	int i, ret;
+	size_t i;
+	int ret;
 
-	for (i = 0; i < sz; i++) {
-		const struct cvb_table *d = &cvb_tables[i];
+	for (i = 0; i < count; i++) {
+		const struct cvb_table *table = &tables[i];
 
-		if (d->speedo_id != -1 && d->speedo_id != speedo_id)
+		if (table->speedo_id != -1 && table->speedo_id != speedo_id)
 			continue;
-		if (d->process_id != -1 && d->process_id != process_id)
+
+		if (table->process_id != -1 && table->process_id != process_id)
 			continue;
 
-		ret = build_opp_table(d, speedo_value, max_rate, opp_dev);
-		return ret ? ERR_PTR(ret) : d;
+		ret = build_opp_table(dev, table, speedo_value, max_freq);
+		return ret ? ERR_PTR(ret) : table;
 	}
 
 	return ERR_PTR(-EINVAL);
diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
index f62cdc4f4234..e6bf8581badd 100644
--- a/drivers/clk/tegra/cvb.h
+++ b/drivers/clk/tegra/cvb.h
@@ -53,15 +53,13 @@ struct cvb_table {
 
 	int speedo_scale;
 	int voltage_scale;
-	struct cvb_table_freq_entry cvb_table[MAX_DVFS_FREQS];
+	struct cvb_table_freq_entry entries[MAX_DVFS_FREQS];
 	struct cvb_cpu_dfll_data cpu_dfll_data;
 };
 
-const struct cvb_table *tegra_cvb_build_opp_table(
-		const struct cvb_table *cvb_tables,
-		size_t sz, int process_id,
-		int speedo_id, int speedo_value,
-		unsigned long max_rate,
-		struct device *opp_dev);
+const struct cvb_table *
+tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *cvb_tables,
+			size_t count, int process_id, int speedo_id,
+			int speedo_value, unsigned long max_freq);
 
 #endif
-- 
2.8.0
