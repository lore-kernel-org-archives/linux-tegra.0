From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 7/8] ARM: tegra: Support L2 cache maintenance done via firmware
Date: Mon, 18 Feb 2019 03:17:25 +0300
Message-ID: <20190218001726.16785-8-digetx@gmail.com>
References: <20190218001726.16785-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218001726.16785-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Trusted Foundations firmware require MMU to be enabled for L2 cache
maintenance on Tegra30, hence perform the maintenance early/late on
suspend-resume respectively.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/pm.c    | 36 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/sleep.S | 11 +++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 1ad5719779b0..66c8cd63dd86 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -38,6 +38,7 @@
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
 #include <asm/tlbflush.h>
+#include <asm/trusted_foundations.h>
 
 #include "iomap.h"
 #include "pm.h"
@@ -195,8 +196,27 @@ void tegra_idle_lp2_last(void)
 	cpu_cluster_pm_enter();
 	suspend_cpu_complex();
 
+	/*
+	 * L2 cache disabling using kernel API only allowed when all
+	 * secondary CPU's are offline. Cache have to be disabled early
+	 * if cache maintenance is done via Trusted Foundations firmware.
+	 * Note that CPUIDLE won't ever enter powergate on Tegra30 if any
+	 * of secondary CPU's is online and this is the LP2 codepath only
+	 * for Tegra20/30.
+	 */
+	if (trusted_foundations_registered())
+		outer_disable();
+
 	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
 
+	/*
+	 * Resume L2 cache if it wasn't re-enabled early during resume,
+	 * which is the case for Tegra30 that has to re-enable the cache
+	 * via firmware call. In other cases cache is already enabled and
+	 * hence re-enabling is a no-op.
+	 */
+	outer_resume();
+
 	restore_cpu_complex();
 	cpu_cluster_pm_exit();
 }
@@ -340,8 +360,24 @@ static int tegra_suspend_enter(suspend_state_t state)
 		break;
 	}
 
+	/*
+	 * Cache have to be disabled early if cache maintenance is done
+	 * via Trusted Foundations firmware. Otherwise this is a no-op,
+	 * like on Tegra114+.
+	 */
+	if (trusted_foundations_registered())
+		outer_disable();
+
 	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, tegra_sleep_func);
 
+	/*
+	 * Resume L2 cache if it wasn't re-enabled early during resume,
+	 * which is the case for Tegra30 that has to re-enable the cache
+	 * via firmware call. In other cases cache is already enabled and
+	 * hence re-enabling is a no-op.
+	 */
+	outer_resume();
+
 	switch (mode) {
 	case TEGRA_SUSPEND_LP1:
 		tegra_suspend_exit_lp1();
diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 5e3496753df1..0a8086d5a47a 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -132,10 +132,13 @@ ENTRY(tegra_shut_off_mmu)
 #ifdef CONFIG_CACHE_L2X0
 	/* Disable L2 cache */
 	check_cpu_part_num 0xc09, r9, r10
-	movweq	r2, #:lower16:(TEGRA_ARM_PERIF_BASE + 0x3000)
-	movteq	r2, #:upper16:(TEGRA_ARM_PERIF_BASE + 0x3000)
-	moveq	r3, #0
-	streq	r3, [r2, #L2X0_CTRL]
+	retne	r0
+
+	mov32	r2, TEGRA_ARM_PERIF_BASE + 0x3000
+	ldr	r3, [r2, #L2X0_CTRL]
+	mov	r9, #0
+	tst	r3, #1
+	strne	r9, [r2, #L2X0_CTRL]
 #endif
 	ret	r0
 ENDPROC(tegra_shut_off_mmu)
-- 
2.20.1
