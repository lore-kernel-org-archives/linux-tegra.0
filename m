From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] clocksource/drivers/tegra: Set up maximum limit properly
Date: Mon, 17 Jun 2019 02:47:44 +0300
Message-ID: <20190616234744.8975-2-digetx@gmail.com>
References: <20190616234744.8975-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616234744.8975-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra's timer has 29 bits for the counter. The counter's value is smaller
than the actual value by 1, hence the maximum equals to 29 bits + 1.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 090c85358fe8..d0a46e10dbca 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -130,7 +130,7 @@ static int tegra_timer_setup(unsigned int cpu)
 
 	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					1, /* min */
-					0x1fffffff); /* 29 bits */
+					0x20000000); /* 29 bits + 1 */
 
 	return 0;
 }
-- 
2.22.0
