From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 17/18] PM / devfreq: tegra30: Tune up MCCPU boost-down coefficient
Date: Sun,  3 Nov 2019 23:41:29 +0300
Message-ID: <20191103204130.2172-18-digetx@gmail.com>
References: <20191103204130.2172-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191103204130.2172-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

MCCPU boosts up very aggressively by 800% and boosts down very mildly by
10%. This doesn't work well when system is idling because the very slow
de-boosting results in lots of consecutive-down interrupts, in result
memory stays clocked high and CPU doesn't enter deepest idling state
instead of keeping memory at lowest freq and having CPU cluster turned
off. A more faster de-boosting fixes the case of idling system and doesn't
affect the case of an active system.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 9c645e83ef8b..732cacb54c3b 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -124,7 +124,7 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
 		.offset = 0x200,
 		.irq_mask = 1 << 25,
 		.boost_up_coeff = 800,
-		.boost_down_coeff = 90,
+		.boost_down_coeff = 40,
 		.boost_up_threshold = 27,
 		.boost_down_threshold = 10,
 		.avg_dependency_threshold = 5 * KHZ,
-- 
2.23.0
