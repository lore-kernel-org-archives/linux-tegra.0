From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 13/20] PM / devfreq: tegra30: Reset boosting on startup
Date: Tue, 30 Jul 2019 19:22:29 +0300
Message-ID: <20190730162236.6063-14-digetx@gmail.com>
References: <20190730162236.6063-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730162236.6063-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Governor could be stopped while boosting is active. We have assumption
that everything is reset on governor's restart, including the boosting
value, which was missed.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 762e17323095..6e8ae20c3bf1 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -684,6 +684,9 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 {
 	u32 val = 0;
 
+	/* reset boosting on governor's restart */
+	dev->boost_freq = 0;
+
 	dev->avg_freq = clk_get_rate(tegra->emc_clock) / KHZ;
 	device_writel(dev, dev->avg_freq * ACTMON_SAMPLING_PERIOD,
 		      ACTMON_DEV_INIT_AVG);
-- 
2.22.0
