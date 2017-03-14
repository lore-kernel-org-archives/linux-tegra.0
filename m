From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: rework pll_u
Date: Tue, 14 Mar 2017 16:12:49 +0200
Message-ID: <1489500769-28694-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In normal operation pll_u is under hardware control and has a fixed rate of
480MHz. Hardware will turn on pll_u on whenever any of the XUSB
powerdomains is on. From a software point of view we model this is if pll_u
is always on using a fixed rate clock. However the bootloader might or
might not have configured pll_u this way. So we will check the current
state of pll_u at boot and reconfigure it if required.

There are 3 possiblities at kernel boot:
1) pll_u is under hardware control: do nothing
2) pll_u is under hardware control and enabled: enable hardware control
3) pll_u is disabled: enable pll_u and enable hardware control

In all cases we also check if UTMIPLL is under hardware control at boot
and configure it for hardware control if that is not the case.
The same is done during SC7 resume.

Thanks to Joseph Lo <josephl@nvidia.com> for bug fixes.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c      | 174 -----------------------
 drivers/clk/tegra/clk-tegra210.c | 295 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 272 insertions(+), 197 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index b385536..159a854 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2517,152 +2517,6 @@ static int clk_plle_tegra210_is_enabled(struct clk_hw *hw)
 	return val & PLLE_BASE_ENABLE ? 1 : 0;
 }
 
