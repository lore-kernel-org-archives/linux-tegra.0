From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3] ARM: add missing linker section markup to head-common.S
Date: Fri,  5 Jul 2013 12:10:55 -0600
Message-ID: <1373047855-24145-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Macro __INIT is used to place various code in head-common.S into the init
section. This should be matched by a closing __FINIT. Also, add an
explicit ".text" to ensure subsequent code is placed into the correct
section; __FINIT is simply a closing marker to match __INIT and doesn't
guarantee to revert to .text.

This historically caused no problem, because macro __CPUINIT was used at
the exact location where __FINIT was missing, which then placed following
code into the cpuinit section. However, with commit 22f0a2736 "init.h:
remove __cpuinit sections from the kernel" applied, __CPUINIT becomes a
no-op, thus leaving all this code in the init section, rather than the
regular text section. This caused issues such as secondary CPU boot
failures or crashes.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
v3: Added .text after __FINIT to force the correct section.
v2: Moved __FINIT after lookup_processor_type, to correctly match the
location of __CPUINIT.
---
 arch/arm/kernel/head-common.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/head-common.S b/arch/arm/kernel/head-common.S
index 529ce99..47cd974 100644
--- a/arch/arm/kernel/head-common.S
+++ b/arch/arm/kernel/head-common.S
@@ -133,6 +133,9 @@ ENTRY(lookup_processor_type)
 	ldmfd	sp!, {r4 - r6, r9, pc}
 ENDPROC(lookup_processor_type)
 
+	__FINIT
+	.text
+
 /*
  * Read processor ID register (CP#15, CR0), and look up in the linker-built
  * supported processor list.  Note that we can't use the absolute addresses
-- 
1.8.1.5
