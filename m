From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 03/10] ARM: tegra: Add Tegra124 host1x support
Date: Fri, 28 Feb 2014 17:40:22 +0100
Message-ID: <1393605629-30514-3-git-send-email-thierry.reding@gmail.com>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The version of host1x on Tegra124 is largely compatible with that on
earlier Tegra generations. Some of the registers have moved around or
expanded to allow for more capability, so a separate compatible string
is still required.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 30a7377d5600..26dfe09e8410 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -9,6 +9,47 @@
 	compatible = "nvidia,tegra124";
 	interrupt-parent = <&gic>;
 
+	host1x@50000000 {
+		compatible = "nvidia,tegra124-host1x", "simple-bus";
+		reg = <0x50000000 0x00034000>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
+			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
+		resets = <&tegra_car 28>;
+		reset-names = "host1x";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0x54000000 0x54000000 0x01000000>;
+
+		dc@54200000 {
+			compatible = "nvidia,tegra124-dc";
+			reg = <0x54200000 0x00040000>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
+				 <&tegra_car TEGRA124_CLK_PLL_P>;
+			clock-names = "dc", "parent";
+			resets = <&tegra_car 27>;
+			reset-names = "dc";
+
+			nvidia,head = <0>;
+		};
+
+		dc@54240000 {
+			compatible = "nvidia,tegra124-dc";
+			reg = <0x54240000 0x00040000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
+				 <&tegra_car TEGRA124_CLK_PLL_P>;
+			clock-names = "dc", "parent";
+			resets = <&tegra_car 26>;
+			reset-names = "dc";
+
+			nvidia,head = <1>;
+		};
+	};
+
 	gic: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-- 
1.8.4.2
