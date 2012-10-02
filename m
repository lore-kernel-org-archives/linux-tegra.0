From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: delete empty sleep.S
Date: Tue,  2 Oct 2012 17:21:09 -0600
Message-ID: <1349220069-4051-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

sleep.S doesn't provide anything useful any more; commit b4e395b "ARM:
tegra: Remove flow controller programming" removed the last public code
here, so that everyting that was left was just macros or #includes.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile |    1 -
 arch/arm/mach-tegra/sleep.S  |   33 ---------------------------------
 2 files changed, 0 insertions(+), 34 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/sleep.S

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 9aa653b..c623752 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -9,7 +9,6 @@ obj-y					+= flowctrl.o
 obj-y					+= powergate.o
 obj-y					+= apbio.o
 obj-$(CONFIG_CPU_IDLE)			+= cpuidle.o
-obj-$(CONFIG_CPU_IDLE)			+= sleep.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra20_clocks.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra20_clocks_data.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra2_emc.o
diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
deleted file mode 100644
index ea81554..0000000
--- a/arch/arm/mach-tegra/sleep.S
+++ /dev/null
@@ -1,33 +0,0 @@
-/*
- * arch/arm/mach-tegra/sleep.S
- *
- * Copyright (c) 2010-2011, NVIDIA Corporation.
- * Copyright (c) 2011, Google, Inc.
- *
- * Author: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
- *         Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
- */
-
-#include <linux/linkage.h>
-
-#include <asm/assembler.h>
-
-#include <mach/iomap.h>
-
-#include "flowctrl.h"
-#include "sleep.h"
-
-- 
1.7.0.4
