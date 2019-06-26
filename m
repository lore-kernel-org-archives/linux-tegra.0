From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 17/25] clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
Date: Wed, 26 Jun 2019 16:46:43 +0200
Message-ID: <20190626144651.16742-17-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

It was left unnoticed by accident, which means that the code could be
cleaned up a tad more.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 42 ++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 880ba67ca7ee..f172a57cc5fe 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -218,6 +218,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
 	return TIMER10_IRQ_IDX + cpu;
 }
 
+static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
+						 bool tegra20)
+{
+	/*
+	 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
+	 * parent clock.
+	 */
+	if (tegra20)
+		return 1000000;
+
+	return timer_of_rate(to);
+}
+
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 				   int rating)
 {
@@ -270,32 +283,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
+		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
+		unsigned long rate = tegra_rate_for_timer(to, tegra20);
 		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
 		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
+		unsigned int irq = irq_of_parse_and_map(np, idx);
 
-		/*
-		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
-		 * parent clock.
-		 */
-		if (tegra20)
-			cpu_to->of_clk.rate = 1000000;
-		else
-			cpu_to->of_clk.rate = timer_of_rate(to);
-
-		cpu_to = per_cpu_ptr(&tegra_to, cpu);
-		cpu_to->of_base.base = timer_reg_base + base;
-		cpu_to->clkevt.rating = rating;
-		cpu_to->clkevt.cpumask = cpumask_of(cpu);
-		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
-		if (!cpu_to->clkevt.irq) {
+		if (!irq) {
 			pr_err("failed to map irq for cpu%d\n", cpu);
 			ret = -EINVAL;
 			goto out_irq;
 		}
 
+		cpu_to->clkevt.irq = irq;
+		cpu_to->clkevt.rating = rating;
+		cpu_to->clkevt.cpumask = cpumask_of(cpu);
+		cpu_to->of_base.base = timer_reg_base + base;
+		cpu_to->of_clk.rate = rate;
+
 		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
-		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr,
-				  IRQF_TIMER | IRQF_NOBALANCING,
+
+		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr, flags,
 				  cpu_to->clkevt.name, &cpu_to->clkevt);
 		if (ret) {
 			pr_err("failed to set up irq for cpu%d: %d\n",
-- 
2.17.1
