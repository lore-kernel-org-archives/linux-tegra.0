From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 1/7] clocksource/drivers/c-sky: request timer_of_init only for probing CPU
Date: Tue, 10 Sep 2019 16:47:10 +0300
Message-ID: <1568123236-767-2-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-tegra@vger.kernel.org

timer_of_init() was initially called for all possible CPUs although it
was requested clock with index 0 for the same device_node on behalf of
all possible CPUs. This patch keeps the timer_of_init() only for probing
CPU and use the information obtained by timer_of_init() to also
initialize the timer_of structure for the rest of CPUs. Since the
probing CPU was requested also a per CPU interrupt, and the
timer_of_init() has such a mechanism implemented, the patch took also
the chance to pass TIMER_OF_IRQ flag to timer_of_init(). Apart from
this csky_mptimer_irq variable was removed and information in per CPU
timer_of objects was used instead (to->clkevt.irq).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clocksource/timer-mp-csky.c | 45 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/clocksource/timer-mp-csky.c b/drivers/clocksource/timer-mp-csky.c
index 183a9955160a..dd263c8de580 100644
--- a/drivers/clocksource/timer-mp-csky.c
+++ b/drivers/clocksource/timer-mp-csky.c
@@ -15,7 +15,7 @@
 #define PTIM_LVR	"cr<6, 14>"
 #define PTIM_TSR	"cr<1, 14>"
 
-static int csky_mptimer_irq;
+static irqreturn_t csky_timer_interrupt(int irq, void *dev);
 
 static int csky_mptimer_set_next_event(unsigned long delta,
 				       struct clock_event_device *ce)
@@ -47,7 +47,7 @@ static int csky_mptimer_oneshot_stopped(struct clock_event_device *ce)
 }
 
 static DEFINE_PER_CPU(struct timer_of, csky_to) = {
-	.flags					= TIMER_OF_CLOCK,
+	.flags					= TIMER_OF_CLOCK | TIMER_OF_IRQ,
 	.clkevt = {
 		.rating				= 300,
 		.features			= CLOCK_EVT_FEAT_PERCPU |
@@ -57,6 +57,10 @@ static DEFINE_PER_CPU(struct timer_of, csky_to) = {
 		.set_state_oneshot_stopped	= csky_mptimer_oneshot_stopped,
 		.set_next_event			= csky_mptimer_set_next_event,
 	},
+	.of_irq = {
+		.percpu				= true,
+		.handler			= csky_timer_interrupt,
+	},
 };
 
 static irqreturn_t csky_timer_interrupt(int irq, void *dev)
@@ -79,7 +83,7 @@ static int csky_mptimer_starting_cpu(unsigned int cpu)
 
 	to->clkevt.cpumask = cpumask_of(cpu);
 
-	enable_percpu_irq(csky_mptimer_irq, 0);
+	enable_percpu_irq(to->clkevt.irq, 0);
 
 	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					2, ULONG_MAX);
@@ -89,7 +93,9 @@ static int csky_mptimer_starting_cpu(unsigned int cpu)
 
 static int csky_mptimer_dying_cpu(unsigned int cpu)
 {
-	disable_percpu_irq(csky_mptimer_irq);
+	struct timer_of *to = per_cpu_ptr(&csky_to, cpu);
+
+	disable_percpu_irq(to->clkevt.irq);
 
 	return 0;
 }
@@ -117,8 +123,8 @@ struct clocksource csky_clocksource = {
 
 static int __init csky_mptimer_init(struct device_node *np)
 {
-	int ret, cpu, cpu_rollback;
-	struct timer_of *to = NULL;
+	struct timer_of *to = this_cpu_ptr(&csky_to);
+	int ret, cpu;
 
 	/*
 	 * Csky_mptimer is designed for C-SKY SMP multi-processors and
@@ -132,20 +138,20 @@ static int __init csky_mptimer_init(struct device_node *np)
 	 * We use private irq for the mptimer and irq number is the same
 	 * for every core. So we use request_percpu_irq() in timer_of_init.
 	 */
-	csky_mptimer_irq = irq_of_parse_and_map(np, 0);
-	if (csky_mptimer_irq <= 0)
-		return -EINVAL;
 
-	ret = request_percpu_irq(csky_mptimer_irq, csky_timer_interrupt,
-				 "csky_mp_timer", &csky_to);
+	ret = timer_of_init(np, to);
 	if (ret)
 		return -EINVAL;
 
 	for_each_possible_cpu(cpu) {
-		to = per_cpu_ptr(&csky_to, cpu);
-		ret = timer_of_init(np, to);
-		if (ret)
-			goto rollback;
+		struct timer_of *cpu_to = per_cpu_ptr(&csky_to, cpu);
+
+		if (to == cpu_to)
+			continue;
+
+		cpu_to->clkevt.irq = to->of_irq.irq;
+		cpu_to->of_clk.rate = to->of_clk.rate;
+		cpu_to->of_clk.period = to->of_clk.period;
 	}
 
 	clocksource_register_hz(&csky_clocksource, timer_of_rate(to));
@@ -156,18 +162,13 @@ static int __init csky_mptimer_init(struct device_node *np)
 				csky_mptimer_starting_cpu,
 				csky_mptimer_dying_cpu);
 	if (ret)
-		return -EINVAL;
+		goto rollback;
 
 	return 0;
 
 rollback:
-	for_each_possible_cpu(cpu_rollback) {
-		if (cpu_rollback == cpu)
-			break;
+	timer_of_cleanup(to);
 
-		to = per_cpu_ptr(&csky_to, cpu_rollback);
-		timer_of_cleanup(to);
-	}
 	return -EINVAL;
 }
 TIMER_OF_DECLARE(csky_mptimer, "csky,mptimer", csky_mptimer_init);
-- 
2.7.4
