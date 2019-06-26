From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 16/25] clocksource/drivers/tegra: Restore timer rate on Tegra210
Date: Wed, 26 Jun 2019 16:46:42 +0200
Message-ID: <20190626144651.16742-16-daniel.lezcano@linaro.org>
References: <adba7d03-e9bd-9542-60bc-0f2d4874a40e@linaro.org>
 <20190626144651.16742-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626144651.16742-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

The clocksource rate is initialized only for the first per-CPU clocksource
and then that rate shall be replicated for the rest of clocksource's
because they are initialized manually in the code.

Fixes: 3be2a85a0b61 ("clocksource/drivers/tegra: Support per-CPU timers on all Tegra's")
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index ed1454000ea9..880ba67ca7ee 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -279,6 +279,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		 */
 		if (tegra20)
 			cpu_to->of_clk.rate = 1000000;
+		else
+			cpu_to->of_clk.rate = timer_of_rate(to);
 
 		cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		cpu_to->of_base.base = timer_reg_base + base;
-- 
2.17.1
