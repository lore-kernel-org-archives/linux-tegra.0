From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 5/5] clocksource/drivers/tegra: Remove unused suspend/resume code
Date: Thu, 28 Apr 2016 15:20:48 +0200
Message-ID: <1461849648-12751-5-git-send-email-daniel.lezcano@linaro.org>
References: <20160428131908.GC5197@linaro.org>
 <1461849648-12751-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461849648-12751-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@kernel.org
Cc: Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The tegra_timer_suspend() and tegra_timer_resume() functions are never
used, so they can be removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/tegra20_timer.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index 38333ab..7b94ad2 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -258,17 +258,3 @@ static void __init tegra20_init_rtc(struct device_node *np)
 	register_persistent_clock(NULL, tegra_read_persistent_clock64);
 }
 CLOCKSOURCE_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
-
-#ifdef CONFIG_PM
-static u32 usec_config;
-
-void tegra_timer_suspend(void)
-{
-	usec_config = timer_readl(TIMERUS_USEC_CFG);
-}
-
-void tegra_timer_resume(void)
-{
-	timer_writel(usec_config, TIMERUS_USEC_CFG);
-}
-#endif
-- 
1.9.1
