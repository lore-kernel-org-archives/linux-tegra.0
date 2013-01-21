From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 1/1] ARM: Add API to detect SCU base address from CP15
Date: Mon, 21 Jan 2013 09:42:55 +0200
Message-ID: <1358754175-15484-1-git-send-email-hdoyu@nvidia.com>
References: <50F97E19.8070607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F97E19.8070607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add API to detect SCU base address from CP15.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
---
For usage: http://patchwork.ozlabs.org/patch/212013/
---
 arch/arm/include/asm/smp_scu.h |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/include/asm/smp_scu.h b/arch/arm/include/asm/smp_scu.h
index 4eb6d00..1733ec7 100644
--- a/arch/arm/include/asm/smp_scu.h
+++ b/arch/arm/include/asm/smp_scu.h
@@ -6,6 +6,18 @@
 #define SCU_PM_POWEROFF	3
 
 #ifndef __ASSEMBLER__
+
+#include <asm/cputype.h>
+
+static inline phys_addr_t scu_get_base(void)
+{
+	if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9) {
+		phys_addr_t pa;
+		asm("mrc p15, 4, %0, c15, c0, 0" : "=r" (pa));
+		return pa;
+	}
+	return 0;
+}
 unsigned int scu_get_core_count(void __iomem *);
 void scu_enable(void __iomem *);
 int scu_power_mode(void __iomem *, unsigned int);
-- 
1.7.9.5