-static int clk_pllu_tegra210_enable(struct clk_hw *hw)
-{
-	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	struct clk_hw *pll_ref = clk_hw_get_parent(hw);
-	struct clk_hw *osc = clk_hw_get_parent(pll_ref);
-	const struct utmi_clk_param *params = NULL;
-	unsigned long flags = 0, input_rate;
-	unsigned int i;
-	int ret = 0;
-	u32 value;
-
-	if (!osc) {
-		pr_err("%s: failed to get OSC clock\n", __func__);
-		return -EINVAL;
-	}
-
-	input_rate = clk_hw_get_rate(osc);
-
-	if (pll->lock)
-		spin_lock_irqsave(pll->lock, flags);
-
-	_clk_pll_enable(hw);
-
-	ret = clk_pll_wait_for_lock(pll);
-	if (ret < 0)
-		goto out;
-
-	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
-		if (input_rate == utmi_parameters[i].osc_frequency) {
-			params = &utmi_parameters[i];
-			break;
-		}
-	}
-
-	if (!params) {
-		pr_err("%s: unexpected input rate %lu Hz\n", __func__,
-		       input_rate);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	value = pll_readl_base(pll);
-	value &= ~PLLU_BASE_OVERRIDE;
-	pll_writel_base(value, pll);
-
-	/* Put PLLU under HW control */
-	value = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
-	value |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
-	         PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
-	         PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
-	value &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
-		   PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
-	writel_relaxed(value, pll->clk_base + PLLU_HW_PWRDN_CFG0);
-
-	value = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
-	value &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
-	writel_relaxed(value, pll->clk_base + XUSB_PLL_CFG0);
-
-	udelay(1);
-
-	value = readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
-	value |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(value, pll->clk_base + PLLU_HW_PWRDN_CFG0);
-
-	udelay(1);
-
-	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
-	value = pll_readl_base(pll);
-	value &= ~PLLU_BASE_CLKENABLE_USB;
-	pll_writel_base(value, pll);
-
-	value = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	if (value & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
-		pr_debug("UTMIPLL already enabled\n");
-		goto out;
-	}
-
-	value &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
-	writel_relaxed(value, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	/* Program UTMIP PLL stable and active counts */
-	value = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
-	value &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
-	value |= UTMIP_PLL_CFG2_STABLE_COUNT(params->stable_count);
-	value &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-	value |= UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(params->active_delay_count);
-	value |= UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
-	writel_relaxed(value, pll->clk_base + UTMIP_PLL_CFG2);
-
-	/* Program UTMIP PLL delay and oscillator frequency counts */
-	value = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
-	value &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
-	value |= UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(params->enable_delay_count);
-	value &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
-	value |= UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(params->xtal_freq_count);
-	writel_relaxed(value, pll->clk_base + UTMIP_PLL_CFG1);
-
-	/* Remove power downs from UTMIP PLL control bits */
-	value = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
-	value &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	value |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	writel(value, pll->clk_base + UTMIP_PLL_CFG1);
-
-	udelay(1);
-
-	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
-	value = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
-	value |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP;
-	value |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP;
-	value |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP;
-	value &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
-	value &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
-	value &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN;
-	writel_relaxed(value, pll->clk_base + UTMIP_PLL_CFG2);
-
-	/* Setup HW control of UTMIPLL */
-	value = readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
-	value &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
-	value &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
-	writel_relaxed(value, pll->clk_base + UTMIP_PLL_CFG1);
-
-	value = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	value |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
-	value &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
-	writel_relaxed(value, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-	udelay(1);
-
-	value = readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
-	value &= ~XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY;
-	writel_relaxed(value, pll->clk_base + XUSB_PLL_CFG0);
-
-	udelay(1);
-
-	/* Enable HW control of UTMIPLL */
-	value = readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-	value |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
-	writel_relaxed(value, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
-
-out:
-	if (pll->lock)
-		spin_unlock_irqrestore(pll->lock, flags);
-
-	return ret;
-}
-
 static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.is_enabled =  clk_plle_tegra210_is_enabled,
 	.enable = clk_plle_tegra210_enable,
@@ -2670,13 +2524,6 @@ static int clk_pllu_tegra210_enable(struct clk_hw *hw)
 	.recalc_rate = clk_pll_recalc_rate,
 };
 
-static const struct clk_ops tegra_clk_pllu_tegra210_ops = {
-	.is_enabled =  clk_pll_is_enabled,
-	.enable = clk_pllu_tegra210_enable,
-	.disable = clk_pll_disable,
-	.recalc_rate = clk_pllre_recalc_rate,
-};
-
 struct clk *tegra_clk_register_plle_tegra210(const char *name,
 				const char *parent_name,
 				void __iomem *clk_base, unsigned long flags,
@@ -2918,25 +2765,4 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 	return clk;
 }
 
-struct clk *tegra_clk_register_pllu_tegra210(const char *name,
-		const char *parent_name, void __iomem *clk_base,
-		unsigned long flags, struct tegra_clk_pll_params *pll_params,
-		spinlock_t *lock)
-{
-	struct tegra_clk_pll *pll;
-	struct clk *clk;
-
-	pll_params->flags |= TEGRA_PLLU;
-
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
-	if (IS_ERR(pll))
-		return ERR_CAST(pll);
-
-	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
-				      &tegra_clk_pllu_tegra210_ops);
-	if (IS_ERR(clk))
-		kfree(pll);
-
-	return clk;
-}
 #endif
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 4554a44..2a84897 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/clk/tegra.h>
 #include <dt-bindings/clock/tegra210-car.h>
+#include <linux/iopoll.h>
 
 #include "clk.h"
 #include "clk-id.h"
@@ -155,6 +156,27 @@
 #define PMC_PLLM_WB0_OVERRIDE 0x1dc
 #define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
 
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
+
+#define UTMIP_PLL_CFG1 0x484
+#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
+#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
+#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
+#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
+#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
+
 #define SATA_PLL_CFG0				0x490
 #define SATA_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
 #define SATA_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(2)
@@ -1051,27 +1073,28 @@ static void tegra210_pllp_set_defaults(struct tegra_clk_pll *pllp)
  * Both VCO and post-divider output rates are fixed at 480MHz and 240MHz,
  * respectively.
  */
-static void pllu_check_defaults(struct tegra_clk_pll *pll, bool hw_control)
+static void pllu_check_defaults(struct tegra_clk_pll_params *params,
+				bool hw_control)
 {
 	u32 val, mask;
 
 	/* Ignore lock enable (will be set) and IDDQ if under h/w control */
 	val = PLLU_MISC0_DEFAULT_VALUE & (~PLLU_MISC0_IDDQ);
 	mask = PLLU_MISC0_LOCK_ENABLE | (hw_control ? PLLU_MISC0_IDDQ : 0);
-	_pll_misc_chk_default(clk_base, pll->params, 0, val,
+	_pll_misc_chk_default(clk_base, params, 0, val,
 			~mask & PLLU_MISC0_WRITE_MASK);
 
 	val = PLLU_MISC1_DEFAULT_VALUE;
 	mask = PLLU_MISC1_LOCK_OVERRIDE;
-	_pll_misc_chk_default(clk_base, pll->params, 1, val,
+	_pll_misc_chk_default(clk_base, params, 1, val,
 			~mask & PLLU_MISC1_WRITE_MASK);
 }
 
-static void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
+static void tegra210_pllu_set_defaults(struct tegra_clk_pll_params *pllu)
 {
-	u32 val = readl_relaxed(clk_base + pllu->params->base_reg);
+	u32 val = readl_relaxed(clk_base + pllu->base_reg);
 
-	pllu->params->defaults_set = true;
+	pllu->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
 
@@ -1080,19 +1103,19 @@ static void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
 		 * that can be updated in flight.
 		 */
 		pllu_check_defaults(pllu, false);
-		if (!pllu->params->defaults_set)
+		if (!pllu->defaults_set)
 			pr_warn("PLL_U already enabled. Postponing set full defaults\n");
 
 		/* Enable lock detect */
-		val = readl_relaxed(clk_base + pllu->params->ext_misc_reg[0]);
+		val = readl_relaxed(clk_base + pllu->ext_misc_reg[0]);
 		val &= ~PLLU_MISC0_LOCK_ENABLE;
 		val |= PLLU_MISC0_DEFAULT_VALUE & PLLU_MISC0_LOCK_ENABLE;
-		writel_relaxed(val, clk_base + pllu->params->ext_misc_reg[0]);
+		writel_relaxed(val, clk_base + pllu->ext_misc_reg[0]);
 
-		val = readl_relaxed(clk_base + pllu->params->ext_misc_reg[1]);
+		val = readl_relaxed(clk_base + pllu->ext_misc_reg[1]);
 		val &= ~PLLU_MISC1_LOCK_OVERRIDE;
 		val |= PLLU_MISC1_DEFAULT_VALUE & PLLU_MISC1_LOCK_OVERRIDE;
-		writel_relaxed(val, clk_base + pllu->params->ext_misc_reg[1]);
+		writel_relaxed(val, clk_base + pllu->ext_misc_reg[1]);
 		udelay(1);
 
 		return;
@@ -1100,9 +1123,9 @@ static void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
 
 	/* set IDDQ, enable lock detect */
 	writel_relaxed(PLLU_MISC0_DEFAULT_VALUE,
-			clk_base + pllu->params->ext_misc_reg[0]);
+			clk_base + pllu->ext_misc_reg[0]);
 	writel_relaxed(PLLU_MISC1_DEFAULT_VALUE,
-			clk_base + pllu->params->ext_misc_reg[1]);
+			clk_base + pllu->ext_misc_reg[1]);
 	udelay(1);
 }
 
@@ -1999,9 +2022,9 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 };
 
 static struct tegra_clk_pll_freq_table pll_u_freq_table[] = {
-	{ 12000000, 480000000, 40, 1, 1, 0 },
-	{ 13000000, 480000000, 36, 1, 1, 0 }, /* actual: 468.0 MHz */
-	{ 38400000, 480000000, 25, 2, 1, 0 },
+	{ 12000000, 480000000, 40, 1, 0, 0 },
+	{ 13000000, 480000000, 36, 1, 0, 0 }, /* actual: 468.0 MHz */
+	{ 38400000, 480000000, 25, 2, 0, 0 },
 	{        0,         0,  0, 0, 0, 0 },
 };
 
