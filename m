From: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Subject: [PATCH v2 2/2] arm/tegra: add timeout to PCIe PLL lock detection loop
Date: Fri,  9 Mar 2012 14:09:20 +0400
Message-ID: <1331287760-10546-1-git-send-email-mad_soft@inbox.ru>
References: <20120306201538.GA14350@rainbow>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120306201538.GA14350@rainbow>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra PCIe driver waits for PLL to lock using busy loop.
If PLL fails to lock for some reason, this leads to silent lockup
while booting (PCIe code is not modular).

Fix by adding timeout, so if PLL doesn't lock in a couple
of seconds, just PCIe driver fails and machine continues to boot.

Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
---
Changes v1 -> v2:
* msleep is changed to usleep_range
* function now returns 0 on success instead of undefined value

 arch/arm/mach-tegra/pcie.c |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 14b29ab..90f85eb 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -585,10 +585,10 @@ static void tegra_pcie_setup_translations(void)
 	afi_writel(0, AFI_MSI_BAR_SZ);
 }
 
-static void tegra_pcie_enable_controller(void)
+static int tegra_pcie_enable_controller(void)
 {
 	u32 val, reg;
-	int i;
+	int i, timeout;
 
 	/* Enable slot clock and pulse the reset signals */
 	for (i = 0, reg = AFI_PEX0_CTRL; i < 2; i++, reg += 0x8) {
@@ -639,8 +639,14 @@ static void tegra_pcie_enable_controller(void)
 	pads_writel(0xfa5cfa5c, 0xc8);
 
 	/* Wait for the PLL to lock */
+	timeout = 2000;
 	do {
 		val = pads_readl(PADS_PLL_CTL);
+		usleep_range(1000, 1000);
+		if (--timeout == 0) {
+			pr_err("Tegra PCIe error: timeout waiting for PLL\n");
+			return -EBUSY;
+		}
 	} while (!(val & PADS_PLL_CTL_LOCKDET));
 
 	/* turn off IDDQ override */
@@ -671,7 +677,7 @@ static void tegra_pcie_enable_controller(void)
 	/* Disable all execptions */
 	afi_writel(0, AFI_FPCI_ERROR_MASKS);
 
-	return;
+	return 0;
 }
 
 static void tegra_pcie_xclk_clamp(bool clamp)
@@ -921,7 +927,9 @@ int __init tegra_pcie_init(bool init_port0, bool init_port1)
 	if (err)
 		return err;
 
-	tegra_pcie_enable_controller();
+	err = tegra_pcie_enable_controller();
+	if (err)
+		return err;
 
 	/* setup the AFI address translations */
 	tegra_pcie_setup_translations();
-- 
1.7.5.1.300.gc565c
