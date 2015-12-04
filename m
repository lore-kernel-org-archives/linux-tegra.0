From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] clk: tegra210: Fix sparse warnings for functions not declared as static
Date: Fri, 4 Dec 2015 17:04:24 +0000
Message-ID: <1449248665-22343-2-git-send-email-jonathanh@nvidia.com>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Sparse reports the following warnings for functions in clk-tegra210.c
that should be declared as static:

drivers/clk/tegra/clk-tegra210.c:460:6: warning: symbol
 'tegra210_pllcx_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:485:6: warning: symbol
 '_pllc_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:490:6: warning: symbol
 '_pllc2_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:495:6: warning: symbol
 '_pllc3_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:500:6: warning: symbol
 '_plla1_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:510:6: warning: symbol
 'tegra210_plla_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:562:6: warning: symbol
 'tegra210_plld_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:701:6: warning: symbol
 'tegra210_plld2_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:709:6: warning: symbol
 'tegra210_plldp_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:722:6: warning: symbol
 'tegra210_pllc4_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:731:6: warning: symbol
 'tegra210_pllre_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:844:6: warning: symbol
 'tegra210_pllx_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:904:6: warning: symbol
 'tegra210_pllmb_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:963:6: warning: symbol
 'tegra210_pllp_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:1025:6: warning: symbol
 'tegra210_pllu_set_defaults' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra210.c:1215:15: warning: symbol
 'tegra210_clk_adjust_vco_min' was not declared. Should it be static?

Fix this by declaring the above as static.

Fixes: b31eba5ff3f7 ("clk: tegra: Add support for Tegra210 clocks")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 3bd831c2b9db..842901693455 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -457,7 +457,8 @@ static void pllcx_check_defaults(struct tegra_clk_pll_params *params)
 			PLLCX_MISC3_WRITE_MASK);
 }
 
-void tegra210_pllcx_set_defaults(const char *name, struct tegra_clk_pll *pllcx)
+static void tegra210_pllcx_set_defaults(const char *name,
+					struct tegra_clk_pll *pllcx)
 {
 	pllcx->params->defaults_set = true;
 
@@ -482,22 +483,22 @@ void tegra210_pllcx_set_defaults(const char *name, struct tegra_clk_pll *pllcx)
 	udelay(1);
 }
 
-void _pllc_set_defaults(struct tegra_clk_pll *pllcx)
+static void _pllc_set_defaults(struct tegra_clk_pll *pllcx)
 {
 	tegra210_pllcx_set_defaults("PLL_C", pllcx);
 }
 
-void _pllc2_set_defaults(struct tegra_clk_pll *pllcx)
+static void _pllc2_set_defaults(struct tegra_clk_pll *pllcx)
 {
 	tegra210_pllcx_set_defaults("PLL_C2", pllcx);
 }
 
-void _pllc3_set_defaults(struct tegra_clk_pll *pllcx)
+static void _pllc3_set_defaults(struct tegra_clk_pll *pllcx)
 {
 	tegra210_pllcx_set_defaults("PLL_C3", pllcx);
 }
 
-void _plla1_set_defaults(struct tegra_clk_pll *pllcx)
+static void _plla1_set_defaults(struct tegra_clk_pll *pllcx)
 {
 	tegra210_pllcx_set_defaults("PLL_A1", pllcx);
 }
@@ -507,7 +508,7 @@ void _plla1_set_defaults(struct tegra_clk_pll *pllcx)
  * PLL with dynamic ramp and fractional SDM. Dynamic ramp is not used.
  * Fractional SDM is allowed to provide exact audio rates.
  */
