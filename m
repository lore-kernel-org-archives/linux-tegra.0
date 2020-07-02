From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] cpuidle: tegra: Correctly handle result of arm_cpuidle_simple_enter()
Date: Thu,  2 Jul 2020 03:13:54 +0300
Message-ID: <20200702001354.27056-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The enter() callback of CPUIDLE drivers returns index of the entered idle
state on success or a negative value on failure. The negative value could
any negative value, i.e. it doesn't necessarily needs to be a error code.
That's because CPUIDLE core only cares about the fact of failure and not
about the reason of the enter() failure.

Like every other enter() callback, the arm_cpuidle_simple_enter() returns
the entered idle-index on success. Unlike some of other drivers, it never
fails. It happened that TEGRA_C1=index=err=0 in the code of cpuidle-tegra
driver, and thus, there is no problem for the cpuidle-tegra driver created
by the typo in the code which assumes that the arm_cpuidle_simple_enter()
returns a error code.

The arm_cpuidle_simple_enter() also may return a -ENODEV error if CPU_IDLE
is disabled in a kernel's config, but all CPUIDLE drivers are disabled if
CPU_IDLE is disabled, including the cpuidle-tegra driver. So we can't ever
see the error code from arm_cpuidle_simple_enter() today.

Of course the code may get some changes in the future and then the typo
may transform into a real bug, so let's correct the typo in the code by
making tegra_cpuidle_enter() to directly return the index returned by the
arm_cpuidle_simple_enter().

This patch fixes a minor typo in the code, it doesn't fix any bugs.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changelog:

v2: Improved commit message by clarifying what values are returned by
    arm_cpuidle_simple_enter() and when. Thanks to Jon Hunter for the
    suggestion!

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
