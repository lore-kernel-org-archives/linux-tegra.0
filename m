From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 01/11] regulator: core: add API to get voltage constraints
Date: Tue, 6 Feb 2018 18:34:02 +0200
Message-ID: <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517934852-23255-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add API to get min/max rail voltage configured from platform for
given rails.

Changes to the commit message by
Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c           | 31 +++++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index be767dd..c498774 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3246,6 +3246,37 @@ int regulator_get_voltage(struct regulator *regulator)
 EXPORT_SYMBOL_GPL(regulator_get_voltage);
 
 /**
+ * regulator_get_constraint_voltages - get platform specific constraint voltage,
+ * @regulator: regulator source
+ * @min_uV: Minimum microvolts.
+ * @max_uV: Maximum microvolts.
+ *
+ * This returns the current regulator voltage in uV.
+ *
+ * NOTE: If the regulator is disabled it will return the voltage value. This
+ * function should not be used to determine regulator state.
+ */
+
+int regulator_get_constraint_voltages(struct regulator *regulator,
+	int *min_uV, int *max_uV)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+
+	if (rdev->desc && rdev->desc->fixed_uV && rdev->desc->n_voltages == 1) {
+		*min_uV = rdev->desc->fixed_uV;
+		*max_uV = rdev->desc->fixed_uV;
+		return 0;
+	}
+	if (rdev->constraints) {
+		*min_uV = rdev->constraints->min_uV;
+		*max_uV = rdev->constraints->max_uV;
+		return 0;
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(regulator_get_constraint_voltages);
+
+/**
  * regulator_set_current_limit - set regulator output current limit
  * @regulator: regulator source
  * @min_uA: Minimum supported current in uA
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index df176d7..d3f495a 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -250,6 +250,8 @@ int regulator_is_supported_voltage(struct regulator *regulator,
 int regulator_set_voltage_time(struct regulator *regulator,
 			       int old_uV, int new_uV);
 int regulator_get_voltage(struct regulator *regulator);
+int regulator_get_constraint_voltages(struct regulator *regulator,
+	int *min_uV, int *max_uV);
 int regulator_sync_voltage(struct regulator *regulator);
 int regulator_set_current_limit(struct regulator *regulator,
 			       int min_uA, int max_uA);
-- 
1.9.1
