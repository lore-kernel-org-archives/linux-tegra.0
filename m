From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v4 06/19] soc: tegra: Add Tegra PMC clock registrations into PMC driver
Date: Tue, 17 Dec 2019 12:03:53 -0800
Message-ID: <1576613046-17159-7-git-send-email-skomatineni@nvidia.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has clk_out_1, clk_out_2, and clk_out_3 clocks and currently
these PMC clocks are registered by Tegra clock driver with each clock as
separate mux and gate clocks using clk_register_mux and clk_register_gate
by passing PMC base address and register offsets and PMC programming for
these clocks happens through direct PMC access by the clock driver.

With this, when PMC is in secure mode any direct PMC access from the
non-secure world does not go through and these clocks will not be
functional.

This patch adds these PMC clocks registration to pmc driver with PMC as
a clock provider and registers each clock as single clock.

clk_ops callback implementations for these clocks uses tegra_pmc_readl and
tegra_pmc_writel which supports PMC programming in both secure mode and
non-secure mode.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 248 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ea0e11a09c12..6d65194a6e71 100644
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
@@ -100,6 +104,7 @@
 #define PMC_WAKE2_STATUS		0x168
 #define PMC_SW_WAKE2_STATUS		0x16c
 
+#define PMC_CLK_OUT_CNTRL		0x1a8
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -155,6 +160,64 @@
 #define  TEGRA_SMC_PMC_READ	0xaa
 #define  TEGRA_SMC_PMC_WRITE	0xbb
 
