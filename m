From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 06/20] clk: tegra: pll-params: change misc_reg count from 3 -> 6
Date: Mon, 4 May 2015 12:37:26 -0400
Message-ID: <1430757460-9478-7-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

New SoC's may have more then 3 MISC registers, so bump up the
array size and use a #define to be more informative about the value.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 5759b8bfb80e..8e7361886cf9 100644
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