@@ -2025,8 +2048,47 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	.div_nmp = &pllu_nmp,
 	.freq_table = pll_u_freq_table,
 	.flags = TEGRA_PLLU | TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
-	.set_defaults = tegra210_pllu_set_defaults,
-	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
+};
+
+struct utmi_clk_param {
+	/* Oscillator Frequency in KHz */
+	u32 osc_frequency;
+	/* UTMIP PLL Enable Delay Count  */
+	u8 enable_delay_count;
+	/* UTMIP PLL Stable count */
+	u16 stable_count;
+	/*  UTMIP PLL Active delay count */
+	u8 active_delay_count;
+	/* UTMIP PLL Xtal frequency count */
+	u16 xtal_freq_count;
+};
+
+static const struct utmi_clk_param utmi_parameters[] = {
+	{
+		.osc_frequency = 38400000, .enable_delay_count = 0x0,
+		.stable_count = 0x0, .active_delay_count = 0x6,
+		.xtal_freq_count = 0x80
+	}, {
+		.osc_frequency = 13000000, .enable_delay_count = 0x02,
+		.stable_count = 0x33, .active_delay_count = 0x05,
+		.xtal_freq_count = 0x7f
+	}, {
+		.osc_frequency = 19200000, .enable_delay_count = 0x03,
+		.stable_count = 0x4b, .active_delay_count = 0x06,
+		.xtal_freq_count = 0xbb
+	}, {
+		.osc_frequency = 12000000, .enable_delay_count = 0x02,
+		.stable_count = 0x2f, .active_delay_count = 0x08,
+		.xtal_freq_count = 0x76
+	}, {
+		.osc_frequency = 26000000, .enable_delay_count = 0x04,
+		.stable_count = 0x66, .active_delay_count = 0x09,
+		.xtal_freq_count = 0xfe
+	}, {
+		.osc_frequency = 16800000, .enable_delay_count = 0x03,
+		.stable_count = 0x41, .active_delay_count = 0x0a,
+		.xtal_freq_count = 0xa4
+	},
 };
 
 static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
