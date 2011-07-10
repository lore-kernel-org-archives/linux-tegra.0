From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove mach/barriers.h
Date: Sun, 10 Jul 2011 14:02:52 -0700
Message-ID: <1310331772-13310-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The barriers implemented in arch/arm/mach-tegra/mach/barriers.h
are exactly the same as the default barriers implemented in
arch/arm/include/asm/system.h.  Remove barriers.h from Tegra,
and don't select ARCH_HAS_BARRIERS.

Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/Kconfig                            |    1 -
 arch/arm/mach-tegra/include/mach/barriers.h |   30 ---------------------------
 2 files changed, 0 insertions(+), 31 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/include/mach/barriers.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9adc278..7e179f0 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -591,7 +591,6 @@ config ARCH_TEGRA
 	select GENERIC_GPIO
 	select HAVE_CLK
 	select HAVE_SCHED_CLOCK
-	select ARCH_HAS_BARRIERS if CACHE_L2X0
 	select ARCH_HAS_CPUFREQ
 	help
 	  This enables support for NVIDIA Tegra based systems (Tegra APX,
diff --git a/arch/arm/mach-tegra/include/mach/barriers.h b/arch/arm/mach-tegra/include/mach/barriers.h
deleted file mode 100644
index 425b42e..0000000
--- a/arch/arm/mach-tegra/include/mach/barriers.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * arch/arm/mach-realview/include/mach/barriers.h
- *
- * Copyright (C) 2010 ARM Ltd.
- * Written by Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
- */
-
-#ifndef __MACH_BARRIERS_H
-#define __MACH_BARRIERS_H
-
-#include <asm/outercache.h>
-
-#define rmb()		dsb()
-#define wmb()		do { dsb(); outer_sync(); } while (0)
-#define mb()		wmb()
-
-#endif	/* __MACH_BARRIERS_H */
-- 
1.7.4.1
