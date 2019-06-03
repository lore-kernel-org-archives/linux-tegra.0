From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/8] regulator: core: Introduce API for regulators coupling customization
Date: Tue,  4 Jun 2019 02:58:57 +0300
Message-ID: <20190603235904.19097-2-digetx@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603235904.19097-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Right now regulator core supports only one type of regulators coupling,
the "voltage max-spread" which keeps voltages of coupled regulators in a
given range from each other. A more sophisticated coupling may be required
in practice, one example is the NVIDIA Tegra SoC's which besides the
max-spreading have other restrictions that must be adhered. Introduce API
that allow platforms to provide their own customized coupling algorithms.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c         | 66 ++++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h | 33 ++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 85f61e5dc312..3b2d10a46bb5 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -50,6 +50,7 @@ static DEFINE_MUTEX(regulator_list_mutex);
 static LIST_HEAD(regulator_map_list);
 static LIST_HEAD(regulator_ena_gpio_list);
 static LIST_HEAD(regulator_supply_alias_list);
+static LIST_HEAD(regulator_coupler_list);
 static bool has_full_constraints;
 
 static struct dentry *debugfs_root;
@@ -3573,6 +3574,7 @@ static int regulator_balance_voltage(struct regulator_dev *rdev,
 	struct regulator_dev **c_rdevs;
 	struct regulator_dev *best_rdev;
 	struct coupling_desc *c_desc = &rdev->coupling_desc;
+	struct regulator_coupler *coupler = c_desc->coupler;
 	int i, ret, n_coupled, best_min_uV, best_max_uV, best_c_rdev;
 	bool best_c_rdev_done, c_rdev_done[MAX_COUPLED];
 	unsigned int delta, best_delta;
@@ -3592,6 +3594,9 @@ static int regulator_balance_voltage(struct regulator_dev *rdev,
 		return -EPERM;
 	}
 
+	if (coupler && coupler->balance_voltage)
+		return coupler->balance_voltage(coupler, rdev, state);
+
 	for (i = 0; i < n_coupled; i++)
 		c_rdev_done[i] = false;
 
@@ -4707,8 +4712,33 @@ static int regulator_register_resolve_supply(struct device *dev, void *data)
 	return 0;
 }
 
+int regulator_coupler_register(struct regulator_coupler *coupler)
+{
+	mutex_lock(&regulator_list_mutex);
+	list_add(&coupler->list, &regulator_coupler_list);
+	mutex_unlock(&regulator_list_mutex);
+
+	return 0;
+}
+
+static struct regulator_coupler *
+regulator_find_coupler(struct regulator_dev *rdev)
+{
+	struct regulator_coupler *coupler;
+	int err;
+
+	list_for_each_entry(coupler, &regulator_coupler_list, list) {
+		err = coupler->attach_regulator(coupler, rdev);
+		if (!err)
+			return coupler;
+	}
+
+	return NULL;
+}
+
 static void regulator_resolve_coupling(struct regulator_dev *rdev)
 {
+	struct regulator_coupler *coupler = rdev->coupling_desc.coupler;
 	struct coupling_desc *c_desc = &rdev->coupling_desc;
 	int n_coupled = c_desc->n_coupled;
 	struct regulator_dev *c_rdev;
@@ -4724,6 +4754,12 @@ static void regulator_resolve_coupling(struct regulator_dev *rdev)
 		if (!c_rdev)
 			continue;
 
+		if (c_rdev->coupling_desc.coupler != coupler) {
+			rdev_err(rdev, "coupler mismatch with %s\n",
+				 rdev_get_name(c_rdev));
+			return;
+		}
+
 		regulator_lock(c_rdev);
 
 		c_desc->coupled_rdevs[i] = c_rdev;
@@ -4737,10 +4773,12 @@ static void regulator_resolve_coupling(struct regulator_dev *rdev)
 
 static void regulator_remove_coupling(struct regulator_dev *rdev)
 {
+	struct regulator_coupler *coupler = rdev->coupling_desc.coupler;
 	struct coupling_desc *__c_desc, *c_desc = &rdev->coupling_desc;
 	struct regulator_dev *__c_rdev, *c_rdev;
 	unsigned int __n_coupled, n_coupled;
 	int i, k;
+	int err;
 
 	n_coupled = c_desc->n_coupled;
 
@@ -4770,6 +4808,13 @@ static void regulator_remove_coupling(struct regulator_dev *rdev)
 		c_desc->coupled_rdevs[i] = NULL;
 		c_desc->n_resolved--;
 	}
+
+	if (coupler && coupler->detach_regulator) {
+		err = coupler->detach_regulator(coupler, rdev);
+		if (err)
+			rdev_err(rdev, "failed to detach from coupler: %d\n",
+				 err);
+	}
 }
 
 static int regulator_init_coupling(struct regulator_dev *rdev)
