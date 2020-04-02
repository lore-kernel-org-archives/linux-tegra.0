From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] PM / devfreq: tegra30: Make CPUFreq notifier to take into account boosting
Date: Fri,  3 Apr 2020 01:24:48 +0300
Message-ID: <20200402222448.8320-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We're taking into account both HW memory-accesses + CPU activity based on
current CPU's frequency. For memory-accesses there is a kind of hysteresis
in a form of "boosting" which is managed by the tegra30-devfreq driver.
If current HW memory activity is higher than activity judged based of the
CPU's frequency, then there is no need to schedule cpufreq_update_work
because the result of the work will be a NO-OP. And thus,
tegra_actmon_cpufreq_contribution() should return 0, meaning that at the
moment CPU frequency doesn't contribute anything to the final decision
about required memory clock rate.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changelog:

v2: - Made commit's message more detailed, which was requested by Chanwoo Choi
      in the review comment to v1.

    - This patch is now made to be standalone because there are no dependencies
      in regards to this change.

 drivers/devfreq/tegra30-devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 28b2c7ca416e..dfc3ac93c584 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -420,7 +420,7 @@ tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
 
 	static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
 
-	if (dev_freq >= static_cpu_emc_freq)
+	if (dev_freq + actmon_dev->boost_freq >= static_cpu_emc_freq)
 		return 0;
 
 	return static_cpu_emc_freq;
-- 
2.25.1
