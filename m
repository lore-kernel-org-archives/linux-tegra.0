From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clocksource/tegra: Remove unused suspend/resume code
Date: Thu, 28 Apr 2016 14:45:28 +0200
Message-ID: <1461847528-11948-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The tegra_timer_suspend() and tegra_timer_resume() functions are never
used, so they can be removed.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/tegra20_timer.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 38333aba3055..7b94ad2ab278 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -258,17 +258,3 @@ static void __init tegra20_init_rtc(struct device_node *np)
 	register_persistent_clock(NULL, tegra_read_persistent_clock64);
 }
 CLOCKSOURCE_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
-
-#ifdef CONFIG_PM
-static u32 usec_config;
-
-void tegra_timer_suspend(void)
-{
-	usec_config = timer_readl(TIMERUS_USEC_CFG);
-}
-
-void tegra_timer_resume(void)
-{
-	timer_writel(usec_config, TIMERUS_USEC_CFG);
-}
-#endif
-- 
2.8.0
