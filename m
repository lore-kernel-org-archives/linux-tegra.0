From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 8/8] clocksource/drivers/tegra: Set up maximum-ticks limit properly
Date: Tue, 18 Jun 2019 17:03:58 +0300
Message-ID: <20190618140358.13148-9-digetx@gmail.com>
References: <20190618140358.13148-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618140358.13148-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra's timer has 29 bits for the counter and for the "load" register
which sets counter to a load-value. The counter's value is lower than
the actual value by 1 because it starts to decrement after one tick,
hence the maximum number of ticks that hardware can handle equals to
29 bits + 1.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index b84324288749..355b29ff6362 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -137,9 +137,17 @@ static int tegra_timer_setup(unsigned int cpu)
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
2.22.0
