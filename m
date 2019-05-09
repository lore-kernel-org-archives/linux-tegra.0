From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 03/15] clocksource/drivers/tegra: Rework for compensation of suspend time
Date: Thu,  9 May 2019 13:10:36 +0200
Message-ID: <20190509111048.11151-3-daniel.lezcano@linaro.org>
References: <7e786ba3-a664-8fd9-dd17-6a5be996a712@linaro.org>
 <20190509111048.11151-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509111048.11151-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Since the clocksource framework has the support for suspend time
compensation. Re-work the driver to use that, so we can reduce the
duplicate code.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra20.c | 63 +++++++++--------------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index fdb3d795a409..919b3568c495 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -60,9 +60,6 @@
 static u32 usec_config;
 static void __iomem *timer_reg_base;
 #ifdef CONFIG_ARM
-static void __iomem *rtc_base;
-static struct timespec64 persistent_ts;
-static u64 persistent_ms, last_persistent_ms;
 static struct delay_timer tegra_delay_timer;
 #endif
 
@@ -199,40 +196,30 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
 	return readl(timer_reg_base + TIMERUS_CNTR_1US);
 }
 
+static struct timer_of suspend_rtc_to = {
+	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
+};
+
 /*
  * tegra_rtc_read - Reads the Tegra RTC registers
  * Care must be taken that this funciton is not called while the
  * tegra_rtc driver could be executing to avoid race conditions
  * on the RTC shadow register
  */
-static u64 tegra_rtc_read_ms(void)
+static u64 tegra_rtc_read_ms(struct clocksource *cs)
 {
-	u32 ms = readl(rtc_base + RTC_MILLISECONDS);
-	u32 s = readl(rtc_base + RTC_SHADOW_SECONDS);
+	u32 ms = readl(timer_of_base(&suspend_rtc_to) + RTC_MILLISECONDS);
+	u32 s = readl(timer_of_base(&suspend_rtc_to) + RTC_SHADOW_SECONDS);
 	return (u64)s * MSEC_PER_SEC + ms;
 }
 
-/*
- * tegra_read_persistent_clock64 -  Return time from a persistent clock.
- *
- * Reads the time from a source which isn't disabled during PM, the
- * 32k sync timer.  Convert the cycles elapsed since last read into
- * nsecs and adds to a monotonically increasing timespec64.
- * Care must be taken that this funciton is not called while the
- * tegra_rtc driver could be executing to avoid race conditions
- * on the RTC shadow register
- */
-static void tegra_read_persistent_clock64(struct timespec64 *ts)
-{
-	u64 delta;
-
-	last_persistent_ms = persistent_ms;
-	persistent_ms = tegra_rtc_read_ms();
-	delta = persistent_ms - last_persistent_ms;
-
-	timespec64_add_ns(&persistent_ts, delta * NSEC_PER_MSEC);
-	*ts = persistent_ts;
-}
+static struct clocksource suspend_rtc_clocksource = {
+	.name	= "tegra_suspend_timer",
+	.rating	= 200,
+	.read	= tegra_rtc_read_ms,
+	.mask	= CLOCKSOURCE_MASK(32),
+	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
+};
 #endif
 
 static int tegra_timer_common_init(struct device_node *np, struct timer_of *to)
@@ -385,25 +372,15 @@ static int __init tegra_init_timer(struct device_node *np)
 
 static int __init tegra20_init_rtc(struct device_node *np)
 {
-	struct clk *clk;
+	int ret;
 
-	rtc_base = of_iomap(np, 0);
-	if (!rtc_base) {
-		pr_err("Can't map RTC registers\n");
-		return -ENXIO;
-	}
+	ret = timer_of_init(np, &suspend_rtc_to);
+	if (ret)
+		return ret;
 
-	/*
-	 * rtc registers are used by read_persistent_clock, keep the rtc clock
-	 * enabled
-	 */
-	clk = of_clk_get(np, 0);
-	if (IS_ERR(clk))
-		pr_warn("Unable to get rtc-tegra clock\n");
-	else
-		clk_prepare_enable(clk);
+	clocksource_register_hz(&suspend_rtc_clocksource, 1000);
 
-	return register_persistent_clock(tegra_read_persistent_clock64);
+	return 0;
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
 #endif
-- 
2.17.1
