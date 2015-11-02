From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v4 3/5] clk: tegra20: init NDFLASH clock to sensible rate
Date: Mon,  2 Nov 2015 21:33:20 +0100
Message-ID: <1446496402-8142-4-git-send-email-dev@lynxeye.de>
References: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446496402-8142-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Set up the NAND Flash controller clock to run at 150MHz
instead of the rate set by the bootloader. This is a
conservative rate which also yields good performance.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index bf004f0..741c74e 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1062,6 +1062,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA20_CLK_DISP2, TEGRA20_CLK_PLL_P, 600000000, 0},
 	{TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0},
 	{TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0},
+	{TEGRA20_CLK_NDFLASH, TEGRA20_CLK_PLL_P, 150000000, 0},
 	{TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0}, /* This MUST be the last entry */
 };
 
-- 
2.4.3
