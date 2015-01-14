From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 5/9] ARM: tegra: add PM domain device nodes to Tegra124 DT
Date: Wed, 14 Jan 2015 14:19:28 +0800
Message-ID: <1421216372-8025-6-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Also bind the PM domain provider and consumer together.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 73 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 4be06c6ea0c8..584307b2953e 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/memory/tegra124-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
+#include <dt-bindings/power/tegra-powergate.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
 
@@ -39,6 +40,8 @@
 			  0x82000000 0 0x13000000 0x0 0x13000000 0 0x0d000000   /* non-prefetchable memory (208 MiB) */
 			  0xc2000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
 
+		power-domains = <&pmc TEGRA_POWERGATE_PCIE>;
+
 		clocks = <&tegra_car TEGRA124_CLK_PCIE>,
 			 <&tegra_car TEGRA124_CLK_AFI>,
 			 <&tegra_car TEGRA124_CLK_PLL_E>,
@@ -98,6 +101,7 @@
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pmc TEGRA_POWERGATE_DIS>;
 			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
 				 <&tegra_car TEGRA124_CLK_PLL_P>;
 			clock-names = "dc", "parent";
@@ -187,6 +191,7 @@
 		clock-names = "gpu", "pwr";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
+		power-domains = <&pmc TEGRA_POWERGATE_3D>;
 		status = "disabled";
 	};
 
@@ -542,11 +547,75 @@
 		clocks = <&tegra_car TEGRA124_CLK_RTC>;
 	};
 
-	pmc@0,7000e400 {
+	pmc: pmc@0,7000e400 {
 		compatible = "nvidia,tegra124-pmc";
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA124_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#power-domain-cells = <1>;
+	};
+
+	dc-power-domain {
+		compatible = "nvidia,power-domains";
+		name = "dc-power-domain";
+		domain = <TEGRA_POWERGATE_DIS>;
+		clocks = <&tegra_car TEGRA124_CLK_DISP1>;
+		resets = <&tegra_car 27>;
+		nvidia,swgroup = <&mc TEGRA_SWGROUP_DC>;
+		depend-on = <&sorpd>;
+	};
+
+	pcie-power-domain {
+		compatible = "nvidia,power-domains";
+		name = "pcie-power-domain";
+		domain = <TEGRA_POWERGATE_PCIE>;
+		clocks = <&tegra_car TEGRA124_CLK_PCIE>,
+			 <&tegra_car TEGRA124_CLK_AFI>,
+			 <&tegra_car TEGRA124_CLK_PLL_E>,
+			 <&tegra_car TEGRA124_CLK_CML0>;
+		resets = <&tegra_car 70>,
+			 <&tegra_car 72>,
+			 <&tegra_car 74>;
+		nvidia,swgroup = <&mc TEGRA_SWGROUP_AFI>;
+	};
+
+	sorpd: sor-power-domain {
+		compatible = "nvidia,power-domains";
+		name = "sor-power-domain";
+		domain = <TEGRA_POWERGATE_SOR>;
+		clocks = <&tegra_car TEGRA124_CLK_SOR0>,
+			 <&tegra_car TEGRA124_CLK_DSIA>,
+			 <&tegra_car TEGRA124_CLK_DSIB>,
+			 <&tegra_car TEGRA124_CLK_HDMI>,
+			 <&tegra_car TEGRA124_CLK_MIPI_CAL>,
+			 <&tegra_car TEGRA124_CLK_DPAUX>;
+		resets = <&tegra_car 182>,
+			<&tegra_car 48>,
+			<&tegra_car 82>,
+			<&tegra_car 51>,
+			<&tegra_car 56>;
+	};
+
+	gpu-power-domain {
+		compatible = "nvidia,power-domains";
+		name = "gpu-power-domain";
+		domain = <TEGRA_POWERGATE_3D>;
+		clocks = <&tegra_car TEGRA124_CLK_GPU>,
+			 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
+		resets = <&tegra_car 184>;
+		external-power-rail;
+	};
+
+	sata-power-domain {
+		compatible = "nvidia,power-domains";
+		name = "sata-power-domain";
+		domain = <TEGRA_POWERGATE_SATA>;
+		clocks = <&tegra_car TEGRA124_CLK_SATA>,
+			<&tegra_car TEGRA124_CLK_SATA_OOB>,
+			<&tegra_car TEGRA124_CLK_CML1>;
+		resets = <&tegra_car 124>,
+			<&tegra_car 123>,
+			<&tegra_car 129>;
 	};
 
 	fuse@0,7000f800 {
@@ -588,6 +657,8 @@
 			<&tegra_car 129>;
 		reset-names = "sata", "sata-oob", "sata-cold";
 
+		power-domains = <&pmc TEGRA_POWERGATE_SATA>;
+
 		phys = <&padctl TEGRA_XUSB_PADCTL_SATA>;
 		phy-names = "sata-phy";
 
-- 
1.9.1
