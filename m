From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] arm/tegra: Support Tegra30 in decompressor UART setup
Date: Tue,  3 Jan 2012 15:05:47 -0700
Message-ID: <1325628347-22140-1-git-send-email-swarren@nvidia.com>
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

v2: Use CHIPID register to differentiate between chips, rather than a
GIC register. This should be more future-proof. Volatile is required
to prevent the compiler transforming the 32-bit apb_misc register read
into an 8-bit read of address 1 higher, since the HW only supports 32-
bit accesses, and will hang on an 8-bit access.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/uncompress.h |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/uncompress.h b/arch/arm/mach-tegra/include/mach/uncompress.h
index 4e83237..39bd5e5 100644
--- a/arch/arm/mach-tegra/include/mach/uncompress.h
+++ b/arch/arm/mach-tegra/include/mach/uncompress.h
@@ -45,15 +45,23 @@ static inline void flush(void)
 
 static inline void arch_decomp_setup(void)
 {
+	volatile u32 *apb_misc = (volatile u32 *)TEGRA_APB_MISC_BASE;
+	u32 chip, div;
 	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
 	int shift = 2;
 
 	if (uart == NULL)
 		return;
 
+	chip = (apb_misc[0x804 / 4] >> 8) & 0xff;
+	if (chip == 0x20)
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
