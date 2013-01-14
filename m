From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Use DT /cpu node to detect number of CPU core
Date: Mon, 14 Jan 2013 09:52:50 +0200
Message-ID: <1358149970-28156-2-git-send-email-hdoyu@nvidia.com>
References: <1358149970-28156-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358149970-28156-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

SCU based detection only works with Cortex-A9 MP and it doesn't
support ones with multiple clusters. The only way to detect number of
CPU core correctly is with DT /cpu node. If DT /cpu node based
detection fails, we just simply fall back a single core in Tegra SoCs.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on the discussion:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140608.html
---
 arch/arm/mach-tegra/platsmp.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 6867030..456e7cc 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -24,6 +24,7 @@
 #include <asm/mach-types.h>
 #include <asm/smp_scu.h>
 #include <asm/smp_plat.h>
+#include <asm/prom.h>
 
 #include <mach/powergate.h>
 
@@ -177,22 +178,10 @@ done:
 	return status;
 }
 
-/*
- * Initialise the CPU possible map early - this describes the CPUs
- * which may be present or become present in the system.
- */
 static void __init tegra_smp_init_cpus(void)
 {
-	unsigned int i, ncores = scu_get_core_count(scu_base);
-
-	if (ncores > nr_cpu_ids) {
-		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
-			ncores, nr_cpu_ids);
-		ncores = nr_cpu_ids;
-	}
-
-	for (i = 0; i < ncores; i++)
-		set_cpu_possible(i, true);
+	if (!arm_dt_cpu_map_valid())
+		set_cpu_possible(0, true);
 
 	set_smp_cross_call(gic_raise_softirq);
 }
-- 
1.7.9.5
