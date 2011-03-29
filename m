From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 3/6] tegra: add PCI Express clocks
Date: Tue, 29 Mar 2011 10:06:37 +0200
Message-ID: <2a7c7ab12126df41c400c023cf365e36d5e397b9.1301385131.git.mike@compulab.co.il>
References: <cover.1301385131.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1301385131.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Gary King <GKing-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
CC: Gary King <GKing-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |   49 +++++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 446d05b..9fb6498 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -112,6 +112,7 @@
 #define PLLD_MISC_CLKENABLE		(1<<30)
 #define PLLD_MISC_DIV_RST		(1<<23)
 #define PLLD_MISC_DCCON_SHIFT		12
+#define PLLE_MISC_READY			(1 << 15)
 
 #define PERIPH_CLK_TO_ENB_REG(c)	((c->u.periph.clk_num / 32) * 4)
 #define PERIPH_CLK_TO_ENB_SET_REG(c)	((c->u.periph.clk_num / 32) * 8)
@@ -710,6 +711,31 @@ static struct clk_ops tegra_pllx_ops = {
 	.set_rate = tegra2_pll_clk_set_rate,
 };
 
+static int tegra2_plle_clk_enable(struct clk *c)
+{
+	u32 val;
+
+	pr_debug("%s on clock %s\n", __func__, c->name);
+
+	mdelay(1);
+
+	val = clk_readl(c->reg + PLL_BASE);
+	if (!(val & PLLE_MISC_READY))
+		return -EBUSY;
+
+	val = clk_readl(c->reg + PLL_BASE);
+	val |= PLL_BASE_ENABLE | PLL_BASE_BYPASS;
+	clk_writel(val, c->reg + PLL_BASE);
+
+	return 0;
+}
+
+static struct clk_ops tegra_plle_ops = {
+	.init       = tegra2_pll_clk_init,
+	.enable     = tegra2_plle_clk_enable,
+	.set_rate   = tegra2_pll_clk_set_rate,
+};
+
 /* Clock divider ops */
 static void tegra2_pll_div_clk_init(struct clk *c)
 {
@@ -1642,6 +1668,25 @@ static struct clk tegra_pll_x = {
 	},
 };
 
+static struct clk_pll_freq_table tegra_pll_e_table[] = {
+	{ 12000000, 100000000,  200,  24, 1, 0 },
+	{ 0, 0, 0, 0, 0, 0 },
+};
+
+static struct clk tegra_pll_e = {
+	.name      = "pll_e",
+	.flags	   = PLL_ALT_MISC_REG,
+	.ops       = &tegra_plle_ops,
+	.max_rate  = 100000000,
+	.parent    = &tegra_clk_m,
+	.reg       = 0xe8,
+	.u.pll = {
+		.freq_table = tegra_pll_e_table,
+		.input_min = 12000000,
+		.input_max = 12000000,
+	},
+};
+
 static struct clk tegra_clk_d = {
 	.name      = "clk_d",
 	.flags     = PERIPH_NO_RESET,
@@ -2018,6 +2063,9 @@ struct clk tegra_list_clks[] = {
 	PERIPH_CLK("csi",	"tegra_camera",		"csi",	52,	0,	72000000,  mux_pllp_out3,		0),
 	PERIPH_CLK("isp",	"tegra_camera",		"isp",	23,	0,	150000000, mux_clk_m,			0), /* same frequency as VI */
 	PERIPH_CLK("csus",	"tegra_camera",		"csus",	92,	0,	150000000, mux_clk_m,			PERIPH_NO_RESET),
+	PERIPH_CLK("pex",       NULL,			"pex",  70,     0,	26000000,  mux_clk_m,			PERIPH_MANUAL_RESET),
+	PERIPH_CLK("afi",       NULL,			"afi",  72,     0,	26000000,  mux_clk_m,			PERIPH_MANUAL_RESET),
+	PERIPH_CLK("pcie_xclk", NULL,		  "pcie_xclk",  74,     0,	26000000,  mux_clk_m,			PERIPH_MANUAL_RESET),
 
 	SHARED_CLK("avp.sclk",	"tegra-avp",		"sclk",	&tegra_clk_sclk),
 	SHARED_CLK("avp.emc",	"tegra-avp",		"emc",	&tegra_clk_emc),
@@ -2106,6 +2154,7 @@ struct clk *tegra_ptr_clks[] = {
 	&tegra_clk_blink,
 	&tegra_clk_cop,
 	&tegra_clk_emc,
+	&tegra_pll_e,
 };
 
 static void tegra2_init_one_clock(struct clk *c)
-- 
1.7.3.1
