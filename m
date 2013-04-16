From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: solve adr range issue with THUMB2_KERNEL enabled
Date: Tue, 16 Apr 2013 11:09:09 -0600
Message-ID: <1366132149-17294-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When building the kernel with CONFIG_THUMB2_KERNEL enabled, older
assemblers may emit the following error:

reset-handler.S:78: Error: invalid immediate for address calculation (value = 0x00000004)

Using an explicit adr.w instruction will solve this. Newer assemblers do
this automatically. Use the W() macro to do this under Thumb mode only.

Inspired-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Suggested-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Olof, Arnd,

Can you please apply this directly to arm-soc. Thanks.

This patch replaces patch 3/3 "ARM: tegra: make sure the pointer on 4
byte align when THUMB2_KERNEL enabled" which I forwarded yesterday. It
can be applied to wherever Tegra's for-3.10/fixes branch was applied,
and doesn't cause any conflicts/merge-issues with any other Tegra patches
this cycle.

 arch/arm/mach-tegra/sleep.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 4ffae54..bb308ea 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -92,7 +92,7 @@
 
 #ifdef CONFIG_CACHE_L2X0
 .macro l2_cache_resume, tmp1, tmp2, tmp3, phys_l2x0_saved_regs
-	adr	\tmp1, \phys_l2x0_saved_regs
+	W(adr)	\tmp1, \phys_l2x0_saved_regs
 	ldr	\tmp1, [\tmp1]
 	ldr	\tmp2, [\tmp1, #L2X0_R_PHY_BASE]
 	ldr	\tmp3, [\tmp2, #L2X0_CTRL]
-- 
1.7.10.4
