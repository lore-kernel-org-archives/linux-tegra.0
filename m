From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v2 01/16] ARM: call clk_of_init from time_init
Date: Tue, 27 Aug 2013 23:27:55 +0200
Message-ID: <1377638890-371-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1376964271-22715-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376964271-22715-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Most DT ARM machs require common clock providers initialized before timers.
Currently, arch/arm machs use .init_time to call clk_of_init right before
clocksource_of_init. This prevents to remove that hook and use the default
hook instead. clk_of_init is safe to call for non-DT platforms, so add
the call to ARM arch time_init by default. While at it, also reorder includes
alphabetically.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changelog:
v1->v2:
- reorder includes alphabetically

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/kernel/time.c |   24 ++++++++++++++----------
 1 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
index 98aee32..dd1028e 100644
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
@@ -116,6 +117,9 @@ int __init register_persistent_clock(clock_access_fn read_boot,
 
 void __init time_init(void)
 {
+	/* initalize common clocks before timers */
+	of_clk_init(NULL);
+
 	if (machine_desc->init_time)
 		machine_desc->init_time();
 	else
-- 
1.7.2.5
