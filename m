From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Demote EMC clock inconsistency BUG to WARN
Date: Mon,  6 Feb 2012 17:09:15 -0800
Message-ID: <1328576955-6295-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When this inconsistency occurs, the system will typically operate without
issue, it's just that EMC scaling won't optimally. Convert the BUG_ON to
a WARN_ONCE in order to allow the kernel to boot, but still complain.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |   30 +++++++++++++++++++++++++-----
 1 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 74d314fd..592a4ee 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1143,15 +1143,35 @@ static void tegra2_emc_clk_init(struct clk *c)
 
 static long tegra2_emc_clk_round_rate(struct clk *c, unsigned long rate)
 {
-	long new_rate = rate;
+	long emc_rate;
+	long clk_rate;
 
-	new_rate = tegra_emc_round_rate(new_rate);
-	if (new_rate < 0)
+	/*
+	 * The slowest entry in the EMC clock table that is at least as
+	 * fast as rate.
+	 */
+	emc_rate = tegra_emc_round_rate(rate);
+	if (emc_rate < 0)
 		return c->max_rate;
 
-	BUG_ON(new_rate != tegra2_periph_clk_round_rate(c, new_rate));
+	/*
+	 * The fastest rate the PLL will generate that is at most the
+	 * requested rate.
+	 */
+	clk_rate = tegra2_periph_clk_round_rate(c, emc_rate);
+
+	/*
+	 * If this fails, and emc_rate > clk_rate, it's because the maximum
+	 * rate in the EMC tables is larger than the maximum rate of the EMC
+	 * clock. The EMC clock's max rate is the rate it was running when the
+	 * kernel booted. Such a mismatch is probably due to using the wrong
+	 * BCT, i.e. using a Tegra20 BCT with an EMC table written for Tegra25.
+	 */
+	WARN_ONCE(emc_rate != clk_rate,
+		"emc_rate %ld != clk_rate %ld",
+		emc_rate, clk_rate);
 
-	return new_rate;
+	return emc_rate;
 }
 
 static int tegra2_emc_clk_set_rate(struct clk *c, unsigned long rate)
-- 
1.7.5.4