-void tegra210_plla_set_defaults(struct tegra_clk_pll *plla)
+static void tegra210_plla_set_defaults(struct tegra_clk_pll *plla)
 {
 	u32 mask;
 	u32 val = readl_relaxed(clk_base + plla->params->base_reg);
@@ -559,7 +560,7 @@ void tegra210_plla_set_defaults(struct tegra_clk_pll *plla)
  * PLLD
  * PLL with fractional SDM.
  */
-void tegra210_plld_set_defaults(struct tegra_clk_pll *plld)
+static void tegra210_plld_set_defaults(struct tegra_clk_pll *plld)
 {
 	u32 val;
 	u32 mask = 0xffff;
@@ -698,7 +699,7 @@ static void plldss_defaults(const char *pll_name, struct tegra_clk_pll *plldss,
 	udelay(1);
 }
 
-void tegra210_plld2_set_defaults(struct tegra_clk_pll *plld2)
+static void tegra210_plld2_set_defaults(struct tegra_clk_pll *plld2)
 {
 	plldss_defaults("PLL_D2", plld2, PLLD2_MISC0_DEFAULT_VALUE,
 			PLLD2_MISC1_CFG_DEFAULT_VALUE,
@@ -706,7 +707,7 @@ void tegra210_plld2_set_defaults(struct tegra_clk_pll *plld2)
 			PLLD2_MISC3_CTRL2_DEFAULT_VALUE);
 }
 
-void tegra210_plldp_set_defaults(struct tegra_clk_pll *plldp)
+static void tegra210_plldp_set_defaults(struct tegra_clk_pll *plldp)
 {
 	plldss_defaults("PLL_DP", plldp, PLLDP_MISC0_DEFAULT_VALUE,
 			PLLDP_MISC1_CFG_DEFAULT_VALUE,
@@ -719,7 +720,7 @@ void tegra210_plldp_set_defaults(struct tegra_clk_pll *plldp)
  * Base and misc0 layout is the same as PLLD2/PLLDP, but no SDM/SSC support.
  * VCO is exposed to the clock tree via fixed 1/3 and 1/5 dividers.
  */
-void tegra210_pllc4_set_defaults(struct tegra_clk_pll *pllc4)
+static void tegra210_pllc4_set_defaults(struct tegra_clk_pll *pllc4)
 {
 	plldss_defaults("PLL_C4", pllc4, PLLC4_MISC0_DEFAULT_VALUE, 0, 0, 0);
 }
@@ -728,7 +729,7 @@ void tegra210_pllc4_set_defaults(struct tegra_clk_pll *pllc4)
  * PLLRE
  * VCO is exposed to the clock tree directly along with post-divider output
  */
-void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
+static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
 {
 	u32 mask;
 	u32 val = readl_relaxed(clk_base + pllre->params->base_reg);
@@ -841,7 +842,7 @@ static void pllx_check_defaults(struct tegra_clk_pll *pll)
 			PLLX_MISC5_WRITE_MASK);
 }
 
-void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
+static void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
 {
 	u32 val;
 	u32 step_a, step_b;
@@ -901,7 +902,7 @@ void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
 }
 
 /* PLLMB */
-void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
+static void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
 {
 	u32 mask, val = readl_relaxed(clk_base + pllmb->params->base_reg);
 
@@ -960,7 +961,7 @@ static void pllp_check_defaults(struct tegra_clk_pll *pll, bool enabled)
 			~mask & PLLP_MISC1_WRITE_MASK);
 }
 
-void tegra210_pllp_set_defaults(struct tegra_clk_pll *pllp)
+static void tegra210_pllp_set_defaults(struct tegra_clk_pll *pllp)
 {
 	u32 mask;
 	u32 val = readl_relaxed(clk_base + pllp->params->base_reg);
@@ -1022,7 +1023,7 @@ static void pllu_check_defaults(struct tegra_clk_pll *pll, bool hw_control)
 			~mask & PLLU_MISC1_WRITE_MASK);
 }
 
-void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
+static void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
 {
 	u32 val = readl_relaxed(clk_base + pllu->params->base_reg);
 
@@ -1212,8 +1213,9 @@ static void tegra210_clk_pll_set_gain(struct tegra_clk_pll_freq_table *cfg)
 	cfg->m *= PLL_SDM_COEFF;
 }
 
-unsigned long tegra210_clk_adjust_vco_min(struct tegra_clk_pll_params *params,
-					  unsigned long parent_rate)
+static unsigned long
+tegra210_clk_adjust_vco_min(struct tegra_clk_pll_params *params,
+			    unsigned long parent_rate)
 {
 	unsigned long vco_min = params->vco_min;
 
-- 
2.1.4
