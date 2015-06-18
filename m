From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 24/25] clk: tegra: read correct iddq register in PLL_SS registration
Date: Thu, 18 Jun 2015 17:28:39 -0400
Message-ID: <1434662920-21469-25-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This fixes bug in tegra_clk_register_pllss() which mistakenly assume the
iddq register is the PLL base address.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 932a18ce821f..82f04a60649c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1921,7 +1921,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	struct clk *clk, *parent;
 	struct tegra_clk_pll_freq_table cfg;
 	unsigned long parent_rate;
-	u32 val;
+	u32 val, val_iddq;
 	int i;
 
 	if (!pll_params->div_nmp)
@@ -1968,14 +1968,17 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	pll_writel(PLLSS_CTRL1_DEFAULT, pll_params->ext_misc_reg[2], pll);
 
 	val = pll_readl_base(pll);
+	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
 	if (val & PLL_BASE_ENABLE) {
-		if (val & BIT(pll_params->iddq_bit_idx)) {
+		if (val_iddq & BIT(pll_params->iddq_bit_idx)) {
 			WARN(1, "%s is on but IDDQ set\n", name);
 			kfree(pll);
 			return ERR_PTR(-EINVAL);
 		}
-	} else
-		val |= BIT(pll_params->iddq_bit_idx);
+	} else {
+		val_iddq |= BIT(pll_params->iddq_bit_idx);
+		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
+	}
 
 	val &= ~PLLSS_LOCK_OVERRIDE;
 	pll_writel_base(val, pll);
-- 
1.7.9.5
