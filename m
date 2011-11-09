From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ARM: l2x0: fix compile error on !CONFIG_USE_OF
Date: Wed,  9 Nov 2011 10:53:43 -0800
Message-ID: <1320864823-5015-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

fae2b89ab1 (ARM: l2x0: add empty l2x0_of_init) adds a static inline
function that returns -ENODEV, but at least on tegra cache-l2x0.h is
included without errno.h being pulled in first, resulting in compile
errors if OF isn't enabled:

In file included from arch/arm/mach-tegra/common.c:26:
arch/arm/include/asm/hardware/cache-l2x0.h: In function 'l2x0_of_init':
arch/arm/include/asm/hardware/cache-l2x0.h:110: error: 'ENODEV' undeclared (first use in this function)
arch/arm/include/asm/hardware/cache-l2x0.h:110: error: (Each undeclared identifier is reported only once
arch/arm/include/asm/hardware/cache-l2x0.h:110: error: for each function it appears in.)

Add errno.h to the include file to make it self-contained.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/include/asm/hardware/cache-l2x0.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/include/asm/hardware/cache-l2x0.h b/arch/arm/include/asm/hardware/cache-l2x0.h
index 1db1143..7df239b 100644
--- a/arch/arm/include/asm/hardware/cache-l2x0.h
+++ b/arch/arm/include/asm/hardware/cache-l2x0.h
@@ -20,6 +20,8 @@
 #ifndef __ASM_ARM_HARDWARE_L2X0_H
 #define __ASM_ARM_HARDWARE_L2X0_H
 
+#include <linux/errno.h>
+
 #define L2X0_CACHE_ID			0x000
 #define L2X0_CACHE_TYPE			0x004
 #define L2X0_CTRL			0x100
-- 
1.7.5.4
