From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra114: correctly output clk_32k
Date: Fri, 24 May 2013 16:10:07 +0900
Message-ID: <1369379407-12764-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra has a blink timer register that allows to modulate the
clk_32k clock before outputting it. Since clk_32k is presented to the
kernel as a fixed clock, make sure this register does not tamper with
the clock frequency and that clk_32k is outputted as-is, similarly to
what is done on t20 and t30.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index d78e16e..dc76d67 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -127,6 +127,7 @@
 #define PMC_DPD_PADS_ORIDE_BLINK_ENB 20
 #define PMC_CTRL 0
 #define PMC_CTRL_BLINK_ENB 7
+#define PMC_BLINK_TIMER 0x40
 
 #define OSC_CTRL			0x50
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
@@ -1625,6 +1626,8 @@ static void __init tegra114_pmc_clk_init(void __iomem *pmc_base)
 	clks[clk_out_3] = clk;
 
 	/* blink */
+	/* clear the blink timer register to directly output clk_32k */
+	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
 	clk = clk_register_gate(NULL, "blink_override", "clk_32k", 0,
 				pmc_base + PMC_DPD_PADS_ORIDE,
 				PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);
-- 
1.8.2.3
