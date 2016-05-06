From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Fri, 6 May 2016 16:20:15 -0400
Message-ID: <1462566015-12306-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Move the UTMIPLL initialization code from the clk-tegra<chip>.c
files into clk-pll.c and perform the initialization sequence when
PLLU is enabled.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>

[rklein: Merged in some later fixes for potential deadlocks]

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v2:
 - Swapped out __clk_lookup for 2 calls to clk_hw_get_parent

 drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra114.c | 155 +------------
 drivers/clk/tegra/clk-tegra124.c | 156 +------------
 drivers/clk/tegra/clk-tegra210.c | 182 +--------------
 drivers/clk/tegra/clk-tegra30.c  | 113 +--------
 drivers/clk/tegra/clk.h          |  17 ++
 6 files changed, 510 insertions(+), 597 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 4e194ecc8d5e..580cae8aee6d 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -191,6 +191,53 @@
 #define PLLSS_REF_SRC_SEL_SHIFT	25
 #define PLLSS_REF_SRC_SEL_MASK	(3 << PLLSS_REF_SRC_SEL_SHIFT)
 
+#define UTMIP_PLL_CFG1 0x484
+#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
+#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
+#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
+#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
+
+#define UTMIP_PLL_CFG2 0x488
+#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xfff) << 6)
+#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP BIT(1)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP BIT(3)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERUP BIT(5)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN BIT(24)
+#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP BIT(25)
+#define UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN BIT(30)
+
+#define UTMIPLL_HW_PWRDN_CFG0 0x52c
+#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL BIT(0)
+#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE BIT(1)
+#define UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL BIT(2)
+#define UTMIPLL_HW_PWRDN_CFG0_SEQ_IN_SWCTL BIT(4)
+#define UTMIPLL_HW_PWRDN_CFG0_SEQ_RESET_INPUT_VALUE BIT(5)
+#define UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET BIT(6)
+#define UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE BIT(24)
+#define UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE BIT(25)
+
+#define PLLU_HW_PWRDN_CFG0 0x530
+#define PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL BIT(0)
+#define PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL BIT(2)
+#define PLLU_HW_PWRDN_CFG0_USE_LOCKDET BIT(6)
+#define PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT BIT(7)
+#define PLLU_HW_PWRDN_CFG0_SEQ_ENABLE BIT(24)
+#define PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE BIT(28)
+
+#define XUSB_PLL_CFG0 0x534
+#define XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY 0x3ff
+#define XUSB_PLL_CFG0_PLLU_LOCK_DLY (0x3ff << 14)
+
+#define PLLU_BASE_CLKENABLE_USB BIT(21)
+#define PLLU_BASE_OVERRIDE BIT(24)
+
 #define pll_readl(offset, p) readl_relaxed(p->clk_base + offset)
 #define pll_readl_base(p) pll_readl(p->params->base_reg, p)
 #define pll_readl_misc(p) pll_readl(p->params->misc_reg, p)
@@ -973,6 +1020,123 @@ const struct clk_ops tegra_clk_plle_ops = {
 	.enable = clk_plle_enable,
 };
 
