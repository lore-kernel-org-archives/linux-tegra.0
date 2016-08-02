From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: Correct polarity for Tegra114 PMIC interrupt
Date: Tue, 2 Aug 2016 11:34:27 +0100
Message-ID: <1470134069-12178-3-git-send-email-jonathanh@nvidia.com>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470134069-12178-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ARM GIC only supports interrupts with either level-high or
rising-edge types for SPIs. The interrupt type for the Palmas PMIC used
for Tegra114 boards is specified as level-low which is invalid for the
GIC. This has gone undetected because until recently, failures to set
the interrupt type when the interrupts are mapped via firmware (such as
device-tree) have not been reported. Since commits 4b357daed698
("genirq: Look-up trigger type if not specified by caller") and
1e2a7d78499e ("irqdomain: Don't set type when mapping an IRQ"), failure
to set the interrupt type will cause the requesting of the interrupt to
fail and exposing incorrectly configured interrupts.

Please note that although the interrupt type was never being set for the
Palmas PMIC, it was still working fine, because the default type setting
for the interrupt, 'level-high', happen to match the correct type for
the interrupt.

Finally, it should be noted that the Palmas interrupt from the PMIC is
actually 'level-low', however, this interrupt signal is inverted by the
Tegra PMC and so the GIC actually sees a 'level-high' interrupt which is
what should be specified in the device-tree interrupt specifier.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 arch/arm/boot/dts/tegra114-roth.dts    | 2 +-
 arch/arm/boot/dts/tegra114-tn7.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 1dfc492cc004..1444fbd543e7 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -897,7 +897,7 @@
 		palmas: tps65913@58 {
 			compatible = "ti,palmas";
 			reg = <0x58>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 70cf40996c3f..966a7fc044af 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -802,7 +802,7 @@
 		palmas: pmic@58 {
 			compatible = "ti,palmas";
 			reg = <0x58>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 17dd14545862..a161fa1dfb61 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -63,7 +63,7 @@
 		palmas: pmic@58 {
 			compatible = "ti,palmas";
 			reg = <0x58>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.1.4
