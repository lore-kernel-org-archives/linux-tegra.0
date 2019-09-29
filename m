From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 11/14] cpuidle: tegra: Support CPU cluster power-down state on Tegra30
Date: Sun, 29 Sep 2019 20:59:49 +0300
Message-ID: <20190929175952.22690-12-digetx@gmail.com>
References: <20190929175952.22690-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190929175952.22690-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The new Tegra CPU Idle driver now has a unified code path for the coupled
LP2/CC6 state, this allows to enable the deepest idling state on Tegra30
SoC where the whole CPU cluster is power-gated.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index a926d2781227..a30a5e4fc863 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -325,7 +325,6 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 		tegra_idle_driver.states[TEGRA_C7].disabled = true;
 		break;
 	case TEGRA30:
-		tegra_idle_driver.states[TEGRA_CC6].disabled = true;
 		break;
 	case TEGRA114:
 	case TEGRA124:
-- 
2.23.0
