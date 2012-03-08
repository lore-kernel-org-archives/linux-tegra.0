From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 08/11] ARM: tegra: Move tegra_pcie_xclk_clamp() to PMC
Date: Thu,  8 Mar 2012 15:51:28 +0100
Message-ID: <1331218291-16119-9-git-send-email-thierry.reding@avionic-design.de>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331218291-16119-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The PMC code already accesses the PMC registers so it makes sense to
move this function there as well. While at it, rename the function to
tegra_pmc_pcie_xclk_clamp() for consistency.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/pcie.c |   30 ++++--------------------------
 arch/arm/mach-tegra/pmc.c  |   16 ++++++++++++++++
 arch/arm/mach-tegra/pmc.h  |    1 +
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 7313059..7704af7a 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -42,6 +42,7 @@
 #include <mach/powergate.h>
 
 #include "board.h"
+#include "pmc.h"
 
 /* register definitions */
 #define AFI_OFFSET	0x3800
@@ -145,17 +146,6 @@
 #define  PADS_PLL_CTL_TXCLKREF_DIV10		(0 << 20)
 #define  PADS_PLL_CTL_TXCLKREF_DIV5		(1 << 20)
 
-/* PMC access is required for PCIE xclk (un)clamping */
-#define PMC_SCRATCH42		0x144
-#define PMC_SCRATCH42_PCX_CLAMP	(1 << 0)
-
-static void __iomem *reg_pmc_base = IO_ADDRESS(TEGRA_PMC_BASE);
-
-#define pmc_writel(value, reg) \
-	__raw_writel(value, reg_pmc_base + (reg))
-#define pmc_readl(reg) \
-	__raw_readl(reg_pmc_base + (reg))
-
 /*
  * Tegra2 defines 1GB in the AXI address map for PCIe.
  *
@@ -680,18 +670,6 @@ static int tegra_pcie_enable_controller(void)
 	return;
 }
 
-static void tegra_pcie_xclk_clamp(bool clamp)
-{
-	u32 reg;
-
-	reg = pmc_readl(PMC_SCRATCH42) & ~PMC_SCRATCH42_PCX_CLAMP;
-
-	if (clamp)
-		reg |= PMC_SCRATCH42_PCX_CLAMP;
-
-	pmc_writel(reg, PMC_SCRATCH42);
-}
-
 static void tegra_pcie_power_off(void)
 {
 	tegra_periph_reset_assert(tegra_pcie.pcie_xclk);
@@ -699,7 +677,7 @@ static void tegra_pcie_power_off(void)
 	tegra_periph_reset_assert(tegra_pcie.pex_clk);
 
 	tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
-	tegra_pcie_xclk_clamp(true);
+	tegra_pmc_pcie_xclk_clamp(true);
 }
 
 static int tegra_pcie_power_regate(void)
@@ -708,7 +686,7 @@ static int tegra_pcie_power_regate(void)
 
 	tegra_pcie_power_off();
 
-	tegra_pcie_xclk_clamp(true);
+	tegra_pmc_pcie_xclk_clamp(true);
 
 	tegra_periph_reset_assert(tegra_pcie.pcie_xclk);
 	tegra_periph_reset_assert(tegra_pcie.afi_clk);
@@ -722,7 +700,7 @@ static int tegra_pcie_power_regate(void)
 
 	tegra_periph_reset_deassert(tegra_pcie.afi_clk);
 
-	tegra_pcie_xclk_clamp(false);
+	tegra_pmc_pcie_xclk_clamp(false);
 
 	clk_enable(tegra_pcie.afi_clk);
 	clk_enable(tegra_pcie.pex_clk);
diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index 7af6a54..399dc3a 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -24,6 +24,10 @@
 #define PMC_CTRL		0x0
 #define PMC_CTRL_INTR_LOW	(1 << 17)
 
+/* PMC access is required for PCIE xclk (un)clamping */
+#define PMC_SCRATCH42		0x144
+#define PMC_SCRATCH42_PCX_CLAMP	(1 << 0)
+
 static inline u32 tegra_pmc_readl(u32 reg)
 {
 	return readl(IO_ADDRESS(TEGRA_PMC_BASE + reg));
@@ -74,3 +78,15 @@ void __init tegra_pmc_init(void)
 		val &= ~PMC_CTRL_INTR_LOW;
 	tegra_pmc_writel(val, PMC_CTRL);
 }
+
+void tegra_pmc_pcie_xclk_clamp(bool clamp)
+{
+	u32 reg;
+
+	reg = tegra_pmc_readl(PMC_SCRATCH42) & ~PMC_SCRATCH42_PCX_CLAMP;
+
+	if (clamp)
+		reg |= PMC_SCRATCH42_PCX_CLAMP;
+
+	tegra_pmc_writel(reg, PMC_SCRATCH42);
+}
diff --git a/arch/arm/mach-tegra/pmc.h b/arch/arm/mach-tegra/pmc.h
index 8995ee4..2631c9a 100644
--- a/arch/arm/mach-tegra/pmc.h
+++ b/arch/arm/mach-tegra/pmc.h
@@ -19,5 +19,6 @@
 #define __MACH_TEGRA_PMC_H
 
 void tegra_pmc_init(void);
+void tegra_pmc_pcie_xclk_clamp(bool clamp);
 
 #endif
-- 
1.7.9.3
