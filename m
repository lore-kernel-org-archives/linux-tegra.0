From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 20/22] PM / devfreq: tegra30: Optimize upper average watermark selection
Date: Fri, 28 Jun 2019 00:11:13 +0300
Message-ID: <20190627211115.21138-21-digetx@gmail.com>
References: <20190627211115.21138-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627211115.21138-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I noticed that CPU may be crossing the dependency threshold very
frequently for some workloads and this results in a lot of interrupts
which could be avoided if MCALL client is keeping actual EMC frequency
at a higher rate.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 1105104445a9..5b1feaf8c16e 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -314,7 +314,8 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 }
 
 static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
-					   struct tegra_devfreq_device *dev)
+					   struct tegra_devfreq_device *dev,
+					   unsigned long freq)
 {
 	unsigned long avg_threshold, lower, upper;
 
@@ -323,6 +324,15 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
 	avg_threshold = dev->config->avg_dependency_threshold;
 	avg_threshold = avg_threshold * ACTMON_SAMPLING_PERIOD;
 
+	/*
+	 * If cumulative EMC frequency selection is higher than the
+	 * device's, then there is no need to set upper watermark to
+	 * a lower value because it will result in unnecessary upper
+	 * interrupts.
+	 */
+	if (freq * ACTMON_SAMPLING_PERIOD > upper)
+		upper = freq * ACTMON_SAMPLING_PERIOD;
+
 	/*
 	 * We want to get interrupts when MCCPU client crosses the
 	 * dependency threshold in order to take into / out of account
@@ -392,6 +402,7 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 			      struct tegra_devfreq_device *dev)
 {
 	u32 intr_status, dev_ctrl, avg_intr_mask, avg_count;
+	unsigned long freq;
 
 	trace_device_isr_enter(tegra->regs, dev->config->offset,
 			       dev->boost_freq, cpufreq_get(0));
@@ -405,8 +416,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 	avg_intr_mask = ACTMON_DEV_INTR_AVG_BELOW_WMARK |
 			ACTMON_DEV_INTR_AVG_ABOVE_WMARK;
 
-	if (intr_status & avg_intr_mask)
-		tegra_devfreq_update_avg_wmark(tegra, dev);
+	if (intr_status & avg_intr_mask) {
+		freq = clk_get_rate(tegra->emc_clock) / KHZ;
+		tegra_devfreq_update_avg_wmark(tegra, dev, freq);
+	}
 
 	if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_UPPER) {
 		/*
@@ -524,7 +537,7 @@ static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
 	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
 		dev = &tegra->devices[i];
 
-		tegra_devfreq_update_avg_wmark(tegra, dev);
+		tegra_devfreq_update_avg_wmark(tegra, dev, freq);
 		tegra_devfreq_update_wmark(tegra, dev, freq);
 	}
 
@@ -629,7 +642,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 	device_writel(dev, dev->avg_freq * ACTMON_SAMPLING_PERIOD,
 		      ACTMON_DEV_INIT_AVG);
 
-	tegra_devfreq_update_avg_wmark(tegra, dev);
+	tegra_devfreq_update_avg_wmark(tegra, dev, dev->avg_freq);
 	tegra_devfreq_update_wmark(tegra, dev, dev->avg_freq);
 
 	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
-- 
2.22.0
