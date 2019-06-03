From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 03/10] clocksource/drivers/tegra: Reset hardware state on init
Date: Mon,  3 Jun 2019 21:59:41 +0300
Message-ID: <20190603185948.30438-4-digetx@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603185948.30438-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reset timer's hardware state to ensure that initially it is in a
predictable state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra20.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
index 57e7aa2b80a3..739f83fdb318 100644
--- a/drivers/clocksource/timer-tegra20.c
+++ b/drivers/clocksource/timer-tegra20.c
@@ -132,6 +132,9 @@ static int tegra_timer_setup(unsigned int cpu)
 {
 	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
 
+	writel(0, timer_of_base(to) + TIMER_PTV);
+	writel(TIMER_PCR_INTR_CLR, timer_of_base(to) + TIMER_PCR);
+
 	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
 	enable_irq(to->clkevt.irq);
 
-- 
2.21.0
