From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] clk: tegra114: Initialize clocks needed for HDMI
Date: Tue, 29 Oct 2013 16:51:10 +0100
Message-ID: <1383061872-27899-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add disp1 and disp2 clocks to the clock initialization table. These
clocks are required for display and HDMI support.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index e365b35..624077d 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1300,6 +1300,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA114_CLK_HOST1X, TEGRA114_CLK_PLL_P, 136000000, 0},
 	{TEGRA114_CLK_DFLL_SOC, TEGRA114_CLK_PLL_P, 51000000, 1},
 	{TEGRA114_CLK_DFLL_REF, TEGRA114_CLK_PLL_P, 51000000, 1},
+	{TEGRA114_CLK_DISP1, TEGRA114_CLK_PLL_P, 600000000, 0},
+	{TEGRA114_CLK_DISP2, TEGRA114_CLK_PLL_P, 600000000, 0},
 	{TEGRA114_CLK_GR2D, TEGRA114_CLK_PLL_C2, 300000000, 0},
 	{TEGRA114_CLK_GR3D, TEGRA114_CLK_PLL_C2, 300000000, 0},
 
-- 
1.8.4
