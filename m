From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler for Tegra30
Date: Sun, 14 Apr 2019 20:59:39 +0300
Message-ID: <20190414175939.12368-7-digetx@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414175939.12368-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add regulators coupler for Tegra30 SoC's that performs voltage balancing
of a coupled regulators and thus provides voltage scaling functionality.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig              |   6 +
 drivers/soc/tegra/Makefile             |   1 +
 drivers/soc/tegra/regulators-tegra30.c | 256 +++++++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 545c0da2e069..a5235af27644 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -139,3 +139,9 @@ config SOC_TEGRA20_VOLTAGE_COUPLER
 	def_bool y
 	depends on ARCH_TEGRA_2x_SOC
 	depends on REGULATOR
+
+config SOC_TEGRA30_VOLTAGE_COUPLER
+	bool "Voltage scaling support for Tegra30 SoC's"
+	def_bool y
+	depends on ARCH_TEGRA_3x_SOC
+	depends on REGULATOR
diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index 9f0bdd53bef8..9c809c1814bd 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_SOC_TEGRA_FLOWCTRL) += flowctrl.o
 obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
 obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
 obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
+obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
new file mode 100644
index 000000000000..ecd6a984e045
--- /dev/null
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Voltage regulators coupling resolver for NVIDIA Tegra30
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
+#include <soc/tegra/fuse.h>
+
+struct tegra_regulators_coupler {
+	struct regulators_coupler coupler;
+	int core_min_uV;
+};
+
+static const char * const cpu_names[] = {
+	"vdd_cpu,vdd_sys",
+	"+V1.0_VDD_CPU",
+	"vdd_cpu",
+};
+
+static const char * const core_names[] = {
+	"tps62361-vout",
+	"tps62362-vout",
+	"vdd_core",
+};
+
+static inline struct tegra_regulators_coupler *
+to_tegra_coupler(struct regulators_coupler *coupler)
+{
+	return container_of(coupler, struct tegra_regulators_coupler, coupler);
+}
+
+static int tegra30_core_limit(struct tegra_regulators_coupler *tegra,
+			      struct regulator_dev *core_rdev)
+{
+	if (tegra->core_min_uV > 0)
+		return tegra->core_min_uV;
+
+	tegra->core_min_uV = regulator_get_voltage_rdev(core_rdev);
+	if (tegra->core_min_uV > 0)
+		pr_info("core minimum voltage limited to %duV\n",
+			tegra->core_min_uV);
+
+	return tegra->core_min_uV;
+}
+
+static int tegra30_core_cpu_limit(int cpu_uV)
+{
+	if (cpu_uV < 800000)
+		return 950000;
+
+	if (cpu_uV < 900000)
+		return 1000000;
+
+	if (cpu_uV < 1000000)
+		return 1100000;
+
+	if (cpu_uV < 1100000)
+		return 1200000;
+
+	if (cpu_uV < 1250000) {
+		switch (tegra_sku_info.cpu_speedo_id) {
+		case 0 ... 1:
+		case 4:
+		case 7:
+		case 8:
+			return 1200000;
+
+		default:
+			return 1300000;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int tegra30_voltage_update(struct tegra_regulators_coupler *tegra,
+				  struct regulator_dev *cpu_rdev,
+				  struct regulator_dev *core_rdev)
+{
+	int cpu_min_uV, cpu_max_uV = INT_MAX;
+	int core_min_uV, core_max_uV = INT_MAX;
+	int core_min_limited_uV;
+	int core_target_uV;
+	int cpu_target_uV;
+	int core_uV;
+	int cpu_uV;
+	int err;
+
+	/*
+	 * The CORE voltage scaling is currently not hooked up in drivers,
+	 * hence we will limit the minimum CORE voltage to the initial value.
+	 * This should be good enough for the time being.
+	 */
+	core_min_uV = tegra30_core_limit(tegra, core_rdev);
+	if (core_min_uV < 0)
+		return core_min_uV;
+
+	err = regulator_check_consumers(core_rdev, &core_min_uV, &core_max_uV,
+					PM_SUSPEND_ON);
+	if (err)
+		return err;
+
+	cpu_min_uV = core_min_uV - 300000;
+
+	err = regulator_check_consumers(cpu_rdev, &cpu_min_uV, &cpu_max_uV,
+					PM_SUSPEND_ON);
+	if (err)
+		return err;
+
+	err = regulator_check_voltage(cpu_rdev, &cpu_min_uV, &cpu_max_uV);
+	if (err)
+		return err;
+
+	cpu_uV = regulator_get_voltage_rdev(cpu_rdev);
+	if (cpu_uV < 0)
+		return cpu_uV;
+
+	core_uV = regulator_get_voltage_rdev(core_rdev);
+	if (core_uV < 0)
+		return core_uV;
+
+	/*
+	 * Bootloader shall set up voltages correctly, but if it
+	 * happens that there is a violation, then try to fix it
+	 * at first.
+	 */
+	core_min_limited_uV = tegra30_core_cpu_limit(cpu_uV);
+	if (core_min_limited_uV < 0)
+		return core_min_limited_uV;
+
+	core_min_uV = max(core_min_uV, tegra30_core_cpu_limit(cpu_min_uV));
+
+	err = regulator_check_voltage(core_rdev, &core_min_uV, &core_max_uV);
+	if (err)
+		return err;
+
+	if (core_min_limited_uV > core_uV) {
+		pr_err("core voltage constraint violated: %d %d %d\n",
+		       core_uV, core_min_limited_uV, cpu_uV);
+		goto update_core;
+	}
+
+	while (cpu_uV != cpu_min_uV || core_uV != core_min_uV) {
+		if (cpu_uV < cpu_min_uV) {
+			cpu_target_uV = min(cpu_uV + 100000, cpu_min_uV);
+		} else {
+			cpu_target_uV = max(cpu_uV - 100000, cpu_min_uV);
+			cpu_target_uV = max(core_uV - 300000, cpu_target_uV);
+		}
+
+		err = regulator_set_voltage_rdev(cpu_rdev,
+						 cpu_target_uV,
+						 cpu_max_uV,
+						 PM_SUSPEND_ON);
+		if (err)
+			return err;
+
+		cpu_uV = cpu_target_uV;
+update_core:
+		core_min_limited_uV = tegra30_core_cpu_limit(cpu_uV);
+		if (core_min_limited_uV < 0)
+			return core_min_limited_uV;
+
+		core_target_uV = max(core_min_limited_uV, core_min_uV);
+
+		if (core_uV < core_target_uV) {
+			core_target_uV = min(core_target_uV, core_uV + 100000);
+			core_target_uV = min(core_target_uV, cpu_uV + 300000);
+		} else {
+			core_target_uV = max(core_target_uV, core_uV - 100000);
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
+static int tegra30_regulator_balance_voltage(struct regulators_coupler *coupler,
+					     struct regulator_dev *rdev,
+					     suspend_state_t state)
+{
+	struct tegra_regulators_coupler *tegra = to_tegra_coupler(coupler);
+	struct regulator_dev *core_rdev;
+	struct regulator_dev *cpu_rdev;
+
+	core_rdev = lookup_rdev(rdev, core_names, ARRAY_SIZE(core_names));
+	cpu_rdev  = lookup_rdev(rdev, cpu_names, ARRAY_SIZE(cpu_names));
+
+	if (!core_rdev || !cpu_rdev || state != PM_SUSPEND_ON) {
+		pr_err("regulators are not coupled properly\n");
+		return -EINVAL;
+	}
+
+	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
+}
+
+static struct tegra_regulators_coupler tegra30_coupler = {
+	.coupler = {
+		.balance_voltage = tegra30_regulator_balance_voltage,
+	},
+};
+
+static int __init tegra_regulators_coupler_init(void)
+{
+	if (!of_machine_is_compatible("nvidia,tegra30"))
+		return 0;
+
+	return regulators_coupler_register(&tegra30_coupler.coupler);
+}
+arch_initcall(tegra_regulators_coupler_init);
-- 
2.21.0
