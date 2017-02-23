From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 5/7] clk: tegra: don't warn for PLL defaults unnecessarily
Date: Thu, 23 Feb 2017 12:44:42 +0200
Message-ID: <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

If the PLL is on, only warn if the defaults are not yet set. Otherwise be
silent.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index b7ef8a7..fe698d2 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -502,7 +502,7 @@ static void tegra210_pllcx_set_defaults(const char *name,
 	pllcx->params->defaults_set = true;
 
 	if (readl_relaxed(clk_base + pllcx->params->base_reg) &
-			PLL_ENABLE) {
+			PLL_ENABLE && !pllcx->params->defaults_set) {
 		/* PLL is ON: only check if defaults already set */
 		pllcx_check_defaults(pllcx->params);
 		pr_warn("%s already enabled. Postponing set full defaults\n",
@@ -608,7 +608,6 @@ static void tegra210_plld_set_defaults(struct tegra_clk_pll *plld)
 
 	if (readl_relaxed(clk_base + plld->params->base_reg) &
 			PLL_ENABLE) {
-		pr_warn("PLL_D already enabled. Postponing set full defaults\n");
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
@@ -625,6 +624,9 @@ static void tegra210_plld_set_defaults(struct tegra_clk_pll *plld)
 		_pll_misc_chk_default(clk_base, plld->params, 0, val,
 				~mask & PLLD_MISC0_WRITE_MASK);
 
+		if (!plld->params->defaults_set)
+			pr_warn("PLL_D already enabled. Postponing set full defaults\n");
+
 		/* Enable lock detect */
 		mask = PLLD_MISC0_LOCK_ENABLE | PLLD_MISC0_LOCK_OVERRIDE;
 		val = readl_relaxed(clk_base + plld->params->ext_misc_reg[0]);
@@ -896,7 +898,6 @@ static void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
 	val |= step_b << PLLX_MISC2_DYNRAMP_STEPB_SHIFT;
 
 	if (readl_relaxed(clk_base + pllx->params->base_reg) & PLL_ENABLE) {
-		pr_warn("PLL_X already enabled. Postponing set full defaults\n");
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
@@ -904,6 +905,8 @@ static void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
 		 */
 		pllx_check_defaults(pllx);
 
+		if (!pllx->params->defaults_set)
+			pr_warn("PLL_X already enabled. Postponing set full defaults\n");
 		/* Configure dyn ramp, disable lock override */
 		writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
 
@@ -948,7 +951,6 @@ static void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
 	pllmb->params->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
-		pr_warn("PLL_MB already enabled. Postponing set full defaults\n");
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
@@ -959,6 +961,8 @@ static void tegra210_pllmb_set_defaults(struct tegra_clk_pll *pllmb)
 		_pll_misc_chk_default(clk_base, pllmb->params, 0, val,
 				~mask & PLLMB_MISC1_WRITE_MASK);
 
+		if (!pllmb->params->defaults_set)
+			pr_warn("PLL_MB already enabled. Postponing set full defaults\n");
 		/* Enable lock detect */
 		val = readl_relaxed(clk_base + pllmb->params->ext_misc_reg[0]);
 		val &= ~mask;
@@ -1008,13 +1012,14 @@ static void tegra210_pllp_set_defaults(struct tegra_clk_pll *pllp)
 	pllp->params->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
-		pr_warn("PLL_P already enabled. Postponing set full defaults\n");
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
 		 * that can be updated in flight.
 		 */
 		pllp_check_defaults(pllp, true);
+		if (!pllp->params->defaults_set)
+			pr_warn("PLL_P already enabled. Postponing set full defaults\n");
 
 		/* Enable lock detect */
 		val = readl_relaxed(clk_base + pllp->params->ext_misc_reg[0]);
@@ -1069,13 +1074,14 @@ static void tegra210_pllu_set_defaults(struct tegra_clk_pll *pllu)
 	pllu->params->defaults_set = true;
 
 	if (val & PLL_ENABLE) {
-		pr_warn("PLL_U already enabled. Postponing set full defaults\n");
 
 		/*
 		 * PLL is ON: check if defaults already set, then set those
 		 * that can be updated in flight.
 		 */
 		pllu_check_defaults(pllu, false);
+		if (!pllu->params->defaults_set)
+			pr_warn("PLL_U already enabled. Postponing set full defaults\n");
 
 		/* Enable lock detect */
 		val = readl_relaxed(clk_base + pllu->params->ext_misc_reg[0]);
-- 
1.9.1

