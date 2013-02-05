From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove empty tegra_smp_init_cpus()
Date: Tue,  5 Feb 2013 13:14:30 -0800
Message-ID: <1360098870-24818-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Based on two separate cleanup branches, it's now empty and can be removed.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---

(Already applied on arm-soc, just posting for posterity)

 arch/arm/mach-tegra/platsmp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index f06fc51..2c6b3d5 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -176,10 +176,6 @@ done:
 	return status;
 }
 
-static void __init tegra_smp_init_cpus(void)
-{
-}
-
 static void __init tegra_smp_prepare_cpus(unsigned int max_cpus)
 {
 	/* Always mark the boot CPU (CPU0) as initialized. */
@@ -190,7 +186,6 @@ static void __init tegra_smp_prepare_cpus(unsigned int max_cpus)
 }
 
 struct smp_operations tegra_smp_ops __initdata = {
-	.smp_init_cpus		= tegra_smp_init_cpus,
 	.smp_prepare_cpus	= tegra_smp_prepare_cpus,
 	.smp_secondary_init	= tegra_secondary_init,
 	.smp_boot_secondary	= tegra_boot_secondary,
-- 
1.8.1.192.gc4361b8
