From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] clk: tegra: Make sor_safe the parent of dpaux and dpaux1
Date: Thu, 23 Jun 2016 12:52:30 +0200
Message-ID: <20160623105231.24383-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

It turns out that sor_safe, rather than pll_p, is the parent of the
dpaux and dpaux1 clocks.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index aab32af77aa2..fe295b4102ca 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2466,11 +2466,11 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					1, 2);
 	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
 
-	clk = tegra_clk_register_periph_fixed("dpaux", "pll_p", 0, clk_base,
+	clk = tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_base,
 					      1, 17, 181);
 	clks[TEGRA210_CLK_DPAUX] = clk;
 
-	clk = tegra_clk_register_periph_fixed("dpaux1", "pll_p", 0, clk_base,
+	clk = tegra_clk_register_periph_fixed("dpaux1", "sor_safe", 0, clk_base,
 					      1, 17, 207);
 	clks[TEGRA210_CLK_DPAUX1] = clk;
 
-- 
2.8.3
