From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Fri,  9 Jan 2015 15:27:10 +0000
Message-ID: <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-1-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Config changes to enable big-endian support. Tested on Jetson TK1.

Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig   | 1 +
 arch/arm/mach-tegra/headsmp.S | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index d0be9a1..d8cb963 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -2,6 +2,7 @@ menuconfig ARCH_TEGRA
 	bool "NVIDIA Tegra" if ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
+	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
 	select CLKSRC_MMIO
diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/headsmp.S
index 2072e73..9896981 100644
--- a/arch/arm/mach-tegra/headsmp.S
+++ b/arch/arm/mach-tegra/headsmp.S
@@ -1,11 +1,12 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
-
+#include <asm/assembler.h>
 #include "sleep.h"

         .section ".text.head", "ax"

 ENTRY(tegra_secondary_startup)
+        ARM_BE8(setend    be)
         check_cpu_part_num 0xc09, r8, r9
         bleq    v7_invalidate_l1
         b       secondary_startup
--
2.1.0
