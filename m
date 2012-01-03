From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: tegra: Introduce define DEBUG_UART_SHIFT
Date: Tue,  3 Jan 2012 15:25:17 -0700
Message-ID: <1325629520-23018-2-git-send-email-swarren@nvidia.com>
References: <1325629520-23018-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325629520-23018-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This removes the need for the variable "shift" in all functions in
uncompress.h.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
[swarren: Extracted from a larger patch by Doug]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/uncompress.h |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/uncompress.h b/arch/arm/mach-tegra/include/mach/uncompress.h
index 39bd5e5..9797279 100644
--- a/arch/arm/mach-tegra/include/mach/uncompress.h
+++ b/arch/arm/mach-tegra/include/mach/uncompress.h
@@ -2,10 +2,12 @@
  * arch/arm/mach-tegra/include/mach/uncompress.h
  *
  * Copyright (C) 2010 Google, Inc.
+ * Copyright (C) 2011 Google, Inc.
  *
  * Author:
  *	Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
  *	Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+ *	Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -26,17 +28,18 @@
 
 #include <mach/iomap.h>
 
+#define DEBUG_UART_SHIFT 2
+
 static void putc(int c)
 {
 	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
-	int shift = 2;
 
 	if (uart == NULL)
 		return;
 
-	while (!(uart[UART_LSR << shift] & UART_LSR_THRE))
+	while (!(uart[UART_LSR << DEBUG_UART_SHIFT] & UART_LSR_THRE))
 		barrier();
-	uart[UART_TX << shift] = c;
+	uart[UART_TX << DEBUG_UART_SHIFT] = c;
 }
 
 static inline void flush(void)
@@ -48,7 +51,6 @@ static inline void arch_decomp_setup(void)
 	volatile u32 *apb_misc = (volatile u32 *)TEGRA_APB_MISC_BASE;
 	u32 chip, div;
 	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
-	int shift = 2;
 
 	if (uart == NULL)
 		return;
@@ -59,10 +61,10 @@ static inline void arch_decomp_setup(void)
 	else
 		div = 0x00dd;
 
-	uart[UART_LCR << shift] |= UART_LCR_DLAB;
-	uart[UART_DLL << shift] = div & 0xff;
-	uart[UART_DLM << shift] = div >> 8;
-	uart[UART_LCR << shift] = 3;
+	uart[UART_LCR << DEBUG_UART_SHIFT] |= UART_LCR_DLAB;
+	uart[UART_DLL << DEBUG_UART_SHIFT] = div & 0xff;
+	uart[UART_DLM << DEBUG_UART_SHIFT] = div >> 8;
+	uart[UART_LCR << DEBUG_UART_SHIFT] = 3;
 }
 
 static inline void arch_decomp_wdog(void)
-- 
1.7.0.4
