From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] clk: tegra: add ac97 controller clock
Date: Mon,  6 May 2013 15:11:11 -0600
Message-ID: <1367874671-11474-3-git-send-email-swarren@wwwdotorg.org>
References: <1367874671-11474-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367874671-11474-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

AC97 controller clock is hardwired to pll_a_out0.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index ecfe532..2547bc0 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -872,6 +872,14 @@ static void __init tegra20_periph_clk_init(void)
 	struct clk *clk;
 	int i;
 
+	/* ac97 */
+	clk = tegra_clk_register_periph_gate("ac97", "pll_a_out0",
+				    TEGRA_PERIPH_ON_APB,
+				    clk_base, 0, 3, &periph_l_regs,
+				    periph_clk_enb_refcnt);
+	clk_register_clkdev(clk, NULL, "tegra20-ac97");
+	clks[ac97] = clk;
+
 	/* apbdma */
 	clk = tegra_clk_register_periph_gate("apbdma", "pclk", 0, clk_base,
 				    0, 34, &periph_h_regs,
-- 
1.7.10.4
