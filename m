From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] ARM: The mandatory barrier rmb() must be a dsb() in for
 device accesses
Date: Fri, 25 Mar 2011 10:16:51 +0000
Message-ID: <20110325101651.27120.56045.stgit@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Since mandatory barriers may be used (explicitly or implicitly via readl
etc.) to ensure the ordering between Device and Normal memory accesses,
a DMB is not enough. This patch converts it to a DSB.

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/include/asm/system.h                  |    2 +-
 arch/arm/mach-realview/include/mach/barriers.h |    2 +-
 arch/arm/mach-tegra/include/mach/barriers.h    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 9a87823..926d867 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -159,7 +159,7 @@ extern unsigned int user_debug;
 #include <mach/barriers.h>
 #elif defined(CONFIG_ARM_DMA_MEM_BUFFERABLE) || defined(CONFIG_SMP)
 #define mb()		do { dsb(); outer_sync(); } while (0)
-#define rmb()		dmb()
+#define rmb()		dsb()
 #define wmb()		mb()
 #else
 #include <asm/memory.h>
diff --git a/arch/arm/mach-realview/include/mach/barriers.h b/arch/arm/mach-realview/include/mach/barriers.h
index 0c5d749..9a73219 100644
--- a/arch/arm/mach-realview/include/mach/barriers.h
+++ b/arch/arm/mach-realview/include/mach/barriers.h
@@ -4,5 +4,5 @@
  * operation to deadlock the system.
  */
 #define mb()		dsb()
-#define rmb()		dmb()
+#define rmb()		dsb()
 #define wmb()		mb()
diff --git a/arch/arm/mach-tegra/include/mach/barriers.h b/arch/arm/mach-tegra/include/mach/barriers.h
index cc11517..425b42e 100644
--- a/arch/arm/mach-tegra/include/mach/barriers.h
+++ b/arch/arm/mach-tegra/include/mach/barriers.h
@@ -23,7 +23,7 @@
 
 #include <asm/outercache.h>
 
-#define rmb()		dmb()
+#define rmb()		dsb()
 #define wmb()		do { dsb(); outer_sync(); } while (0)
 #define mb()		wmb()
 
