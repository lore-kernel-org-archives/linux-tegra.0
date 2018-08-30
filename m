From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 4/4] ARM: tegra: Clear EMC interrupts on resume from LP1 on Tegra30+
Date: Thu, 30 Aug 2018 21:54:04 +0300
Message-ID: <20180830185404.7224-5-digetx@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Two interrupts are raised on resume from LP1 on Tegra30+: first is the
clock change completed interrupt which is set after updating timing
configuration, second is DLL alarm interrupt which is set when DLL
starts re-calibration after being reset. Clear these two interrupts
in the end of exiting from the self-refresh mode for consistency, that
will also allow to not receive spurious interrupts in the EMC driver
after resume from suspend.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 828f6c37afde..78c6e9fb56e7 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -26,6 +26,7 @@
 #include "irammap.h"
 #include "sleep.h"
 
+#define EMC_INTSTATUS			0x0
 #define EMC_CFG				0xc
 #define EMC_ADR_CFG			0x10
 #define EMC_TIMING_CONTROL		0x28
@@ -44,6 +45,9 @@
 #define EMC_XM2VTTGENPADCTRL		0x310
 #define EMC_XM2VTTGENPADCTRL2		0x314
 
+#define EMC_CLKCHANGE_COMPLETE_INT	(1 << 4)
+#define EMC_DLL_ALARM_INT		(1 << 7)
+
 #define MC_EMEM_ARB_CFG			0x90
 
 #define PMC_CTRL			0x0
@@ -539,6 +543,9 @@ zcal_done:
 
 	emc_timing_update r1, r0
 
+	mov	r1, #(EMC_CLKCHANGE_COMPLETE_INT | EMC_DLL_ALARM_INT)
+	str	r1, [r0, #EMC_INTSTATUS]	@ clear interrupts
+
 	/* Tegra114 had dual EMC channel, now config the other one */
 	cmp	r10, #TEGRA114
 	bne	__no_dual_emc_chanl
-- 
2.18.0