@@ -4812,9 +4857,25 @@ static int regulator_init_coupling(struct regulator_dev *rdev)
 	if (!of_check_coupling_data(rdev))
 		return -EPERM;
 
+	rdev->coupling_desc.coupler = regulator_find_coupler(rdev);
+	if (!rdev->coupling_desc.coupler) {
+		rdev_err(rdev, "failed to find coupler\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
+static int generic_coupler_attach(struct regulator_coupler *coupler,
+				  struct regulator_dev *rdev)
+{
+	return 0;
+}
+
+static struct regulator_coupler generic_regulator_coupler = {
+	.attach_regulator = generic_coupler_attach,
+};
+
 /**
  * regulator_register - register regulator
  * @regulator_desc: regulator to register
@@ -4976,7 +5037,9 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	if (ret < 0)
 		goto wash;
 
+	mutex_lock(&regulator_list_mutex);
 	ret = regulator_init_coupling(rdev);
+	mutex_unlock(&regulator_list_mutex);
 	if (ret < 0)
 		goto wash;
 
@@ -5025,6 +5088,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 unset_supplies:
 	mutex_lock(&regulator_list_mutex);
 	unset_regulator_supplies(rdev);
+	regulator_remove_coupling(rdev);
 	mutex_unlock(&regulator_list_mutex);
 wash:
 	kfree(rdev->constraints);
@@ -5480,6 +5544,8 @@ static int __init regulator_init(void)
 #endif
 	regulator_dummy_init();
 
+	regulator_coupler_register(&generic_regulator_coupler);
+
 	return ret;
 }
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 377da2357118..18bbbd4135a1 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/regulator/consumer.h>
+#include <linux/suspend.h>
 #include <linux/ww_mutex.h>
 
 struct gpio_desc;
@@ -28,6 +29,7 @@ struct regulator_dev;
 struct regulator_config;
 struct regulator_init_data;
 struct regulator_enable_gpio;
+struct regulator_coupler;
 
 enum regulator_status {
 	REGULATOR_STATUS_OFF,
@@ -427,6 +429,7 @@ struct regulator_config {
  */
 struct coupling_desc {
 	struct regulator_dev *coupled_rdevs[MAX_COUPLED];
+	struct regulator_coupler *coupler;
 	int n_resolved;
 	int n_coupled;
 };
@@ -482,6 +485,33 @@ struct regulator_dev {
 	unsigned long last_off_jiffy;
 };
 
+/**
+ * struct regulator_coupler - customized regulator's coupler
+ *
+ * Regulator's coupler allows to customize coupling algorithm.
+ *
+ * @list: couplers list entry
+ * @attach_regulator: Callback invoked on creation of a coupled regulator,
+ *                    couples are unresolved at this point. The callee should
+ *                    check that it could handle the regulator and return 0 on
+ *                    success, -errno otherwise.
+ * @detach_regulator: Callback invoked on destruction of a coupled regulator.
+ * @balance_voltage: Callback invoked when voltage of a coupled regulator is
+ *                   changing. The callee should perform voltage balancing
+ *                   and change voltage of the coupled regulators.
+ */
+struct regulator_coupler {
+	struct list_head list;
+
+	int (*attach_regulator)(struct regulator_coupler *coupler,
+				struct regulator_dev *rdev);
+	int (*detach_regulator)(struct regulator_coupler *coupler,
+				struct regulator_dev *rdev);
+	int (*balance_voltage)(struct regulator_coupler *coupler,
+			       struct regulator_dev *rdev,
+			       suspend_state_t state);
+};
+
 struct regulator_dev *
 regulator_register(const struct regulator_desc *regulator_desc,
 		   const struct regulator_config *config);
@@ -552,4 +582,7 @@ void regulator_unlock(struct regulator_dev *rdev);
  */
 int regulator_desc_list_voltage_linear_range(const struct regulator_desc *desc,
 					     unsigned int selector);
+
+int regulator_coupler_register(struct regulator_coupler *coupler);
+
 #endif
-- 
2.21.0
