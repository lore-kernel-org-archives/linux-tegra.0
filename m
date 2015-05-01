From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v3 06/20] clk: tegra: pll-params: change misc_reg count from 3 -> 6
Date: Fri, 1 May 2015 14:53:53 -0400
Message-ID: <1430506447-29074-7-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

New SoC's may have more then 3 MISC registers, so bump up the
array size and use a #define to be more informative about the value.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 4ea8b5b089cd..03babba1c3b4 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -156,6 +156,8 @@ struct div_nmp {
 	u8		override_divp_shift;
 };
 
+#define MAX_PLL_MISC_REG_COUNT	6
+
 /**
  * struct clk_pll_params - PLL parameters
  *
@@ -213,7 +215,7 @@ struct tegra_clk_pll_params {
 	u32		iddq_bit_idx;
 	u32		aux_reg;
 	u32		dyn_ramp_reg;
-	u32		ext_misc_reg[3];
+	u32		ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
 	u32		pmc_divnm_reg;
 	u32		pmc_divp_reg;
 	u32		flags;
-- 
1.7.9.5
