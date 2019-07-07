From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 06/24] PM / devfreq: tegra30: Tune up boosting thresholds
Date: Mon,  8 Jul 2019 01:32:45 +0300
Message-ID: <20190707223303.6755-7-digetx@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Now that average-sustain coefficient / multiplier is gone, it won't hurt
to re-tune the boosting thresholds to get a bit harder boosting for MCALL
clients, resulting in a more reactive governing in a case of multimedia
applications usage like 3d / video.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 16f7e6cf3b99..2bf65409ddd8 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -111,8 +111,8 @@ static struct tegra_devfreq_device_config actmon_device_configs[] = {
 		.irq_mask = 1 << 26,
 		.boost_up_coeff = 200,
 		.boost_down_coeff = 50,
-		.boost_up_threshold = 60,
-		.boost_down_threshold = 40,
+		.boost_up_threshold = 50,
+		.boost_down_threshold = 25,
 	},
 	{
 		/* MCCPU: memory accesses from the CPUs */
-- 
2.22.0
