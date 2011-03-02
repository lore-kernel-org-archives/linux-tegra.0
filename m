From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: PCIE minor code refactoring
Date: Wed,  2 Mar 2011 14:34:04 +0200
Message-ID: <14be7b76cf6dd9e3ce6a77ed86a11525581bfaa1.1299068166.git.mike@compulab.co.il>
References: <cover.1299068166.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299068166.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Move tegra_pcie_power_off before tegra_pcie_power_on for clean addition
of PCIE power gating

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/pcie.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 53f5fa3..6de5ef4 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -682,6 +682,15 @@ static void tegra_pcie_xclk_clamp(bool clamp)
 	pmc_writel(reg, PMC_SCRATCH42);
 }
 
+static void tegra_pcie_power_off(void)
+{
+	tegra_periph_reset_assert(tegra_pcie.pcie_xclk);
+	tegra_periph_reset_assert(tegra_pcie.afi_clk);
+	tegra_periph_reset_assert(tegra_pcie.pex_clk);
+
+	tegra_pcie_xclk_clamp(true);
+}
+
 static int tegra_pcie_power_on(void)
 {
 	tegra_pcie_xclk_clamp(true);
@@ -693,15 +702,6 @@ static int tegra_pcie_power_on(void)
 	return clk_enable(tegra_pcie.pll_e);
 }
 
-static void tegra_pcie_power_off(void)
-{
-	tegra_periph_reset_assert(tegra_pcie.pcie_xclk);
-	tegra_periph_reset_assert(tegra_pcie.afi_clk);
-	tegra_periph_reset_assert(tegra_pcie.pex_clk);
-
-	tegra_pcie_xclk_clamp(true);
-}
-
 static int tegra_pcie_clocks_get(void)
 {
 	int err;
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
