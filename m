From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: fix relocation truncated error when THUMB2_KERNEL enabled
Date: Mon, 15 Apr 2013 16:50:54 -0600
Message-ID: <1366066255-18192-2-git-send-email-swarren@wwwdotorg.org>
References: <1366066255-18192-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366066255-18192-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The conditional branch instruction in Thumb2 only available to short range.
The linker will fail when the conditional branch over the range. Then
resulting in link error when generating kernel image. e.g.:

arch/arm/mach-tegra/reset-handler.S:47:(.text+0xf8e):
relocation truncated to fit: R_ARM_THM_JUMP19 against symbol
`cpu_resume' defined in .data section in arch/arm/kernel/built-in.o

This patch using a Thumb2 instruction IT (if-then) to have a longer branch
range.

Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset-handler.S |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index 1676aba..e6de88a 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -44,6 +44,7 @@ ENTRY(tegra_resume)
 
 	cpu_id	r0
 	cmp	r0, #0				@ CPU0?
+ THUMB(	it	ne )
 	bne	cpu_resume			@ no
 
 #ifdef CONFIG_ARCH_TEGRA_3x_SOC
-- 
1.7.10.4
