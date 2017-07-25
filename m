From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 10/14] clk: tegra: Re-factor T210 PLLX registration
Date: Tue, 25 Jul 2017 13:34:11 +0300
Message-ID: <1500978856-5981-11-git-send-email-pdeschrijver@nvidia.com>
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

Tegra210 PLLX uses the same sequences than then PLLC instances. So there
is no need to have a special registration function and ops struct for it.
Simplify the code by changing all references to the Tegra210 PLLX
registration function to the Tegra210 PLLC registration function and
avoid duplicate functionality.

Based on work by Alex Frid <afrid@nvidia.com>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c              | 40 --------------------------------
 drivers/clk/tegra/clk-tegra-super-gen4.c | 11 +++++++--
 drivers/clk/tegra/clk-tegra210.c         |  2 +-
 drivers/clk/tegra/clk.h                  |  6 -----
 4 files changed, 10 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 695ccb4..02f34e6 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2610,46 +2610,6 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 	return clk;
 }
 
-struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
-			const char *parent_name, void __iomem *clk_base,
-			void __iomem *pmc, unsigned long flags,
-			struct tegra_clk_pll_params *pll_params,
-			spinlock_t *lock)
-{
-	struct tegra_clk_pll *pll;
-	struct clk *clk, *parent;
-	unsigned long parent_rate;
-
-	parent = __clk_lookup(parent_name);
-	if (!parent) {
-		WARN(1, "parent clk %s of %s must be registered first\n",
-			name, parent_name);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (!pll_params->pdiv_tohw)
-		return ERR_PTR(-EINVAL);
-
-	parent_rate = clk_get_rate(parent);
-
-	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
-
-	if (pll_params->adjust_vco)
-		pll_params->vco_min = pll_params->adjust_vco(pll_params,
-							     parent_rate);
-
-	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
-	if (IS_ERR(pll))
-		return ERR_CAST(pll);
-
-	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
-				      &tegra_clk_pll_ops);
-	if (IS_ERR(clk))
-		kfree(pll);
-
-	return clk;
-}
-
 struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 				const char *parent_name, void __iomem *clk_base,
 				unsigned long flags,
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 474de0f..4f6fd30 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -232,8 +232,15 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 	if (!dt_clk)
 		return;
 
-	clk = tegra_clk_register_pllxc("pll_x", "pll_ref", clk_base,
-			pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+	if (gen_info->gen == gen5)
+		clk = tegra_clk_register_pllc_tegra210("pll_x", "pll_ref",
+			clk_base, pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+	else
+#endif
+		clk = tegra_clk_register_pllxc("pll_x", "pll_ref", clk_base,
+				pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+
 	*dt_clk = clk;
 
 	/* PLLX_OUT0 */
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 1e470ca..4fa7ab3 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2701,7 +2701,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	struct clk *clk;
 
 	/* PLLC */
-	clk = tegra_clk_register_pllxc_tegra210("pll_c", "pll_ref", clk_base,
+	clk = tegra_clk_register_pllc_tegra210("pll_c", "pll_ref", clk_base,
 			pmc, 0, &pll_c_params, NULL);
 	if (!WARN_ON(IS_ERR(clk)))
 		clk_register_clkdev(clk, "pll_c", NULL);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 945b070..872f118 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -362,12 +362,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 			    struct tegra_clk_pll_params *pll_params,
 			    spinlock_t *lock);
 
-struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
-			const char *parent_name, void __iomem *clk_base,
-			void __iomem *pmc, unsigned long flags,
-			struct tegra_clk_pll_params *pll_params,
-			spinlock_t *lock);
-
 struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 			   void __iomem *clk_base, void __iomem *pmc,
 			   unsigned long flags,
-- 
1.9.1
