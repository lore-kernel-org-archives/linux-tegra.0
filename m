From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 43/93] clocksource/drivers/tegra20: Convert init function to return error
Date: Thu,  7 Jul 2016 10:01:16 +0200
Message-ID: <1467878526-1238-43-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, daniel.lezcano@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The init functions do not return any error. They behave as the following:

  - panic, thus leading to a kernel crash while another timer may work and
    make the system boot up correctly

  or

  - print an error and let the caller unaware if the state of the system

Change that by converting the init functions to return an error conforming
to the CLOCKSOURCE_OF_RET prototype.

Proper error handling (rollback, errno value) will be changed later case
by case, thus this change just return back an error or success in the init
function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/tegra20_timer.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 7b94ad2..543c37e 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -165,7 +165,7 @@ static struct irqaction tegra_timer_irq = {
 	.dev_id		= &tegra_clockevent,
 };
 
-static void __init tegra20_init_timer(struct device_node *np)
+static int __init tegra20_init_timer(struct device_node *np)
 {
 	struct clk *clk;
 	unsigned long rate;
@@ -174,13 +174,13 @@ static void __init tegra20_init_timer(struct device_node *np)
 	timer_reg_base = of_iomap(np, 0);
 	if (!timer_reg_base) {
 		pr_err("Can't map timer registers\n");
-		BUG();
+		return -ENXIO;
 	}
 
 	tegra_timer_irq.irq = irq_of_parse_and_map(np, 2);
 	if (tegra_timer_irq.irq <= 0) {
 		pr_err("Failed to map timer IRQ\n");
-		BUG();
+		return -EINVAL;
 	}
 
 	clk = of_clk_get(np, 0);
@@ -211,10 +211,12 @@ static void __init tegra20_init_timer(struct device_node *np)
 
 	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
 
-	if (clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
-		"timer_us", 1000000, 300, 32, clocksource_mmio_readl_up)) {
+	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
+				    "timer_us", 1000000, 300, 32,
+				    clocksource_mmio_readl_up);
+	if (ret) {
 		pr_err("Failed to register clocksource\n");
-		BUG();
+		return ret;
 	}
 
 	tegra_delay_timer.read_current_timer =
@@ -225,24 +227,26 @@ static void __init tegra20_init_timer(struct device_node *np)
 	ret = setup_irq(tegra_timer_irq.irq, &tegra_timer_irq);
 	if (ret) {
 		pr_err("Failed to register timer IRQ: %d\n", ret);
-		BUG();
+		return ret;
 	}
 
 	tegra_clockevent.cpumask = cpu_all_mask;
 	tegra_clockevent.irq = tegra_timer_irq.irq;
 	clockevents_config_and_register(&tegra_clockevent, 1000000,
 					0x1, 0x1fffffff);
+
+	return 0;
 }
-CLOCKSOURCE_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
+CLOCKSOURCE_OF_DECLARE_RET(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 
-static void __init tegra20_init_rtc(struct device_node *np)
+static int __init tegra20_init_rtc(struct device_node *np)
 {
 	struct clk *clk;
 
 	rtc_base = of_iomap(np, 0);
 	if (!rtc_base) {
 		pr_err("Can't map RTC registers");
-		BUG();
+		return -ENXIO;
 	}
 
 	/*
@@ -255,6 +259,6 @@ static void __init tegra20_init_rtc(struct device_node *np)
 	else
 		clk_prepare_enable(clk);
 
-	register_persistent_clock(NULL, tegra_read_persistent_clock64);
+	return register_persistent_clock(NULL, tegra_read_persistent_clock64);
 }
-CLOCKSOURCE_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
+CLOCKSOURCE_OF_DECLARE_RET(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
-- 
1.9.1