+/*
+ * Structure defining the fields for USB UTMI clocks Parameters.
+ */
+struct utmi_clk_param {
+	/* Oscillator Frequency in Hz */
+	u32 osc_frequency;
+	/* UTMIP PLL Enable Delay Count  */
+	u8 enable_delay_count;
+	/* UTMIP PLL Stable count */
+	u8 stable_count;
+	/*  UTMIP PLL Active delay count */
+	u8 active_delay_count;
+	/* UTMIP PLL Xtal frequency count */
+	u8 xtal_freq_count;
+};
+
+static const struct utmi_clk_param utmi_parameters[] = {
+	{ .osc_frequency = 13000000, .enable_delay_count = 0x02,
+	  .stable_count = 0x33, .active_delay_count = 0x05,
+	  .xtal_freq_count = 0x7f },
+	{ .osc_frequency = 19200000, .enable_delay_count = 0x03,
+	  .stable_count = 0x4b, .active_delay_count = 0x06,
+	  .xtal_freq_count = 0xbb },
+	{ .osc_frequency = 12000000, .enable_delay_count = 0x02,
+	  .stable_count = 0x2f, .active_delay_count = 0x04,
+	  .xtal_freq_count = 0x76 },
+	{ .osc_frequency = 26000000, .enable_delay_count = 0x04,
+	  .stable_count = 0x66, .active_delay_count = 0x09,
+	  .xtal_freq_count = 0xfe },
+	{ .osc_frequency = 16800000, .enable_delay_count = 0x03,
+	  .stable_count = 0x41, .active_delay_count = 0x0a,
+	  .xtal_freq_count = 0xa4 },
+	{ .osc_frequency = 38400000, .enable_delay_count = 0x0,
+	  .stable_count = 0x0, .active_delay_count = 0x6,
+	  .xtal_freq_count = 0x80 },
+};
+
+static int clk_pllu_enable(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct clk_hw *pll_ref = clk_hw_get_parent(hw);
+	struct clk_hw *osc = clk_hw_get_parent(pll_ref);
+	unsigned long flags, input_rate;
+	unsigned int i;
+	int ret = 0;
+	u32 val;
+
+	if (!osc) {
+		pr_err("%s: failed to get OSC clock\n", __func__);
+		return -EINVAL;
+	}
+	input_rate = clk_hw_get_rate(osc);
+
+	if (pll->lock)
+		spin_lock_irqsave(pll->lock, flags);
+
+	_clk_pll_enable(hw);
+	ret = clk_pll_wait_for_lock(pll);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
+		if (input_rate == utmi_parameters[i].osc_frequency)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(utmi_parameters)) {
+		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	val = pll_readl_base(pll);
+	val &= ~PLLU_BASE_OVERRIDE;
+	pll_writel_base(val, pll);
+
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
+	/* Program UTMIP PLL stable and active counts */
+	val &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
+	val &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
+			utmi_parameters[i].active_delay_count);
+	/* Remove power downs from UTMIP PLL control bits */
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
+
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	/* Program UTMIP PLL delay and oscillator frequency counts */
+	val &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
+		utmi_parameters[i].enable_delay_count);
+	val &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
+		utmi_parameters[i].xtal_freq_count);
+	/* Remove power downs from UTMIP PLL control bits */
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+
+out:
+	if (pll->lock)
+		spin_unlock_irqrestore(pll->lock, flags);
+
+	return ret;
+}
+
+static const struct clk_ops tegra_clk_pllu_ops = {
+	.is_enabled = clk_pll_is_enabled,
+	.enable = clk_pllu_enable,
+	.disable = clk_pll_disable,
+	.recalc_rate = clk_pll_recalc_rate,
+};
+
 static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,
 			   unsigned long parent_rate)
 {
@@ -1505,6 +1669,109 @@ static void clk_plle_tegra114_disable(struct clk_hw *hw)
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
 }
+
+static int clk_pllu_tegra114_enable(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct clk *osc = __clk_lookup("osc");
+	unsigned long flags, input_rate;
+	unsigned int i;
+	int ret = 0;
+	u32 val;
+
+	if (!osc) {
+		pr_err("%s: failed to get OSC clock\n", __func__);
+		return -EINVAL;
+		}
+	input_rate = clk_hw_get_rate(__clk_get_hw(osc));
+
+	if (pll->lock)
+		spin_lock_irqsave(pll->lock, flags);
+
+	_clk_pll_enable(hw);
+	ret = clk_pll_wait_for_lock(pll);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
+		if (input_rate == utmi_parameters[i].osc_frequency)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(utmi_parameters)) {
+		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	val = pll_readl_base(pll);
+	val &= ~PLLU_BASE_OVERRIDE;
+	pll_writel_base(val, pll);
+
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
+	/* Program UTMIP PLL stable and active counts */
+	val &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
+	val &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
+			utmi_parameters[i].active_delay_count);
+	/* Remove power downs from UTMIP PLL control bits */
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
+
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	/* Program UTMIP PLL delay and oscillator frequency counts */
+	val &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
+		utmi_parameters[i].enable_delay_count);
+	val &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
+		utmi_parameters[i].xtal_freq_count);
+	/* Remove power downs from UTMIP PLL control bits */
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+
+	/* Setup HW control of UTMIPLL */
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	val |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
+	val &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
+	val |= UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+
+	udelay(1);
+
+	/*
+	 * Setup SW override of UTMIPLL assuming USB2.0 ports are assigned
+	 * to USB2
+	 */
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	val |= UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL;
+	val &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	udelay(1);
+
+	/* Enable HW control of UTMIPLL */
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	val |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+out:
+	if (pll->lock)
+		spin_unlock_irqrestore(pll->lock, flags);
+
+	return ret;
+}
 #endif
 
 static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
