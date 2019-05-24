From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 4/8] clocksource/drivers/tegra: Replace readl/writel with relaxed versions
Date: Fri, 24 May 2019 18:32:49 +0300
Message-ID: <20190524153253.28564-5-digetx@gmail.com>
References: <20190524153253.28564-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524153253.28564-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The readl/writel functions are inserting memory barrier to ensure that
outstanding memory writes are completed, this results in L2 cache syncing
being done on Tegra20 and Tegra30 which isn't a very cheap operation.
Replace all readl/writel occurrences in the code with the relaxed versions
since there is no need for the memory-access syncing.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra20.c | 35 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 739f83fdb318..55e9b3e1fbeb 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -61,9 +61,9 @@ static int tegra_timer_set_next_event(unsigned long cycles,
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
@@ -72,7 +72,7 @@ static int tegra_timer_shutdown(struct clock_event_device *evt)
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(0, reg_base + TIMER_PTV);
+	writel_relaxed(0, reg_base + TIMER_PTV);
 
 	return 0;
 }
@@ -81,9 +81,9 @@ static int tegra_timer_set_periodic(struct clock_event_device *evt)
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
@@ -93,7 +93,7 @@ static irqreturn_t tegra_timer_isr(int irq, void *dev_id)
 	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
+	writel_relaxed(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -103,12 +103,12 @@ static void tegra_timer_suspend(struct clock_event_device *evt)
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
@@ -132,8 +132,8 @@ static int tegra_timer_setup(unsigned int cpu)
 {
 	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
 
-	writel(0, timer_of_base(to) + TIMER_PTV);
-	writel(TIMER_PCR_INTR_CLR, timer_of_base(to) + TIMER_PCR);
+	writel_relaxed(0, timer_of_base(to) + TIMER_PTV);
+	writel_relaxed(TIMER_PCR_INTR_CLR, timer_of_base(to) + TIMER_PCR);
 
 	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
 	enable_irq(to->clkevt.irq);
@@ -157,13 +157,13 @@ static int tegra_timer_stop(unsigned int cpu)
 
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
@@ -184,8 +184,9 @@ static struct timer_of suspend_rtc_to = {
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
 
@@ -270,7 +271,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20)
 		goto out;
 	}
 
-	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
+	writel_relaxed(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
-- 
2.21.0
