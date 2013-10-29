From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] clk: tegra: Initialize secondary gr3d clock on Tegra30
Date: Tue, 29 Oct 2013 16:51:11 +0100
Message-ID: <1383061872-27899-2-git-send-email-treding@nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383061872-27899-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There are two GPUs on Tegra30 and each of them uses a separate clock, so
the secondary clock needs to be initialized in order for the gr3d module
to work properly.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 880290f..24ce357 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1377,6 +1377,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA30_CLK_TWD, TEGRA30_CLK_CLK_MAX, 0, 1},
 	{TEGRA30_CLK_GR2D, TEGRA30_CLK_PLL_C, 300000000, 0},
 	{TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0},
+	{TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0},
 	{TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0}, /* This MUST be the last entry. */
 };
 
-- 
1.8.4
