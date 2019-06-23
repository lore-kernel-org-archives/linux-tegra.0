From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 08/11] PM / devfreq: tegra30: Stop de-boosting once it's finished
Date: Mon, 24 Jun 2019 00:46:55 +0300
Message-ID: <20190623214658.11680-9-digetx@gmail.com>
References: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Once boosting value is 0, then further consecutive-down events won't do
anything useful since the only purpose of those consecutive events to
boost the freq and de-boosting is over in the case of 0. Note that upper
watermark is infinitely high in a case of frequency max out and thus the
upper events are stopping by themselves. In a result of this change all
parasite interrupts are fixed now and interrupts activity is nearly
non-existent now!

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 6fb3ca125438..81449cc1392b 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -424,6 +424,8 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 					     dev->config->boost_up_coeff);
 		dev->boost_freq += ACTMON_BOOST_FREQ_STEP;
 
+		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
+
 		if (dev->boost_freq >= tegra->max_freq && !low_activity)
 			dev->boost_freq = tegra->max_freq;
 
@@ -442,6 +444,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
 		tegra_devfreq_update_wmark(tegra, dev);
 	}
 
+	/* no boosting => no need for consecutive-down interrupt */
+	if (dev->boost_freq == 0)
+		dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
+
 	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
 
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
-- 
2.22.0
