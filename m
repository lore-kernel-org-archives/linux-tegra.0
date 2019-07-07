From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 5/6] cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from Tegra114/124 idle-state
Date: Mon,  8 Jul 2019 02:38:08 +0300
Message-ID: <20190707233809.14400-6-digetx@gmail.com>
References: <20190707233809.14400-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707233809.14400-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Local CPU timers are always-ON on the Tegra114/124 SoCs regardless of the
CPU's idle state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 31eeef22c0ff..464b2376905a 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -163,7 +163,6 @@ static struct cpuidle_driver tegra_idle_driver = {
 			.exit_latency		= 500,
 			.target_residency	= 1000,
 			.power_usage		= 0,
-			.flags			= CPUIDLE_FLAG_TIMER_STOP,
 			.name			= "powered-down",
 			.desc			= "CPU core power-gated",
 		},
-- 
2.22.0
