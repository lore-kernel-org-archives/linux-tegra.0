From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 11/17] PM / devfreq: tegra30: Add debug messages
Date: Wed, 26 Jun 2019 04:32:45 +0300
Message-ID: <20190626013252.30470-12-digetx@gmail.com>
References: <20190626013252.30470-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626013252.30470-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add debug messages to know about what's happening in hardware and how
driver reacts.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 1e704289c129..8ef7ed8d7e10 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -41,6 +41,7 @@
 #define ACTMON_DEV_AVG_UPPER_WMARK				0x10
 #define ACTMON_DEV_AVG_LOWER_WMARK				0x14
 #define ACTMON_DEV_COUNT_WEIGHT					0x18
+#define ACTMON_DEV_COUNT					0x1c
 #define ACTMON_DEV_AVG_COUNT					0x20
 #define ACTMON_DEV_INTR_STATUS					0x24
 
@@ -276,6 +277,9 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 					 unsigned long *lower,
 					 unsigned long *upper)
 {
+	struct device *ddev = tegra->devfreq->dev.parent;
+	u32 offset = dev->config->offset;
+
 	/*
 	 * Memory frequencies are guaranteed to have 1MHz granularity
 	 * and thus we need this rounding down to get a proper watermarks
@@ -288,6 +292,9 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 	*lower = tegra_actmon_lower_freq(tegra, target_freq);
 	*upper = tegra_actmon_upper_freq(tegra, target_freq);
 
+	dev_dbg(ddev, "%03x: target_freq %lu lower freq %lu upper freq %lu\n",
+		offset, target_freq, *lower, *upper);
+
 	*lower /= KHZ;
 	*upper /= KHZ;
 
@@ -367,11 +374,31 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
 	device_writel(dev, lower + delta, ACTMON_DEV_LOWER_WMARK);
 }
 
+static void actmon_device_debug(struct tegra_devfreq *tegra,
+				struct tegra_devfreq_device *dev,
+				const char *prefix)
+{
+	dev_dbg(tegra->devfreq->dev.parent,
+		"%03x: %s: 0x%08x 0x%08x a %u %u %u c %u %u %u b %lu cpu %u\n",
+		dev->config->offset, prefix,
+		device_readl(dev, ACTMON_DEV_INTR_STATUS),
+		device_readl(dev, ACTMON_DEV_CTRL),
+		device_readl(dev, ACTMON_DEV_AVG_COUNT),
+		device_readl(dev, ACTMON_DEV_AVG_LOWER_WMARK),
+		device_readl(dev, ACTMON_DEV_AVG_UPPER_WMARK),
+		device_readl(dev, ACTMON_DEV_COUNT),
+		device_readl(dev, ACTMON_DEV_LOWER_WMARK),
+		device_readl(dev, ACTMON_DEV_UPPER_WMARK),
+		dev->boost_freq, cpufreq_get(0));
+}
+
 static void actmon_isr_device(struct tegra_devfreq *tegra,
 			      struct tegra_devfreq_device *dev)
 {
 	u32 intr_status, dev_ctrl, avg_intr_mask;
 
+	actmon_device_debug(tegra, dev, "isr+");
+
 	dev->avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
 	intr_status = device_readl(dev, ACTMON_DEV_INTR_STATUS);
 	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
@@ -421,6 +448,8 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
+
+	actmon_device_debug(tegra, dev, "isr-");
 }
 
 static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
@@ -710,6 +739,7 @@ static struct devfreq_dev_profile tegra_devfreq_profile = {
 static int tegra_governor_get_target(struct devfreq *devfreq,
 				     unsigned long *freq)
 {
+	struct device *ddev = devfreq->dev.parent;
 	struct devfreq_dev_status *stat;
 	struct tegra_devfreq *tegra;
 	struct tegra_devfreq_device *dev;
@@ -732,6 +762,11 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 		dev_target_freq = actmon_update_target(tegra, dev);
 
 		target_freq = max(target_freq, dev_target_freq);
+
+		dev_dbg(ddev, "%03x: upd: dev_target_freq %lu\n",
+			dev->config->offset, dev_target_freq);
+
+		actmon_device_debug(tegra, dev, "upd");
 	}
 
 	*freq = target_freq * KHZ;
-- 
2.22.0
