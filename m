From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH 8/9] ARM: tegra: avoid touching Secure registers in reset
 handler
Date: Thu, 20 Jul 2017 02:14:20 +0200
Message-ID: <22bba1196e745a5bdf66bd449bee7ccc17bd4761.1500509346.git.mirq-linux@rere.qmqm.pl>
References: <cover.1500509346.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1500509346.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows secondary CPUs to boot with Trusted Foundations firmware.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 arch/arm/mach-tegra/reset-handler.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index aae7f5961563..f642032a5a08 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -143,6 +143,8 @@ ENTRY(__tegra_cpu_reset_handler)
 	cpsid	aif, 0x13			@ SVC mode, interrupts disabled
 
 	tegra_get_soc_id TEGRA_APB_MISC_BASE, r6
+
+#ifdef CONFIG_ARCH_ASSUME_SECURE_PLATFORM
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 t20_check:
 	cmp	r6, #TEGRA20
@@ -172,6 +174,7 @@ t30_errata:
 	b	after_errata
 after_t30_check:
 #endif
+#endif	/* CONFIG_ARCH_ASSUME_SECURE_PLATFORM */
 after_errata:
 	mrc	p15, 0, r10, c0, c0, 5		@ MPIDR
 	and	r10, r10, #0x3			@ R10 = CPU number
-- 
2.11.0