+struct pmc_clk {
+	struct clk_hw	hw;
+	unsigned long	offs;
+	u32		mux_mask;
+	u32		mux_shift;
+	u32		gate_shift;
+};
+
+#define to_pmc_clk(_hw) container_of(_hw, struct pmc_clk, hw)
+
+struct pmc_clk_init_data {
+	char *name;
+	const char *const *parents;
+	int num_parents;
+	int clk_id;
+	u8 mux_shift;
+	u8 gate_shift;
+};
+
+static const char * const clk_out1_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern1",
+};
+
+static const char * const clk_out2_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern2",
+};
+
+static const char * const clk_out3_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern3",
+};
+
+static const struct pmc_clk_init_data tegra_pmc_clks_data[] = {
+	{
+		.name = "clk_out_1",
+		.parents = clk_out1_parents,
+		.num_parents = ARRAY_SIZE(clk_out1_parents),
+		.clk_id = TEGRA_PMC_CLK_OUT_1,
+		.mux_shift = 6,
+		.gate_shift = 2,
+	},
+	{
+		.name = "clk_out_2",
+		.parents = clk_out2_parents,
+		.num_parents = ARRAY_SIZE(clk_out2_parents),
+		.clk_id = TEGRA_PMC_CLK_OUT_2,
+		.mux_shift = 14,
+		.gate_shift = 10,
+	},
+	{
+		.name = "clk_out_3",
+		.parents = clk_out3_parents,
+		.num_parents = ARRAY_SIZE(clk_out3_parents),
+		.clk_id = TEGRA_PMC_CLK_OUT_3,
+		.mux_shift = 22,
+		.gate_shift = 18,
+	},
+};
+
 struct tegra_powergate {
 	struct generic_pm_domain genpd;
 	struct tegra_pmc *pmc;
@@ -254,6 +317,9 @@ struct tegra_pmc_soc {
 	 */
 	const struct tegra_wake_event *wake_events;
 	unsigned int num_wake_events;
+
+	const struct pmc_clk_init_data *pmc_clks_data;
+	unsigned int num_pmc_clks;
 };
 
 static const char * const tegra186_reset_sources[] = {
@@ -2163,6 +2229,173 @@ static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
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
+	struct pmc_clk *clk = to_pmc_clk(hw);
+	u32 val;
+
+	val = tegra_pmc_readl(pmc, clk->offs) >> clk->mux_shift;
+	val &= clk->mux_mask;
+
+	return val;
+}
+
+static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct pmc_clk *clk = to_pmc_clk(hw);
+	u32 val;
+
+	val = tegra_pmc_readl(pmc, clk->offs);
+	val &= ~(clk->mux_mask << clk->mux_shift);
+	val |= index << clk->mux_shift;
+	tegra_pmc_writel(pmc, val, clk->offs);
+	pmc_clk_fence_udelay(clk->offs);
+
+	return 0;
+}
+
+static int pmc_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pmc_clk *clk = to_pmc_clk(hw);
+
+	return tegra_pmc_readl(pmc, clk->offs) & BIT(clk->gate_shift) ? 1 : 0;
+}
+
+static void pmc_clk_set_state(unsigned long offs, u32 shift, int state)
+{
+	u32 val;
+
+	val = tegra_pmc_readl(pmc, offs);
+	val = state ? (val | BIT(shift)) : (val & ~BIT(shift));
+	tegra_pmc_writel(pmc, val, offs);
+	pmc_clk_fence_udelay(offs);
+}
+
+static int pmc_clk_enable(struct clk_hw *hw)
+{
+	struct pmc_clk *clk = to_pmc_clk(hw);
+
+	pmc_clk_set_state(clk->offs, clk->gate_shift, 1);
+
+	return 0;
+}
+
+static void pmc_clk_disable(struct clk_hw *hw)
+{
+	struct pmc_clk *clk = to_pmc_clk(hw);
+
+	pmc_clk_set_state(clk->offs, clk->gate_shift, 0);
+}
+
+static const struct clk_ops pmc_clk_ops = {
+	.get_parent = pmc_clk_mux_get_parent,
+	.set_parent = pmc_clk_mux_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+	.is_enabled = pmc_clk_is_enabled,
+	.enable = pmc_clk_enable,
+	.disable = pmc_clk_disable,
+};
+
+static struct clk *
+tegra_pmc_clk_out_register(const struct pmc_clk_init_data *data,
+			   unsigned long offset)
+{
+	struct clk_init_data init;
+	struct pmc_clk *pmc_clk;
+
+	pmc_clk = kzalloc(sizeof(*pmc_clk), GFP_KERNEL);
+	if (!pmc_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = data->name;
+	init.ops = &pmc_clk_ops;
+	init.parent_names = data->parents;
+	init.num_parents = data->num_parents;
+	init.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT |
+		     CLK_SET_PARENT_GATE;
+
+	pmc_clk->hw.init = &init;
+	pmc_clk->offs = offset;
+	pmc_clk->mux_mask = 3;
+	pmc_clk->mux_shift = data->mux_shift;
+	pmc_clk->gate_shift = data->gate_shift;
+
+	return clk_register(NULL, &pmc_clk->hw);
+}
+
+static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
+				     struct device_node *np)
+{
+	struct clk *clk;
+	struct clk_onecell_data *clk_data;
+	unsigned int num_clks;
+	int i, err = -ENOMEM;
+
+	num_clks = pmc->soc->num_pmc_clks;
+
+	if (!num_clks)
+		return;
+
+	clk_data = kmalloc(sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		goto err_clk;
+
+	clk_data->clks = kcalloc(TEGRA_PMC_CLK_MAX, sizeof(*clk_data->clks),
+				 GFP_KERNEL);
+	if (!clk_data->clks)
+		goto free_clkdata;
+
+	clk_data->clk_num = TEGRA_PMC_CLK_MAX;
+
+	for (i = 0; i < TEGRA_PMC_CLK_MAX; i++)
+		clk_data->clks[i] = ERR_PTR(-ENOENT);
+
+	for (i = 0; i < pmc->soc->num_pmc_clks; i++) {
+		const struct pmc_clk_init_data *data;
+
+		data = pmc->soc->pmc_clks_data + i;
+
+		clk = tegra_pmc_clk_out_register(data, PMC_CLK_OUT_CNTRL);
+		if (IS_ERR(clk)) {
+			dev_err(pmc->dev,
+				"unable to register %s\n", data->name);
+			err = PTR_ERR(clk);
+			goto free_clks;
+		}
+
+		clk_data->clks[data->clk_id] = clk;
+		err = clk_register_clkdev(clk, data->name, NULL);
+		if (err) {
+			dev_err(pmc->dev,
+				"unable to register %s clock lookup\n",
+				data->name);
+			goto free_clks;
+		}
+	}
+
+	err = of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
+	if (err) {
+		dev_err(pmc->dev, "failed to add pmc clk provider\n");
+		goto free_clks;
+	}
+
+	return;
+
+free_clks:
+	kfree(clk_data->clks);
+free_clkdata:
+	kfree(clk_data);
+err_clk:
+	WARN(1, "failed to register Tegra PMC clocks: %d\n", err);
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -2281,6 +2514,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	pmc->base = base;
 	mutex_unlock(&pmc->powergates_lock);
 
+	tegra_pmc_clock_register(pmc, pdev->dev.of_node);
 	platform_set_drvdata(pdev, pmc);
 
 	return 0;
@@ -2422,6 +2656,8 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.num_reset_sources = 0,
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -2469,6 +2705,8 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra114_powergates[] = {
@@ -2520,6 +2758,8 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra124_powergates[] = {
@@ -2631,6 +2871,8 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 static const char * const tegra210_powergates[] = {
@@ -2745,6 +2987,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_reset_levels = 0,
 	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
 	.wake_events = tegra210_wake_events,
+	.pmc_clks_data = tegra_pmc_clks_data,
+	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
@@ -2874,6 +3118,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
 	.num_wake_events = ARRAY_SIZE(tegra186_wake_events),
 	.wake_events = tegra186_wake_events,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
 };
 
 static const struct tegra_io_pad_soc tegra194_io_pads[] = {
@@ -2991,6 +3237,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.7.4
