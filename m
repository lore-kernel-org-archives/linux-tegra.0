From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] clk: tegra124: Add init data for dsi lp clocks
Date: Wed,  1 Oct 2014 12:40:41 -0400
Message-ID: <1412181642-19415-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Set the parent of the dsi lp clocks to pll_p and the rate
to 68MHz. The default parent is clk_m and rate is 12MHz, this
is too slow to receive data from the peripheral.

Per NVidia HW engineers, the optimal rate is 70MHz, but 68MHz
will suffice.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 9525c68..ffa1488 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1355,6 +1355,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0},
 	{TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_P, 0, 0},
 	{TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1},
+	{TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0},
+	{TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0},
 	{TEGRA124_CLK_SCLK, TEGRA124_CLK_PLL_P_OUT2, 102000000, 1},
 	{TEGRA124_CLK_DFLL_SOC, TEGRA124_CLK_PLL_P, 51000000, 1},
 	{TEGRA124_CLK_DFLL_REF, TEGRA124_CLK_PLL_P, 51000000, 1},
-- 
2.1.1
