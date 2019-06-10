From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/6] clocksource/drivers/tegra: Restore timer rate on Tegra210
Date: Mon, 10 Jun 2019 19:43:55 +0300
Message-ID: <20190610164400.11830-2-digetx@gmail.com>
References: <20190610164400.11830-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The clocksource rate is initialized only for the first per-CPU clocksource
and then that rate shall be replicated for the rest of clocksource's
because they are initialized manually in the code.

Fixes: 3be2a85a0b61 ("Support per-CPU timers on all Tegra's")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 9406855781ff..830c66e2d927 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -277,6 +277,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		 */
 		if (tegra20)
 			cpu_to->of_clk.rate = 1000000;
+		else
+			cpu_to->of_clk.rate = timer_of_rate(to);
 
 		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
-- 
2.21.0
