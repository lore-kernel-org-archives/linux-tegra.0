From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v1 04/17] soc: tegra: Add Tegra PMC clock registrations into PMC driver
Date: Mon, 18 Nov 2019 22:50:21 -0800
Message-ID: <1574146234-3871-5-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with mux and gate for
each of these clocks.

Currently these PMC clocks are registered by Tegra clock driver using
clk_register_mux and clk_register_gate by passing PMC base address
and register offsets and PMC programming for these clocks happens
through direct PMC access by the clock driver.

With this, when PMC is in secure mode any direct PMC access from the
non-secure world does not go through and these clocks will not be
functional.

This patch adds these clocks registration with PMC as a clock provider
for these clocks. clk_ops callback implementations for these clocks
uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programming
in secure mode and non-secure mode.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 330 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 7a5aab0b993b..790a6619ba32 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -13,6 +13,9 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -48,6 +51,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 #define PMC_CNTRL			0x0
 #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
@@ -108,6 +112,7 @@
 #define PMC_WAKE2_STATUS		0x168
 #define PMC_SW_WAKE2_STATUS		0x16c
 
+#define PMC_CLK_OUT_CNTRL		0x1a8
 #define PMC_SATA_PWRGT			0x1ac
 #define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
 #define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
@@ -170,6 +175,78 @@
 #define  TEGRA_SMC_PMC_READ	0xaa
 #define  TEGRA_SMC_PMC_WRITE	0xbb
 
