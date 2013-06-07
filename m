From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 08:06:56 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Andrew Chew <achew@nvidia.com>, Matthew Longnecker <mlongnecker@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


Add regulator_get_linear_step(), which returns the voltage step size
between VSEL values for linear regulators.  This is intended for use
by regulator consumers which build their own voltage-to-VSEL tables.

Signed-off-by: Paul Walmsley <pwalmsley@nvidia.com>
Reviewed-by: Andrew Chew <achew@nvidia.com>
Cc: Matthew Longnecker <mlongnecker@nvidia.com>
---

Applies on v3.10-rc4.  Will be used by the upcoming Tegra DFLL clocksource 
driver, which will build its own table of voltage-to-VSEL values by 
querying the regulator framework.

 drivers/regulator/core.c           |   15 +++++++++++++++
 include/linux/regulator/consumer.h |    1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6e50178..f07d7ad 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2135,6 +2135,21 @@ int regulator_list_voltage(struct regulator *regulator, unsigned selector)
 EXPORT_SYMBOL_GPL(regulator_list_voltage);
 
 /**
+ * regulator_get_linear_step - return the voltage step size between VSEL values
+ * @regulator: regulator source
+ *
+ * Returns the voltage step size between VSEL values for linear
+ * regulators, or return 0 if the regulator isn't a linear regulator.
+ */
+unsigned int regulator_get_linear_step(struct regulator *regulator)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+
+	return rdev->desc->uV_step;
+}
+EXPORT_SYMBOL_GPL(regulator_get_linear_step);
+
+/**
  * regulator_is_supported_voltage - check if a voltage range can be supported
  *
  * @regulator: Regulator to check.
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 145022a..3a76389c 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -165,6 +165,7 @@ int regulator_count_voltages(struct regulator *regulator);
 int regulator_list_voltage(struct regulator *regulator, unsigned selector);
 int regulator_is_supported_voltage(struct regulator *regulator,
 				   int min_uV, int max_uV);
+unsigned int regulator_get_linear_step(struct regulator *regulator);
 int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV);
 int regulator_set_voltage_time(struct regulator *regulator,
 			       int old_uV, int new_uV);
-- 
1.7.10.4
