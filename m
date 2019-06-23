From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 07/11] PM / devfreq: tegra30: Reset boosting if clock rate changed
Date: Mon, 24 Jun 2019 00:46:54 +0300
Message-ID: <20190623214658.11680-8-digetx@gmail.com>
References: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is a situation when memory activity is going up, hence boosting up
starts to happen, and then governor ramps memory clock rate up. In this
case consecutive events may be stopped if new "COUNT" is within watermarks
range, meanwhile old boosting value remains, which is plainly wrong and
results in unneeded "go down" events after ramping up. In a result of this
change unnecessary interrupts activity goes even lower.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index fc278f2f1b62..6fb3ca125438 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -631,6 +631,24 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
 		tegra_actmon_stop_device(&tegra->devices[i]);
 }
 
+static void tegra_actmon_stop_boosting(struct tegra_devfreq *tegra)
+{
+	struct tegra_devfreq_device *dev = tegra->devices;
+	unsigned int i;
+	u32 dev_ctrl;
+
+	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++, dev++) {
+		if (!dev->boost_freq)
+			continue;
+
+		dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
+		dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
+		device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
+
+		dev->boost_freq = 0;
+	}
+}
+
 static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 				u32 flags)
 {
@@ -656,6 +674,16 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	if (err)
 		goto restore_min_rate;
 
+	/*
+	 * Hence boosting-up could be active at the moment of the rate-change
+	 * and in this case boosting should be reset because it doesn't relate
+	 * to the new state. If average won't follow shortly in a case of going
+	 * UP, then clock rate will drop back on next update due to the missed
+	 * boosting.
+	 */
+	if (rate != devfreq->previous_freq)
+		tegra_actmon_stop_boosting(tegra);
+
 	return 0;
 
 restore_min_rate:
-- 
2.22.0
