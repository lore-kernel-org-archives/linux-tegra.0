From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove unnecessary includes of <mach/*.h>
Date: Mon, 15 Oct 2012 12:00:12 -0600
Message-ID: <1350324012-21467-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This should make it easier to delete or move <mach/*.h>; something that
is useful for single-zImage.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I thought I'd already posted this for review, but apparently not. Anyway,
I intend to apply this immediately to Tegra's for-3.8/cleanup branch.

 arch/arm/mach-tegra/board-dt-tegra20.c       |    1 -
 arch/arm/mach-tegra/clock.c                  |    2 --
 arch/arm/mach-tegra/cpu-tegra.c              |    3 ---
 arch/arm/mach-tegra/cpuidle.c                |    2 --
 arch/arm/mach-tegra/include/mach/powergate.h |    2 ++
 arch/arm/mach-tegra/platsmp.c                |    1 -
 arch/arm/mach-tegra/sleep-t20.S              |    2 --
 arch/arm/mach-tegra/sleep-t30.S              |    2 --
 arch/arm/mach-tegra/tegra20_clocks_data.c    |    2 --
 arch/arm/mach-tegra/tegra2_emc.c             |    2 --
 10 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 57e235f..76497e0 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -41,7 +41,6 @@
 #include <asm/setup.h>
 
 #include <mach/iomap.h>
-#include <mach/irqs.h>
 
 #include "board.h"
 #include "clock.h"
diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index fd82085..867bf8b 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -27,8 +27,6 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 
-#include <mach/clk.h>
-
 #include "board.h"
 #include "clock.h"
 #include "tegra_cpu_car.h"
diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-tegra.c
index 627bf0f..a74d3c7 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -30,9 +30,6 @@
 #include <linux/io.h>
 #include <linux/suspend.h>
 
-
-#include <mach/clk.h>
-
 /* Frequency table index must be sequential starting at 0 */
 static struct cpufreq_frequency_table freq_table[] = {
 	{ 0, 216000 },
diff --git a/arch/arm/mach-tegra/cpuidle.c b/arch/arm/mach-tegra/cpuidle.c
index 566e2f8..9a6f051 100644
--- a/arch/arm/mach-tegra/cpuidle.c
+++ b/arch/arm/mach-tegra/cpuidle.c
@@ -29,8 +29,6 @@
 
 #include <asm/proc-fns.h>
 
-#include <mach/iomap.h>
-
 static int tegra_idle_enter_lp3(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv, int index);
 
diff --git a/arch/arm/mach-tegra/include/mach/powergate.h b/arch/arm/mach-tegra/include/mach/powergate.h
index 4752b1a..06763fe 100644
--- a/arch/arm/mach-tegra/include/mach/powergate.h
+++ b/arch/arm/mach-tegra/include/mach/powergate.h
@@ -20,6 +20,8 @@
 #ifndef _MACH_TEGRA_POWERGATE_H_
 #define _MACH_TEGRA_POWERGATE_H_
 
+struct clk;
+
 #define TEGRA_POWERGATE_CPU	0
 #define TEGRA_POWERGATE_3D	1
 #define TEGRA_POWERGATE_VENC	2
diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 81cb265..e50870c 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -24,7 +24,6 @@
 #include <asm/mach-types.h>
 #include <asm/smp_scu.h>
 
-#include <mach/clk.h>
 #include <mach/iomap.h>
 #include <mach/powergate.h>
 
diff --git a/arch/arm/mach-tegra/sleep-t20.S b/arch/arm/mach-tegra/sleep-t20.S
index a36ae41..72ce709 100644
--- a/arch/arm/mach-tegra/sleep-t20.S
+++ b/arch/arm/mach-tegra/sleep-t20.S
@@ -22,8 +22,6 @@
 
 #include <asm/assembler.h>
 
-#include <mach/iomap.h>
-
 #include "sleep.h"
 #include "flowctrl.h"
 
diff --git a/arch/arm/mach-tegra/sleep-t30.S b/arch/arm/mach-tegra/sleep-t30.S
index 777d9ce..be7614b 100644
--- a/arch/arm/mach-tegra/sleep-t30.S
+++ b/arch/arm/mach-tegra/sleep-t30.S
@@ -18,8 +18,6 @@
 
 #include <asm/assembler.h>
 
-#include <mach/iomap.h>
-
 #include "sleep.h"
 #include "flowctrl.h"
 
diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index cc9b5fd..d8139b3 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -27,8 +27,6 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 
-#include <mach/iomap.h>
-
 #include "clock.h"
 #include "fuse.h"
 #include "tegra2_emc.h"
diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c
index 5070d83..837c7b9 100644
--- a/arch/arm/mach-tegra/tegra2_emc.c
+++ b/arch/arm/mach-tegra/tegra2_emc.c
@@ -25,8 +25,6 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/tegra_emc.h>
 
-#include <mach/iomap.h>
-
 #include "tegra2_emc.h"
 #include "fuse.h"
 
-- 
1.7.0.4
