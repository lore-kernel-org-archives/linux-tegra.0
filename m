From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Fri, 17 Feb 2012 16:44:28 +0100
Message-ID: <1329493468-7741-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PCIe reference clock needs a 3.3V supply voltage to work properly.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
This patch is based on next-20120217. Note that PCIe works without this
patch when the Linux kernel is booted with a combination of QuickBoot
and U-Boot because either apparently sets LD0 to 3.3V. This is not the
case when booting from mainline U-Boot, so it must be set explicitly.

 arch/arm/mach-tegra/board-harmony-pcie.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
index 33c4fed..d521cf4 100644
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ b/arch/arm/mach-tegra/board-harmony-pcie.c
@@ -45,6 +45,10 @@ static int __init harmony_pcie_init(void)
 	if (IS_ERR_OR_NULL(regulator))
 		goto err_reg;
 
+	err = regulator_set_voltage(regulator, 3300000, 3300000);
+	if (err < 0)
+		goto err_put;
+
 	regulator_enable(regulator);
 
 	err = tegra_pcie_init(true, true);
@@ -55,6 +59,7 @@ static int __init harmony_pcie_init(void)
 
 err_pcie:
 	regulator_disable(regulator);
+err_put:
 	regulator_put(regulator);
 err_reg:
 	gpio_free(TEGRA_GPIO_EN_VDD_1V05_GPIO);
-- 
1.7.9.1
