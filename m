From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v9 2/7] ARM: trusted_foundations: Make prepare_idle call to take mode argument
Date: Sun,  3 Mar 2019 20:12:09 +0300
Message-ID: <20190303171214.24821-3-digetx@gmail.com>
References: <20190303171214.24821-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190303171214.24821-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Trusted Foundations firmware call varies depending on the required
suspend-mode. Make the firmware API to take the mode argument in order
to expose all of the modes to firmware user.

Tested-by: Robert Yang <decatf@gmail.com>
Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/firmware/trusted_foundations.c    | 29 ++++++++++++++++++++--
 arch/arm/include/asm/firmware.h            |  2 +-
 arch/arm/include/asm/trusted_foundations.h |  6 +++++
 arch/arm/mach-tegra/cpuidle-tegra114.c     |  3 ++-
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/arch/arm/firmware/trusted_foundations.c b/arch/arm/firmware/trusted_foundations.c
index d7ac05103a52..720904a43c00 100644
--- a/arch/arm/firmware/trusted_foundations.c
+++ b/arch/arm/firmware/trusted_foundations.c
@@ -67,9 +67,34 @@ static int tf_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 	return 0;
 }
 
-static int tf_prepare_idle(void)
+static int tf_prepare_idle(unsigned long mode)
 {
-	tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S1_NOFLUSH_L2, cpu_boot_addr);
+	switch (mode) {
+	case TF_PM_MODE_LP0:
+		tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S3, cpu_boot_addr);
+		break;
+
+	case TF_PM_MODE_LP1:
+		tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S2, cpu_boot_addr);
+		break;
+
+	case TF_PM_MODE_LP1_NO_MC_CLK:
+		tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S2_NO_MC_CLK,
+			       cpu_boot_addr);
+		break;
+
+	case TF_PM_MODE_LP2:
+		tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S1, cpu_boot_addr);
+		break;
+
+	case TF_PM_MODE_LP2_NOFLUSH_L2:
+		tf_generic_smc(TF_CPU_PM, TF_CPU_PM_S1_NOFLUSH_L2,
+			       cpu_boot_addr);
+		break;
+
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/arch/arm/include/asm/firmware.h b/arch/arm/include/asm/firmware.h
index 34c1d96ef46d..6698272bbcbf 100644
--- a/arch/arm/include/asm/firmware.h
+++ b/arch/arm/include/asm/firmware.h
@@ -24,7 +24,7 @@ struct firmware_ops {
 	/*
 	 * Inform the firmware we intend to enter CPU idle mode
 	 */
-	int (*prepare_idle)(void);
+	int (*prepare_idle)(unsigned long mode);
 	/*
 	 * Enters CPU idle mode
 	 */
diff --git a/arch/arm/include/asm/trusted_foundations.h b/arch/arm/include/asm/trusted_foundations.h
index d5d1b7efa02e..40445389ffe7 100644
--- a/arch/arm/include/asm/trusted_foundations.h
+++ b/arch/arm/include/asm/trusted_foundations.h
@@ -35,6 +35,12 @@
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/outercache.h>
 
+#define TF_PM_MODE_LP0			0
+#define TF_PM_MODE_LP1			1
+#define TF_PM_MODE_LP1_NO_MC_CLK	2
+#define TF_PM_MODE_LP2			3
+#define TF_PM_MODE_LP2_NOFLUSH_L2	4
+
 struct trusted_foundations_platform_data {
 	unsigned int version_major;
 	unsigned int version_minor;
diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index e3fbcfedf845..3b9af4766cdf 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -24,6 +24,7 @@
 #include <asm/cpuidle.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
+#include <asm/trusted_foundations.h>
 #include <asm/psci.h>
 
 #include "cpuidle.h"
@@ -46,7 +47,7 @@ static int tegra114_idle_power_down(struct cpuidle_device *dev,
 	tegra_set_cpu_in_lp2();
 	cpu_pm_enter();
 
-	call_firmware_op(prepare_idle);
+	call_firmware_op(prepare_idle, TF_PM_MODE_LP2_NOFLUSH_L2);
 
 	/* Do suspend by ourselves if the firmware does not implement it */
 	if (call_firmware_op(do_idle, 0) == -ENOSYS)
-- 
2.20.1
