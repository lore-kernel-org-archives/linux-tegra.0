From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 14/24] PM / devfreq: tegra30: Ensure that target freq won't overflow
Date: Mon,  8 Jul 2019 01:32:53 +0300
Message-ID: <20190707223303.6755-15-digetx@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Potentially very high boosting could cause an integer overflow for a
highly clocked memory after conversion to MHz.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 2f59c78930bd..0de1efdaabf4 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -460,6 +460,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
 	unsigned long target_freq;
 
 	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
+	target_freq = min(target_freq, ULONG_MAX / KHZ);
 	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
 
 	return target_freq;
-- 
2.22.0
