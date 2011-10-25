From: <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm/tegra: clk_get should not be fatal
Date: Tue, 25 Oct 2011 19:15:29 +0300
Message-ID: <1319559329-324-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The timer and rtc-timer clocks aren't gated by default, so there is no reason
to crash the system if the dummy enable call failed.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/timer.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c
index e2272d2..e12b064 100644
--- a/arch/arm/mach-tegra/timer.c
+++ b/arch/arm/mach-tegra/timer.c
@@ -186,16 +186,20 @@ static void __init tegra_init_timer(void)
 	int ret;
 
 	clk = clk_get_sys("timer", NULL);
-	BUG_ON(IS_ERR(clk));
-	clk_enable(clk);
+	if (IS_ERR(clk))
+		pr_warning("Unable to get timer clock");
+	else
+		clk_enable(clk);
 
 	/*
 	 * rtc registers are used by read_persistent_clock, keep the rtc clock
 	 * enabled
 	 */
 	clk = clk_get_sys("rtc-tegra", NULL);
-	BUG_ON(IS_ERR(clk));
-	clk_enable(clk);
+	if (IS_ERR(clk))
+		pr_warning("Unable to get rtc-tegra clock");
+	else
+		clk_enable(clk);
 
 #ifdef CONFIG_HAVE_ARM_TWD
 	twd_base = IO_ADDRESS(TEGRA_ARM_PERIF_BASE + 0x600);
-- 
1.7.7.rc0.72.g4b5ea.dirty