@@ -1614,6 +1881,27 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
 	return clk;
 }
 
+struct clk *tegra_clk_register_pllu(const char *name, const char *parent_name,
+		void __iomem *clk_base, unsigned long flags,
+		struct tegra_clk_pll_params *pll_params, spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk;
+
+	pll_params->flags |= TEGRA_PLLU;
+
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+				      &tegra_clk_pllu_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
+
 #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
 	defined(CONFIG_ARCH_TEGRA_124_SOC) || \
 	defined(CONFIG_ARCH_TEGRA_132_SOC) || \
@@ -1652,6 +1940,12 @@ static const struct clk_ops tegra_clk_plle_tegra114_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 };
 
+static const struct clk_ops tegra_clk_pllu_tegra114_ops = {
+	.is_enabled =  clk_pll_is_enabled,
+	.enable = clk_pllu_tegra114_enable,
+	.disable = clk_pll_disable,
+	.recalc_rate = clk_pll_recalc_rate,
+};
 
 struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 			  void __iomem *clk_base, void __iomem *pmc,
@@ -1919,6 +2213,28 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 
 	return clk;
 }
+
+struct clk *tegra_clk_register_pllu_tegra114(const char *name,
+		const char *parent_name, void __iomem *clk_base,
+		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk;
+
+	pll_params->flags |= TEGRA_PLLU;
+
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+				      &tegra_clk_pllu_tegra114_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
@@ -2187,6 +2503,145 @@ static int clk_plle_tegra210_is_enabled(struct clk_hw *hw)
 	return val & PLLE_BASE_ENABLE ? 1 : 0;
 }
 
+static int clk_pllu_tegra210_enable(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct clk_hw *pll_ref = clk_hw_get_parent(hw);
+	struct clk_hw *osc = clk_hw_get_parent(pll_ref);
+	unsigned long flags, input_rate;
+	unsigned int i;
+	int ret = 0;
+	u32 val;
+
+	if (!osc) {
+		pr_err("%s: failed to get OSC clock\n", __func__);
+		return -EINVAL;
+	}
+	input_rate = clk_hw_get_rate(osc);
+
+	if (pll->lock)
+		spin_lock_irqsave(pll->lock, flags);
+
+	_clk_pll_enable(hw);
+	ret = clk_pll_wait_for_lock(pll);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
+		if (input_rate == utmi_parameters[i].osc_frequency)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(utmi_parameters)) {
+		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	val = pll_readl_base(pll);
+	val &= ~PLLU_BASE_OVERRIDE;
+	pll_writel_base(val, pll);
+
+	/* Put PLLU under HW control */
+	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
+	val |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
+	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
+	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
+	val &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
+		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
+	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
+
+	val = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
+	val &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
+	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
+	udelay(1);
+
+	val = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
+	val |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
+	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
+	udelay(1);
+
+	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
+	val = pll_readl_base(pll);
+	val &= ~PLLU_BASE_CLKENABLE_USB;
+	pll_writel_base(val, pll);
+
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	if (val & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
+		pr_debug("UTMIPLL already enabled\n");
+		goto out;
+	}
+	val &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	/* Program UTMIP PLL stable and active counts */
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
+	val &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
+	val &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
+			utmi_parameters[i].active_delay_count);
+	val |= UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
+
+	/* Program UTMIP PLL delay and oscillator frequency counts */
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	val &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
+		utmi_parameters[i].enable_delay_count);
+	val &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
+	val |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
+		utmi_parameters[i].xtal_freq_count);
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+
+	/* Remove power downs from UTMIP PLL control bits */
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	val |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+	udelay(100);
+
+	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
+	val |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP;
+	val |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP;
+	val |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
+	val &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
+
+	/* Setup HW control of UTMIPLL */
+	val = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
+	val &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
+
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	val |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
+	val &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	udelay(1);
+
+	val = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
+	val &= ~XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY;
+	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
+
+	udelay(1);
+
+	/* Enable HW control of UTMIPLL */
+	val = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	val |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
+	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+out:
+	if (pll->lock)
+		spin_unlock_irqrestore(pll->lock, flags);
+
+	return ret;
+}
+
 static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.is_enabled =  clk_plle_tegra210_is_enabled,
 	.enable = clk_plle_tegra210_enable,
