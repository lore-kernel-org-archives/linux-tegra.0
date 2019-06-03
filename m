From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/8] regulator: core: Parse max-spread value per regulator couple
Date: Tue,  4 Jun 2019 02:58:58 +0300
Message-ID: <20190603235904.19097-3-digetx@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603235904.19097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Parse and validate max-spread value per regulator couple. Now regulator
core can take multiple regulator couples, although balancing is still
limited to a single couple.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c          | 13 ++++----
 drivers/regulator/of_regulator.c  | 49 +++++++++++++++++++++----------
 include/linux/regulator/machine.h |  3 +-
 3 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3b2d10a46bb5..c148dd7d306e 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3435,7 +3435,7 @@ static int regulator_get_optimal_voltage(struct regulator_dev *rdev,
 	struct coupling_desc *c_desc = &rdev->coupling_desc;
 	struct regulator_dev **c_rdevs = c_desc->coupled_rdevs;
 	struct regulation_constraints *constraints = rdev->constraints;
-	int max_spread = constraints->max_spread;
+	int max_spread = constraints->max_spread[0];
 	int desired_min_uV = 0, desired_max_uV = INT_MAX;
 	int max_current_uV = 0, min_current_uV = INT_MAX;
 	int highest_min_uV = 0, target_uV, possible_uV;
@@ -3597,6 +3597,12 @@ static int regulator_balance_voltage(struct regulator_dev *rdev,
 	if (coupler && coupler->balance_voltage)
 		return coupler->balance_voltage(coupler, rdev, state);
 
+	if (n_coupled > 2) {
+		rdev_err(rdev,
+			 "Voltage balancing for multiple regulator couples is unimplemented\n");
+		return -EPERM;
+	}
+
 	for (i = 0; i < n_coupled; i++)
 		c_rdev_done[i] = false;
 
@@ -4849,11 +4855,6 @@ static int regulator_init_coupling(struct regulator_dev *rdev)
 		return -EPERM;
 	}
 
-	if (rdev->constraints->max_spread <= 0) {
-		rdev_err(rdev, "wrong max_spread value\n");
-		return -EPERM;
-	}
-
 	if (!of_check_coupling_data(rdev))
 		return -EPERM;
 
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 0ead1164e4d6..41cf8819f60a 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -30,8 +30,14 @@ static void of_get_regulation_constraints(struct device_node *np,
 	struct device_node *suspend_np;
 	unsigned int mode;
 	int ret, i, len;
+	int n_phandles;
+	u32 pvals[MAX_COUPLED];
 	u32 pval;
 
+	n_phandles = of_count_phandle_with_args(np, "regulator-coupled-with",
+						NULL);
+	n_phandles = max(n_phandles, 0);
+
 	constraints->name = of_get_property(np, "regulator-name", NULL);
 
 	if (!of_property_read_u32(np, "regulator-min-microvolt", &pval))
@@ -163,9 +169,12 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!of_property_read_u32(np, "regulator-system-load", &pval))
 		constraints->system_load = pval;
 
-	if (!of_property_read_u32(np, "regulator-coupled-max-spread",
-				  &pval))
-		constraints->max_spread = pval;
+	if (!of_property_read_u32_array(np, "regulator-coupled-max-spread",
+					pvals, n_phandles)) {
+
+		for (i = 0; i < n_phandles; i++)
+			constraints->max_spread[i] = pvals[i];
+	}
 
 	if (!of_property_read_u32(np, "regulator-max-step-microvolt",
 				  &pval))
@@ -473,7 +482,8 @@ int of_get_n_coupled(struct regulator_dev *rdev)
 
 /* Looks for "to_find" device_node in src's "regulator-coupled-with" property */
 static bool of_coupling_find_node(struct device_node *src,
-				  struct device_node *to_find)
+				  struct device_node *to_find,
+				  int *index)
 {
 	int n_phandles, i;
 	bool found = false;
@@ -495,8 +505,10 @@ static bool of_coupling_find_node(struct device_node *src,
 
 		of_node_put(tmp);
 
-		if (found)
+		if (found) {
+			*index = i;
 			break;
+		}
 	}
 
 	return found;
@@ -517,22 +529,28 @@ static bool of_coupling_find_node(struct device_node *src,
  */
 bool of_check_coupling_data(struct regulator_dev *rdev)
 {
-	int max_spread = rdev->constraints->max_spread;
 	struct device_node *node = rdev->dev.of_node;
 	int n_phandles = of_get_n_coupled(rdev);
 	struct device_node *c_node;
+	int index;
 	int i;
 	bool ret = true;
 
-	if (max_spread <= 0) {
-		dev_err(&rdev->dev, "max_spread value invalid\n");
+	if (n_phandles >= MAX_COUPLED) {
+		dev_err(&rdev->dev, "please bump MAX_COUPLED number\n");
 		return false;
 	}
 
 	/* iterate over rdev's phandles */
 	for (i = 0; i < n_phandles; i++) {
+		int max_spread = rdev->constraints->max_spread[i];
 		int c_max_spread, c_n_phandles;
 
+		if (max_spread <= 0) {
+			dev_err(&rdev->dev, "max_spread value invalid\n");
+			return false;
+		}
+
 		c_node = of_parse_phandle(node,
 					  "regulator-coupled-with", i);
 
@@ -549,22 +567,23 @@ bool of_check_coupling_data(struct regulator_dev *rdev)
 			goto clean;
 		}
 
-		if (of_property_read_u32(c_node, "regulator-coupled-max-spread",
-					 &c_max_spread)) {
+		if (!of_coupling_find_node(c_node, node, &index)) {
+			dev_err(&rdev->dev, "missing 2-way linking for coupled regulators\n");
 			ret = false;
 			goto clean;
 		}
 
-		if (c_max_spread != max_spread) {
-			dev_err(&rdev->dev,
-				"coupled regulators max_spread mismatch\n");
+		if (of_property_read_u32_index(c_node, "regulator-coupled-max-spread",
+					       index, &c_max_spread)) {
 			ret = false;
 			goto clean;
 		}
 
-		if (!of_coupling_find_node(c_node, node)) {
-			dev_err(&rdev->dev, "missing 2-way linking for coupled regulators\n");
+		if (c_max_spread != max_spread) {
+			dev_err(&rdev->dev,
+				"coupled regulators max_spread mismatch\n");
 			ret = false;
+			goto clean;
 		}
 
 clean:
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 1d34a70ffda2..53830d0c0b6f 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_REGULATOR_MACHINE_H_
 #define __LINUX_REGULATOR_MACHINE_H_
 
+#include <linux/regulator/driver.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 
@@ -156,7 +157,7 @@ struct regulation_constraints {
 	int system_load;
 
 	/* used for coupled regulators */
-	int max_spread;
+	int max_spread[MAX_COUPLED];
 
 	/* used for changing voltage in steps */
 	int max_uV_step;
-- 
2.21.0
