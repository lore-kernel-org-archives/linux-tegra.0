From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arch_timer: Do not register arch_sys_counter twice
Date: Tue, 15 Oct 2013 15:31:51 +0200
Message-ID: <1381843911-31962-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit 65cd4f6 (arch_timer: Move to generic sched_clock framework) added
code to register the arch_sys_counter in arch_timer_register() but it is
already registered in arch_counter_register(). This results in the timer
being added to the clocksource list twice, therefore causing an infinite
loop in the list.

Remove the duplicate registration and register the scheduler clock after
the original registration instead.

This fixes a hang during boot on Tegra114 (Cortex-A15).

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
While I've only tested this on Tegra114, I suspect the same hang during
boot happens for all processors that use this clock source.

 drivers/clocksource/arm_arch_timer.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index f655036..95fb944 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -436,6 +436,9 @@ static void __init arch_counter_register(unsigned type)
 	cyclecounter.mult = clocksource_counter.mult;
 	cyclecounter.shift = clocksource_counter.shift;
 	timecounter_init(&timecounter, &cyclecounter, start_count);
+
+	/* 56 bits minimum, so we assume worst case rollover */
+	sched_clock_register(arch_timer_read_counter, 56, arch_timer_rate);
 }
 
 static void arch_timer_stop(struct clock_event_device *clk)
@@ -515,15 +518,6 @@ static int __init arch_timer_register(void)
 		goto out;
 	}
 
-	clocksource_register_hz(&clocksource_counter, arch_timer_rate);
-	cyclecounter.mult = clocksource_counter.mult;
-	cyclecounter.shift = clocksource_counter.shift;
-	timecounter_init(&timecounter, &cyclecounter,
-			 arch_counter_get_cntvct());
-
-	/* 56 bits minimum, so we assume worst case rollover */
-	sched_clock_register(arch_timer_read_counter, 56, arch_timer_rate);
-
 	if (arch_timer_use_virtual) {
 		ppi = arch_timer_ppi[VIRT_PPI];
 		err = request_percpu_irq(ppi, arch_timer_handler_virt,
-- 
1.8.4
