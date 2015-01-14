From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 4/9] soc: tegra: pmc: Add generic PM domain support
Date: Wed, 14 Jan 2015 14:19:27 +0800
Message-ID: <1421216372-8025-5-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The PM domains are populated from DT, and the PM domain consumer devices are
also bound to their relevant PM domains by DT.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[vinceh: make changes based on Thierry and Peter's suggestions]
Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c                     | 589 ++++++++++++++++++++++++++++
 include/dt-bindings/power/tegra-powergate.h |  30 ++
 2 files changed, 619 insertions(+)
 create mode 100644 include/dt-bindings/power/tegra-powergate.h

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4bdc654bd747..0779b0ba6d3d 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -17,6 +17,8 @@
  *
  */
 
+#define DEBUG
+
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
@@ -27,15 +29,20 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/reboot.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
+#include <soc/tegra/mc.h>
 #include <soc/tegra/pmc.h>
 
 #define PMC_CNTRL			0x0
@@ -83,6 +90,30 @@
 
 #define GPU_RG_CNTRL			0x2d4
 
+#define MAX_CLK_NUM		5
+#define MAX_RESET_NUM		5
+#define MAX_SWGROUP_NUM		5
+
+struct tegra_powergate {
+	struct generic_pm_domain base;
+	struct tegra_pmc *pmc;
+	unsigned int id;
+	const char *name;
+	struct list_head head;
+	struct device_node *of_node;
+	struct clk *clk[MAX_CLK_NUM];
+	struct reset_control *reset[MAX_RESET_NUM];
+	struct tegra_mc_swgroup *swgroup[MAX_SWGROUP_NUM];
+	bool need_vdd;
+	struct regulator *vdd;
+};
+
+static inline struct tegra_powergate *
+to_powergate(struct generic_pm_domain *domain)
+{
+	return container_of(domain, struct tegra_powergate, base);
+}
+
 struct tegra_pmc_soc {
 	unsigned int num_powergates;
 	const char *const *powergates;
@@ -92,8 +123,10 @@ struct tegra_pmc_soc {
 
 /**
  * struct tegra_pmc - NVIDIA Tegra PMC
+ * @dev: pointer to parent device
  * @base: pointer to I/O remapped register region
  * @clk: pointer to pclk clock
+ * @soc: SoC-specific data
  * @rate: currently configured rate of pclk
  * @suspend_mode: lowest suspend mode available
  * @cpu_good_time: CPU power good time (in microseconds)
@@ -107,9 +140,12 @@ struct tegra_pmc_soc {
  * @cpu_pwr_good_en: CPU power good signal is enabled
  * @lp0_vec_phys: physical base address of the LP0 warm boot code
  * @lp0_vec_size: size of the LP0 warm boot code
+ * @powergates: list of power gates
  * @powergates_lock: mutex for power gate register access
+ * @nb: bus notifier for generic power domains
  */
 struct tegra_pmc {
+	struct device *dev;
 	void __iomem *base;
 	struct clk *clk;
 
@@ -130,7 +166,12 @@ struct tegra_pmc {
 	u32 lp0_vec_phys;
 	u32 lp0_vec_size;
 
+	struct tegra_powergate *powergates;
 	struct mutex powergates_lock;
+	struct notifier_block nb;
+
+	struct list_head powergate_list;
+	int power_domain_num;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -353,6 +394,8 @@ int tegra_pmc_cpu_remove_clamping(int cpuid)
 	if (id < 0)
 		return id;
 
+	usleep_range(10, 20);
+
 	return tegra_powergate_remove_clamping(id);
 }
 #endif /* CONFIG_SMP */
@@ -387,6 +430,317 @@ void tegra_pmc_restart(enum reboot_mode mode, const char *cmd)
 	tegra_pmc_writel(value, 0);
 }
 
+static bool tegra_pmc_powergate_is_powered(struct tegra_powergate *powergate)
+{
+	u32 status = tegra_pmc_readl(PWRGATE_STATUS);
+
+	if (!powergate->need_vdd)
+		return (status & BIT(powergate->id)) != 0;
+
+	if (IS_ERR(powergate->vdd))
+		return false;
+	else
+		return regulator_is_enabled(powergate->vdd);
+}
+
+static int tegra_pmc_powergate_set(struct tegra_powergate *powergate,
+				   bool new_state)
+{
+	u32 status, mask = new_state ? BIT(powergate->id) : 0;
+	bool state = false;
+
+	mutex_lock(&pmc->powergates_lock);
+
+	/* check the current state of the partition */
+	status = tegra_pmc_readl(PWRGATE_STATUS);
+	if (status & BIT(powergate->id))
+		state = true;
+
+	/* nothing to do */
+	if (new_state == state) {
+		mutex_unlock(&pmc->powergates_lock);
+		return 0;
+	}
+
+	/* toggle partition state and wait for state change to finish */
+	tegra_pmc_writel(PWRGATE_TOGGLE_START | powergate->id, PWRGATE_TOGGLE);
+
+	while (1) {
+		status = tegra_pmc_readl(PWRGATE_STATUS);
+		if ((status & BIT(powergate->id)) == mask)
+			break;
+
+		usleep_range(10, 20);
+	}
+
+	mutex_unlock(&pmc->powergates_lock);
+
+	return 0;
+}
+
+static int
+tegra_pmc_powergate_remove_clamping(struct tegra_powergate *powergate)
+{
+	u32 mask;
+
+	/*
+	 * The Tegra124 GPU has a separate register (with different semantics)
+	 * to remove clamps.
+	 */
+	if (tegra_get_chip_id() == TEGRA124) {
+		if (powergate->id == TEGRA_POWERGATE_3D) {
+			tegra_pmc_writel(0, GPU_RG_CNTRL);
+			return 0;
+		}
+	}
+
+	/*
+	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
+	 * swapped relatively to the partition ids
+	 */
+	if (powergate->id == TEGRA_POWERGATE_VDEC)
+		mask = (1 << TEGRA_POWERGATE_PCIE);
+	else if (powergate->id == TEGRA_POWERGATE_PCIE)
+		mask = (1 << TEGRA_POWERGATE_VDEC);
+	else
+		mask = (1 << powergate->id);
+
+	tegra_pmc_writel(mask, REMOVE_CLAMPING);
+
+	return 0;
+}
+
+static int tegra_pmc_powergate_enable_clocks(
+		struct tegra_powergate *powergate)
+{
+	int i, err;
+
+	for (i = 0; i < MAX_CLK_NUM; i++) {
+		if (!powergate->clk[i])
+			break;
+
+		err = clk_prepare_enable(powergate->clk[i]);
+		if (err)
+			goto out;
+	}
+
+	return 0;
+
+out:
+	while(i--)
+		clk_disable_unprepare(powergate->clk[i]);
+	return err;
+}
+
+static void tegra_pmc_powergate_disable_clocks(
+		struct tegra_powergate *powergate)
+{
+	int i;
+
+	for (i = 0; i < MAX_CLK_NUM; i++) {
+		if (!powergate->clk[i])
+			break;
+
+		clk_disable_unprepare(powergate->clk[i]);
+	}
+}
+
+static int tegra_pmc_powergate_mc_flush(struct tegra_powergate *powergate)
+{
+	int i, err;
+
+	for (i = 0; i < MAX_SWGROUP_NUM; i++) {
+		if (!powergate->swgroup[i])
+			break;
+
+		err = tegra_mc_flush(powergate->swgroup[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tegra_pmc_powergate_mc_flush_done(struct tegra_powergate *powergate)
+{
+	int i, err;
+
+	for (i = 0; i < MAX_SWGROUP_NUM; i++) {
+		if (!powergate->swgroup[i])
+			break;
+
+		err = tegra_mc_flush_done(powergate->swgroup[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+
+}
+
+static int tegra_pmc_powergate_reset_assert(
+		struct tegra_powergate *powergate)
+{
+	int i, err;
+
+	for (i = 0; i < MAX_RESET_NUM; i++) {
+		if (!powergate->reset[i])
+			break;
+
+		err = reset_control_assert(powergate->reset[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tegra_pmc_powergate_reset_deassert(
+		struct tegra_powergate *powergate)
+{
+	int i, err;
+
+	for (i = 0; i < MAX_RESET_NUM; i++) {
+		if (!powergate->reset[i])
+			break;
+
+		err = reset_control_deassert(powergate->reset[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int get_regulator(struct tegra_powergate *powergate)
+{
+	struct platform_device *pdev;
+
+	if (!powergate->need_vdd)
+		return -EINVAL;
+
+	if (powergate->vdd && !IS_ERR(powergate->vdd))
+		return 0;
+
+	pdev = of_find_device_by_node(powergate->of_node);
+	if (!pdev)
+		return -EINVAL;
+
+	powergate->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
+	if (IS_ERR(powergate->vdd))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int tegra_pmc_powergate_power_on(struct generic_pm_domain *domain)
+{
+	struct tegra_powergate *powergate = to_powergate(domain);
+	struct tegra_pmc *pmc = powergate->pmc;
+	int err;
+
+	dev_dbg(pmc->dev, "> %s(domain=%p)\n", __func__, domain);
+	dev_dbg(pmc->dev, "  name: %s\n", domain->name);
+
+	if (powergate->need_vdd) {
+		err = get_regulator(powergate);
+		if (!err) {
+			err = regulator_enable(powergate->vdd);
+		}
+	} else {
+		err = tegra_pmc_powergate_set(powergate, true);
+	}
+	if (err < 0)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_enable_clocks(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_remove_clamping(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_reset_deassert(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_mc_flush_done(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	tegra_pmc_powergate_disable_clocks(powergate);
+
+	return 0;
+
+/* XXX more error handing */
+out:
+	dev_dbg(pmc->dev, "< %s() = %d\n", __func__, err);
+	return err;
+}
+
+static int tegra_pmc_powergate_power_off(struct generic_pm_domain *domain)
+{
+	struct tegra_powergate *powergate = to_powergate(domain);
+	struct tegra_pmc *pmc = powergate->pmc;
+	int err;
+
+	dev_dbg(pmc->dev, "> %s(domain=%p)\n", __func__, domain);
+	dev_dbg(pmc->dev, "  name: %s\n", domain->name);
+
+	/* never turn off this partition */
+	switch (powergate->id) {
+	case TEGRA_POWERGATE_CPU:
+	case TEGRA_POWERGATE_CPU1:
+	case TEGRA_POWERGATE_CPU2:
+	case TEGRA_POWERGATE_CPU3:
+	case TEGRA_POWERGATE_CPU0:
+	case TEGRA_POWERGATE_C0NC:
+	case TEGRA_POWERGATE_IRAM:
+		dev_dbg(pmc->dev, "not disabling always-on partition %s\n",
+			domain->name);
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = tegra_pmc_powergate_enable_clocks(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_mc_flush(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	err = tegra_pmc_powergate_reset_assert(powergate);
+	if (err)
+		goto out;
+	udelay(10);
+
+	tegra_pmc_powergate_disable_clocks(powergate);
+	udelay(10);
+
+	if (powergate->vdd)
+		err = regulator_disable(powergate->vdd);
+	else
+		err = tegra_pmc_powergate_set(powergate, false);
+	if (err)
+		goto out;
+
+	return 0;
+
+/* XXX more error handling */
+out:
+	dev_dbg(pmc->dev, "< %s() = %d\n", __func__, err);
+	return err;
+}
+
 static int powergate_show(struct seq_file *s, void *data)
 {
 	unsigned int i;
@@ -429,6 +783,231 @@ static int tegra_powergate_debugfs_init(void)
 	return 0;
 }
 
+static struct generic_pm_domain *
+tegra_powergate_of_xlate(struct of_phandle_args *args, void *data)
+{
+	struct tegra_pmc *pmc = data;
+	struct tegra_powergate *powergate;
+
+	dev_dbg(pmc->dev, "> %s(args=%p, data=%p)\n", __func__, args, data);
+
+	list_for_each_entry(powergate, &pmc->powergate_list, head) {
+		if (!powergate->base.name)
+			continue;
+
+		if (powergate->id == args->args[0]) {
+			dev_dbg(pmc->dev, "< %s() = %p\n", __func__, powergate);
+			return &powergate->base;
+		}
+	}
+
+	dev_dbg(pmc->dev, "< %s() = -ENOENT\n", __func__);
+	return ERR_PTR(-ENOENT);
+}
+
+static int of_get_clks(struct tegra_powergate *powergate)
+{
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < MAX_CLK_NUM; i++) {
+		clk = of_clk_get(powergate->of_node, i);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) == -ENOENT)
+				break;
+			else
+				return PTR_ERR(clk);
+		}
+
+		powergate->clk[i] = clk;
+	}
+
+	return 0;
+}
+
+static int of_get_resets(struct tegra_powergate *powergate)
+{
+	struct reset_control *reset;
+	int i;
+
+	for (i = 0; i < MAX_RESET_NUM; i++) {
+		reset = of_reset_control_get_by_index(powergate->of_node, i);
+		if (IS_ERR(reset)) {
+			if (PTR_ERR(reset) == -ENOENT)
+				break;
+			else
+				return PTR_ERR(reset);
+		}
+
+		powergate->reset[i] = reset;
+	}
+
+	return 0;
+}
+
+static int of_get_swgroups(struct tegra_powergate *powergate)
+{
+	struct tegra_mc_swgroup *sg;
+	int i;
+
+	for (i = 0; i < MAX_SWGROUP_NUM; i++) {
+		sg = tegra_mc_find_swgroup(powergate->of_node, i);
+		if (IS_ERR_OR_NULL(sg)) {
+			if (PTR_ERR(sg) == -ENOENT)
+				break;
+			else
+				return -EINVAL;
+		}
+
+		powergate->swgroup[i] = sg;
+	}
+
+	return 0;
+}
+
+static int tegra_pmc_powergate_init_powerdomain(struct tegra_pmc *pmc)
+{
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "nvidia,power-domains") {
+		struct tegra_powergate *powergate;
+		const char *name;
+		int err;
+		u32 id;
+		bool off;
+
+		err = of_property_read_string(np, "name", &name);
+		if (err) {
+			dev_err(pmc->dev, "no significant name for domain\n");
+			return err;
+		}
+
+		err = of_property_read_u32(np, "domain", &id);
+		if (err) {
+			dev_err(pmc->dev, "no powergate ID for domain\n");
+			return err;
+		}
+
+		powergate = devm_kzalloc(pmc->dev, sizeof(*powergate), GFP_KERNEL);
+		if (!powergate) {
+			dev_err(pmc->dev, "failed to allocate memory for domain %s\n",
+					name);
+			return -ENOMEM;
+		}
+
+		if (of_property_read_bool(np, "external-power-rail")) {
+			powergate->need_vdd = true;
+			err = get_regulator(powergate);
+			if (err) {
+				/* The regulator might not be ready yet, so just give a
+				 * warning instead of failing the whole init.
+				 */
+				dev_warn(pmc->dev, "couldn't locate regulator\n");
+			}
+		}
+
+		powergate->of_node = np;
+		powergate->name = name;
+		powergate->id = id;
+		powergate->base.name = kstrdup(powergate->name, GFP_KERNEL);
+		powergate->base.power_off = tegra_pmc_powergate_power_off;
+		powergate->base.power_on = tegra_pmc_powergate_power_on;
+		powergate->pmc = pmc;
+
+		err = of_get_clks(powergate);
+		if (err)
+			return err;
+
+		err = of_get_resets(powergate);
+		if (err)
+			return err;
+
+		err = of_get_swgroups(powergate);
+		if (err)
+			return err;
+
+		list_add_tail(&powergate->head, &pmc->powergate_list);
+
+		/* XXX */
+		if ((powergate->need_vdd && !IS_ERR(powergate->vdd)) ||
+			!powergate->need_vdd)
+			tegra_pmc_powergate_power_off(&powergate->base);
+
+		off = !tegra_pmc_powergate_is_powered(powergate);
+		pm_genpd_init(&powergate->base, NULL, off);
+
+		pmc->power_domain_num++;
+
+		dev_info(pmc->dev, "added power domain %d\n", powergate->id);
+	}
+
+	dev_info(pmc->dev, "%d power domains added\n", pmc->power_domain_num);
+	return 0;
+}
+
+static int tegra_pmc_powergate_init_subdomain(struct tegra_pmc *pmc)
+{
+	struct tegra_powergate *powergate;
+
+	list_for_each_entry(powergate, &pmc->powergate_list, head) {
+		struct device_node *pdn;
+		struct tegra_powergate *parent = NULL;
+		struct tegra_powergate *temp;
+		int err;
+
+		/* XXX might depend-on more than one domain */
+		pdn = of_parse_phandle(powergate->of_node, "depend-on", 0);
+		if (!pdn)
+			continue;
+
+		list_for_each_entry(temp, &pmc->powergate_list, head) {
+			if (temp->of_node == pdn) {
+				parent = temp;
+				break;
+			}
+		}
+
+		if (!parent)
+			return -EINVAL;
+
+		err = pm_genpd_add_subdomain_names(parent->name, powergate->name);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tegra_powergate_init(struct tegra_pmc *pmc)
+{
+	struct device_node *np = pmc->dev->of_node;
+	int err = 0;
+
+	dev_dbg(pmc->dev, "> %s(pmc=%p)\n", __func__, pmc);
+
+	INIT_LIST_HEAD(&pmc->powergate_list);
+	err = tegra_pmc_powergate_init_powerdomain(pmc);
+	if (err)
+		goto out;
+
+	err = tegra_pmc_powergate_init_subdomain(pmc);
+	if (err < 0)
+		return err;
+
+	err = __of_genpd_add_provider(np, tegra_powergate_of_xlate, pmc);
+	if (err < 0)
+		return err;
+
+#if 0
+	pmc->nb.notifier_call = tegra_powergate_notifier_call;
+	bus_register_notifier(&platform_bus_type, &pmc->nb);
+#endif
+
+out:
+	dev_dbg(pmc->dev, "< %s() = %d\n", __func__, err);
+	return err;
+}
+
 static int tegra_io_rail_prepare(int id, unsigned long *request,
 				 unsigned long *status, unsigned int *bit)
 {
@@ -709,6 +1288,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
+	dev_dbg(&pdev->dev, "> %s(pdev=%p)\n", __func__, pdev);
+
 	err = tegra_pmc_parse_dt(pmc, pdev->dev.of_node);
 	if (err < 0)
 		return err;
@@ -728,14 +1309,22 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	pmc->dev = &pdev->dev;
 	tegra_pmc_init(pmc);
 
+	if (IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
+		err = tegra_powergate_init(pmc);
+		if (err < 0)
+			return err;
+	}
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_powergate_debugfs_init();
 		if (err < 0)
 			return err;
 	}
 
+	dev_dbg(&pdev->dev, "< %s()\n", __func__);
 	return 0;
 }
 
diff --git a/include/dt-bindings/power/tegra-powergate.h b/include/dt-bindings/power/tegra-powergate.h
new file mode 100644
index 000000000000..b8265167c20e
--- /dev/null
+++ b/include/dt-bindings/power/tegra-powergate.h
@@ -0,0 +1,30 @@
+#ifndef _DT_BINDINGS_POWER_TEGRA_POWERGATE_H
+#define _DT_BINDINGS_POWER_TEGRA_POWERGATE_H
+
+#define TEGRA_POWERGATE_CPU	0
+#define TEGRA_POWERGATE_3D	1
+#define TEGRA_POWERGATE_VENC	2
+#define TEGRA_POWERGATE_PCIE	3
+#define TEGRA_POWERGATE_VDEC	4
+#define TEGRA_POWERGATE_L2	5
+#define TEGRA_POWERGATE_MPE	6
+#define TEGRA_POWERGATE_HEG	7
+#define TEGRA_POWERGATE_SATA	8
+#define TEGRA_POWERGATE_CPU1	9
+#define TEGRA_POWERGATE_CPU2	10
+#define TEGRA_POWERGATE_CPU3	11
+#define TEGRA_POWERGATE_CELP	12
+#define TEGRA_POWERGATE_3D1	13
+#define TEGRA_POWERGATE_CPU0	14
+#define TEGRA_POWERGATE_C0NC	15
+#define TEGRA_POWERGATE_C1NC	16
+#define TEGRA_POWERGATE_SOR	17
+#define TEGRA_POWERGATE_DIS	18
+#define TEGRA_POWERGATE_DISB	19
+#define TEGRA_POWERGATE_XUSBA	20
+#define TEGRA_POWERGATE_XUSBB	21
+#define TEGRA_POWERGATE_XUSBC	22
+#define TEGRA_POWERGATE_VIC	23
+#define TEGRA_POWERGATE_IRAM	24
+
+#endif
-- 
1.9.1
