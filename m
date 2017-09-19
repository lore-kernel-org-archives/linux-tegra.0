From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH] clk: tegra30: fix cclk_lp divisor register
Date: Tue, 19 Sep 2017 04:48:10 +0200
Message-ID: <f54b8ff896d3dcbae51741b817d65a7e9a21987a.1505789180.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

According to comments in code and common sense, cclk_lp uses its
own divisor, not cclk_g's.

Fixes: b08e8c0ecc42 ("clk: tegra: add clock support for Tegra30")
Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 8f5a3e7c3bf9..95b7df4a8abd 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -964,7 +964,7 @@ static void __init tegra30_super_clk_init(void)
 	 * U71 divider of cclk_lp.
 	 */
 	clk = tegra_clk_register_divider("pll_p_out3_cclklp", "pll_p_out3",
-				clk_base + SUPER_CCLKG_DIVIDER, 0,
+				clk_base + SUPER_CCLKLP_DIVIDER, 0,
 				TEGRA_DIVIDER_INT, 16, 8, 1, NULL);
 	clk_register_clkdev(clk, "pll_p_out3_cclklp", NULL);
 
-- 
2.11.0
