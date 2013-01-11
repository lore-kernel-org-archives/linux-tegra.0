From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] clk: tegra: add KBC clock for Tegra20
Date: Fri, 11 Jan 2013 16:17:42 -0700
Message-ID: <1357946262-25823-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This clock has been missing from all our upstream clock drivers. Add it
by copying the tegra_clk_periph_gate() call from Tegra30; the data
matches what's in the ChromeOS kernel for this clock.

Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mike, I'd need to apply this to the Tegra tree as part of the common
clock framework conversion.

 drivers/clk/tegra/clk-tegra20.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index f40b6f7..5847b5e 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -896,6 +896,13 @@ static void __init tegra20_periph_clk_init(void)
 	clk_register_clkdev(clk, NULL, "timer");
 	clks[timer] = clk;
 
+	/* kbc */
+	clk = tegra_clk_periph_gate("kbc", "clk_32k", TEGRA_PERIPH_NO_RESET |
+				    TEGRA_PERIPH_ON_APB, clk_base, 0,
+				    36, &periph_h_regs, periph_clk_enb_refcnt);
+	clk_register_clkdev(clk, NULL, "tegra-kbc");
+	clks[kbc] = clk;
+
 	/* csus */
 	clk = tegra_clk_periph_gate("csus", "clk_m", TEGRA_PERIPH_NO_RESET,
 				    clk_base, 0, 92, &periph_u_regs,
-- 
1.7.10.4
