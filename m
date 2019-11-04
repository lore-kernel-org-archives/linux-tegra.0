From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v9 14/19] PM / devfreq: tegra30: Disable consecutive interrupts when appropriate
Date: Tue,  5 Nov 2019 00:56:12 +0300
Message-ID: <20191104215617.25544-15-digetx@gmail.com>
References: <20191104215617.25544-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104215617.25544-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Consecutive interrupts should be disabled when boosting is completed.

Currently the disabling of "lower" interrupt happens only for MCCPU
monitor that uses dependency threshold, but even in a case of MCCPU the
interrupt isn't getting disabled if CPU's activity is above the threshold.
This results in a lot of dummy interrupt requests. The boosting feature is
used by both MCCPU and MCALL, boosting should be stopped once it reaches 0
for both of the monitors and regardless of the activity level.

The boosting stops to grow once the maximum limit is hit and thus the
"upper" interrupt needs to be disabled when the limit is reached.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 4a5d513904a2..852bde6249c7 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -259,8 +259,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
 
-		if (dev->boost_freq >= tegra->max_freq)
+		if (dev->boost_freq >= tegra->max_freq) {
+			dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
 			dev->boost_freq = tegra->max_freq;
+		}
 	} else if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_LOWER) {
 		/*
 		 * new_boost = old_boost * down_coef
@@ -271,15 +273,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
 
-		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1))
-			dev->boost_freq = 0;
-	}
-
-	if (dev->config->avg_dependency_threshold) {
-		if (dev->avg_count >= dev->config->avg_dependency_threshold)
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
-		else if (dev->boost_freq == 0)
+		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1)) {
 			dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
+			dev->boost_freq = 0;
+		}
 	}
 
 	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
-- 
2.23.0
