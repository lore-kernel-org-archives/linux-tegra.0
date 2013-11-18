From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] clk: tegra: Initialize DSI low-power clocks
Date: Mon, 18 Nov 2013 16:11:36 +0100
Message-ID: <1384787499-26994-2-git-send-email-treding@nvidia.com>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384787499-26994-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The low-power DSI clocks are used during host-driven transactions on the
DSI bus. Documentation recommends that they be children of PLLP and run
at a frequency of at least 52 MHz.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note: The 68 MHz that they are configured to is what the downstream
kernel uses. It seems as good a default as any.

 drivers/clk/tegra/clk-tegra114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 9036a22ee5aa..ceb4477ec651 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1305,6 +1305,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA114_CLK_DISP2, TEGRA114_CLK_PLL_P, 600000000, 0},
 	{TEGRA114_CLK_GR2D, TEGRA114_CLK_PLL_C2, 300000000, 0},
 	{TEGRA114_CLK_GR3D, TEGRA114_CLK_PLL_C2, 300000000, 0},
+	{TEGRA114_CLK_DSIALP, TEGRA114_CLK_PLL_P, 68000000, 0},
+	{TEGRA114_CLK_DSIBLP, TEGRA114_CLK_PLL_P, 68000000, 0},
 
 	/* This MUST be the last entry. */
 	{TEGRA114_CLK_CLK_MAX, TEGRA114_CLK_CLK_MAX, 0, 0},
-- 
1.8.4.2
