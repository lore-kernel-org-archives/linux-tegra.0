From: Bill Huang <bilhuang@nvidia.com>
Subject: [PATCH 1/1] clk: tegra: read correct iddq register in PLL_SS registration
Date: Mon, 18 May 2015 19:03:03 +0800
Message-ID: <1431946983-29554-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com
Cc: mturquette@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, pwalmsley@nvidia.com, rklein@nvidia.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This fixes bug in tegra_clk_register_pllss() which mistakenly assume the
iddq register is the PLL base address.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 05c6d08..f225325 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1826,7 +1826,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	struct clk *clk, *parent;
 	struct tegra_clk_pll_freq_table cfg;
 	unsigned long parent_rate;
-	u32 val;
+	u32 val, val_iddq;
 	int i;
 
 	if (!pll_params->div_nmp)
@@ -1874,14 +1874,17 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
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
1.9.1
