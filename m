From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 12/14] clk: tegra: Fix T210 PLLRE registration
Date: Tue, 25 Jul 2017 13:34:13 +0300
Message-ID: <1500978856-5981-13-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

Switched Tegra210 PLLRE registration to common PLL ops instead of special
PLLRE ops used on previous Tegra chips. The latter ops do not follow
chip specific PLL frequency table, and do not apply chip specific rate
calculation method.

Removed unnecessary default rate setting that duplicates h/w reset
state, and is overwritten by clock initialization, anyway.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c6bce4a..7c369e2 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2355,7 +2355,6 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 			  struct tegra_clk_pll_params *pll_params,
 			  spinlock_t *lock, unsigned long parent_rate)
 {
-	u32 val;
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
@@ -2369,26 +2368,8 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
-	/* program minimum rate by default */
-
-	val = pll_readl_base(pll);
-	if (val & PLL_BASE_ENABLE)
-		WARN_ON(readl_relaxed(clk_base + pll_params->iddq_reg) &
-				BIT(pll_params->iddq_bit_idx));
-	else {
-		val = 0x4 << divm_shift(pll);
-		val |= 0x41 << divn_shift(pll);
-		pll_writel_base(val, pll);
-	}
-
-	/* disable lock override */
-
-	val = pll_readl_misc(pll);
-	val &= ~BIT(29);
-	pll_writel_misc(val, pll);
-
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
-				      &tegra_clk_pllre_ops);
+				      &tegra_clk_pll_ops);
 	if (IS_ERR(clk))
 		kfree(pll);
 
-- 
1.9.1
