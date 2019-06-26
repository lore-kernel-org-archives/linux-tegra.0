From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 20/25] clocksource/drivers/tegra: Add verbose definition for 1MHz constant
Date: Wed, 26 Jun 2019 16:46:46 +0200
Message-ID: <20190626144651.16742-20-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Convert all 1MHz literals to a verbose constant for better readability.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index f7a09d88dacb..cc90f22c559b 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -46,6 +46,8 @@
 #define TIMER1_IRQ_IDX		0
 #define TIMER10_IRQ_IDX		10
 
+#define TIMER_1MHz		1000000
+
 static u32 usec_config;
 static void __iomem *timer_reg_base;
 
@@ -160,7 +162,7 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
 
 static struct delay_timer tegra_delay_timer = {
 	.read_current_timer = tegra_delay_timer_read_counter_long,
-	.freq = 1000000,
+	.freq = TIMER_1MHz,
 };
 #endif
 
@@ -226,7 +228,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 	 * parent clock.
 	 */
 	if (tegra20)
-		return 1000000;
+		return TIMER_1MHz;
 
 	return timer_of_rate(to);
 }
@@ -315,11 +317,11 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		}
 	}
 
-	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
+	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
 
 	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-				    "timer_us", 1000000,
-				    300, 32, clocksource_mmio_readl_up);
+				    "timer_us", TIMER_1MHz, 300, 32,
+				    clocksource_mmio_readl_up);
 	if (ret)
 		pr_err("failed to register clocksource: %d\n", ret);
 
-- 
2.17.1