@@ -2194,6 +2649,13 @@ static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 };
 
+static const struct clk_ops tegra_clk_pllu_tegra210_ops = {
+	.is_enabled =  clk_pll_is_enabled,
+	.enable = clk_pllu_tegra210_enable,
+	.disable = clk_pll_disable,
+	.recalc_rate = clk_pllre_recalc_rate,
+};
+
 struct clk *tegra_clk_register_plle_tegra210(const char *name,
 				const char *parent_name,
 				void __iomem *clk_base, unsigned long flags,
@@ -2434,4 +2896,26 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	return clk;
 }
+
+struct clk *tegra_clk_register_pllu_tegra210(const char *name,
+		const char *parent_name, void __iomem *clk_base,
+		unsigned long flags, struct tegra_clk_pll_params *pll_params,
+		spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk;
+
+	pll_params->flags |= TEGRA_PLLU;
+
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+				      &tegra_clk_pllu_tegra210_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
 #endif
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index b78054fac0a8..ff202eb9a716 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -113,32 +113,6 @@
 
 #define CCLKG_BURST_POLICY 0x368
 
-#define UTMIP_PLL_CFG2 0x488
-#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xffff) << 6)
-#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
-
-#define UTMIP_PLL_CFG1 0x484
-#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
-#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
-
-#define UTMIPLL_HW_PWRDN_CFG0			0x52c
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE	BIT(25)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE	BIT(24)
-#define UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET	BIT(6)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_RESET_INPUT_VALUE	BIT(5)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_IN_SWCTL	BIT(4)
-#define UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL	BIT(2)
-#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE	BIT(1)
-#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL	BIT(0)
-
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
 
@@ -649,43 +623,6 @@ static unsigned long tegra114_input_freq[] = {
 
 #define MASK(x) (BIT(x) - 1)
 
-struct utmi_clk_param {
-	/* Oscillator Frequency in KHz */
-	u32 osc_frequency;
-	/* UTMIP PLL Enable Delay Count  */
-	u8 enable_delay_count;
-	/* UTMIP PLL Stable count */
-	u8 stable_count;
-	/*  UTMIP PLL Active delay count */
-	u8 active_delay_count;
-	/* UTMIP PLL Xtal frequency count */
-	u8 xtal_freq_count;
-};
-
-static const struct utmi_clk_param utmi_parameters[] = {
-	{
-		.osc_frequency = 13000000, .enable_delay_count = 0x02,
-		.stable_count = 0x33, .active_delay_count = 0x05,
-		.xtal_freq_count = 0x7f
-	}, {
-		.osc_frequency = 19200000, .enable_delay_count = 0x03,
-		.stable_count = 0x4b, .active_delay_count = 0x06,
-		.xtal_freq_count = 0xbb
-	}, {
-		.osc_frequency = 12000000, .enable_delay_count = 0x02,
-		.stable_count = 0x2f, .active_delay_count = 0x04,
-		.xtal_freq_count = 0x76
-	}, {
-		.osc_frequency = 26000000, .enable_delay_count = 0x04,
-		.stable_count = 0x66, .active_delay_count = 0x09,
-		.xtal_freq_count = 0xfe
-	}, {
-		.osc_frequency = 16800000, .enable_delay_count = 0x03,
-		.stable_count = 0x41, .active_delay_count = 0x0a,
-		.xtal_freq_count = 0xa4
-	},
-};
-
 /* peripheral mux definitions */
 
 static const char *mux_plld_out0_plld2_out0[] = {
@@ -986,88 +923,6 @@ static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 
 }
 
-static __init void tegra114_utmi_param_configure(void __iomem *clk_base)
-{
-	unsigned int i;
-	u32 reg;
-
-	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
-		if (osc_freq == utmi_parameters[i].osc_frequency)
-			break;
-	}
-
-	if (i >= ARRAY_SIZE(utmi_parameters)) {
-		pr_err("%s: Unexpected oscillator freq %lu\n", __func__,
-		       osc_freq);
-		return;
-	}
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL stable and active counts */
-	/* [FIXME] arclk_rst.h says WRONG! This should be 1ms -> 0x50 Check! */
-	reg &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
-	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
-
-	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].
-					    active_delay_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
-
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL delay and oscillator frequency counts */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].
-					    enable_delay_count);
-
-	reg &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
-	reg |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(utmi_parameters[i].
-					   xtal_freq_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	/* Setup HW control of UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
-	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	udelay(1);
-
-	/* Setup SW override of UTMIPLL assuming USB2.0
-	   ports are assigned to USB2 */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL;
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	udelay(1);
-
-	/* Enable HW control UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-}
-
 static void __init tegra114_pll_init(void __iomem *clk_base,
 				     void __iomem *pmc)
 {
@@ -1118,16 +973,10 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 					CLK_SET_RATE_PARENT, 1, 1);
 
 	/* PLLU */
-	val = readl(clk_base + pll_u_params.base_reg);
-	val &= ~BIT(24); /* disable PLLU_OVERRIDE */
-	writel(val, clk_base + pll_u_params.base_reg);
-
-	clk = tegra_clk_register_pll("pll_u", "pll_ref", clk_base, pmc, 0,
-			    &pll_u_params, &pll_u_lock);
+	clk = tegra_clk_register_pllu_tegra114("pll_u", "pll_ref", clk_base, 0,
+					       &pll_u_params, &pll_u_lock);
 	clks[TEGRA114_CLK_PLL_U] = clk;
 
-	tegra114_utmi_param_configure(clk_base);
-
 	/* PLLU_480M */
 	clk = clk_register_gate(NULL, "pll_u_480M", "pll_u",
 				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index f4fbbf16a056..a112d3d2bff1 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -99,32 +99,6 @@
 
 #define CCLKG_BURST_POLICY 0x368
 
-#define UTMIP_PLL_CFG2 0x488
-#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xffff) << 6)
-#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
-
-#define UTMIP_PLL_CFG1 0x484
-#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
-#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
-
-#define UTMIPLL_HW_PWRDN_CFG0			0x52c
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE	BIT(25)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE	BIT(24)
-#define UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET	BIT(6)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_RESET_INPUT_VALUE	BIT(5)
-#define UTMIPLL_HW_PWRDN_CFG0_SEQ_IN_SWCTL	BIT(4)
-#define UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL	BIT(2)
-#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE	BIT(1)
-#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL	BIT(0)
-
 /* Tegra CPU clock and reset control regs */
 #define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS	0x470
 
@@ -764,43 +738,6 @@ static struct tegra_clk_pll_params pll_u_params = {
 		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
-struct utmi_clk_param {
-	/* Oscillator Frequency in KHz */
-	u32 osc_frequency;
-	/* UTMIP PLL Enable Delay Count  */
-	u8 enable_delay_count;
-	/* UTMIP PLL Stable count */
-	u8 stable_count;
-	/*  UTMIP PLL Active delay count */
-	u8 active_delay_count;
-	/* UTMIP PLL Xtal frequency count */
-	u8 xtal_freq_count;
-};
-
-static const struct utmi_clk_param utmi_parameters[] = {
-	{
-		.osc_frequency = 13000000, .enable_delay_count = 0x02,
-		.stable_count = 0x33, .active_delay_count = 0x05,
-		.xtal_freq_count = 0x7f
-	}, {
-		.osc_frequency = 19200000, .enable_delay_count = 0x03,
-		.stable_count = 0x4b, .active_delay_count = 0x06,
-		.xtal_freq_count = 0xbb
-	}, {
-		.osc_frequency = 12000000, .enable_delay_count = 0x02,
-		.stable_count = 0x2f, .active_delay_count = 0x04,
-		.xtal_freq_count = 0x76
-	}, {
-		.osc_frequency = 26000000, .enable_delay_count = 0x04,
-		.stable_count = 0x66, .active_delay_count = 0x09,
-		.xtal_freq_count = 0xfe
-	}, {
-		.osc_frequency = 16800000, .enable_delay_count = 0x03,
-		.stable_count = 0x41, .active_delay_count = 0x0a,
-		.xtal_freq_count = 0xa4
-	},
-};
-
 static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_ispb] = { .dt_id = TEGRA124_CLK_ISPB, .present = true },
 	[tegra_clk_rtc] = { .dt_id = TEGRA124_CLK_RTC, .present = true },
@@ -1063,88 +1000,6 @@ static struct tegra_devclk devclks[] __initdata = {
 
 static struct clk **clks;
 
-static void tegra124_utmi_param_configure(void __iomem *clk_base)
-{
-	unsigned int i;
-	u32 reg;
-
-	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
-		if (osc_freq == utmi_parameters[i].osc_frequency)
-			break;
-	}
-
-	if (i >= ARRAY_SIZE(utmi_parameters)) {
-		pr_err("%s: Unexpected oscillator freq %lu\n", __func__,
-		       osc_freq);
-		return;
-	}
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL stable and active counts */
-	/* [FIXME] arclk_rst.h says WRONG! This should be 1ms -> 0x50 Check! */
-	reg &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
-	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
-
-	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].
-					    active_delay_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
-
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL delay and oscillator frequency counts */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].
-					    enable_delay_count);
-
-	reg &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
-	reg |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(utmi_parameters[i].
-					   xtal_freq_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	/* Setup HW control of UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
-	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	udelay(1);
-
-	/* Setup SW override of UTMIPLL assuming USB2.0
-	   ports are assigned to USB2 */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL;
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	udelay(1);
-
-	/* Enable HW control UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-}
-
 static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -1195,7 +1050,6 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 static void __init tegra124_pll_init(void __iomem *clk_base,
 				     void __iomem *pmc)
 {
-	u32 val;
 	struct clk *clk;
 
 	/* PLLC */
@@ -1256,17 +1110,11 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
 	clks[TEGRA124_CLK_PLL_M_UD] = clk;
 
 	/* PLLU */
-	val = readl(clk_base + pll_u_params.base_reg);
-	val &= ~BIT(24); /* disable PLLU_OVERRIDE */
-	writel(val, clk_base + pll_u_params.base_reg);
-
-	clk = tegra_clk_register_pll("pll_u", "pll_ref", clk_base, pmc, 0,
-			    &pll_u_params, &pll_u_lock);
+	clk = tegra_clk_register_pllu_tegra114("pll_u", "pll_ref", clk_base, 0,
+					       &pll_u_params, &pll_u_lock);
 	clk_register_clkdev(clk, "pll_u", NULL);
 	clks[TEGRA124_CLK_PLL_U] = clk;
 
-	tegra124_utmi_param_configure(clk_base);
-
 	/* PLLU_480M */
 	clk = clk_register_gate(NULL, "pll_u_480M", "pll_u",
 				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index b8551813ec43..cc60322bb116 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -155,27 +155,6 @@
 #define PMC_PLLM_WB0_OVERRIDE 0x1dc
 #define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
 
-#define UTMIP_PLL_CFG2 0x488
-#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xfff) << 6)
-#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP BIT(1)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP BIT(3)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERUP BIT(5)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN BIT(24)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP BIT(25)
-
-#define UTMIP_PLL_CFG1 0x484
-#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
-#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
-
 #define SATA_PLL_CFG0				0x490
 #define SATA_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
 #define SATA_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(2)
@@ -2037,47 +2016,6 @@ static struct tegra_clk_pll_params pll_u_vco_params = {
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
 
-struct utmi_clk_param {
-	/* Oscillator Frequency in KHz */
-	u32 osc_frequency;
-	/* UTMIP PLL Enable Delay Count  */
-	u8 enable_delay_count;
-	/* UTMIP PLL Stable count */
-	u16 stable_count;
-	/*  UTMIP PLL Active delay count */
-	u8 active_delay_count;
-	/* UTMIP PLL Xtal frequency count */
-	u16 xtal_freq_count;
-};
-
-static const struct utmi_clk_param utmi_parameters[] = {
-	{
-		.osc_frequency = 38400000, .enable_delay_count = 0x0,
-		.stable_count = 0x0, .active_delay_count = 0x6,
-		.xtal_freq_count = 0x80
-	}, {
-		.osc_frequency = 13000000, .enable_delay_count = 0x02,
-		.stable_count = 0x33, .active_delay_count = 0x05,
-		.xtal_freq_count = 0x7f
-	}, {
-		.osc_frequency = 19200000, .enable_delay_count = 0x03,
-		.stable_count = 0x4b, .active_delay_count = 0x06,
-		.xtal_freq_count = 0xbb
-	}, {
-		.osc_frequency = 12000000, .enable_delay_count = 0x02,
-		.stable_count = 0x2f, .active_delay_count = 0x08,
-		.xtal_freq_count = 0x76
-	}, {
-		.osc_frequency = 26000000, .enable_delay_count = 0x04,
-		.stable_count = 0x66, .active_delay_count = 0x09,
-		.xtal_freq_count = 0xfe
-	}, {
-		.osc_frequency = 16800000, .enable_delay_count = 0x03,
-		.stable_count = 0x41, .active_delay_count = 0x0a,
-		.xtal_freq_count = 0xa4
-	},
-};
-
 static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_ispb] = { .dt_id = TEGRA210_CLK_ISPB, .present = true },
 	[tegra_clk_rtc] = { .dt_id = TEGRA210_CLK_RTC, .present = true },
@@ -2345,114 +2283,6 @@ static struct tegra_audio_clk_info tegra210_audio_plls[] = {
 
 static struct clk **clks;
 
-static void tegra210_utmi_param_configure(void __iomem *clk_base)
-{
-	u32 reg;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
-		if (osc_freq == utmi_parameters[i].osc_frequency)
-			break;
-	}
-
-	if (i >= ARRAY_SIZE(utmi_parameters)) {
-		pr_err("%s: Unexpected oscillator freq %lu\n", __func__,
-		       osc_freq);
-		return;
-	}
-
-	reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
-	reg |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
-	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
-	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
-	reg &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
-		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
-	writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
-
-	reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
-	reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
-	udelay(1);
-
-	reg = readl_relaxed(clk_base + PLLU_BASE);
-	reg &= ~PLLU_BASE_CLKENABLE_USB;
-	writel_relaxed(reg, clk_base + PLLU_BASE);
-
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	udelay(10);
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL stable and active counts */
-	/* [FIXME] arclk_rst.h says WRONG! This should be 1ms -> 0x50 Check! */
-	reg &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
-	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
-
-	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].
-					    active_delay_count);
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL delay and oscillator frequency counts */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].
-					    enable_delay_count);
-
-	reg &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
-	reg |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(utmi_parameters[i].
-					   xtal_freq_count);
-
-	reg |= UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	reg |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-	udelay(1);
-
-	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP;
-	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP;
-	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
-
-	/* Setup HW control of UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
-	reg &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	udelay(1);
-
-	reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
-	reg &= ~XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY;
-	writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
-
-	udelay(1);
-
-	/* Enable HW control UTMIPLL */
-	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
-}
-
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -2520,7 +2350,6 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 static void __init tegra210_pll_init(void __iomem *clk_base,
 				     void __iomem *pmc)
 {
-	u32 val;
 	struct clk *clk;
 
 	/* PLLC */
@@ -2580,12 +2409,9 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clks[TEGRA210_CLK_PLL_M_UD] = clk;
 
 	/* PLLU_VCO */
-	val = readl(clk_base + pll_u_vco_params.base_reg);
-	val &= ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
-	writel(val, clk_base + pll_u_vco_params.base_reg);
-
-	clk = tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, pmc,
-			    0, &pll_u_vco_params, &pll_u_lock, pll_ref_freq);
+	clk = tegra_clk_register_pllu_tegra210("pll_u_vco", "pll_ref",
+					       clk_base, 0, &pll_u_vco_params,
+					       &pll_u_lock);
 	clk_register_clkdev(clk, "pll_u_vco", NULL);
 	clks[TEGRA210_CLK_PLL_U] = clk;
 
