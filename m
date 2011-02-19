From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 18/21] ARM: tegra: cpufreq: Adjust memory frequency with cpu frequency
Date: Sat, 19 Feb 2011 14:26:07 -0800
Message-ID: <1298154371-5641-20-git-send-email-ccross__8037.43080837211$1298154673$gmane$org@android.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/cpu-tegra.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-tegra.c
index f02ba60..0e1016a 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -51,6 +51,7 @@ static struct cpufreq_frequency_table freq_table[] = {
 #define NUM_CPUS	2
 
 static struct clk *cpu_clk;
+static struct clk *emc_clk;
 
 static unsigned long target_cpu_speed[NUM_CPUS];
 static DEFINE_MUTEX(tegra_cpu_lock);
@@ -83,6 +84,17 @@ static int tegra_update_cpu_speed(unsigned long rate)
 	if (freqs.old == freqs.new)
 		return ret;
 
+	/*
+	 * Vote on memory bus frequency based on cpu frequency
+	 * This sets the minimum frequency, display or avp may request higher
+	 */
+	if (rate >= 816000)
+		clk_set_rate(emc_clk, 600000000); /* cpu 816 MHz, emc max */
+	else if (rate >= 456000)
+		clk_set_rate(emc_clk, 300000000); /* cpu 456 MHz, emc 150Mhz */
+	else
+		clk_set_rate(emc_clk, 100000000);  /* emc 50Mhz */
+
 	for_each_online_cpu(freqs.cpu)
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
@@ -173,6 +185,13 @@ static int tegra_cpu_init(struct cpufreq_policy *policy)
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
 
+	emc_clk = clk_get_sys("cpu", "emc");
+	if (IS_ERR(emc_clk)) {
+		clk_put(cpu_clk);
+		return PTR_ERR(emc_clk);
+	}
+
+	clk_enable(emc_clk);
 	clk_enable(cpu_clk);
 
 	cpufreq_frequency_table_cpuinfo(policy, freq_table);
@@ -195,6 +214,8 @@ static int tegra_cpu_init(struct cpufreq_policy *policy)
 static int tegra_cpu_exit(struct cpufreq_policy *policy)
 {
 	cpufreq_frequency_table_cpuinfo(policy, freq_table);
+	clk_disable(emc_clk);
+	clk_put(emc_clk);
 	clk_put(cpu_clk);
 	return 0;
 }
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
