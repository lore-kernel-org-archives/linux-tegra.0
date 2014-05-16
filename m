From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH] clk: tegra: Fix wrong value written to PLLE_AUX
Date: Fri, 16 May 2014 16:50:20 +0300
Message-ID: <1400248220-16025-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The value written to PLLE_AUX was incorrect due to a wrong variable
being used.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Tested-by: Mikko Perttunen <mperttunen@nvidia.com>
---
  This fix is required for the (upcoming) SATA support.
 drivers/clk/tegra/clk-pll.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0d20241..e1769ad 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1718,7 +1718,7 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 					"pll_re_vco");
 	} else {
 		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
-		pll_writel(val, pll_params->aux_reg, pll);
+		pll_writel(val_aux, pll_params->aux_reg, pll);
 	}
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
-- 
1.7.9.5
