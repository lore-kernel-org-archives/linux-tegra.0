From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm64: tegra: Remove 0, prefix from unit-addresses
Date: Mon, 11 Apr 2016 16:01:10 +0200
Message-ID: <1460383271-27306-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When Tegra124 support was first merged the unit-addresses of all devices
were listed with a "0," prefix to encode the reg property's second cell.
It turns out that this notation is not correct, and the "," separator is
only used to separate fields in the unit address (such as the device and
function number in PCI devices), not individual cells for addresses with
more than one cell.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts |  46 +++++-----
 arch/arm64/boot/dts/nvidia/tegra132.dtsi       | 118 ++++++++++++-------------
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   8 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi |  10 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2571.dts  |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 118 ++++++++++++-------------
 8 files changed, 154 insertions(+), 154 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 62f33fc84e3e..ebf8926c72d6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -8,8 +8,8 @@
 	compatible = "nvidia,norrin", "nvidia,tegra132", "nvidia,tegra124";
 
 	aliases {
-		rtc0 = "/i2c@0,7000d000/as3722@40";
-		rtc1 = "/rtc@0,7000e000";
+		rtc0 = "/i2c@7000d000/as3722@40";
+		rtc1 = "/rtc@7000e000";
 	};
 
 	chosen { };
@@ -19,8 +19,8 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
-	host1x@0,50000000 {
-		hdmi@0,54280000 {
+	host1x@50000000 {
+		hdmi@54280000 {
 			status = "disabled";
 
 			vdd-supply = <&vdd_3v3_hdmi>;
@@ -32,26 +32,26 @@
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			status = "okay";
 
 			nvidia,dpaux = <&dpaux>;
 			nvidia,panel = <&panel>;
 		};
 
-		dpaux: dpaux@0,545c0000 {
+		dpaux: dpaux@545c0000 {
 			vdd-supply = <&vdd_3v3_panel>;
 			status = "okay";
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		status = "okay";
 
 		vdd-supply = <&vdd_gpu>;
 	};
 
-	pinmux@0,70000868 {
+	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
 
@@ -523,21 +523,21 @@
 		};
 	};
 
-	serial@0,70006000 {
+	serial@70006000 {
 		status = "okay";
 	};
 
-	pwm: pwm@0,7000a000 {
+	pwm: pwm@7000a000 {
 		status = "okay";
 	};
 
 	/* HDMI DDC */
-	hdmi_ddc: i2c@0,7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -744,7 +744,7 @@
 		};
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		status = "okay";
 
 		ec: cros-ec@0 {
@@ -876,7 +876,7 @@
 		};
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
 		#wake-cells = <3>;
@@ -890,12 +890,12 @@
 	};
 
 	/* WIFI/BT module */
-	sdhci@0,700b0000 {
+	sdhci@700b0000 {
 		status = "disabled";
 	};
 
 	/* external SD/MMC */
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
@@ -905,35 +905,35 @@
 	};
 
 	/* EMMC 4.51 */
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
 	};
 
-	usb@0,7d000000 {
+	usb@7d000000 {
 		status = "okay";
 	};
 
-	usb-phy@0,7d000000 {
+	usb-phy@7d000000 {
 		status = "okay";
 		vbus-supply = <&vdd_usb1_vbus>;
 	};
 
-	usb@0,7d004000 {
+	usb@7d004000 {
 		status = "okay";
 	};
 
-	usb-phy@0,7d004000 {
+	usb-phy@7d004000 {
 		status = "okay";
 		vbus-supply = <&vdd_run_cam>;
 	};
 
-	usb@0,7d008000 {
+	usb@7d008000 {
 		status = "okay";
 	};
 
-	usb-phy@0,7d008000 {
+	usb-phy@7d008000 {
 		status = "okay";
 		vbus-supply = <&vdd_usb3_vbus>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 6e28e41d7e3e..5d70728dda83 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -11,7 +11,7 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	pcie-controller@0,01003000 {
+	pcie-controller@01003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
 		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
@@ -77,7 +77,7 @@
 		};
 	};
 
-	host1x@0,50000000 {
+	host1x@50000000 {
 		compatible = "nvidia,tegra124-host1x", "simple-bus";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
@@ -92,7 +92,7 @@
 
 		ranges = <0 0x54000000 0 0x54000000 0 0x01000000>;
 
-		dc@0,54200000 {
+		dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -107,7 +107,7 @@
 			nvidia,head = <0>;
 		};
 
-		dc@0,54240000 {
+		dc@54240000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -122,7 +122,7 @@
 			nvidia,head = <1>;
 		};
 
-		hdmi@0,54280000 {
+		hdmi@54280000 {
 			compatible = "nvidia,tegra124-hdmi";
 			reg = <0x0 0x54280000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -134,7 +134,7 @@
 			status = "disabled";
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			compatible = "nvidia,tegra124-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -148,7 +148,7 @@
 			status = "disabled";
 		};
 
-		dpaux: dpaux@0,545c0000 {
+		dpaux: dpaux@545c0000 {
 			compatible = "nvidia,tegra124-dpaux";
 			reg = <0x0 0x545c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,7 +161,7 @@
 		};
 	};
 
-	gic: interrupt-controller@0,50041000 {
+	gic: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -174,7 +174,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		compatible = "nvidia,gk20a";
 		reg = <0x0 0x57000000 0x0 0x01000000>,
 		      <0x0 0x58000000 0x0 0x01000000>;
@@ -201,7 +201,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	timer@0,60005000 {
+	timer@60005000 {
 		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -214,7 +214,7 @@
 		clock-names = "timer";
 	};
 
-	tegra_car: clock@0,60006000 {
+	tegra_car: clock@60006000 {
 		compatible = "nvidia,tegra132-car";
 		reg = <0x0 0x60006000 0x0 0x1000>;
 		#clock-cells = <1>;
@@ -222,12 +222,12 @@
 		nvidia,external-memory-controller = <&emc>;
 	};
 
-	flow-controller@0,60007000 {
+	flow-controller@60007000 {
 		compatible = "nvidia,tegra124-flowctrl";
 		reg = <0x0 0x60007000 0x0 0x1000>;
 	};
 
-	actmon@0,6000c800 {
+	actmon@6000c800 {
 		compatible = "nvidia,tegra124-actmon";
 		reg = <0x0 0x6000c800 0x0 0x400>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -238,7 +238,7 @@
 		reset-names = "actmon";
 	};
 
-	gpio: gpio@0,6000d000 {
+	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra124-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
@@ -255,7 +255,7 @@
 		interrupt-controller;
 	};
 
-	apbdma: dma@0,60020000 {
+	apbdma: dma@60020000 {
 		compatible = "nvidia,tegra124-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
@@ -297,13 +297,13 @@
 		#dma-cells = <1>;
 	};
 
-	apbmisc@0,70000800 {
+	apbmisc@70000800 {
 		compatible = "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc";
 		reg = <0x0 0x70000800 0x0 0x64>,   /* Chip revision */
 		      <0x0 0x7000e864 0x0 0x04>;   /* Strapping options */
 	};
 
-	pinmux: pinmux@0,70000868 {
+	pinmux: pinmux@70000868 {
 		compatible = "nvidia,tegra124-pinmux";
 		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
 		      <0x0 0x70003000 0x0 0x434>, /* Mux registers */
@@ -318,7 +318,7 @@
 	 * the APB DMA based serial driver, the comptible is
 	 * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
 	 */
-	uarta: serial@0,70006000 {
+	uarta: serial@70006000 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006000 0x0 0x40>;
 		reg-shift = <2>;
@@ -332,7 +332,7 @@
 		status = "disabled";
 	};
 
-	uartb: serial@0,70006040 {
+	uartb: serial@70006040 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006040 0x0 0x40>;
 		reg-shift = <2>;
@@ -346,7 +346,7 @@
 		status = "disabled";
 	};
 
-	uartc: serial@0,70006200 {
+	uartc: serial@70006200 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006200 0x0 0x40>;
 		reg-shift = <2>;
@@ -360,7 +360,7 @@
 		status = "disabled";
 	};
 
-	uartd: serial@0,70006300 {
+	uartd: serial@70006300 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006300 0x0 0x40>;
 		reg-shift = <2>;
@@ -374,7 +374,7 @@
 		status = "disabled";
 	};
 
-	pwm: pwm@0,7000a000 {
+	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";
 		reg = <0x0 0x7000a000 0x0 0x100>;
 		#pwm-cells = <2>;
@@ -385,7 +385,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -400,7 +400,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -415,7 +415,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -430,7 +430,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c700 {
+	i2c@7000c700 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
@@ -445,7 +445,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -460,7 +460,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d100 {
+	i2c@7000d100 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -475,7 +475,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d400 0x0 0x200>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
@@ -490,7 +490,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d600 {
+	spi@7000d600 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d600 0x0 0x200>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -505,7 +505,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d800 {
+	spi@7000d800 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d800 0x0 0x200>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -520,7 +520,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000da00 {
+	spi@7000da00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000da00 0x0 0x200>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -535,7 +535,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000dc00 {
+	spi@7000dc00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000dc00 0x0 0x200>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
@@ -550,7 +550,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000de00 {
+	spi@7000de00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000de00 0x0 0x200>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -565,7 +565,7 @@
 		status = "disabled";
 	};
 
-	rtc@0,7000e000 {
+	rtc@7000e000 {
 		compatible = "nvidia,tegra124-rtc", "nvidia,tegra20-rtc";
 		reg = <0x0 0x7000e000 0x0 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -573,14 +573,14 @@
 		clock-names = "rtc";
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		compatible = "nvidia,tegra124-pmc";
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA124_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 	};
 
-	fuse@0,7000f800 {
+	fuse@7000f800 {
 		compatible = "nvidia,tegra124-efuse";
 		reg = <0x0 0x7000f800 0x0 0x400>;
 		clocks = <&tegra_car TEGRA124_CLK_FUSE>;
@@ -589,7 +589,7 @@
 		reset-names = "fuse";
 	};
 
-	mc: memory-controller@0,70019000 {
+	mc: memory-controller@70019000 {
 		compatible = "nvidia,tegra132-mc";
 		reg = <0x0 0x70019000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_MC>;
@@ -600,14 +600,14 @@
 		#iommu-cells = <1>;
 	};
 
-	emc: emc@0,7001b000 {
+	emc: emc@7001b000 {
 		compatible = "nvidia,tegra132-emc", "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 
 		nvidia,memory-controller = <&mc>;
 	};
 
-	sata@0,70020000 {
+	sata@70020000 {
 		compatible = "nvidia,tegra124-ahci";
 		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
 		      <0x0 0x70020000 0x0 0x7000>; /* SATA */
@@ -626,7 +626,7 @@
 		status = "disabled";
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		compatible = "nvidia,tegra132-hda", "nvidia,tegra124-hda",
 			     "nvidia,tegra30-hda";
 		reg = <0x0 0x70030000 0x0 0x10000>;
@@ -642,7 +642,7 @@
 		status = "disabled";
 	};
 
-	padctl: padctl@0,7009f000 {
+	padctl: padctl@7009f000 {
 		compatible = "nvidia,tegra132-xusb-padctl",
 			     "nvidia,tegra124-xusb-padctl";
 		reg = <0x0 0x7009f000 0x0 0x1000>;
@@ -682,7 +682,7 @@
 		};
 	};
 
-	sdhci@0,700b0000 {
+	sdhci@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -693,7 +693,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0200 {
+	sdhci@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -704,7 +704,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -715,7 +715,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
@@ -726,7 +726,7 @@
 		status = "disabled";
 	};
 
-	soctherm: thermal-sensor@0,700e2000 {
+	soctherm: thermal-sensor@700e2000 {
 		compatible = "nvidia,tegra124-soctherm";
 		reg = <0x0 0x700e2000 0x0 0x1000>;
 		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
@@ -738,7 +738,7 @@
 		#thermal-sensor-cells = <1>;
 	};
 
-	ahub@0,70300000 {
+	ahub@70300000 {
 		compatible = "nvidia,tegra124-ahub";
 		reg = <0x0 0x70300000 0x0 0x200>,
 		      <0x0 0x70300800 0x0 0x800>,
@@ -790,7 +790,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		tegra_i2s0: i2s@0,70301000 {
+		tegra_i2s0: i2s@70301000 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301000 0x0 0x100>;
 			nvidia,ahub-cif-ids = <4 4>;
@@ -801,7 +801,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s1: i2s@0,70301100 {
+		tegra_i2s1: i2s@70301100 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301100 0x0 0x100>;
 			nvidia,ahub-cif-ids = <5 5>;
@@ -812,7 +812,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s2: i2s@0,70301200 {
+		tegra_i2s2: i2s@70301200 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301200 0x0 0x100>;
 			nvidia,ahub-cif-ids = <6 6>;
@@ -823,7 +823,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s3: i2s@0,70301300 {
+		tegra_i2s3: i2s@70301300 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301300 0x0 0x100>;
 			nvidia,ahub-cif-ids = <7 7>;
@@ -834,7 +834,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s4: i2s@0,70301400 {
+		tegra_i2s4: i2s@70301400 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301400 0x0 0x100>;
 			nvidia,ahub-cif-ids = <8 8>;
@@ -846,7 +846,7 @@
 		};
 	};
 
-	usb@0,7d000000 {
+	usb@7d000000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
@@ -859,7 +859,7 @@
 		status = "disabled";
 	};
 
-	phy1: usb-phy@0,7d000000 {
+	phy1: usb-phy@7d000000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d000000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
@@ -884,7 +884,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d004000 {
+	usb@7d004000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
@@ -897,7 +897,7 @@
 		status = "disabled";
 	};
 
-	phy2: usb-phy@0,7d004000 {
+	phy2: usb-phy@7d004000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d004000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
@@ -921,7 +921,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d008000 {
+	usb@7d008000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d008000 0x0 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
@@ -934,7 +934,7 @@
 		status = "disabled";
 	};
 
-	phy3: usb-phy@0,7d008000 {
+	phy3: usb-phy@7d008000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d008000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 2b7f88950d1e..316c92c03821 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -5,7 +5,7 @@
 	compatible = "nvidia,p2180", "nvidia,tegra210";
 
 	aliases {
-		rtc1 = "/rtc@0,7000e000";
+		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
 	};
 
@@ -15,16 +15,16 @@
 	};
 
 	/* debug port */
-	serial@0,70006000 {
+	serial@70006000 {
 		status = "okay";
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 	};
 
 	/* eMMC */
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index ece0dec61fae..a8e4b7311071 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -5,7 +5,7 @@
 	compatible = "nvidia,p2530", "nvidia,tegra210";
 
 	aliases {
-		rtc1 = "/rtc@0,7000e000";
+		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
 	};
 
@@ -15,21 +15,21 @@
 	};
 
 	/* debug port */
-	serial@0,70006000 {
+	serial@70006000 {
 		status = "okay";
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 	};
 
 	/* eMMC */
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2571.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2571.dts
index 58d27ddd57ff..576957a55801 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2571.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2571.dts
@@ -7,7 +7,7 @@
 	model = "NVIDIA Tegra210 P2571 reference design";
 	compatible = "nvidia,p2571", "nvidia,tegra210";
 
-	pinmux: pinmux@0,700008d4 {
+	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi
index f3f91392214e..e008e3364d2a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi
@@ -2,7 +2,7 @@
 	model = "NVIDIA Tegra210 P2595 I/O board";
 	compatible = "nvidia,p2595", "nvidia,tegra210";
 
-	pinmux: pinmux@0,700008d4 {
+	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index be3eccbe8013..c662404e78a2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -2,7 +2,7 @@
 	model = "NVIDIA Tegra210 P2597 I/O board";
 	compatible = "nvidia,p2597", "nvidia,tegra210";
 
-	pinmux: pinmux@0,700008d4 {
+	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
 
@@ -1260,7 +1260,7 @@
 	};
 
 	/* MMC/SD */
-	sdhci@0,700b0000 {
+	sdhci@700b0000 {
 		status = "okay";
 		bus-width = <4>;
 		no-1-8-v;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 23b0630602cf..77d5aba03f8e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -10,7 +10,7 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	host1x@0,50000000 {
+	host1x@50000000 {
 		compatible = "nvidia,tegra210-host1x", "simple-bus";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
@@ -25,7 +25,7 @@
 
 		ranges = <0x0 0x54000000 0x0 0x54000000 0x0 0x01000000>;
 
-		dpaux1: dpaux@0,54040000 {
+		dpaux1: dpaux@54040000 {
 			compatible = "nvidia,tegra210-dpaux";
 			reg = <0x0 0x54040000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -37,19 +37,19 @@
 			status = "disabled";
 		};
 
-		vi@0,54080000 {
+		vi@54080000 {
 			compatible = "nvidia,tegra210-vi";
 			reg = <0x0 0x54080000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		tsec@0,54100000 {
+		tsec@54100000 {
 			compatible = "nvidia,tegra210-tsec";
 			reg = <0x0 0x54100000 0x0 0x00040000>;
 		};
 
-		dc@0,54200000 {
+		dc@54200000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -64,7 +64,7 @@
 			nvidia,head = <0>;
 		};
 
-		dc@0,54240000 {
+		dc@54240000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -79,7 +79,7 @@
 			nvidia,head = <1>;
 		};
 
-		dsi@0,54300000 {
+		dsi@54300000 {
 			compatible = "nvidia,tegra210-dsi";
 			reg = <0x0 0x54300000 0x0 0x00040000>;
 			clocks = <&tegra_car TEGRA210_CLK_DSIA>,
@@ -96,19 +96,19 @@
 			#size-cells = <0>;
 		};
 
-		vic@0,54340000 {
+		vic@54340000 {
 			compatible = "nvidia,tegra210-vic";
 			reg = <0x0 0x54340000 0x0 0x00040000>;
 			status = "disabled";
 		};
 
-		nvjpg@0,54380000 {
+		nvjpg@54380000 {
 			compatible = "nvidia,tegra210-nvjpg";
 			reg = <0x0 0x54380000 0x0 0x00040000>;
 			status = "disabled";
 		};
 
-		dsi@0,54400000 {
+		dsi@54400000 {
 			compatible = "nvidia,tegra210-dsi";
 			reg = <0x0 0x54400000 0x0 0x00040000>;
 			clocks = <&tegra_car TEGRA210_CLK_DSIB>,
@@ -125,25 +125,25 @@
 			#size-cells = <0>;
 		};
 
-		nvdec@0,54480000 {
+		nvdec@54480000 {
 			compatible = "nvidia,tegra210-nvdec";
 			reg = <0x0 0x54480000 0x0 0x00040000>;
 			status = "disabled";
 		};
 
-		nvenc@0,544c0000 {
+		nvenc@544c0000 {
 			compatible = "nvidia,tegra210-nvenc";
 			reg = <0x0 0x544c0000 0x0 0x00040000>;
 			status = "disabled";
 		};
 
-		tsec@0,54500000 {
+		tsec@54500000 {
 			compatible = "nvidia,tegra210-tsec";
 			reg = <0x0 0x54500000 0x0 0x00040000>;
 			status = "disabled";
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			compatible = "nvidia,tegra210-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -157,7 +157,7 @@
 			status = "disabled";
 		};
 
-		sor@0,54580000 {
+		sor@54580000 {
 			compatible = "nvidia,tegra210-sor1";
 			reg = <0x0 0x54580000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -171,7 +171,7 @@
 			status = "disabled";
 		};
 
-		dpaux: dpaux@0,545c0000 {
+		dpaux: dpaux@545c0000 {
 			compatible = "nvidia,tegra124-dpaux";
 			reg = <0x0 0x545c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
@@ -183,21 +183,21 @@
 			status = "disabled";
 		};
 
-		isp@0,54600000 {
+		isp@54600000 {
 			compatible = "nvidia,tegra210-isp";
 			reg = <0x0 0x54600000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		isp@0,54680000 {
+		isp@54680000 {
 			compatible = "nvidia,tegra210-isp";
 			reg = <0x0 0x54680000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		i2c@0,546c0000 {
+		i2c@546c0000 {
 			compatible = "nvidia,tegra210-i2c-vi";
 			reg = <0x0 0x546c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
@@ -205,7 +205,7 @@
 		};
 	};
 
-	gic: interrupt-controller@0,50041000 {
+	gic: interrupt-controller@50041000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -218,7 +218,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		compatible = "nvidia,gm20b";
 		reg = <0x0 0x57000000 0x0 0x01000000>,
 		      <0x0 0x58000000 0x0 0x01000000>;
@@ -233,7 +233,7 @@
 		status = "disabled";
 	};
 
-	lic: interrupt-controller@0,60004000 {
+	lic: interrupt-controller@60004000 {
 		compatible = "nvidia,tegra210-ictlr";
 		reg = <0x0 0x60004000 0x0 0x40>, /* primary controller */
 		      <0x0 0x60004100 0x0 0x40>, /* secondary controller */
@@ -246,7 +246,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	timer@0,60005000 {
+	timer@60005000 {
 		compatible = "nvidia,tegra210-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -259,19 +259,19 @@
 		clock-names = "timer";
 	};
 
-	tegra_car: clock@0,60006000 {
+	tegra_car: clock@60006000 {
 		compatible = "nvidia,tegra210-car";
 		reg = <0x0 0x60006000 0x0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
 
-	flow-controller@0,60007000 {
+	flow-controller@60007000 {
 		compatible = "nvidia,tegra210-flowctrl";
 		reg = <0x0 0x60007000 0x0 0x1000>;
 	};
 
-	gpio: gpio@0,6000d000 {
+	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra210-gpio", "nvidia,tegra124-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
@@ -288,7 +288,7 @@
 		interrupt-controller;
 	};
 
-	apbdma: dma@0,60020000 {
+	apbdma: dma@60020000 {
 		compatible = "nvidia,tegra210-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
@@ -330,13 +330,13 @@
 		#dma-cells = <1>;
 	};
 
-	apbmisc@0,70000800 {
+	apbmisc@70000800 {
 		compatible = "nvidia,tegra210-apbmisc", "nvidia,tegra20-apbmisc";
 		reg = <0x0 0x70000800 0x0 0x64>,   /* Chip revision */
 		      <0x0 0x7000e864 0x0 0x04>;   /* Strapping options */
 	};
 
-	pinmux: pinmux@0,700008d4 {
+	pinmux: pinmux@700008d4 {
 		compatible = "nvidia,tegra210-pinmux";
 		reg = <0x0 0x700008d4 0x0 0x29c>, /* Pad control registers */
 		      <0x0 0x70003000 0x0 0x294>; /* Mux registers */
@@ -350,7 +350,7 @@
 	 * the APB DMA based serial driver, the comptible is
 	 * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
 	 */
-	uarta: serial@0,70006000 {
+	uarta: serial@70006000 {
 		compatible = "nvidia,tegra210-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006000 0x0 0x40>;
 		reg-shift = <2>;
@@ -364,7 +364,7 @@
 		status = "disabled";
 	};
 
-	uartb: serial@0,70006040 {
+	uartb: serial@70006040 {
 		compatible = "nvidia,tegra210-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006040 0x0 0x40>;
 		reg-shift = <2>;
@@ -378,7 +378,7 @@
 		status = "disabled";
 	};
 
-	uartc: serial@0,70006200 {
+	uartc: serial@70006200 {
 		compatible = "nvidia,tegra210-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006200 0x0 0x40>;
 		reg-shift = <2>;
@@ -392,7 +392,7 @@
 		status = "disabled";
 	};
 
-	uartd: serial@0,70006300 {
+	uartd: serial@70006300 {
 		compatible = "nvidia,tegra210-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006300 0x0 0x40>;
 		reg-shift = <2>;
@@ -406,7 +406,7 @@
 		status = "disabled";
 	};
 
-	pwm: pwm@0,7000a000 {
+	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra210-pwm", "nvidia,tegra20-pwm";
 		reg = <0x0 0x7000a000 0x0 0x100>;
 		#pwm-cells = <2>;
@@ -417,7 +417,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -432,7 +432,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -447,7 +447,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -462,7 +462,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c700 {
+	i2c@7000c700 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
@@ -477,7 +477,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -492,7 +492,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d100 {
+	i2c@7000d100 {
 		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d400 0x0 0x200>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
@@ -522,7 +522,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d600 {
+	spi@7000d600 {
 		compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d600 0x0 0x200>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -537,7 +537,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d800 {
+	spi@7000d800 {
 		compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d800 0x0 0x200>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -552,7 +552,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000da00 {
+	spi@7000da00 {
 		compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000da00 0x0 0x200>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -567,7 +567,7 @@
 		status = "disabled";
 	};
 
-	rtc@0,7000e000 {
+	rtc@7000e000 {
 		compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
 		reg = <0x0 0x7000e000 0x0 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -575,7 +575,7 @@
 		clock-names = "rtc";
 	};
 
-	pmc: pmc@0,7000e400 {
+	pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra210-pmc";
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
@@ -584,7 +584,7 @@
 		#power-domain-cells = <1>;
 	};
 
-	fuse@0,7000f800 {
+	fuse@7000f800 {
 		compatible = "nvidia,tegra210-efuse";
 		reg = <0x0 0x7000f800 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_FUSE>;
@@ -593,7 +593,7 @@
 		reset-names = "fuse";
 	};
 
-	mc: memory-controller@0,70019000 {
+	mc: memory-controller@70019000 {
 		compatible = "nvidia,tegra210-mc";
 		reg = <0x0 0x70019000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA210_CLK_MC>;
@@ -604,7 +604,7 @@
 		#iommu-cells = <1>;
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		compatible = "nvidia,tegra210-hda", "nvidia,tegra30-hda";
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -619,7 +619,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0000 {
+	sdhci@700b0000 {
 		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -630,7 +630,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0200 {
+	sdhci@700b0200 {
 		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -641,7 +641,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -652,7 +652,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
@@ -663,7 +663,7 @@
 		status = "disabled";
 	};
 
-	mipi: mipi@0,700e3000 {
+	mipi: mipi@700e3000 {
 		compatible = "nvidia,tegra210-mipi";
 		reg = <0x0 0x700e3000 0x0 0x100>;
 		clocks = <&tegra_car TEGRA210_CLK_MIPI_CAL>;
@@ -671,7 +671,7 @@
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
-	spi@0,70410000 {
+	spi@70410000 {
 		compatible = "nvidia,tegra210-qspi";
 		reg = <0x0 0x70410000 0x0 0x1000>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -686,7 +686,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d000000 {
+	usb@7d000000 {
 		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
@@ -699,7 +699,7 @@
 		status = "disabled";
 	};
 
-	phy1: usb-phy@0,7d000000 {
+	phy1: usb-phy@7d000000 {
 		compatible = "nvidia,tegra210-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d000000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
@@ -724,7 +724,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d004000 {
+	usb@7d004000 {
 		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@
 		status = "disabled";
 	};
 
-	phy2: usb-phy@0,7d004000 {
+	phy2: usb-phy@7d004000 {
 		compatible = "nvidia,tegra210-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d004000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
-- 
2.8.0
