From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 33/74] clockevents/drivers/tegra20: Migrate to new 'set-state' interface
Date: Mon, 10 Aug 2015 11:51:50 +0200
Message-ID: <1439200352-26767-33-git-send-email-daniel.lezcano@linaro.org>
References: <55C87382.4070309@linaro.org>
 <1439200352-26767-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439200352-26767-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mingo@kernel.org
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Viresh Kumar <viresh.kumar@linaro.org>

Migrate tegra20 driver to the new 'set-state' interface provided by
clockevents core, the earlier 'set-mode' interface is marked obsolete
now.

This also enables us to implement callbacks for new states of clockevent
devices, for example: ONESHOT_STOPPED.

Cc: Thierry Reding <treding@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/tegra20_timer.c | 45 ++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 5a112d7..6ebda11 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -72,33 +72,36 @@ static int tegra_timer_set_next_event(unsigned long cycles,
 	return 0;
 }
 
-static void tegra_timer_set_mode(enum clock_event_mode mode,
-				    struct clock_event_device *evt)
+static inline void timer_shutdown(struct clock_event_device *evt)
 {
-	u32 reg;
-
 	timer_writel(0, TIMER3_BASE + TIMER_PTV);
+}
 
-	switch (mode) {
-	case CLOCK_EVT_MODE_PERIODIC:
-		reg = 0xC0000000 | ((1000000/HZ)-1);
-		timer_writel(reg, TIMER3_BASE + TIMER_PTV);
-		break;
-	case CLOCK_EVT_MODE_ONESHOT:
-		break;
-	case CLOCK_EVT_MODE_UNUSED:
-	case CLOCK_EVT_MODE_SHUTDOWN:
-	case CLOCK_EVT_MODE_RESUME:
-		break;
-	}
+static int tegra_timer_shutdown(struct clock_event_device *evt)
+{
+	timer_shutdown(evt);
+	return 0;
+}
+
+static int tegra_timer_set_periodic(struct clock_event_device *evt)
+{
+	u32 reg = 0xC0000000 | ((1000000 / HZ) - 1);
+
+	timer_shutdown(evt);
+	timer_writel(reg, TIMER3_BASE + TIMER_PTV);
+	return 0;
 }
 
 static struct clock_event_device tegra_clockevent = {
-	.name		= "timer0",
-	.rating		= 300,
-	.features	= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC,
-	.set_next_event	= tegra_timer_set_next_event,
-	.set_mode	= tegra_timer_set_mode,
+	.name			= "timer0",
+	.rating			= 300,
+	.features		= CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_PERIODIC,
+	.set_next_event		= tegra_timer_set_next_event,
+	.set_state_shutdown	= tegra_timer_shutdown,
+	.set_state_periodic	= tegra_timer_set_periodic,
+	.set_state_oneshot	= tegra_timer_shutdown,
+	.tick_resume		= tegra_timer_shutdown,
 };
 
 static u64 notrace tegra_read_sched_clock(void)
-- 
1.9.1
