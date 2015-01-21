From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] ARM: l2c: Maintain CPU endianness for early resume function
Date: Wed, 21 Jan 2015 19:07:19 +0300
Message-ID: <1421856440-28097-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In big endian CPU mode l2x0_saved_regs structure stores registers values in BE
format. In order to maintain BE CPU mode, these values and immediate constants
must be converted back to LE format before writing them to cache controller.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
V2: no code change, fixed patch numbering, extended mail recipients list

 arch/arm/mm/l2c-l2x0-resume.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mm/l2c-l2x0-resume.S b/arch/arm/mm/l2c-l2x0-resume.S
index fda415e..9f99c7e 100644
--- a/arch/arm/mm/l2c-l2x0-resume.S
+++ b/arch/arm/mm/l2c-l2x0-resume.S
@@ -30,6 +30,15 @@ ENTRY(l2c310_early_resume)
 	teq	r1, #0
 	reteq	lr
 
+	@ Reverse for big endian kernel
+ARM_BE8(rev	r2, r2)
+ARM_BE8(rev	r3, r3)
+ARM_BE8(rev	r4, r4)
+ARM_BE8(rev	r5, r5)
+ARM_BE8(rev	r6, r6)
+ARM_BE8(rev	r7, r7)
+ARM_BE8(rev	r8, r8)
+
 	@ The prefetch and power control registers are revision dependent
 	@ and can be written whether or not the L2 cache is enabled
 	ldr	r0, [r1, #L2X0_CACHE_ID]
@@ -51,6 +60,7 @@ ENTRY(l2c310_early_resume)
 
 	str	r2, [r1, #L2X0_AUX_CTRL]
 	mov	r9, #L2X0_CTRL_EN
+ARM_BE8(rev	r9, r9)
 	str	r9, [r1, #L2X0_CTRL]
 	ret	lr
 ENDPROC(l2c310_early_resume)
-- 
2.2.1
