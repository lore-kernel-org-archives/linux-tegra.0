From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 62/62] ARM: tegra: make debug_ll code build for ARMv6
Date: Wed, 19 Mar 2014 20:29:59 +0100
Message-ID: <1395257399-359545-63-git-send-email-arnd@arndb.de>
References: <1395257399-359545-1-git-send-email-arnd@arndb.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395257399-359545-1-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In a combined ARMv6/v7 kernel, we cannot use the
movt/movw instructions to load an immediate, as they
are not valid on ARMv6.

This changes the file to use an indirect load instead,
as lots of other implementations do.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/include/debug/tegra.S | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/debug/tegra.S b/arch/arm/include/debug/tegra.S
index f98763f..3bc8059 100644
--- a/arch/arm/include/debug/tegra.S
+++ b/arch/arm/include/debug/tegra.S
@@ -53,8 +53,7 @@
 
 #define checkuart(rp, rv, lhu, bit, uart) \
 		/* Load address of CLK_RST register */ \
-		movw	rp, #TEGRA_CLK_RST_DEVICES_##lhu & 0xffff ; \
-		movt	rp, #TEGRA_CLK_RST_DEVICES_##lhu >> 16 ; \
+		ldr	rp, =TEGRA_CLK_RST_DEVICES_##lhu ; \
 		/* Load value from CLK_RST register */ \
 		ldr	rp, [rp, #0] ; \
 		/* Test UART's reset bit */ \
@@ -62,8 +61,7 @@
 		/* If set, can't use UART; jump to save no UART */ \
 		bne	90f ; \
 		/* Load address of CLK_OUT_ENB register */ \
-		movw	rp, #TEGRA_CLK_OUT_ENB_##lhu & 0xffff ; \
-		movt	rp, #TEGRA_CLK_OUT_ENB_##lhu >> 16 ; \
+		ldr	rp, =TEGRA_CLK_OUT_ENB_##lhu ; \
 		/* Load value from CLK_OUT_ENB register */ \
 		ldr	rp, [rp, #0] ; \
 		/* Test UART's clock enable bit */ \
@@ -71,8 +69,7 @@
 		/* If clear, can't use UART; jump to save no UART */ \
 		beq	90f ; \
 		/* Passed all tests, load address of UART registers */ \
-		movw	rp, #TEGRA_UART##uart##_BASE & 0xffff ; \
-		movt	rp, #TEGRA_UART##uart##_BASE >> 16 ; \
+		ldr	rp, =TEGRA_UART##uart##_BASE ; \
 		/* Jump to save UART address */ \
 		b 91f
 
@@ -90,15 +87,16 @@
 
 #ifdef CONFIG_TEGRA_DEBUG_UART_AUTO_ODMDATA
 		/* Check ODMDATA */
-10:		movw	\rp, #TEGRA_PMC_SCRATCH20 & 0xffff
-		movt	\rp, #TEGRA_PMC_SCRATCH20 >> 16
+10:		ldr	\rp, =TEGRA_PMC_SCRATCH20
 		ldr	\rp, [\rp, #0]		@ Load PMC_SCRATCH20
-		ubfx	\rv, \rp, #18, #2	@ 19:18 are console type
+		lsr	\rv, \rp, #18		@ 19:18 are console type
+		and	\rv, \rv, #3
 		cmp	\rv, #2			@ 2 and 3 mean DCC, UART
 		beq	11f			@ some boards swap the meaning
 		cmp	\rv, #3			@ so accept either
 		bne	90f
-11:		ubfx	\rv, \rp, #15, #3	@ 17:15 are UART ID
+11:		lsr	\rv, \rp, #15		@ 17:15 are UART ID
+		and	\rv, #7	
 		cmp	\rv, #0			@ UART 0?
 		beq	20f
 		cmp	\rv, #1			@ UART 1?
-- 
1.8.3.2
