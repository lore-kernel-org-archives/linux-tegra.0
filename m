From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH resend 2/2] clk: tegra: add ac97 controller clock
Date: Mon, 15 Apr 2013 09:31:45 +0200
Message-ID: <1366011105-2351-2-git-send-email-dev@lynxeye.de>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366011105-2351-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

AC97 controller clock is hardwired to pll_a_out0.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index a73278f..bbcca91 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -897,6 +897,14 @@ static void __init tegra20_periph_clk_init(void)
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
1.8.1.4
