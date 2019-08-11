From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 18/19] PM / devfreq: tegra30: Support variable polling interval
Date: Mon, 12 Aug 2019 00:23:14 +0300
Message-ID: <20190811212315.12689-19-digetx@gmail.com>
References: <20190811212315.12689-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The ACTMON governor is interrupt-driven and currently hardware's polling
interval is fixed to 16ms in the driver. Devfreq supports variable polling
interval by the generic governors, let's re-use the generic interface for
changing of the polling interval. Now the polling interval can be changed
dynamically via /sys/class/devfreq/devfreq0/polling_interval.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 71 ++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 8adc0ff48b45..e30314bd571a 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -236,7 +237,7 @@ tegra_actmon_dev_avg_dependency_freq(struct tegra_devfreq *tegra,
 				     struct tegra_devfreq_device *dev)
 {
 	return dev->config->avg_dependency_threshold /
-		ACTMON_SAMPLING_PERIOD;
+		tegra->devfreq->profile->polling_ms;
 }
 
 static unsigned long
@@ -314,8 +315,8 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 	 */
 	*upper = tegra_actmon_account_cpu_freq(tegra, dev, *upper);
 
-	*lower *= ACTMON_SAMPLING_PERIOD;
-	*upper *= ACTMON_SAMPLING_PERIOD;
+	*lower *= tegra->devfreq->profile->polling_ms;
+	*upper *= tegra->devfreq->profile->polling_ms;
 }
 
 static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
@@ -341,8 +342,8 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
 	 * result, but this one is probably the least churning, although
 	 * it may look a bit convoluted.
 	 */
-	if (freq * ACTMON_SAMPLING_PERIOD > upper)
-		upper = freq * ACTMON_SAMPLING_PERIOD;
+	if (freq * tegra->devfreq->profile->polling_ms > upper)
+		upper = freq * tegra->devfreq->profile->polling_ms;
 
 	/*
 	 * We want to get interrupts when MCCPU client crosses the
@@ -420,7 +421,7 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 	avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
 	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
 
-	dev->avg_freq = avg_count / ACTMON_SAMPLING_PERIOD;
+	dev->avg_freq = avg_count / tegra->devfreq->profile->polling_ms;
 
 	avg_intr_mask = ACTMON_DEV_INTR_AVG_BELOW_WMARK |
 			ACTMON_DEV_INTR_AVG_ABOVE_WMARK;
@@ -499,7 +500,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
 	 * outdated.
 	 */
 	avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
-	avg_freq = avg_count / ACTMON_SAMPLING_PERIOD;
+	avg_freq = avg_count / tegra->devfreq->profile->polling_ms;
 
 	old_upper = tegra_actmon_upper_freq(tegra, dev->avg_freq);
 	new_upper = tegra_actmon_upper_freq(tegra, avg_freq);
@@ -675,7 +676,7 @@ static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
 	 * here for too long, otherwise CPUFreq's core will complain with a
 	 * warning splat.
 	 */
-	delay = msecs_to_jiffies(ACTMON_SAMPLING_PERIOD);
+	delay = msecs_to_jiffies(tegra->devfreq->profile->polling_ms);
 	schedule_delayed_work(&tegra->cpufreq_update_work, delay);
 
 	return NOTIFY_OK;
@@ -690,7 +691,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 	dev->boost_freq = 0;
 
 	dev->avg_freq = clk_get_rate(tegra->emc_clock) / KHZ;
-	device_writel(dev, dev->avg_freq * ACTMON_SAMPLING_PERIOD,
+	device_writel(dev, dev->avg_freq * tegra->devfreq->profile->polling_ms,
 		      ACTMON_DEV_INIT_AVG);
 
 	tegra_devfreq_update_avg_wmark(tegra, dev, dev->avg_freq);
@@ -725,7 +726,14 @@ static int tegra_actmon_start(struct tegra_devfreq *tegra)
 	unsigned int i;
 	int err;
 
-	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
+	if (!tegra->devfreq->stop_polling)
+		return 0;
+
+	tegra->devfreq->previous_freq = clk_get_rate(tegra->emc_clock) / KHZ;
+	tegra->devfreq->last_stat_updated = jiffies;
+	tegra->devfreq->stop_polling = false;
+
+	actmon_writel(tegra, tegra->devfreq->profile->polling_ms - 1,
 		      ACTMON_GLB_PERIOD_CTRL);
 
 	/*
@@ -776,6 +784,11 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 {
 	unsigned int i;
 
+	if (tegra->devfreq->stop_polling)
+		return;
+
+	mutex_unlock(&tegra->devfreq->lock);
+
 	disable_irq(tegra->irq);
 
 	cpufreq_unregister_notifier(&tegra->cpu_rate_change_nb,
@@ -783,10 +796,16 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 
 	cancel_delayed_work_sync(&tegra->cpufreq_update_work);
 
+	mutex_lock(&tegra->devfreq->lock);
+
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
 		tegra_actmon_stop_device(&tegra->devices[i]);
 
 	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
+
+	devfreq_update_status(tegra->devfreq, tegra->devfreq->previous_freq);
+
+	tegra->devfreq->stop_polling = true;
 }
 
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
@@ -846,7 +865,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 	stat->busy_time *= 100 / BUS_SATURATION_RATIO;
 
 	/* Number of cycles in a sampling period */
-	stat->total_time = cur_freq * ACTMON_SAMPLING_PERIOD;
+	stat->total_time = cur_freq * tegra->devfreq->profile->polling_ms;
 
 	stat->busy_time = min(stat->busy_time, stat->total_time);
 
@@ -854,7 +873,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
 }
 
 static struct devfreq_dev_profile tegra_devfreq_profile = {
-	.polling_ms	= 0,
+	.polling_ms	= ACTMON_SAMPLING_PERIOD,
 	.target		= tegra_devfreq_target,
 	.get_dev_status	= tegra_devfreq_get_dev_status,
 };
@@ -895,8 +914,11 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 					unsigned int event, void *data)
 {
 	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
+	unsigned int new_delay, *delay_ptr = data;
 	int ret = 0;
 
+	mutex_lock(&devfreq->lock);
+
 	/*
 	 * Couple device with the governor early as it is needed at
 	 * the moment of governor's start (used by ISR).
@@ -905,26 +927,33 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 	switch (event) {
 	case DEVFREQ_GOV_START:
-		devfreq_monitor_start(devfreq);
+		devfreq->stop_polling = true;
+		/* fall through */
+	case DEVFREQ_GOV_RESUME:
 		ret = tegra_actmon_start(tegra);
 		break;
 
 	case DEVFREQ_GOV_STOP:
-		tegra_actmon_stop(tegra);
-		devfreq_monitor_stop(devfreq);
-		break;
-
+		/* fall through */
 	case DEVFREQ_GOV_SUSPEND:
 		tegra_actmon_stop(tegra);
-		devfreq_monitor_suspend(devfreq);
 		break;
 
-	case DEVFREQ_GOV_RESUME:
-		devfreq_monitor_resume(devfreq);
-		ret = tegra_actmon_start(tegra);
+	case DEVFREQ_GOV_INTERVAL:
+		new_delay = *delay_ptr;
+
+		if (!new_delay || new_delay > 256) {
+			ret = -EINVAL;
+		} else {
+			tegra_actmon_stop(tegra);
+			devfreq->profile->polling_ms = new_delay;
+			ret = tegra_actmon_start(tegra);
+		}
 		break;
 	}
 
+	mutex_unlock(&devfreq->lock);
+
 	return ret;
 }
 
-- 
2.22.0
