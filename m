From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] clocksource/drivers/tegra: allow timer irq affinity change
Date: Sun, 25 Oct 2015 16:40:30 +0100
Message-ID: <1445787630-13251-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Allow the timer core to change the smp affinity of the broadcast timer
irq by setting CLOCK_EVT_FEAT_DYNIRQ flag.

This reduces interrupt pressure and wakeups on CPU0 as well as vastly
reducing the number of timer broadcast IPIs.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/clocksource/tegra20_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 6ebda11..38333ab 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -96,7 +96,8 @@ static struct clock_event_device tegra_clockevent = {
 	.name			= "timer0",
 	.rating			= 300,
 	.features		= CLOCK_EVT_FEAT_ONESHOT |
-				  CLOCK_EVT_FEAT_PERIODIC,
+				  CLOCK_EVT_FEAT_PERIODIC |
+				  CLOCK_EVT_FEAT_DYNIRQ,
 	.set_next_event		= tegra_timer_set_next_event,
 	.set_state_shutdown	= tegra_timer_shutdown,
 	.set_state_periodic	= tegra_timer_set_periodic,
-- 
2.4.3
