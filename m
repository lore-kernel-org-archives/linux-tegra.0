From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler for Tegra20
Date: Sun, 14 Apr 2019 20:59:38 +0300
Message-ID: <20190414175939.12368-6-digetx@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414175939.12368-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add regulators coupler for Tegra20 SoC's that performs voltage balancing
of a coupled regulators and thus provides voltage scaling functionality.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig              |   6 +
 drivers/soc/tegra/Makefile             |   1 +
 drivers/soc/tegra/regulators-tegra20.c | 304 +++++++++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index a0b03443d8c1..545c0da2e069 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -133,3 +133,9 @@ config SOC_TEGRA_POWERGATE_BPMP
 	def_bool y
 	depends on PM_GENERIC_DOMAINS
 	depends on TEGRA_BPMP
+
+config SOC_TEGRA20_VOLTAGE_COUPLER
+	bool "Voltage scaling support for Tegra20 SoC's"
+	def_bool y
+	depends on ARCH_TEGRA_2x_SOC
+	depends on REGULATOR
diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index 902759fe5f4d..9f0bdd53bef8 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -5,3 +5,4 @@ obj-y += common.o
 obj-$(CONFIG_SOC_TEGRA_FLOWCTRL) += flowctrl.o
 obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
 obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
+obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
new file mode 100644
index 000000000000..3f005b804af3
--- /dev/null
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Voltage regulators coupling resolver for NVIDIA Tegra20
+ *
+ * Author: Dmitry Osipenko <digetx@gmail.com>
+ */
+
+#define pr_fmt(fmt)	"tegra voltage-coupler: " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+struct tegra_regulators_coupler {
+	struct regulators_coupler coupler;
+	int core_min_uV;
+};
+
+static const char * const cpu_names[] = {
+	"vdd_sys_sm0,vdd_core",
+	"+1.0vs_sm1,vdd_cpu",
+	"vdd_sm1,vdd_cpu",
+	"VDD_CPU_1.0V",
+	"vdd_cpu",
+};
+
+static const char * const core_names[] = {
+	"vdd_sys_sm1,vdd_cpu",
+	"+1.2vs_sm0,vdd_core",
+	"vdd_sm0,vdd_core",
+	"VDD_CORE_1.2V",
+	"vdd_core",
+};
+
+static const char * const rtc_names[] = {
+	"+1.2vs_ldo2,vdd_rtc",
+	"vdd_ldo2,vdd_rtc",
+	"VDD_RTC_1.2V",
+	"vdd_rtc",
+};
+
+static inline struct tegra_regulators_coupler *
+to_tegra_coupler(struct regulators_coupler *coupler)
+{
+	return container_of(coupler, struct tegra_regulators_coupler, coupler);
+}
+
+static int tegra20_core_limit(struct tegra_regulators_coupler *tegra,
+			      struct regulator_dev *core_rdev,
+			      struct regulator_dev *rtc_rdev)
+{
+	int core_min_uV;
+
+	if (tegra->core_min_uV > 0)
+		return tegra->core_min_uV;
+
+	core_min_uV = regulator_get_voltage_rdev(core_rdev);
+	if (core_min_uV > 0) {
+		pr_info("core minimum voltage limited to %duV\n", core_min_uV);
+		tegra->core_min_uV = core_min_uV;
+	}
+
+	return core_min_uV;
+}
+
+static int tegra20_core_rtc_update(struct tegra_regulators_coupler *tegra,
+				   struct regulator_dev *core_rdev,
+				   struct regulator_dev *rtc_rdev,
+				   int cpu_uV, int cpu_min_uV)
+{
+	int core_min_uV, core_max_uV = INT_MAX;
+	int rtc_min_uV, rtc_max_uV = INT_MAX;
+	int core_target_uV;
+	int rtc_target_uV;
+	int core_uV;
+	int rtc_uV;
+	int err;
+
+	/*
+	 * The core voltage scaling is currently not hooked up in drivers,
+	 * hence we will limit the minimum core voltage to the initial value.
+	 * This should be good enough for the time being.
+	 */
+	core_min_uV = tegra20_core_limit(tegra, core_rdev, rtc_rdev);
+	if (core_min_uV < 0)
+		return core_min_uV;
+
+	err = regulator_check_voltage(core_rdev, &core_min_uV, &core_max_uV);
+	if (err)
+		return err;
+
+	err = regulator_check_consumers(core_rdev, &core_min_uV, &core_max_uV,
+					PM_SUSPEND_ON);
+	if (err)
+		return err;
+
+	core_min_uV = max(cpu_min_uV + 125000, core_min_uV);
+	if (core_min_uV > core_max_uV)
+		return -EINVAL;
+
+	core_uV = regulator_get_voltage_rdev(core_rdev);
+	if (core_uV < 0)
+		return core_uV;
+
+	if (cpu_uV + 120000 > core_uV)
+		pr_err("core-cpu voltage constraint violated: %d %d\n",
+		       core_uV, cpu_uV + 120000);
+
+	rtc_uV = regulator_get_voltage_rdev(rtc_rdev);
+	if (rtc_uV < 0)
+		return rtc_uV;
+
+	if (cpu_uV + 120000 > rtc_uV)
+		pr_err("rtc-cpu voltage constraint violated: %d %d\n",
+		       rtc_uV, cpu_uV + 120000);
+
+	if (abs(core_uV - rtc_uV) > 170000)
+		pr_err("core-rtc voltage constraint violated: %d %d\n",
+		       core_uV, rtc_uV);
+
+	rtc_min_uV = max(cpu_min_uV + 125000, core_min_uV - 150000);
+
+	err = regulator_check_voltage(rtc_rdev, &rtc_min_uV, &rtc_max_uV);
+	if (err)
+		return err;
+
+	while (core_uV != core_min_uV || rtc_uV != rtc_min_uV) {
+		if (core_uV < core_min_uV) {
+			core_target_uV = min(core_uV + 150000, core_min_uV);
+			core_target_uV = min(rtc_uV + 150000, core_target_uV);
+		} else {
+			core_target_uV = max(core_uV - 150000, core_min_uV);
+			core_target_uV = max(rtc_uV - 150000, core_target_uV);
+		}
+
+		err = regulator_set_voltage_rdev(core_rdev,
+						 core_target_uV,
+						 core_max_uV,
+						 PM_SUSPEND_ON);
+		if (err)
+			return err;
+
+		core_uV = core_target_uV;
+
+		if (rtc_uV < rtc_min_uV) {
+			rtc_target_uV = min(rtc_uV + 150000, rtc_min_uV);
+			rtc_target_uV = min(core_uV + 150000, rtc_target_uV);
+		} else {
+			rtc_target_uV = max(rtc_uV - 150000, rtc_min_uV);
+			rtc_target_uV = max(core_uV - 150000, rtc_target_uV);
+		}
+
+		err = regulator_set_voltage_rdev(rtc_rdev,
+						 rtc_target_uV,
+						 rtc_max_uV,
+						 PM_SUSPEND_ON);
+		if (err)
+			return err;
+
+		rtc_uV = rtc_target_uV;
+	}
+
+	return 0;
+}
+
+static int tegra20_core_voltage_update(struct tegra_regulators_coupler *tegra,
+				       struct regulator_dev *cpu_rdev,
+				       struct regulator_dev *core_rdev,
+				       struct regulator_dev *rtc_rdev)
+{
+	int cpu_uV;
+
+	cpu_uV = regulator_get_voltage_rdev(cpu_rdev);
+	if (cpu_uV < 0)
+		return cpu_uV;
+
+	return tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
+				       cpu_uV, cpu_uV);
+}
+
+static int tegra20_cpu_voltage_update(struct tegra_regulators_coupler *tegra,
+				      struct regulator_dev *cpu_rdev,
+				      struct regulator_dev *core_rdev,
+				      struct regulator_dev *rtc_rdev)
+{
+	int cpu_min_uV = 0;
+	int cpu_max_uV = INT_MAX;
+	int cpu_uV;
+	int err;
+
+	err = regulator_check_voltage(cpu_rdev, &cpu_min_uV, &cpu_max_uV);
+	if (err)
+		return err;
+
+	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV, &cpu_max_uV,
+					PM_SUSPEND_ON);
+	if (err)
+		return err;
+
+	cpu_uV = regulator_get_voltage_rdev(cpu_rdev);
+	if (cpu_uV < 0)
+		return cpu_uV;
+
+	if (cpu_min_uV > cpu_uV) {
+		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
+					      cpu_uV, cpu_min_uV);
+		if (err)
+			return err;
+
+		err = regulator_set_voltage_rdev(cpu_rdev, cpu_min_uV,
+						 cpu_max_uV, PM_SUSPEND_ON);
+		if (err)
+			return err;
+	} else if (cpu_min_uV < cpu_uV)  {
+		err = regulator_set_voltage_rdev(cpu_rdev, cpu_min_uV,
+						 cpu_max_uV, PM_SUSPEND_ON);
+		if (err)
+			return err;
+
+		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
+					      cpu_uV, cpu_min_uV);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static struct regulator_dev *lookup_rdev(struct regulator_dev *rdev,
+					 const char * const *names,
+					 unsigned int num_names)
+{
+	struct coupling_desc *c_desc = &rdev->coupling_desc;
+	unsigned int i, k;
+
+	for (i = 0; i < num_names; i++) {
+		if (!strcmp(names[i], rdev_get_name(rdev)))
+			return rdev;
+	}
+
+	for (k = 0; k < c_desc->n_coupled; k++) {
+		rdev = c_desc->coupled_rdevs[k];
+
+		for (i = 0; i < num_names; i++) {
+			if (!strcmp(names[i], rdev_get_name(rdev)))
+				return rdev;
+		}
+	}
+
+	pr_err_once("%s: failed for %s\n", __func__, rdev_get_name(rdev));
+
+	for (i = 0; i < num_names; i++)
+		pr_err_once("%s: entry%u: %s\n", __func__, i, names[i]);
+
+	return NULL;
+}
+
+static int tegra20_regulator_balance_voltage(struct regulators_coupler *coupler,
+					     struct regulator_dev *rdev,
+					     suspend_state_t state)
+{
+	struct tegra_regulators_coupler *tegra = to_tegra_coupler(coupler);
+	struct regulator_dev *core_rdev;
+	struct regulator_dev *cpu_rdev;
+	struct regulator_dev *rtc_rdev;
+
+	core_rdev = lookup_rdev(rdev, core_names, ARRAY_SIZE(core_names));
+	cpu_rdev  = lookup_rdev(rdev, cpu_names, ARRAY_SIZE(cpu_names));
+	rtc_rdev  = lookup_rdev(rdev, rtc_names, ARRAY_SIZE(rtc_names));
+
+	if (!core_rdev || !cpu_rdev || !rtc_rdev || state != PM_SUSPEND_ON) {
+		pr_err("regulators are not coupled properly\n");
+		return -EINVAL;
+	}
+
+	if (rdev == cpu_rdev)
+		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
+						  core_rdev, rtc_rdev);
+
+	if (rdev == core_rdev)
+		return tegra20_core_voltage_update(tegra, cpu_rdev,
+						   core_rdev, rtc_rdev);
+
+	pr_err("driving %s voltage not permitted\n", rdev_get_name(rtc_rdev));
+
+	return -EPERM;
+}
+
+static struct tegra_regulators_coupler tegra20_coupler = {
+	.coupler = {
+		.balance_voltage = tegra20_regulator_balance_voltage,
+	},
+};
+
+static int __init tegra_regulators_coupler_init(void)
+{
+	if (!of_machine_is_compatible("nvidia,tegra20"))
+		return 0;
+
+	return regulators_coupler_register(&tegra20_coupler.coupler);
+}
+arch_initcall(tegra_regulators_coupler_init);
-- 
2.21.0