@@ -2618,8 +2444,6 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "pll_u_out2", NULL);
 	clks[TEGRA210_CLK_PLL_U_OUT2] = clk;
 
-	tegra210_utmi_param_configure(clk_base);
-
 	/* PLLU_480M */
 	clk = clk_register_gate(NULL, "pll_u_480M", "pll_u_vco",
 				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 9396f4930da7..8e2db5ead8da 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -118,20 +118,6 @@
 
 #define AUDIO_SYNC_DOUBLER 0x49c
 
-#define UTMIP_PLL_CFG2 0x488
-#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xffff) << 6)
-#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
-#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
-
-#define UTMIP_PLL_CFG1 0x484
-#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
-#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
-#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
-#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
-
 /* Tegra CPU clock and reset control regs */
 #define TEGRA_CLK_RST_CONTROLLER_CLK_CPU_CMPLX		0x4c
 #define TEGRA_CLK_RST_CONTROLLER_RST_CPU_CMPLX_SET	0x340
@@ -207,46 +193,6 @@ static DEFINE_SPINLOCK(emc_lock);
 
 static struct clk **clks;
 
-/*
- * Structure defining the fields for USB UTMI clocks Parameters.
- */
-struct utmi_clk_param {
-	/* Oscillator Frequency in KHz */
-	u32 osc_frequency;
-	/* UTMIP PLL Enable Delay Count  */
-	u8 enable_delay_count;
-	/* UTMIP PLL Stable count */
-	u8 stable_count;
-	/*  UTMIP PLL Active delay count */
-	u8 active_delay_count;
-	/* UTMIP PLL Xtal frequency count */
-	u8 xtal_freq_count;
-};
-
-static const struct utmi_clk_param utmi_parameters[] = {
-	{
-		.osc_frequency = 13000000, .enable_delay_count = 0x02,
-		.stable_count = 0x33, .active_delay_count = 0x05,
-		.xtal_freq_count = 0x7f
-	}, {
-		.osc_frequency = 19200000, .enable_delay_count = 0x03,
-		.stable_count = 0x4b, .active_delay_count = 0x06,
-		.xtal_freq_count = 0xbb
-	}, {
-		.osc_frequency = 12000000, .enable_delay_count = 0x02,
-		.stable_count = 0x2f, .active_delay_count = 0x04,
-		.xtal_freq_count = 0x76
-	}, {
-		.osc_frequency = 26000000, .enable_delay_count = 0x04,
-		.stable_count = 0x66, .active_delay_count = 0x09,
-		.xtal_freq_count = 0xfe
-	}, {
-		.osc_frequency = 16800000, .enable_delay_count = 0x03,
-		.stable_count = 0x41, .active_delay_count = 0x0a,
-		.xtal_freq_count = 0xa4
-	},
-};
-
 static struct tegra_clk_pll_freq_table pll_c_freq_table[] = {
 	{ 12000000, 1040000000, 520,  6, 1, 8 },
 	{ 13000000, 1040000000, 480,  6, 1, 8 },
@@ -873,59 +819,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_pll_a_out0] = { .dt_id = TEGRA30_CLK_PLL_A_OUT0, .present = true },
 };
 
