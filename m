From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND][v3 4/9] ARM: Add API to detect SCU base address from CP15
Date: Fri, 18 Jan 2013 11:54:40 +0100
Message-ID: <20130118.125440.65456178743324707.hdoyu@nvidia.com>
References: <1358237598-32413-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358237598-32413-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add API to detect SCU base address from CP15.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
NOTE:
This wasn't delivered to linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, resending....

For usage: http://patchwork.ozlabs.org/patch/212013/
---
 arch/arm/include/asm/smp_scu.h |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/include/asm/smp_scu.h b/arch/arm/include/asm/smp_scu.h
index 4eb6d00..f619eef 100644
--- a/arch/arm/include/asm/smp_scu.h
+++ b/arch/arm/include/asm/smp_scu.h
@@ -6,6 +6,23 @@
 #define SCU_PM_POWEROFF	3
 
 #ifndef __ASSEMBLER__
+
+#include <asm/cputype.h>
+
+static inline phys_addr_t scu_get_base(void)
+{
+	phys_addr_t pa;
+	unsigned long part_number = read_cpuid_part_number();
+
+	switch (part_number) {
+	case ARM_CPU_PART_CORTEX_A9:
+		/* Get SCU physical base */
+		asm("mrc p15, 4, %0, c15, c0, 0" : "=r" (pa));
+		return pa;
+	default:
+		return 0;
+	}
+}
 unsigned int scu_get_core_count(void __iomem *);
 void scu_enable(void __iomem *);
 int scu_power_mode(void __iomem *, unsigned int);
-- 
1.7.9.5
