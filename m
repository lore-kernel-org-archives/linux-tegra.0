From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH 7/9] ARM: tegra: enable cache via TF
Date: Thu, 20 Jul 2017 02:14:19 +0200
Message-ID: <6a164b2270a3e996c083e94bf5b1e27028c1135e.1500509346.git.mirq-linux@rere.qmqm.pl>
References: <cover.1500509346.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1500509346.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Cache enable needs to go via firmware call with TF running.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 arch/arm/mach-tegra/reset-handler.S | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index 805f306fa6f7..aae7f5961563 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -78,8 +78,20 @@ ENTRY(tegra_resume)
 	orr	r1, r1, #1
 	str	r1, [r0]
 #endif
+#ifdef CONFIG_TRUSTED_FOUNDATIONS
+	adr	r3, __tegra_smc_stack
+	stmia	r3, {r4-r12, sp, lr}
 
-#ifdef CONFIG_CACHE_L2X0
+	mov	r0, #3	// local wake
+	mov	r3, #0
+	mov	r4, #0
+	dsb
+	.arch_extension	sec
+	smc	#0
+
+	adr	r3, __tegra_smc_stack
+	ldmia	r3, {r4-r12, sp, pc}
+#elif defined(CONFIG_CACHE_L2X0)
 	/* L2 cache resume & re-enable */
 	bl	l2c310_early_resume
 #endif
@@ -92,6 +104,16 @@ end_ca9_scu_l2_resume:
 ENDPROC(tegra_resume)
 #endif
 
+#ifdef CONFIG_TRUSTED_FOUNDATIONS
+	.align L1_CACHE_SHIFT
+	.type __tegra_smc_stack, %object
+__tegra_smc_stack:
+	.rept 11
+	.long 0
+	.endr
+	.size __tegra_smc_stack, . - __tegra_smc_stack
+#endif /* CONFIG_TRUSTED_FOUNDATIONS */
+
 	.align L1_CACHE_SHIFT
 ENTRY(__tegra_cpu_reset_handler_start)
 
-- 
2.11.0
