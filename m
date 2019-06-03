From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 02/10] clocksource/drivers/tegra: Unify timer code
Date: Mon,  3 Jun 2019 21:59:40 +0300
Message-ID: <20190603185948.30438-3-digetx@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603185948.30438-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra132 is 64bit platform and it has the tegra20-timer hardware unit.
Right now the corresponding timer code isn't compiled for ARM64, remove
ifdef'iness from the code and compile tegra20-timer for both 32 and 64 bit
platforms. Also note that like the older generations, Tegra210 has the
microseconds counter, hence the timer_us clocksource is now made available
for Tegra210 as well.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra20.c | 111 +++++++++++++++-------------
 1 file changed, 60 insertions(+), 51 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 58e8bb6deac9..57e7aa2b80a3 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -30,10 +30,6 @@
 
 #include "timer-of.h"
 
-#ifdef CONFIG_ARM
-#include <asm/mach/time.h>
-#endif
-
 #define RTC_SECONDS            0x08
 #define RTC_SHADOW_SECONDS     0x0c
 #define RTC_MILLISECONDS       0x10
@@ -48,25 +44,17 @@
 #define TIMER_PCR		0x4
 #define TIMER_PCR_INTR_CLR	BIT(30)
 
-#ifdef CONFIG_ARM
-#define TIMER_CPU0		0x00 /* TIMER1 */
-#define TIMER_CPU2		0x50 /* TIMER3 */
+#define TIMER1_BASE		0x00
+#define TIMER2_BASE		0x08
+#define TIMER3_BASE		0x50
+#define TIMER4_BASE		0x58
+#define TIMER10_BASE		0x90
+
 #define TIMER1_IRQ_IDX		0
-#define IRQ_IDX_FOR_CPU(cpu)	(TIMER1_IRQ_IDX + cpu)
-#define TIMER_BASE_FOR_CPU(cpu)	\
-	(((cpu) & 1) * 8 + ((cpu) < 2 ? TIMER_CPU0 : TIMER_CPU2))
-#else
-#define TIMER_CPU0		0x90 /* TIMER10 */
 #define TIMER10_IRQ_IDX		10
-#define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
-#define TIMER_BASE_FOR_CPU(cpu) (TIMER_CPU0 + (cpu) * 8)
-#endif
 
 static u32 usec_config;
 static void __iomem *timer_reg_base;
-#ifdef CONFIG_ARM
-static struct delay_timer tegra_delay_timer;
-#endif
 
 static int tegra_timer_set_next_event(unsigned long cycles,
 					 struct clock_event_device *evt)
@@ -164,17 +152,23 @@ static int tegra_timer_stop(unsigned int cpu)
 	return 0;
 }
 
-#ifdef CONFIG_ARM
 static u64 notrace tegra_read_sched_clock(void)
 {
 	return readl(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
+#ifdef CONFIG_ARM
 static unsigned long tegra_delay_timer_read_counter_long(void)
 {
 	return readl(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
+static struct delay_timer tegra_delay_timer = {
+	.read_current_timer = tegra_delay_timer_read_counter_long,
+	.freq = 1000000,
+};
+#endif
+
 static struct timer_of suspend_rtc_to = {
 	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
 };
@@ -199,9 +193,34 @@ static struct clocksource suspend_rtc_clocksource = {
 	.mask	= CLOCKSOURCE_MASK(32),
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
 };
-#endif
 
-static int tegra_init_timer(struct device_node *np, bool tegra20)
+static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
+{
+	if (tegra20) {
+		switch (cpu) {
+		case 0:
+			return TIMER1_BASE;
+		case 1:
+			return TIMER2_BASE;
+		case 2:
+			return TIMER3_BASE;
+		default:
+			return TIMER4_BASE;
+		}
+	}
+
+	return TIMER10_BASE + cpu * 8;
+}
+
+static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
+{
+	if (tegra20)
+		return TIMER1_IRQ_IDX + cpu;
+
+	return TIMER10_IRQ_IDX + cpu;
+}
+
+static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 {
 	struct timer_of *to;
 	int cpu, ret;
@@ -252,6 +271,8 @@ static int tegra_init_timer(struct device_node *np, bool tegra20)
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
+		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
+		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
 
 		/*
 		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
@@ -260,10 +281,10 @@ static int tegra_init_timer(struct device_node *np, bool tegra20)
 		if (tegra20)
 			cpu_to->of_clk.rate = 1000000;
 
-		cpu_to->of_base.base = timer_reg_base + TIMER_BASE_FOR_CPU(cpu);
+		cpu_to = per_cpu_ptr(&tegra_to, cpu);
+		cpu_to->of_base.base = timer_reg_base + base;
 		cpu_to->clkevt.cpumask = cpumask_of(cpu);
-		cpu_to->clkevt.irq =
-			irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
+		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
 		if (!cpu_to->clkevt.irq) {
 			pr_err("%s: can't map IRQ for CPU%d\n",
 			       __func__, cpu);
@@ -283,6 +304,18 @@ static int tegra_init_timer(struct device_node *np, bool tegra20)
 		}
 	}
 
+	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
+
+	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
+				    "timer_us", 1000000,
+				    300, 32, clocksource_mmio_readl_up);
+	if (ret)
+		pr_err("failed to register clocksource: %d\n", ret);
+
+#ifdef CONFIG_ARM
+	register_current_timer_delay(&tegra_delay_timer);
+#endif
+
 	cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
 			  "AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
 			  tegra_timer_stop);
@@ -303,39 +336,17 @@ static int tegra_init_timer(struct device_node *np, bool tegra20)
 	return ret;
 }
 
-#ifdef CONFIG_ARM64
 static int __init tegra210_init_timer(struct device_node *np)
 {
 	return tegra_init_timer(np, false);
 }
 TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
-#else /* CONFIG_ARM */
+
 static int __init tegra20_init_timer(struct device_node *np)
 {
-	struct timer_of *to;
-	int err;
-
-	err = tegra_init_timer(np, true);
-	if (err)
-		return err;
-
-	to = this_cpu_ptr(&tegra_to);
-
-	sched_clock_register(tegra_read_sched_clock, 32,
-			     timer_of_rate(to));
-	err = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-				    "timer_us", timer_of_rate(to),
-				    300, 32, clocksource_mmio_readl_up);
-	if (err)
-		pr_err("Failed to register clocksource: %d\n", err);
-
-	tegra_delay_timer.read_current_timer =
-			tegra_delay_timer_read_counter_long;
-	tegra_delay_timer.freq = timer_of_rate(to);
-	register_current_timer_delay(&tegra_delay_timer);
-
-	return 0;
+	return tegra_init_timer(np, true);
 }
+TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 
 static int __init tegra20_init_rtc(struct device_node *np)
 {
@@ -350,5 +361,3 @@ static int __init tegra20_init_rtc(struct device_node *np)
 	return 0;
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
-TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
-#endif
-- 
2.21.0
