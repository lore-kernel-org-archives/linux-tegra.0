From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] clocksource/drivers/tegra: Cycles can't be 0
Date: Mon, 17 Jun 2019 02:47:43 +0300
Message-ID: <20190616234744.8975-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The minimum number of "cycles" is limited to 1 by
clockevents_config_and_register().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index f6a8eb0d7322..090c85358fe8 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -54,9 +54,7 @@ static int tegra_timer_set_next_event(unsigned long cycles,
 {
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
-	writel_relaxed(TIMER_PTV_EN |
-		       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
-		       reg_base + TIMER_PTV);
+	writel_relaxed(TIMER_PTV_EN | (cycles - 1), reg_base + TIMER_PTV);
 
 	return 0;
 }
-- 
2.22.0
