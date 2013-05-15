From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/6] ARM: tegra: skip SCU and PL310 code when CPU is not Cortex-A9
Date: Wed, 15 May 2013 18:27:20 +0800
Message-ID: <1368613644-11863-3-git-send-email-josephl@nvidia.com>
References: <1368613644-11863-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368613644-11863-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For supporting single image on all Tegra series, we need to skip some HW
support code for Cortex-A9 only.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/sleep.S |  8 +++++---
 arch/arm/mach-tegra/sleep.h | 24 ++++++++++++++++++------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 364d845..9daaef2 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -106,9 +106,11 @@ ENTRY(tegra_shut_off_mmu)
 	isb
 #ifdef CONFIG_CACHE_L2X0
 	/* Disable L2 cache */
-	mov32	r4, TEGRA_ARM_PERIF_BASE + 0x3000
-	mov	r5, #0
-	str	r5, [r4, #L2X0_CTRL]
+	check_cpu_part_num 0xc09, r9, r10
+	movweq	r4, #:lower16:(TEGRA_ARM_PERIF_BASE + 0x3000)
+	movteq	r4, #:upper16:(TEGRA_ARM_PERIF_BASE + 0x3000)
+	moveq	r5, #0
+	streq	r5, [r4, #L2X0_CTRL]
 #endif
 	mov	pc, r0
 ENDPROC(tegra_shut_off_mmu)
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 7e9c9fe..c2cac9a 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -70,19 +70,31 @@
 	movt	\reg, #:upper16:\val
 .endm
 
+/* Marco to check CPU part num */
+.macro check_cpu_part_num part_num, tmp1, tmp2
+	mrc	p15, 0, \tmp1, c0, c0, 0
+	ubfx	\tmp1, \tmp1, #4, #12
+	mov32	\tmp2, \part_num
+	cmp	\tmp1, \tmp2
+.endm
+
 /* Macro to exit SMP coherency. */
 .macro exit_smp, tmp1, tmp2
 	mrc	p15, 0, \tmp1, c1, c0, 1	@ ACTLR
 	bic	\tmp1, \tmp1, #(1<<6) | (1<<0)	@ clear ACTLR.SMP | ACTLR.FW
 	mcr	p15, 0, \tmp1, c1, c0, 1	@ ACTLR
 	isb
-	cpu_id	\tmp1
-	mov	\tmp1, \tmp1, lsl #2
-	mov	\tmp2, #0xf
-	mov	\tmp2, \tmp2, lsl \tmp1
-	mov32	\tmp1, TEGRA_ARM_PERIF_VIRT + 0xC
-	str	\tmp2, [\tmp1]			@ invalidate SCU tags for CPU
+#ifdef CONFIG_HAVE_ARM_SCU
+	check_cpu_part_num 0xc09, \tmp1, \tmp2
+	mrceq	p15, 0, \tmp1, c0, c0, 5
+	andeq	\tmp1, \tmp1, #0xF
+	moveq	\tmp1, \tmp1, lsl #2
+	moveq	\tmp2, #0xf
+	moveq	\tmp2, \tmp2, lsl \tmp1
+	ldreq	\tmp1, =(TEGRA_ARM_PERIF_VIRT + 0xC)
+	streq	\tmp2, [\tmp1]			@ invalidate SCU tags for CPU
 	dsb
+#endif
 .endm
 
 /* Macro to check Tegra revision */
-- 
1.8.2.2
