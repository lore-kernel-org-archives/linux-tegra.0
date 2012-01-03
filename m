From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: uncompress.h: Store UART address in a variable
Date: Tue,  3 Jan 2012 15:25:18 -0700
Message-ID: <1325629520-23018-3-git-send-email-swarren@nvidia.com>
References: <1325629520-23018-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325629520-23018-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This will allow a future change to auto-detect which UART to use.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
[swarren: Extracted from a larger patch by Doug]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/uncompress.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/uncompress.h b/arch/arm/mach-tegra/include/mach/uncompress.h
index 9797279..bb3fd35 100644
--- a/arch/arm/mach-tegra/include/mach/uncompress.h
+++ b/arch/arm/mach-tegra/include/mach/uncompress.h
@@ -30,10 +30,10 @@
 
 #define DEBUG_UART_SHIFT 2
 
+volatile u8 *uart;
+
 static void putc(int c)
 {
-	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
-
 	if (uart == NULL)
 		return;
 
@@ -50,8 +50,8 @@ static inline void arch_decomp_setup(void)
 {
 	volatile u32 *apb_misc = (volatile u32 *)TEGRA_APB_MISC_BASE;
 	u32 chip, div;
-	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
 
+	uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
 	if (uart == NULL)
 		return;
 
-- 
1.7.0.4
