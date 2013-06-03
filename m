From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove the ifdef of ARCH SoC in the tegra_resume
Date: Mon, 3 Jun 2013 16:10:04 +0800
Message-ID: <1370247004-31846-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Removing the ifdef of ARCH_TEGRA_SoC in the tegra_resume function. Because
we always build with all Tegra SoCs support and had a runtime chip
detection code there. And we expect most of the chips would need the code
in the future.

We also fix a typo of a macro name that cause a build error.

Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset-handler.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index d2042ac..39dc9e7 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -54,12 +54,11 @@ ENTRY(tegra_resume)
 	bne	cpu_resume			@ no
 no_cpu0_chk:
 
-#ifndef CONFIG_ARCH_TEGRA_2x_SOC
 	/* Are we on Tegra20? */
 	cmp	r6, #TEGRA20
 	beq	1f				@ Yes
 	/* Clear the flow controller flags for this CPU. */
-	cpu_to_csr_req r1, r0
+	cpu_to_csr_reg r1, r0
 	mov32	r2, TEGRA_FLOW_CTRL_BASE
 	ldr	r1, [r2, r1]
 	/* Clear event & intr flag */
@@ -70,7 +69,6 @@ no_cpu0_chk:
 	bic	r1, r1, r0
 	str	r1, [r2]
 1:
-#endif
 
 	check_cpu_part_num 0xc09, r8, r9
 	bne	not_ca9
-- 
1.8.3
