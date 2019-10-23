From: Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH] cpufreq: tegra186: add CPUFREQ_NEED_INITIAL_FREQ_CHECK flag
Date: Wed, 23 Oct 2019 11:27:03 +0200
Message-ID: <20191023092703.30767-1-ykaukab@suse.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mperttunen@nvidia.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com, Mian Yousaf Kaukab <ykaukab@suse.de>
List-Id: linux-tegra@vger.kernel.org

The driver doesn't provide ->get() method to read current frequency.
Let cpufreq core set a frequency which is specified in freq-table by
setting CPUFREQ_NEED_INITIAL_FREQ_CHECK flag. As a result policy->cur
is set to a correct value as well.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 drivers/cpufreq/tegra186-cpufreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index bcecb068b51b..6ce6298bd2d7 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -93,7 +93,8 @@ static int tegra186_cpufreq_set_target(struct cpufreq_policy *policy,
 
 static struct cpufreq_driver tegra186_cpufreq_driver = {
 	.name = "tegra186",
-	.flags = CPUFREQ_STICKY | CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
+	.flags = CPUFREQ_STICKY | CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
+			CPUFREQ_NEED_INITIAL_FREQ_CHECK,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = tegra186_cpufreq_set_target,
 	.init = tegra186_cpufreq_init,
-- 
2.16.4