@@ -2339,6 +2401,190 @@ void tegra210_put_utmipll_out_iddq(void)
 }
 EXPORT_SYMBOL_GPL(tegra210_put_utmipll_out_iddq);
 
+static void tegra210_utmi_param_configure(void)
+{
+	u32 reg;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(utmi_parameters); i++) {
+		if (osc_freq == utmi_parameters[i].osc_frequency)
+			break;
+	}
+
+	if (i >= ARRAY_SIZE(utmi_parameters)) {
+		pr_err("%s: Unexpected oscillator freq %lu\n", __func__,
+			osc_freq);
+		return;
+	}
+
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	reg &= ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
+	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	udelay(10);
+
+	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
+
+	/* Program UTMIP PLL stable and active counts */
+	/* [FIXME] arclk_rst.h says WRONG! This should be 1ms -> 0x50 Check! */
+	reg &= ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
+	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
+
+	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
+
+	reg |=
+	UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].active_delay_count);
+	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
+
+	/* Program UTMIP PLL delay and oscillator frequency counts */
+	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
+	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
+
+	reg |=
+	UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].enable_delay_count);
+
+	reg &= ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
+	reg |=
+	UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(utmi_parameters[i].xtal_freq_count);
+
+	reg |= UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
+	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
+
+	/* Remove power downs from UTMIP PLL control bits */
+	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
+	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	reg |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
+	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
+	udelay(1);
+
+	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
+	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
+	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP;
+	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP;
+	reg |= UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP;
+	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
+	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
+	reg &= ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN;
+	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
+
+	/* Setup HW control of UTMIPLL */
+	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
+	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
+	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
+	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
+
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	reg |= UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
+	reg &= ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
+	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
+
+	udelay(1);
+
+	reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
+	reg &= ~XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY;
+	writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
+
+	udelay(1);
+
+	/* Enable HW control UTMIPLL */
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	reg |= UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
+	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
+}
+
+static int tegra210_enable_pllu(void)
+{
+	struct tegra_clk_pll_freq_table *fentry;
+	struct tegra_clk_pll pllu;
+	u32 reg;
+
+	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
+		if (fentry->input_rate == pll_ref_freq)
+			break;
+	}
+
+	if (!fentry->input_rate) {
+		pr_err("Unknown PLL_U reference frequency %lu\n", pll_ref_freq);
+		return -EINVAL;
+	}
+
+	/* clear IDDQ bit */
+	pllu.params = &pll_u_vco_params;
+	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
+	reg &= ~BIT(pllu.params->iddq_bit_idx);
+	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
+
+	reg = readl_relaxed(clk_base + PLLU_BASE);
+	reg &= ~GENMASK(20, 0);
+	reg |= fentry->m;
+	reg |= fentry->n << 8;
+	reg |= fentry->p << 16;
+	writel(reg, clk_base + PLLU_BASE);
+	reg |= PLL_ENABLE;
+	writel(reg, clk_base + PLLU_BASE);
+
+	readl_relaxed_poll_timeout(clk_base + PLLU_BASE, reg,
+				   reg & PLL_BASE_LOCK, 2, 1000);
+	if (!(reg & PLL_BASE_LOCK)) {
+		pr_err("Timed out waiting for PLL_U to lock\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int tegra210_init_pllu(void)
+{
+	u32 reg;
+	int err;
+
+	tegra210_pllu_set_defaults(&pll_u_vco_params);
+	/* skip initialization when pllu is in hw controlled mode */
+	reg = readl_relaxed(clk_base + PLLU_BASE);
+	if (reg & PLLU_BASE_OVERRIDE) {
+		if (!(reg & PLL_ENABLE)) {
+			err = tegra210_enable_pllu();
+			if (err < 0) {
+				WARN_ON(1);
+				return err;
+			}
+		}
+		/* enable hw controlled mode */
+		reg = readl_relaxed(clk_base + PLLU_BASE);
+		reg &= ~PLLU_BASE_OVERRIDE;
+		writel(reg, clk_base + PLLU_BASE);
+
+		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
+		reg |= PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
+		       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
+		       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
+		reg &= ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
+			PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
+		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
+
+		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
+		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
+		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
+		udelay(1);
+
+		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
+		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
+		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
+		udelay(1);
+
+		reg = readl_relaxed(clk_base + PLLU_BASE);
+		reg &= ~PLLU_BASE_CLKENABLE_USB;
+		writel_relaxed(reg, clk_base + PLLU_BASE);
+	}
+
+	/* enable UTMIPLL hw control if not yet done by the bootloader */
+	reg = readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
+	if (!(reg & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE))
+		tegra210_utmi_param_configure();
+
+	return 0;
+}
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
@@ -2467,11 +2713,12 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clks[TEGRA210_CLK_PLL_M_UD] = clk;
 
 	/* PLLU_VCO */
-	clk = tegra_clk_register_pllu_tegra210("pll_u_vco", "pll_ref",
-					       clk_base, 0, &pll_u_vco_params,
-					       &pll_u_lock);
-	clk_register_clkdev(clk, "pll_u_vco", NULL);
-	clks[TEGRA210_CLK_PLL_U] = clk;
+	if (!tegra210_init_pllu()) {
+		clk = clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
+					      480*1000*1000);
+		clk_register_clkdev(clk, "pll_u_vco", NULL);
+		clks[TEGRA210_CLK_PLL_U] = clk;
+	}
 
 	/* PLLU_OUT */
 	clk = clk_register_divider_table(NULL, "pll_u_out", "pll_u_vco", 0,
@@ -2717,6 +2964,8 @@ static void tegra210_cpu_clock_resume(void)
 	{ TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0 },
 	{ TEGRA210_CLK_SOC_THERM, TEGRA210_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA210_CLK_CCLK_G, TEGRA210_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1 },
+	{ TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1 },
 	/* This MUST be the last entry. */
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
-- 
1.9.1
