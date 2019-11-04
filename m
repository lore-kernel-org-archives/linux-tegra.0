From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v9 13/19] PM / devfreq: tegra30: Don't enable already enabled consecutive interrupts
Date: Tue,  5 Nov 2019 00:56:11 +0300
Message-ID: <20191104215617.25544-14-digetx@gmail.com>
References: <20191104215617.25544-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104215617.25544-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Consecutive up/down interrupt-bit is set in the interrupt status register
only if that interrupt was previously enabled. Thus enabling the already
enabled interrupt doesn't do much for us.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 7c8126e74750..4a5d513904a2 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -261,8 +261,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 		if (dev->boost_freq >= tegra->max_freq)
 			dev->boost_freq = tegra->max_freq;
-		else
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
 	} else if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_LOWER) {
 		/*
 		 * new_boost = old_boost * down_coef
@@ -275,8 +273,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 
 		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1))
 			dev->boost_freq = 0;
-		else
-			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
 	}
 
 	if (dev->config->avg_dependency_threshold) {
-- 
2.23.0
