From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/3] clocksource/drivers/tegra: Remove duplicated use of per_cpu_ptr
Date: Sun,  9 Jun 2019 22:27:28 +0300
Message-ID: <20190609192730.29459-2-digetx@gmail.com>
References: <20190609192730.29459-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609192730.29459-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It was left unnoticed by accident, which means that the code could be
cleaned up a tad more.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 40 +++++++++++++++++++------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 9406855781ff..6da169de47f9 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -216,6 +216,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
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
+	return to->of_clk.rate;
+}
+
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 				   int rating)
 {
@@ -268,30 +281,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
+		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
+		unsigned long rate = tegra_rate_for_timer(&tegra_to, tegra20);
 		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
 		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
+		unsigned int irq = irq_of_parse_and_map(np, idx);
 
-		/*
-		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
-		 * parent clock.
-		 */
-		if (tegra20)
-			cpu_to->of_clk.rate = 1000000;
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
2.21.0
