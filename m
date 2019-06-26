From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 23/25] clocksource/drivers/tegra: Set up maximum-ticks limit properly
Date: Wed, 26 Jun 2019 16:46:49 +0200
Message-ID: <20190626144651.16742-23-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Tegra's timer has 29 bits for the counter and for the "load" register
which sets counter to a load-value. The counter's value is lower than
the actual value by 1 because it starts to decrement after one tick,
hence the maximum number of ticks that hardware can handle equals to
29 bits + 1.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index a907e71065bd..e9635c25eef4 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -139,9 +139,17 @@ static int tegra_timer_setup(unsigned int cpu)
 	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
 	enable_irq(to->clkevt.irq);
 
+	/*
+	 * Tegra's timer uses n+1 scheme for the counter, i.e. timer will
+	 * fire after one tick if 0 is loaded and thus minimum number of
+	 * ticks is 1. In result both of the clocksource's tick limits are
+	 * higher than a minimum and maximum that hardware register can
+	 * take by 1, this is then taken into account by set_next_event
+	 * callback.
+	 */
 	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					1, /* min */
-					0x1fffffff); /* 29 bits */
+					0x1fffffff + 1); /* max 29 bits + 1 */
 
 	return 0;
 }
-- 
2.17.1
