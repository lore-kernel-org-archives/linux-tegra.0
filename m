From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/5] clk: tegra: dfll: Properly clean up on failure and removal
Date: Fri,  8 Apr 2016 15:31:36 +0200
Message-ID: <1460122297-14420-4-git-send-email-thierry.reding@gmail.com>
References: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Upon failure to probe the DFLL, the OPP table will not be cleaned up
properly. Fix this and while at it make sure the OPP table will also be
cleared upon driver removal.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-dfll.h               |  2 ++
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 31 ++++++++++++++++++++++++++----
 drivers/clk/tegra/cvb.c                    | 16 +++++++++++++++
 drivers/clk/tegra/cvb.h                    |  3 +++
 4 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
index d192982b1f96..ed2ad888268f 100644
--- a/drivers/clk/tegra/clk-dfll.h
+++ b/drivers/clk/tegra/clk-dfll.h
@@ -25,6 +25,7 @@
 /**
  * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
  * @dev: struct device * that holds the OPP table for the DFLL
+ * @max_freq: maximum frequency supported on this SoC
  * @cvb: CPU frequency table for this SoC
  * @init_clock_trimmers: callback to initialize clock trimmers
  * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
@@ -32,6 +33,7 @@
  */
 struct tegra_dfll_soc_data {
 	struct device *dev;
+	unsigned long max_freq;
 	const struct cvb_table *cvb;
 
 	void (*init_clock_trimmers)(void);
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index c7ffd4fd2231..d052d9fa8230 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -84,7 +84,7 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
 
 static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 {
-	int process_id, speedo_id, speedo_value;
+	int process_id, speedo_id, speedo_value, err;
 	struct tegra_dfll_soc_data *soc;
 
 	process_id = tegra_sku_info.cpu_process_id;
@@ -107,18 +107,41 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	soc->max_freq = cpu_max_freq_table[speedo_id];
+
 	soc->cvb = tegra_cvb_add_opp_table(soc->dev, tegra124_cpu_cvb_tables,
 					   ARRAY_SIZE(tegra124_cpu_cvb_tables),
 					   process_id, speedo_id, speedo_value,
-					   cpu_max_freq_table[speedo_id]);
+					   soc->max_freq);
 	if (IS_ERR(soc->cvb)) {
 		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
 			PTR_ERR(soc->cvb));
 		return PTR_ERR(soc->cvb);
 	}
 
+	err = tegra_dfll_register(pdev, soc);
+	if (err < 0) {
+		tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, soc);
+
+	return 0;
+}
+
+static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
+{
+	struct tegra_dfll_soc_data *soc = platform_get_drvdata(pdev);
+	int err;
+
+	err = tegra_dfll_unregister(pdev);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to unregister DFLL: %d\n", err);
+
+	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-	return tegra_dfll_register(pdev, soc);
+	return 0;
 }
 
 static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
@@ -134,7 +157,7 @@ static const struct dev_pm_ops tegra124_dfll_pm_ops = {
 
 static struct platform_driver tegra124_dfll_fcpu_driver = {
 	.probe = tegra124_dfll_fcpu_probe,
-	.remove = tegra_dfll_unregister,
+	.remove = tegra124_dfll_fcpu_remove,
 	.driver = {
 		.name = "tegra124-dfll",
 		.of_match_table = tegra124_dfll_fcpu_of_match,
diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index 7a099b18c368..624115e82ff9 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -130,3 +130,19 @@ tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *tables,
 
 	return ERR_PTR(-EINVAL);
 }
+
+void tegra_cvb_remove_opp_table(struct device *dev,
+				const struct cvb_table *table,
+				unsigned long max_freq)
+{
+	unsigned int i;
+
+	for (i = 0; i < MAX_DVFS_FREQS; i++) {
+		const struct cvb_table_freq_entry *entry = &table->entries[i];
+
+		if (!entry->freq || (entry->freq > max_freq))
+			break;
+
+		dev_pm_opp_remove(dev, entry->freq);
+	}
+}
diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
index e6bf8581badd..c1f077993b2a 100644
--- a/drivers/clk/tegra/cvb.h
+++ b/drivers/clk/tegra/cvb.h
@@ -61,5 +61,8 @@ const struct cvb_table *
 tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *cvb_tables,
 			size_t count, int process_id, int speedo_id,
 			int speedo_value, unsigned long max_freq);
+void tegra_cvb_remove_opp_table(struct device *dev,
+				const struct cvb_table *table,
+				unsigned long max_freq);
 
 #endif
-- 
2.8.0

