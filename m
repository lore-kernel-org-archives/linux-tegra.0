From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: fix Tegra114 USB compatible values
Date: Mon, 15 Aug 2016 11:31:31 -0600
Message-ID: <20160815173132.12270-1-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

DT compatible values should always include an entry for the specific
chip in addition to any earlier generations that the HW is backwards-
compatible with.

This doesn't affect the kernel at all given current driver code, but
U-Boot needs to distinguish between Tegra114 and Tegra30 for this HW,
and I'd like to synchronize the DT content.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index cb9393a53422..8932ea3afd5f 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -672,7 +672,7 @@
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x7d000000 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -684,7 +684,7 @@
 	};
 
 	phy1: usb-phy@7d000000 {
-		compatible = "nvidia,tegra30-usb-phy";
+		compatible = "nvidia,tegra114-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x7d000000 0x4000 0x7d000000 0x4000>;
 		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA114_CLK_USBD>,
@@ -708,7 +708,7 @@
 	};
 
 	usb@7d008000 {
-		compatible = "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x7d008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -720,7 +720,7 @@
 	};
 
 	phy3: usb-phy@7d008000 {
-		compatible = "nvidia,tegra30-usb-phy";
+		compatible = "nvidia,tegra114-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x7d008000 0x4000 0x7d000000 0x4000>;
 		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA114_CLK_USB3>,
-- 
2.9.2
