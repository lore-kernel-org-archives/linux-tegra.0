From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 06/11] PM / devfreq: tegra30: Reset boosting on startup
Date: Mon, 24 Jun 2019 00:46:53 +0300
Message-ID: <20190623214658.11680-7-digetx@gmail.com>
References: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Governor could be stopped while boosting is active. We have assumption
that everything is reset on governor's restart, including the boosting
value, which was missed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 813b0f490b90..fc278f2f1b62 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -544,6 +544,9 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 {
 	u32 val = 0, target_freq;
 
+	/* we don't want boosting on restart */
+	dev->boost_freq = 0;
+
 	target_freq = clk_get_rate(tegra->emc_clock) / KHZ;
 	dev->avg_count = target_freq * ACTMON_SAMPLING_PERIOD;
 	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
-- 
2.22.0
