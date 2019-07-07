From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 23/24] PM / devfreq: tegra30: Increase sampling period to 16ms
Date: Mon,  8 Jul 2019 01:33:02 +0300
Message-ID: <20190707223303.6755-24-digetx@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Increase sampling period by 4ms to get a nicer pow2 value, converting
diving into shifts in the code. That's more preferable for Tegra30 that
doesn't have hardware divider instructions because of older Cortex-A9 CPU.
In a result boosting events are delayed by 4ms, which is not sensible in
practice at all.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 19e872a64148..bde19b758643 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -71,7 +71,7 @@
  * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
  */
 #define ACTMON_AVERAGE_WINDOW_LOG2				6
-#define ACTMON_SAMPLING_PERIOD					12 /* ms */
+#define ACTMON_SAMPLING_PERIOD					16 /* ms */
 
 #define KHZ							1000
 
-- 
2.22.0
