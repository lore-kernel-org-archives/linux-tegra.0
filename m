From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] cpuidle: tegra: Correctly handle result of arm_cpuidle_simple_enter()
Date: Tue, 30 Jun 2020 01:26:25 +0300
Message-ID: <20200629222625.674-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The arm_cpuidle_simple_enter() returns the entered idle-index and not a
error code. It happened that TEGRA_C1=index=err=0, and hence this typo
was difficult to notice in the code since everything happened to work
properly. This patch fixes the minor typo, it doesn't fix any problem.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/cpuidle/cpuidle-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
index 150045849d78..9e9a9cccd755 100644
--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -236,14 +236,14 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
 			       int index)
 {
 	unsigned int cpu = cpu_logical_map(dev->cpu);
-	int err;
+	int err = 0;
 
 	index = tegra_cpuidle_adjust_state_index(index, cpu);
 	if (dev->states_usage[index].disable)
 		return -1;
 
 	if (index == TEGRA_C1)
-		err = arm_cpuidle_simple_enter(dev, drv, index);
+		index = arm_cpuidle_simple_enter(dev, drv, index);
 	else
 		err = tegra_cpuidle_state_enter(dev, index, cpu);
 
-- 
2.26.0
