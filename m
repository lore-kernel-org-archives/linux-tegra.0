From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 10/11] PM / devfreq: tegra30: Add debug messages
Date: Mon, 24 Jun 2019 00:46:57 +0300
Message-ID: <20190623214658.11680-11-digetx@gmail.com>
References: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add debug messages to know about what's happening in hardware and how
driver reacts.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 168bfe78e525..452bc10d2d72 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -277,6 +277,8 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 					 unsigned long *lower,
 					 unsigned long *upper)
 {
+	struct device *ddev = tegra->devfreq->dev.parent;
+	u32 offset = dev->config->offset;
 	unsigned long target_freq, min;
 
 	target_freq = count / ACTMON_SAMPLING_PERIOD * KHZ;
@@ -312,6 +314,9 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
 	else
 		*upper = tegra_actmon_upper_freq(tegra, target_freq);
 
+	dev_dbg(ddev, "%03x: target_freq %lu lower freq %lu upper freq %lu\n",
+		offset, target_freq, *lower, *upper);
+
 	*lower /= KHZ;
 	*upper /= KHZ;
 
@@ -384,12 +389,32 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
 	device_writel(dev, count + delta, ACTMON_DEV_UPPER_WMARK);
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
 	bool low_activity = true;
 
+	actmon_device_debug(tegra, dev, "isr+");
+
 	dev->avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
 	intr_status = device_readl(dev, ACTMON_DEV_INTR_STATUS);
 	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
@@ -451,6 +476,8 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
 
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
+
+	actmon_device_debug(tegra, dev, "isr-");
 }
 
 static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
@@ -737,6 +764,7 @@ static struct devfreq_dev_profile tegra_devfreq_profile = {
 static int tegra_governor_get_target(struct devfreq *devfreq,
 				     unsigned long *freq)
 {
+	struct device *ddev = devfreq->dev.parent;
 	struct devfreq_dev_status *stat;
 	struct tegra_devfreq *tegra;
 	struct tegra_devfreq_device *dev;
@@ -759,6 +787,11 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
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
