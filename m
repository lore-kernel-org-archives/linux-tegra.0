From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 08/25] clocksource/drivers/tegra: Replace readl/writel with relaxed versions
Date: Wed, 26 Jun 2019 16:46:34 +0200
Message-ID: <20190626144651.16742-8-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

The readl/writel functions are inserting memory barrier to ensure that
outstanding memory writes are completed, this results in L2 cache syncing
being done on Tegra20 and Tegra30 which isn't a very cheap operation.
Replace all readl/writel occurrences in the code with the relaxed versions
since there is no need for the memory-access syncing.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 35 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 3e4f12aee8df..276b55f6ada0 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -52,9 +52,9 @@ static int tegra_timer_set_next_event(unsigned long cycles,
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(TIMER_PTV_EN |
-	       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
-	       reg_base + TIMER_PTV);
+	writel_relaxed(TIMER_PTV_EN |
+		       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
+		       reg_base + TIMER_PTV);
 
 	return 0;
 }
@@ -63,7 +63,7 @@ static int tegra_timer_shutdown(struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(0, reg_base + TIMER_PTV);
+	writel_relaxed(0, reg_base + TIMER_PTV);
 
 	return 0;
 }
@@ -72,9 +72,9 @@ static int tegra_timer_set_periodic(struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(TIMER_PTV_EN | TIMER_PTV_PER |
-	       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
-	       reg_base + TIMER_PTV);
+	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER |
+		       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
+		       reg_base + TIMER_PTV);
 
 	return 0;
 }
@@ -84,7 +84,7 @@ static irqreturn_t tegra_timer_isr(int irq, void *dev_id)
 	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
+	writel_relaxed(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -94,12 +94,12 @@ static void tegra_timer_suspend(struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
+	writel_relaxed(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
 }
 
 static void tegra_timer_resume(struct clock_event_device *evt)
 {
-	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
+	writel_relaxed(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 }
 
 static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
@@ -123,8 +123,8 @@ static int tegra_timer_setup(unsigned int cpu)
 {
 	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
 
-	writel(0, timer_of_base(to) + TIMER_PTV);
-	writel(TIMER_PCR_INTR_CLR, timer_of_base(to) + TIMER_PCR);
+	writel_relaxed(0, timer_of_base(to) + TIMER_PTV);
+	writel_relaxed(TIMER_PCR_INTR_CLR, timer_of_base(to) + TIMER_PCR);
 
 	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
 	enable_irq(to->clkevt.irq);
@@ -148,13 +148,13 @@ static int tegra_timer_stop(unsigned int cpu)
 
 static u64 notrace tegra_read_sched_clock(void)
 {
-	return readl(timer_reg_base + TIMERUS_CNTR_1US);
+	return readl_relaxed(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
 #ifdef CONFIG_ARM
 static unsigned long tegra_delay_timer_read_counter_long(void)
 {
-	return readl(timer_reg_base + TIMERUS_CNTR_1US);
+	return readl_relaxed(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
 static struct delay_timer tegra_delay_timer = {
@@ -175,8 +175,9 @@ static struct timer_of suspend_rtc_to = {
  */
 static u64 tegra_rtc_read_ms(struct clocksource *cs)
 {
-	u32 ms = readl(timer_of_base(&suspend_rtc_to) + RTC_MILLISECONDS);
-	u32 s = readl(timer_of_base(&suspend_rtc_to) + RTC_SHADOW_SECONDS);
+	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
+	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
+	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
 	return (u64)s * MSEC_PER_SEC + ms;
 }
 
@@ -261,7 +262,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 		goto out;
 	}
 
-	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
+	writel_relaxed(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
-- 
2.17.1
