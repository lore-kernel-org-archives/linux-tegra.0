From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] cpuidle: tegra: Support CPU cluster power-down state on Tegra30
Date: Wed, 25 Mar 2020 01:43:35 +0300
Message-ID: <20200324224335.5825-4-digetx@gmail.com>
References: <20200324224335.5825-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200324224335.5825-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The new Tegra CPU Idle driver now has a unified code path for the coupled
CC6 (LP2) state, this allows to enable the deepest idling state on Tegra30
SoC where the whole CPU cluster is power-gated.

Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/cpuidle/cpuidle-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 313b0290e97b..150045849d78 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -365,7 +365,6 @@ static int tegra_cpuidle_probe(struct platform_device *pdev)
 		break;
 
 	case TEGRA30:
-		tegra_cpuidle_disable_state(TEGRA_CC6);
 		break;
 
 	case TEGRA114:
-- 
2.25.1
