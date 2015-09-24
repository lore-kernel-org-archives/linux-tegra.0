From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Use consistent indentation for SATA node
Date: Thu, 24 Sep 2015 10:00:05 +0200
Message-ID: <1443081605-17146-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The indentation for properties in the SATA device tree node on Tegra124
deviates from the rest of the device tree file. Restore consistency and
get rid of a couple of gratuitous blank lines while at it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index ac8a6a567935..ee0cf9e99772 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -624,28 +624,21 @@
 
 	sata@0,70020000 {
 		compatible = "nvidia,tegra124-ahci";
-
 		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
-			<0x0 0x70020000 0x0 0x7000>; /* SATA */
-
+		      <0x0 0x70020000 0x0 0x7000>; /* SATA */
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-
 		clocks = <&tegra_car TEGRA124_CLK_SATA>,
-			<&tegra_car TEGRA124_CLK_SATA_OOB>,
-			<&tegra_car TEGRA124_CLK_CML1>,
-			<&tegra_car TEGRA124_CLK_PLL_E>;
+			 <&tegra_car TEGRA124_CLK_SATA_OOB>,
+			 <&tegra_car TEGRA124_CLK_CML1>,
+			 <&tegra_car TEGRA124_CLK_PLL_E>;
 		clock-names = "sata", "sata-oob", "cml1", "pll_e";
-
 		resets = <&tegra_car 124>,
-			<&tegra_car 123>,
-			<&tegra_car 129>;
+			 <&tegra_car 123>,
+			 <&tegra_car 129>;
 		reset-names = "sata", "sata-oob", "sata-cold";
-
 		power-domains = <&pmc TEGRA_POWERGATE_SATA>;
-
 		phys = <&padctl TEGRA_XUSB_PADCTL_SATA>;
 		phy-names = "sata-phy";
-
 		status = "disabled";
 	};
 
-- 
2.5.0
