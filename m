From: Prateek Patel <prpatel@nvidia.com>
Subject: [PATCH] kmemleak: Add config to select auto scan
Date: Wed, 17 Oct 2018 13:33:28 +0530
Message-ID: <1539763408-22085-1-git-send-email-prpatel@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org, snikam@nvidia.com, vdumpa@nvidia.com, talho@nvidia.com, swarren@nvidia.com, prpatel@nvidia.com, Sri Krishna chowdary <schowdary@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Sri Krishna chowdary <schowdary@nvidia.com>

Kmemleak scan is cpu intensive and can stall user tasks at times.
To prevent this, add config DEBUG_KMEMLEAK_SCAN_ON to enable/disable
auto scan on boot up.
Also protect first_run with CONFIG_DEBUG_KMEMLEAK_SCAN_ON as this is
meant for only first automatic scan.

Signed-off-by: Sri Krishna chowdary <schowdary@nvidia.com>
Signed-off-by: Sachin Nikam <snikam@nvidia.com>
Signed-off-by: Prateek <prpatel@nvidia.com>
---
 lib/Kconfig.debug | 11 +++++++++++
 mm/kmemleak.c     |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e5e7c03..9542852 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -593,6 +593,17 @@ config DEBUG_KMEMLEAK_DEFAULT_OFF
 	  Say Y here to disable kmemleak by default. It can then be enabled
 	  on the command line via kmemleak=on.
 
+config DEBUG_KMEMLEAK_SCAN_ON
+	bool "Enable kmemleak auto scan thread on boot up"
+	default y
+	depends on DEBUG_KMEMLEAK
+	help
+	  Kmemleak scan is cpu intensive and can stall user tasks at times.
+	  This option enables/disables automatic kmemleak scan at boot up.
+
+	  Say N here to disable kmemleak auto scan thread to stop automatic
+	  scanning.
+
 config DEBUG_STACK_USAGE
 	bool "Stack utilization instrumentation"
 	depends on DEBUG_KERNEL && !IA64
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 877de4f..ac53678 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1647,11 +1647,14 @@ static void kmemleak_scan(void)
  */
 static int kmemleak_scan_thread(void *arg)
 {
+#ifdef CONFIG_DEBUG_KMEMLEAK_SCAN_ON
 	static int first_run = 1;
+#endif
 
 	pr_info("Automatic memory scanning thread started\n");
 	set_user_nice(current, 10);
 
+#ifdef CONFIG_DEBUG_KMEMLEAK_SCAN_ON
 	/*
 	 * Wait before the first scan to allow the system to fully initialize.
 	 */
@@ -1661,6 +1664,7 @@ static int kmemleak_scan_thread(void *arg)
 		while (timeout && !kthread_should_stop())
 			timeout = schedule_timeout_interruptible(timeout);
 	}
+#endif
 
 	while (!kthread_should_stop()) {
 		signed long timeout = jiffies_scan_wait;
@@ -2141,9 +2145,11 @@ static int __init kmemleak_late_init(void)
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_KMEMLEAK_SCAN_ON
 	mutex_lock(&scan_mutex);
 	start_scan_thread();
 	mutex_unlock(&scan_mutex);
+#endif
 
 	pr_info("Kernel memory leak detector initialized\n");
 
-- 
2.1.4
