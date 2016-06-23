From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] clk: tegra: Micro-optimize Tegra210 clock setup
Date: Thu, 23 Jun 2016 12:52:31 +0200
Message-ID: <20160623105231.24383-2-thierry.reding@gmail.com>
References: <20160623105231.24383-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623105231.24383-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

sor_safe being the parent of the dpaux and dpaux1 clocks, it's not only
natural, but also slightly more efficient, to initialize it before its
children. This avoids orphaning the dpaux and dpaux1 clocks only to get
them reparented when the sor_safe clock is registered.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index fe295b4102ca..b4df5c46642f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2466,6 +2466,10 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					1, 2);
 	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
 
+	clk = tegra_clk_register_periph_fixed("sor_safe", "pll_p", 0, clk_base,
+					      1, 17, 222);
+	clks[TEGRA210_CLK_SOR_SAFE] = clk;
+
 	clk = tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_base,
 					      1, 17, 181);
 	clks[TEGRA210_CLK_DPAUX] = clk;
@@ -2474,10 +2478,6 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					      1, 17, 207);
 	clks[TEGRA210_CLK_DPAUX1] = clk;
 
-	clk = tegra_clk_register_periph_fixed("sor_safe", "pll_p", 0, clk_base,
-					      1, 17, 222);
-	clks[TEGRA210_CLK_SOR_SAFE] = clk;
-
 	/* pll_d_dsi_out */
 	clk = clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
 				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
-- 
2.8.3
