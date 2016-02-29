From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 2/2] clk: tegra30: fix PLL_U post divider and init rate
Date: Mon, 29 Feb 2016 21:46:07 +0100
Message-ID: <1456778767-18413-2-git-send-email-dev@lynxeye.de>
References: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456778767-18413-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The post divider value in the frequency table is wrong as it
would lead to the PLL producing a output rate of 960MHz instead
of the desired 480MHz. This wasn't a problem as nothing used the
table to actually init the PLL rate, but the bootloader
configuration was used unaltered.

If the bootloader does not set up the PLL it will fail to come
when used under Linux. To fix this don't rely on the bootloader,
but set the correct rate in the clock driver.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 236e2db..9396f49 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -339,11 +339,11 @@ static const struct pdiv_map pllu_p[] = {
 };
 
 static struct tegra_clk_pll_freq_table pll_u_freq_table[] = {
-	{ 12000000, 480000000, 960, 12, 1, 12 },
-	{ 13000000, 480000000, 960, 13, 1, 12 },
-	{ 16800000, 480000000, 400,  7, 1,  5 },
-	{ 19200000, 480000000, 200,  4, 1,  3 },
-	{ 26000000, 480000000, 960, 26, 1, 12 },
+	{ 12000000, 480000000, 960, 12, 2, 12 },
+	{ 13000000, 480000000, 960, 13, 2, 12 },
+	{ 16800000, 480000000, 400,  7, 2,  5 },
+	{ 19200000, 480000000, 200,  4, 2,  3 },
+	{ 26000000, 480000000, 960, 26, 2, 12 },
 	{        0,         0,   0,  0, 0,  0 },
 };
 
@@ -1380,6 +1380,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_GR2D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
+	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.5.0
