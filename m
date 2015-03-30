From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/11] clk: tegra: Use the proper parent for plld_dsi
Date: Mon, 30 Mar 2015 14:31:13 +0200
Message-ID: <1427718673-32011-12-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The current parent, plld_out0, does not exist. The proper name is
pll_d_out0. While at it, rename the plld_dsi clock to pll_d_dsi_out to
be more consistent with other clock names.

Fixes: b270491eb9a0 ("clk: tegra: Define PLLD_DSI and remove dsia(b)_mux")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c                | 14 ++++++++------
 include/dt-bindings/clock/tegra124-car-common.h |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index f1fa29ec7951..11f857cd5f6a 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1113,16 +1113,18 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 					1, 2);
 	clks[TEGRA124_CLK_XUSB_SS_DIV2] = clk;
 
-	clk = clk_register_gate(NULL, "plld_dsi", "plld_out0", 0,
+	clk = clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
 				clk_base + PLLD_MISC, 30, 0, &pll_d_lock);
-	clks[TEGRA124_CLK_PLLD_DSI] = clk;
+	clks[TEGRA124_CLK_PLL_D_DSI_OUT] = clk;
 
-	clk = tegra_clk_register_periph_gate("dsia", "plld_dsi", 0, clk_base,
-					     0, 48, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("dsia", "pll_d_dsi_out", 0,
+					     clk_base, 0, 48,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA124_CLK_DSIA] = clk;
 
-	clk = tegra_clk_register_periph_gate("dsib", "plld_dsi", 0, clk_base,
-					     0, 82, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("dsib", "pll_d_dsi_out", 0,
+					     clk_base, 0, 82,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA124_CLK_DSIB] = clk;
 
 	/* emc mux */
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index ae2eb17a1658..a2156090563f 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -297,7 +297,7 @@
 #define TEGRA124_CLK_PLL_C4 270
 #define TEGRA124_CLK_PLL_DP 271
 #define TEGRA124_CLK_PLL_E_MUX 272
-#define TEGRA124_CLK_PLLD_DSI 273
+#define TEGRA124_CLK_PLL_D_DSI_OUT 273
 /* 274 */
 /* 275 */
 /* 276 */
-- 
2.3.2
