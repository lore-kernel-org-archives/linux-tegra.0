From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 6/6] clocksource/drivers/tegra: Restore base address before cleanup
Date: Mon, 10 Jun 2019 19:44:00 +0300
Message-ID: <20190610164400.11830-7-digetx@gmail.com>
References: <20190610164400.11830-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We're adjusting the timer's base for each per-CPU timer to point to the
actual start of the timer since device-tree defines a compound registers
range that includes all of the timers. In this case the original base
need to be restore before calling iounmap to unmap the proper address.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 2a428fdf702f..7be91db98bd7 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -345,6 +345,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 			irq_dispose_mapping(cpu_to->clkevt.irq);
 		}
 	}
+
+	to->of_base.base = timer_reg_base;
 out:
 	timer_of_cleanup(to);
 
-- 
2.21.0
