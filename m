From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 2/8] clk: tegra: clock changes for emc scaling support on
 Tegra210
Date: Mon, 25 Mar 2019 15:45:17 +0800
Message-ID: <20190325074523.26456-3-josephl@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

1) Introduce low jitter paths for pllp and pll_mb used by the EMC driver.
2) Remove the old emc_mux clock and don't use the common EMC clock
   definition. This will be replaced by a new clock defined in the EMC
   driver.
3) Export functions to allow accessing the CAR register required for EMC
   clock scaling. These functions will be used to access the CAR register
   as part of the scaling sequence.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 112 +++++++++++++++++++----
 include/dt-bindings/clock/tegra210-car.h |   4 +-
 include/linux/clk/tegra.h                |   5 +
 3 files changed, 103 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 7545af763d7a..e17b5279ea69 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -47,6 +47,7 @@
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
+#define CLK_SOURCE_EMC_DLL 0x664
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -234,6 +235,10 @@
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
 
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
+#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
+
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
 
@@ -319,12 +324,6 @@ static unsigned long tegra210_input_freq[] = {
 	[8] = 12000000,
 };
 
-static const char *mux_pllmcp_clkm[] = {
-	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
-	"pll_p",
-};
-#define mux_pllmcp_clkm_idx NULL
-
 #define PLL_ENABLE			(1 << 30)
 
 #define PLLCX_MISC1_IDDQ		(1 << 27)
@@ -2310,7 +2309,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
 	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
 	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
+	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = false },
 	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
 	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
@@ -2921,6 +2920,82 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
 
+void tegra210_clk_emc_dll_enable(bool flag)
+{
+	unsigned long flags = 0;
+	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
+		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
+	readl(clk_base + offset);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
+
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
+{
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
+	readl(clk_base + CLK_SOURCE_EMC_DLL);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
+
+void tegra210_clk_emc_update_setting(u32 emc_src_value)
+{
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
+	readl(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
+
+u32 tegra210_clk_emc_get_setting(void)
+{
+	unsigned long flags = 0;
+	u32 val;
+
+	spin_lock_irqsave(&emc_lock, flags);
+
+	val = readl_relaxed(clk_base + CLK_SOURCE_EMC);
+
+	spin_unlock_irqrestore(&emc_lock, flags);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_get_setting);
+
+static const struct clk_div_table mc_div_table_tegra210[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 1 },
+	{ .val = 3, .div = 2 },
+	{ .val = 0, .div = 0 },
+};
+
+static void tegra_clk_register_mc_tegra210(const char *name,
+					   const char *parent_name)
+{
+	struct clk *clk;
+
+	clk = clk_register_divider_table(NULL, name, parent_name, 0,
+					 clk_base + CLK_SOURCE_EMC,
+					 15, 2, CLK_DIVIDER_READ_ONLY,
+					 mc_div_table_tegra210, &emc_lock);
+	clks[TEGRA210_CLK_MC] = clk;
+}
+
 static const char * const sor1_out_parents[] = {
 	/*
 	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
@@ -3004,15 +3079,8 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 			CLK_SOURCE_LA, 0);
 	clks[TEGRA210_CLK_LA] = clk;
 
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
-
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA210_CLK_MC] = clk;
+	/* mc */
+	tegra_clk_register_mc_tegra210("mc", "emc");
 
 	/* cml0 */
 	clk = clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
@@ -3116,6 +3184,18 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "pll_m_ud", NULL);
 	clks[TEGRA210_CLK_PLL_M_UD] = clk;
 
+	/* PLLMB_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
+					CLK_SET_RATE_PARENT, 1, 1);
+	clk_register_clkdev(clk, "pll_mb_ud", NULL);
+	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
+
+	/* PLLP_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
+					0, 1, 1);
+	clks[TEGRA210_CLK_PLL_P_UD] = clk;
+
+
 	/* PLLU_VCO */
 	if (!tegra210_init_pllu()) {
 		clk = clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 6b77e721f6b1..832a89788525 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -349,8 +349,8 @@
 #define TEGRA210_CLK_PLL_P_OUT_XUSB 317
 #define TEGRA210_CLK_XUSB_SSP_SRC 318
 #define TEGRA210_CLK_PLL_RE_OUT1 319
-/* 320 */
-/* 321 */
+#define TEGRA210_CLK_PLL_MB_UD 320
+#define TEGRA210_CLK_PLL_P_UD 321
 #define TEGRA210_CLK_ISP 322
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index afb9edfa5d58..7018afb1990e 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -130,4 +130,9 @@ extern void tegra210_put_utmipll_in_iddq(void);
 extern void tegra210_put_utmipll_out_iddq(void);
 extern int tegra210_clk_handle_mbist_war(unsigned int id);
 
+void tegra210_clk_emc_dll_enable(bool flag);
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
+void tegra210_clk_emc_update_setting(u32 emc_src_value);
+u32 tegra210_clk_emc_get_setting(void);
+
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
2.21.0
