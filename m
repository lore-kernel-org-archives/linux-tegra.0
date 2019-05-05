From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/7] clocksource/drivers/tegra: Support per-CPU timers on all Tegra's
Date: Sun,  5 May 2019 19:24:30 +0300
Message-ID: <20190505162436.23125-2-digetx@gmail.com>
References: <20190505162436.23125-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505162436.23125-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Assign TMR1-4 per-CPU core on 32bit Tegra's in a way it is done for
Tegra210. In a result each core can handle its own timer events, less
code is unique to ARM64 and Tegra's clock events driver now has higher
rating on all Tegra's, replacing the ARM's TWD timer which isn't very
accurate due to the clock rate jitter caused by CPU frequency scaling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra20.c | 120 ++++++++++------------------
 1 file changed, 43 insertions(+), 77 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 919b3568c495..58e8bb6deac9 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -49,13 +49,18 @@
 #define TIMER_PCR_INTR_CLR	BIT(30)
 
 #ifdef CONFIG_ARM
-#define TIMER_CPU0		0x50 /* TIMER3 */
+#define TIMER_CPU0		0x00 /* TIMER1 */
+#define TIMER_CPU2		0x50 /* TIMER3 */
+#define TIMER1_IRQ_IDX		0
+#define IRQ_IDX_FOR_CPU(cpu)	(TIMER1_IRQ_IDX + cpu)
+#define TIMER_BASE_FOR_CPU(cpu)	\
+	(((cpu) & 1) * 8 + ((cpu) < 2 ? TIMER_CPU0 : TIMER_CPU2))
 #else
 #define TIMER_CPU0		0x90 /* TIMER10 */
 #define TIMER10_IRQ_IDX		10
 #define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
-#endif
 #define TIMER_BASE_FOR_CPU(cpu) (TIMER_CPU0 + (cpu) * 8)
+#endif
 
 static u32 usec_config;
 static void __iomem *timer_reg_base;
@@ -118,7 +123,6 @@ static void tegra_timer_resume(struct clock_event_device *evt)
 	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 }
 
-#ifdef CONFIG_ARM64
 static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
 	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE,
 
@@ -159,33 +163,8 @@ static int tegra_timer_stop(unsigned int cpu)
 
 	return 0;
 }
-#else /* CONFIG_ARM */
-static struct timer_of tegra_to = {
-	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE | TIMER_OF_IRQ,
-
-	.clkevt = {
-		.name = "tegra_timer",
-		.rating	= 300,
-		.features = CLOCK_EVT_FEAT_ONESHOT |
-			    CLOCK_EVT_FEAT_PERIODIC |
-			    CLOCK_EVT_FEAT_DYNIRQ,
-		.set_next_event	= tegra_timer_set_next_event,
-		.set_state_shutdown = tegra_timer_shutdown,
-		.set_state_periodic = tegra_timer_set_periodic,
-		.set_state_oneshot = tegra_timer_shutdown,
-		.tick_resume = tegra_timer_shutdown,
-		.suspend = tegra_timer_suspend,
-		.resume = tegra_timer_resume,
-		.cpumask = cpu_possible_mask,
-	},
-
-	.of_irq = {
-		.index = 2,
-		.flags = IRQF_TIMER | IRQF_TRIGGER_HIGH,
-		.handler = tegra_timer_isr,
-	},
-};
 
+#ifdef CONFIG_ARM
 static u64 notrace tegra_read_sched_clock(void)
 {
 	return readl(timer_reg_base + TIMERUS_CNTR_1US);
@@ -222,10 +201,12 @@ static struct clocksource suspend_rtc_clocksource = {
 };
 #endif
 
-static int tegra_timer_common_init(struct device_node *np, struct timer_of *to)
+static int tegra_init_timer(struct device_node *np, bool tegra20)
 {
-	int ret = 0;
+	struct timer_of *to;
+	int cpu, ret;
 
+	to = this_cpu_ptr(&tegra_to);
 	ret = timer_of_init(np, to);
 	if (ret < 0)
 		goto out;
@@ -267,29 +248,19 @@ static int tegra_timer_common_init(struct device_node *np, struct timer_of *to)
 		goto out;
 	}
 
-	writel(usec_config, timer_of_base(to) + TIMERUS_USEC_CFG);
-
-out:
-	return ret;
-}
-
-#ifdef CONFIG_ARM64
-static int __init tegra_init_timer(struct device_node *np)
-{
-	int cpu, ret = 0;
-	struct timer_of *to;
-
-	to = this_cpu_ptr(&tegra_to);
-	ret = tegra_timer_common_init(np, to);
-	if (ret < 0)
-		goto out;
+	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 
 	for_each_possible_cpu(cpu) {
-		struct timer_of *cpu_to;
+		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
+
+		/*
+		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
+		 * parent clock.
+		 */
+		if (tegra20)
+			cpu_to->of_clk.rate = 1000000;
 
-		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + TIMER_BASE_FOR_CPU(cpu);
-		cpu_to->of_clk.rate = timer_of_rate(to);
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
 		cpu_to->clkevt.irq =
 			irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
@@ -331,43 +302,39 @@ static int __init tegra_init_timer(struct device_node *np)
 	timer_of_cleanup(to);
 	return ret;
 }
+
+#ifdef CONFIG_ARM64
+static int __init tegra210_init_timer(struct device_node *np)
+{
+	return tegra_init_timer(np, false);
+}
+TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
 #else /* CONFIG_ARM */
-static int __init tegra_init_timer(struct device_node *np)
+static int __init tegra20_init_timer(struct device_node *np)
 {
-	int ret = 0;
+	struct timer_of *to;
+	int err;
 
-	ret = tegra_timer_common_init(np, &tegra_to);
-	if (ret < 0)
-		goto out;
+	err = tegra_init_timer(np, true);
+	if (err)
+		return err;
 
-	tegra_to.of_base.base = timer_reg_base + TIMER_BASE_FOR_CPU(0);
-	tegra_to.of_clk.rate = 1000000; /* microsecond timer */
+	to = this_cpu_ptr(&tegra_to);
 
 	sched_clock_register(tegra_read_sched_clock, 32,
-			     timer_of_rate(&tegra_to));
-	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-				    "timer_us", timer_of_rate(&tegra_to),
+			     timer_of_rate(to));
+	err = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
+				    "timer_us", timer_of_rate(to),
 				    300, 32, clocksource_mmio_readl_up);
-	if (ret) {
-		pr_err("Failed to register clocksource\n");
-		goto out;
-	}
+	if (err)
+		pr_err("Failed to register clocksource: %d\n", err);
 
 	tegra_delay_timer.read_current_timer =
 			tegra_delay_timer_read_counter_long;
-	tegra_delay_timer.freq = timer_of_rate(&tegra_to);
+	tegra_delay_timer.freq = timer_of_rate(to);
 	register_current_timer_delay(&tegra_delay_timer);
 
-	clockevents_config_and_register(&tegra_to.clkevt,
-					timer_of_rate(&tegra_to),
-					0x1,
-					0x1fffffff);
-
-	return ret;
-out:
-	timer_of_cleanup(&tegra_to);
-
-	return ret;
+	return 0;
 }
 
 static int __init tegra20_init_rtc(struct device_node *np)
@@ -383,6 +350,5 @@ static int __init tegra20_init_rtc(struct device_node *np)
 	return 0;
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
+TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 #endif
-TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra_init_timer);
-TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra_init_timer);
-- 
2.21.0
