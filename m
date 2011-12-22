From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm/tegra: Support Tegra30 in decompressor UART setup
Date: Thu, 22 Dec 2011 14:01:59 -0700
Message-ID: <1324587719-32731-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tegra20, the UART clock runs at 216MHz, whereas on Tegra30 it runs at
408MHz. Modify arch_decomp_setup() to detect Tegra20-vs-Tegra30 at run-
time, and program the correct divisor.

This makes uncompressor messages work correctly on Tegra30. This also
fixes early printk, assuming zImage is used and this setup code runs.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/uncompress.h |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/uncompress.h b/arch/arm/mach-tegra/include/mach/uncompress.h
index 4e83237..61d6e08 100644
--- a/arch/arm/mach-tegra/include/mach/uncompress.h
+++ b/arch/arm/mach-tegra/include/mach/uncompress.h
@@ -24,6 +24,8 @@
 #include <linux/types.h>
 #include <linux/serial_reg.h>
 
+#include <asm/hardware/gic.h>
+
 #include <mach/iomap.h>
 
 static void putc(int c)
@@ -45,15 +47,29 @@ static inline void flush(void)
 
 static inline void arch_decomp_setup(void)
 {
+	u8 *distctr = (u8 *)(TEGRA_ARM_INT_DIST_BASE +
+			     GIC_DIST_CTR);
+	u32 ctlrs, div;
 	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
 	int shift = 2;
 
 	if (uart == NULL)
 		return;
 
+	/*
+	 * Tegra20 has 4 interrupt controllers
+	 * Tegra30 has 5 interrupt controllers
+	 * Future SoCs may need additional means of identification
+	 */
+	ctlrs = (*distctr) & 0x1f;
+	if (ctlrs == 4)
+		div = 0x0075;
+	else
+		div = 0x00dd;
+
 	uart[UART_LCR << shift] |= UART_LCR_DLAB;
-	uart[UART_DLL << shift] = 0x75;
-	uart[UART_DLM << shift] = 0x0;
+	uart[UART_DLL << shift] = div & 0xff;
+	uart[UART_DLM << shift] = div >> 8;
 	uart[UART_LCR << shift] = 3;
 }
 
-- 
1.7.0.4