-static void tegra30_utmi_param_configure(void)
-{
-	unsigned int i;
-	u32 reg;
-
-	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
-		if (input_freq == utmi_parameters[i].osc_frequency)
-			break;
-	}
-
-	if (i >= ARRAY_SIZE(utmi_parameters)) {
-		pr_err("%s: Unexpected input rate %lu\n", __func__, input_freq);
-		return;
-	}
-
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL stable and active counts */
-	reg &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
-	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(
-			utmi_parameters[i].stable_count);
-
-	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
-			utmi_parameters[i].active_delay_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
-
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL delay and oscillator frequency counts */
-	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
-
-	reg |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
-		utmi_parameters[i].enable_delay_count);
-
-	reg &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
-	reg |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
-		utmi_parameters[i].xtal_freq_count);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
-	reg &= ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
-
-	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-}
-
 static const char *pll_e_parents[] = { "pll_ref", "pll_p" };
 
 static void __init tegra30_pll_init(void)
@@ -972,12 +865,10 @@ static void __init tegra30_pll_init(void)
 	clks[TEGRA30_CLK_PLL_X_OUT0] = clk;
 
 	/* PLLU */
-	clk = tegra_clk_register_pll("pll_u", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_u_params, NULL);
+	clk = tegra_clk_register_pllu("pll_u", "pll_ref", clk_base, 0,
+				      &pll_u_params, NULL);
 	clks[TEGRA30_CLK_PLL_U] = clk;
 
-	tegra30_utmi_param_configure();
-
 	/* PLLD */
 	clk = tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc_base, 0,
 			    &pll_d_params, &pll_d_lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 9421f0310999..6ba82ecffd4d 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -427,6 +427,23 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock);
 
+struct clk *tegra_clk_register_pllu(const char *name, const char *parent_name,
+				void __iomem *clk_base, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
+struct clk *tegra_clk_register_pllu_tegra114(const char *name,
+				const char *parent_name,
+				void __iomem *clk_base, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
+struct clk *tegra_clk_register_pllu_tegra210(const char *name,
+				const char *parent_name,
+				void __iomem *clk_base, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
 /**
  * struct tegra_clk_pll_out - PLL divider down clock
  *
-- 
1.9.1

