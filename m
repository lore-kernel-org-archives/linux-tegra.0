From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v1 1/6] regulator: core: Introduce API for machine-specific regulators coupling
Date: Sun, 14 Apr 2019 20:59:34 +0300
Message-ID: <20190414175939.12368-2-digetx@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414175939.12368-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Right now regulator core supports only one type of regulators coupling,
the "voltage max-spread" which keeps voltages of coupled regulators in a
given range. A more sophisticated coupling may be required in practice,
one example is the NVIDIA Tegra SoC's which besides the max-spreading
have other restrictions that must be adhered. Introduce API that allow
platforms to provide their own custom coupling algorithms.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c          | 18 ++++++++++++++++++
 include/linux/regulator/machine.h | 19 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 186a37675b50..a98af47e0feb 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -59,6 +59,8 @@ static bool has_full_constraints;
 
 static struct dentry *debugfs_root;
 
+static struct regulators_coupler *machine_regulators_coupler;
+
 /*
  * struct regulator_map
  *
@@ -3596,6 +3598,12 @@ static int regulator_balance_voltage(struct regulator_dev *rdev,
 		return -EPERM;
 	}
 
+	if (n_coupled > 1 &&
+	    machine_regulators_coupler &&
+	    machine_regulators_coupler->balance_voltage)
+		return machine_regulators_coupler->balance_voltage(
+				machine_regulators_coupler, rdev, state);
+
 	for (i = 0; i < n_coupled; i++)
 		c_rdev_done[i] = false;
 
@@ -4706,6 +4714,16 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+int regulators_coupler_register(struct regulators_coupler *coupler)
+{
+	if (WARN_ON(machine_regulators_coupler))
+		return -EBUSY;
+
+	machine_regulators_coupler = coupler;
+
+	return 0;
+}
+
 static void regulator_resolve_coupling(struct regulator_dev *rdev)
 {
 	struct coupling_desc *c_desc = &rdev->coupling_desc;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 1d34a70ffda2..f15c8c5f7f6c 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -19,6 +19,7 @@
 #include <linux/suspend.h>
 
 struct regulator;
+struct regulator_dev;
 
 /*
  * Regulator operation constraint flags. These flags are used to enable
@@ -265,4 +266,22 @@ static inline int regulator_suspend_finish(void)
 	return 0;
 }
 
+/**
+ * struct regulators_coupler - machine-specific regulators coupler
+ *
+ * A custom regulators coupler allows platform to customize coupling
+ * algorithm.
+ *
+ * @balance_voltage: Callback invoked when voltage of a coupled regulator is
+ *                   changing. The callee should perform voltage balancing
+ *                   and change voltage of the coupled regulators.
+ */
+struct regulators_coupler {
+	int (*balance_voltage)(struct regulators_coupler *coupler,
+			       struct regulator_dev *rdev,
+			       suspend_state_t state);
+};
+
+int regulators_coupler_register(struct regulators_coupler *coupler);
+
 #endif
-- 
2.21.0
