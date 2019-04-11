From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 4/4] Revert "ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+"
Date: Fri, 12 Apr 2019 01:12:50 +0300
Message-ID: <20190411221250.23233-5-digetx@gmail.com>
References: <20190411221250.23233-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411221250.23233-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Turned out that the actual bug was in the Memory Controller driver
that programmed shadowed registers without latching the new values
and then there was a bug on EMEM arbitration configuration calculation
that results in a wrong value being latched on resume from suspend.
The Memory Controller has been fixed properly now, hence the workaround
patch could be reverted safely.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/iomap.h         |  9 ---------
 arch/arm/mach-tegra/sleep-tegra30.S | 21 ---------------------
 2 files changed, 30 deletions(-)

diff --git a/arch/arm/mach-tegra/iomap.h b/arch/arm/mach-tegra/iomap.h
index 4af9e92a216f..ba61db7fe533 100644
--- a/arch/arm/mach-tegra/iomap.h
+++ b/arch/arm/mach-tegra/iomap.h
@@ -79,24 +79,15 @@
 #define TEGRA_PMC_BASE			0x7000E400
 #define TEGRA_PMC_SIZE			SZ_256
 
-#define TEGRA_MC_BASE			0x7000F000
-#define TEGRA_MC_SIZE			SZ_1K
-
 #define TEGRA_EMC_BASE			0x7000F400
 #define TEGRA_EMC_SIZE			SZ_1K
 
-#define TEGRA114_MC_BASE		0x70019000
-#define TEGRA114_MC_SIZE		SZ_4K
-
 #define TEGRA_EMC0_BASE			0x7001A000
 #define TEGRA_EMC0_SIZE			SZ_2K
 
 #define TEGRA_EMC1_BASE			0x7001A800
 #define TEGRA_EMC1_SIZE			SZ_2K
 
-#define TEGRA124_MC_BASE		0x70019000
-#define TEGRA124_MC_SIZE		SZ_4K
-
 #define TEGRA124_EMC_BASE		0x7001B000
 #define TEGRA124_EMC_SIZE		SZ_2K
 
diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index d0b4c486ddbf..7727e005c30e 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -44,8 +44,6 @@
 #define EMC_XM2VTTGENPADCTRL		0x310
 #define EMC_XM2VTTGENPADCTRL2		0x314
 
-#define MC_EMEM_ARB_CFG			0x90
-
 #define PMC_CTRL			0x0
 #define PMC_CTRL_SIDE_EFFECT_LP0 (1 << 14) /* enter LP0 when CPU pwr gated */
 
@@ -420,22 +418,6 @@ _pll_m_c_x_done:
 	movweq	r0, #:lower16:TEGRA124_EMC_BASE
 	movteq	r0, #:upper16:TEGRA124_EMC_BASE
 
-	cmp	r10, #TEGRA30
-	moveq	r2, #0x20
-	movweq	r4, #:lower16:TEGRA_MC_BASE
-	movteq	r4, #:upper16:TEGRA_MC_BASE
-	cmp	r10, #TEGRA114
-	moveq	r2, #0x34
-	movweq	r4, #:lower16:TEGRA114_MC_BASE
-	movteq	r4, #:upper16:TEGRA114_MC_BASE
-	cmp	r10, #TEGRA124
-	moveq	r2, #0x20
-	movweq	r4, #:lower16:TEGRA124_MC_BASE
-	movteq	r4, #:upper16:TEGRA124_MC_BASE
-
-	ldr	r1, [r5, r2]		@ restore MC_EMEM_ARB_CFG
-	str	r1, [r4, #MC_EMEM_ARB_CFG]
-
 exit_self_refresh:
 	ldr	r1, [r5, #0xC]		@ restore EMC_XM2VTTGENPADCTRL
 	str	r1, [r0, #EMC_XM2VTTGENPADCTRL]
@@ -564,7 +546,6 @@ tegra30_sdram_pad_address:
 	.word	TEGRA_PMC_BASE + PMC_IO_DPD_STATUS			@0x14
 	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_CLK_SOURCE_MSELECT	@0x18
 	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_SCLK_BURST		@0x1c
-	.word	TEGRA_MC_BASE + MC_EMEM_ARB_CFG				@0x20
 tegra30_sdram_pad_address_end:
 
 tegra114_sdram_pad_address:
@@ -581,7 +562,6 @@ tegra114_sdram_pad_address:
 	.word	TEGRA_EMC1_BASE + EMC_AUTO_CAL_INTERVAL			@0x28
 	.word	TEGRA_EMC1_BASE + EMC_XM2VTTGENPADCTRL			@0x2c
 	.word	TEGRA_EMC1_BASE + EMC_XM2VTTGENPADCTRL2			@0x30
-	.word	TEGRA114_MC_BASE + MC_EMEM_ARB_CFG			@0x34
 tegra114_sdram_pad_adress_end:
 
 tegra124_sdram_pad_address:
@@ -593,7 +573,6 @@ tegra124_sdram_pad_address:
 	.word	TEGRA_PMC_BASE + PMC_IO_DPD_STATUS			@0x14
 	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_CLK_SOURCE_MSELECT	@0x18
 	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_SCLK_BURST		@0x1c
-	.word	TEGRA124_MC_BASE + MC_EMEM_ARB_CFG			@0x20
 tegra124_sdram_pad_address_end:
 
 tegra30_sdram_pad_size:
-- 
2.21.0