+struct pmc_clk_mux {
+	struct clk_hw	hw;
+	unsigned long	offs;
+	u32		mask;
+	u32		shift;
+	/* register lock */
+	spinlock_t	*lock;
+};
+
+#define to_pmc_clk_mux(_hw) container_of(_hw, struct pmc_clk_mux, hw)
+
+struct pmc_clk_gate {
+	struct clk_hw	hw;
+	unsigned long	offs;
+	u32		shift;
+	/* register lock */
+	spinlock_t	*lock;
+};
+
+#define to_pmc_clk_gate(_hw) container_of(_hw, struct pmc_clk_gate, hw)
+
+struct pmc_clk_init_data {
+	char *mux_name;
+	char *gate_name;
+	const char **parents;
+	int num_parents;
+	int mux_id;
+	int gate_id;
+	char *dev_name;
+	u8 mux_shift;
+	u8 gate_shift;
+	u8 init_parent;
+	int init_state;
+	struct pmc_clk_mux mux;
+	struct pmc_clk_gate gate;
+};
+
+#define PMC_CLK(_num, _mux_shift, _gate_shift, _init_parent, _init_state)\
+	{\
+		.mux_name = "clk_out_" #_num "_mux",\
+		.gate_name = "clk_out_" #_num,\
+		.parents = clk_out ##_num ##_parents,\
+		.num_parents = ARRAY_SIZE(clk_out ##_num ##_parents),\
+		.mux_id = TEGRA_PMC_CLK_OUT_ ##_num ##_MUX,\
+		.gate_id = TEGRA_PMC_CLK_OUT_ ##_num,\
+		.dev_name = "extern" #_num,\
+		.mux_shift = _mux_shift,\
+		.gate_shift = _gate_shift,\
+		.init_parent = _init_parent,\
+		.init_state = _init_state,\
+	}
+
+static DEFINE_SPINLOCK(clk_out_lock);
+
+static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
+	"clk_m_div4", "extern1",
+};
+
+static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
+	"clk_m_div4", "extern2",
+};
+
+static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
+	"clk_m_div4", "extern3",
+};
+
+static struct pmc_clk_init_data tegra_pmc_clks_data[] = {
+	PMC_CLK(1, 6, 2, 3, 1),
+	PMC_CLK(2, 14, 10, 0, 0),
+	PMC_CLK(3, 22, 18, 0, 0),
+};
+
 struct tegra_powergate {
 	struct generic_pm_domain genpd;
 	struct tegra_pmc *pmc;
@@ -279,6 +356,9 @@ struct tegra_pmc_soc {
 	 */
 	const struct tegra_wake_event *wake_events;
 	unsigned int num_wake_events;
+
+	struct pmc_clk_init_data *pmc_clks_data;
+	unsigned int num_pmc_clks;
 };
 
 static const char * const tegra186_reset_sources[] = {
@@ -2299,6 +2379,241 @@ static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static void pmc_clk_fence_udelay(u32 offset)
+{
+	tegra_pmc_readl(pmc, offset);
+	/* pmc clk propagation delay 2 us */
+	udelay(2);
+}
+
+static u8 pmc_clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct pmc_clk_mux *mux = to_pmc_clk_mux(hw);
+	int num_parents = clk_hw_get_num_parents(hw);
+	u32 val;
+
+	val = tegra_pmc_readl(pmc, mux->offs) >> mux->shift;
+	val &= mux->mask;
+
+	if (val >= num_parents)
+		return -EINVAL;
+
+	return val;
+}
+
+static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pmc_clk_mux *mux = to_pmc_clk_mux(hw);
+	u32 val;
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(mux->lock, flags);
+
+	val = tegra_pmc_readl(pmc, mux->offs);
+	val &= ~(mux->mask << mux->shift);
+	val |= index << mux->shift;
+	tegra_pmc_writel(pmc, val, mux->offs);
+	pmc_clk_fence_udelay(mux->offs);
+
+	spin_unlock_irqrestore(mux->lock, flags);
+
+	return 0;
+}
+
+static const struct clk_ops pmc_clk_mux_ops = {
+	.get_parent = pmc_clk_mux_get_parent,
+	.set_parent = pmc_clk_mux_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+
+static struct clk *
+tegra_pmc_clk_mux_register(const char *name, const char * const *parent_names,
+			   int num_parents, unsigned long flags,
+			   struct pmc_clk_mux *mux, unsigned long offset,
+			   u32 shift, u32 mask, spinlock_t *lock)
+{
+	struct clk_init_data init;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &pmc_clk_mux_ops;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+	init.flags = flags;
+
+	mux->hw.init = &init;
+	mux->offs = offset;
+	mux->mask = mask;
+	mux->shift = shift;
+	mux->lock = lock;
+
+	return clk_register(NULL, &mux->hw);
+}
+
+static int pmc_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pmc_clk_gate *gate = to_pmc_clk_gate(hw);
+
+	return tegra_pmc_readl(pmc, gate->offs) & BIT(gate->shift) ? 1 : 0;
+}
+
+static void pmc_clk_set_state(struct clk_hw *hw, int state)
+{
+	struct pmc_clk_gate *gate = to_pmc_clk_gate(hw);
+	u32 val;
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	val = tegra_pmc_readl(pmc, gate->offs);
+	val = state ? (val | BIT(gate->shift)) : (val & ~BIT(gate->shift));
+	tegra_pmc_writel(pmc, val, gate->offs);
+	pmc_clk_fence_udelay(gate->offs);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+}
+
+static int pmc_clk_enable(struct clk_hw *hw)
+{
+	pmc_clk_set_state(hw, 1);
+
+	return 0;
+}
+
+static void pmc_clk_disable(struct clk_hw *hw)
+{
+	pmc_clk_set_state(hw, 0);
+}
+
+static const struct clk_ops pmc_clk_gate_ops = {
+	.is_enabled = pmc_clk_is_enabled,
+	.enable = pmc_clk_enable,
+	.disable = pmc_clk_disable,
+};
+
+static struct clk *
+tegra_pmc_clk_gate_register(const char *name, const char *parent_name,
+			    unsigned long flags, struct pmc_clk_gate *gate,
+			    unsigned long offset, u32 shift, spinlock_t *lock)
+{
+	struct clk_init_data init;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &pmc_clk_gate_ops;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+	init.flags = flags;
+
+	gate->hw.init = &init;
+	gate->offs = offset;
+	gate->shift = shift;
+	gate->lock = lock;
+
+	return clk_register(NULL, &gate->hw);
+}
+
+static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
+				     struct device_node *np)
+{
+	struct clk *clkmux, *clkgate, *parent;
+	struct clk_onecell_data *clk_data;
+	unsigned int num_clks;
+	int i, ret = 0;
+
+	/* each pmc clock output has a mux and a gate */
+	num_clks = pmc->soc->num_pmc_clks * 2;
+
+	if (!num_clks)
+		return;
+
+	clk_data = kmalloc(sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return;
+
+	clk_data->clks = kcalloc(num_clks, sizeof(*clk_data->clks),
+				 GFP_KERNEL);
+	if (!clk_data->clks)
+		goto free_clkdata;
+
+	clk_data->clk_num = num_clks;
+
+	for (i = 0; i < pmc->soc->num_pmc_clks; i++) {
+		struct pmc_clk_init_data *data;
+
+		data = pmc->soc->pmc_clks_data + i;
+
+		clkmux = tegra_pmc_clk_mux_register(data->mux_name,
+						    data->parents,
+						    data->num_parents,
+						    CLK_SET_RATE_NO_REPARENT |
+						    CLK_SET_RATE_PARENT,
+						    &data->mux,
+						    PMC_CLK_OUT_CNTRL,
+						    data->mux_shift,
+						    3, &clk_out_lock);
+		if (IS_ERR(clkmux))
+			goto free_clks;
+
+		clk_data->clks[data->mux_id] = clkmux;
+
+		clkgate = tegra_pmc_clk_gate_register(data->gate_name,
+						      data->mux_name,
+						      CLK_SET_RATE_PARENT,
+						      &data->gate,
+						      PMC_CLK_OUT_CNTRL,
+						      data->gate_shift,
+						      &clk_out_lock);
+		if (IS_ERR(clkgate))
+			goto free_clks;
+
+		clk_data->clks[data->gate_id] = clkgate;
+
+		ret = clk_set_parent(clkgate, clkmux);
+		if (ret < 0) {
+			pr_err("%s: Failed to set parent of %s to %s\n",
+			       __func__, __clk_get_name(clkgate),
+			       __clk_get_name(clkmux));
+		}
+
+		clk_register_clkdev(clkgate, data->dev_name, data->gate_name);
+
+		/* configure initial clock parent and state */
+		parent = clk_get_sys(data->gate_name,
+				     data->parents[data->init_parent]);
+		ret = clk_set_parent(clkmux, parent);
+		if (ret < 0) {
+			pr_err("%s: Failed to set parent of %s to %s\n",
+			       __func__, __clk_get_name(clkmux),
+			       __clk_get_name(parent));
+			WARN_ON(1);
+		}
+
+		if (data->init_state) {
+			if (clk_prepare_enable(clkgate)) {
+				pr_err("%s: Failed to enable %s\n", __func__,
+				       __clk_get_name(clkgate));
+				WARN_ON(1);
+			}
+		}
+	}
+
+	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
+
+	return;
+
+free_clks:
+	kfree(clk_data->clks);
+free_clkdata:
+	kfree(clk_data);
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -2417,6 +2732,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	pmc->base = base;
 	mutex_unlock(&pmc->powergates_lock);
 
+	tegra_pmc_clock_register(pmc, pdev->dev.of_node);
 	platform_set_drvdata(pdev, pmc);
 
 	return 0;
@@ -2625,6 +2941,8 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.num_reset_sources = 0,
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -2673,6 +2991,8 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra114_powergates[] = {
@@ -2725,6 +3045,8 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra124_powergates[] = {
@@ -2837,6 +3159,8 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra210_powergates[] = {
@@ -2952,6 +3276,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_reset_levels = 0,
 	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
 	.wake_events = tegra210_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
@@ -3091,6 +3417,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
 	.num_wake_events = ARRAY_SIZE(tegra186_wake_events),
 	.wake_events = tegra186_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const struct tegra_io_pad_soc tegra194_io_pads[] = {
@@ -3166,6 +3494,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.7.4
