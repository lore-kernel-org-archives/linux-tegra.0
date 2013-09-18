From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 09/26] ARM: call of_clk_init from default time_init handler
Date: Wed, 18 Sep 2013 19:53:42 +0200
Message-ID: <1379526839-14798-10-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1379526839-14798-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1379526839-14798-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, kernel@stlinux.com, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, STEricsson <STEricsson_nomadik_linux@list.st.com>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Most DT ARM machs require common clock providers initialized before timers.
Currently, arch/arm machs use .init_time to call of_clk_init right before
clocksource_of_init. This prevents to remove that callback and use the default
one instead.

This patch adds a call to of_clk_init() to the default .init_time callback
to allow to remove custom callbacks where applicable. While at it, also
reorder includes alphabetically.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Changelog:
RFCv2->v1:
- only call of_clk_init(NULL) when no custom .init_time is set
  (Suggested by Soeren Brinkmann)
RFCv1->RFCv2:
- reorder includes alphabetically

Cc: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: STEricsson <STEricsson_nomadik_linux@list.st.com>
Cc: linux-tegra@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel@stlinux.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/kernel/time.c |   27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
index 98aee32..bc0468b 100644
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
@@ -116,8 +117,10 @@ int __init register_persistent_clock(clock_access_fn read_boot,
 
 void __init time_init(void)
 {
-	if (machine_desc->init_time)
+	if (machine_desc->init_time) {
 		machine_desc->init_time();
-	else
+	} else {
+		of_clk_init(NULL);
 		clocksource_of_init();
+	}
 }
-- 
1.7.10.4
