From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: fix pllre initilization
Date: Wed, 5 Jun 2013 17:21:46 +0300
Message-ID: <1370442111-13215-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PLLRE flags weren't set correctly. Fixed in this patch.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 4293643..197074a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1424,7 +1424,7 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
-	pll_flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
+	pll_flags |= TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_LOCK_MISC;
 	pll = _tegra_init_pll(clk_base, pmc, fixed_rate, pll_params, pll_flags,
 			      freq_table, lock);
 	if (IS_ERR(pll))
@@ -1451,7 +1451,6 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 	val &= ~BIT(29);
 	pll_writel_misc(val, pll);
 
-	pll_flags |= TEGRA_PLL_LOCK_MISC;
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 				      &tegra_clk_pllre_ops);
 	if (IS_ERR(clk))
-- 
1.7.7.rc0.72.g4b5ea.dirty
