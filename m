From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/26] ARM: call of_clk_init from default time_init handler
Date: Mon, 23 Sep 2013 09:54:30 +0200
Message-ID: <1379922870-2325-1-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1379526839-14798-10-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379526839-14798-10-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, STEricsson <STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Most DT ARM machs require common clock providers initialized before timers.
Currently, arch/arm machs use .init_time to call of_clk_init right before
clocksource_of_init. This prevents to remove that callback and use the default
one instead.

This patch adds a call to of_clk_init() to the default .init_time callback
for COMMON_CLK enabled machs to allow to remove custom callbacks where applicable.
While at it, also reorder includes alphabetically.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changelog:
v1->v2:
- protect call to of_clk_init which is only available for COMMON_CLK to
  not break !COMMON_CLK machs. (Reported by Olof Johanssen)
RFCv2->v1:
- only call of_clk_init(NULL) when no custom .init_time is set
  (Suggested by Soeren Brinkmann)
RFCv1->RFCv2:
- reorder includes alphabetically

Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: STEricsson <STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/kernel/time.c |   29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
index 98aee32..829a96d 100644
--- a/arch/arm/kernel/time.c
+++ b/arch/arm/kernel/time.c
@@ -11,25 +11,26 @@
  *  This file contains the ARM-specific time handling details:
  *  reading the RTC at bootup, etc...
  */
+#include <linux/clk-provider.h>
+#include <linux/clocksource.h>
+#include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/kernel.h>
-#include <linux/interrupt.h>
-#include <linux/time.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/profile.h>
 #include <linux/sched.h>
+#include <linux/sched_clock.h>
 #include <linux/smp.h>
+#include <linux/time.h>
 #include <linux/timex.h>
-#include <linux/errno.h>
-#include <linux/profile.h>
 #include <linux/timer.h>
-#include <linux/clocksource.h>
-#include <linux/irq.h>
-#include <linux/sched_clock.h>
 
-#include <asm/thread_info.h>
-#include <asm/stacktrace.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
+#include <asm/stacktrace.h>
+#include <asm/thread_info.h>
 
 #if defined(CONFIG_RTC_DRV_CMOS) || defined(CONFIG_RTC_DRV_CMOS_MODULE) || \
     defined(CONFIG_NVRAM) || defined(CONFIG_NVRAM_MODULE)
@@ -116,8 +117,12 @@ int __init register_persistent_clock(clock_access_fn read_boot,
 
 void __init time_init(void)
 {
-	if (machine_desc->init_time)
+	if (machine_desc->init_time) {
 		machine_desc->init_time();
-	else
+	} else {
+#ifdef CONFIG_COMMON_CLK
+		of_clk_init(NULL);
+#endif
 		clocksource_of_init();
+	}
 }
-- 
1.7.10.4
