From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Remove 0, prefix from unit-addresses
Date: Mon, 11 Apr 2016 16:01:11 +0200
Message-ID: <1460383271-27306-2-git-send-email-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   6 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts      |  57 ++++++------
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi   |   6 +-
 arch/arm/boot/dts/tegra124-nyan-big.dts        |   4 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |   6 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts      |   2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi           |  58 ++++++------
 arch/arm/boot/dts/tegra124-venice2.dts         |  58 ++++++------
 arch/arm/boot/dts/tegra124.dtsi                | 120 ++++++++++++-------------
 9 files changed, 159 insertions(+), 158 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
index 2c5cede686dc..accb7055165a 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
@@ -1,5 +1,5 @@
 / {
-	clock@0,60006000 {
+	clock@60006000 {
 		emc-timings-3 {
 			nvidia,ram-code = <3>;
 
@@ -78,7 +78,7 @@
 		};
 	};
 
-	emc@0,7001b000 {
+	emc@7001b000 {
 		emc-timings-3 {
 			nvidia,ram-code = <3>;
 
@@ -2101,7 +2101,7 @@
 		};
 	};
 
-	memory-controller@0,70019000 {
+	memory-controller@70019000 {
 		emc-timings-3 {
 			nvidia,ram-code = <3>;
 
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 66b4451eb2ca..0bfe76a26d2a 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -10,8 +10,9 @@
 	compatible = "nvidia,jetson-tk1", "nvidia,tegra124";
 
 	aliases {
-		rtc0 = "/i2c@0,7000d000/pmic@40";
-		rtc1 = "/rtc@0,7000e000";
+		rtc0 = "/i2c@7000d000/pmic@40";
+		rtc1 = "/rtc@7000e000";
+
 		serial0 = &uartd;
 	};
 
@@ -19,7 +20,7 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
-	pcie-controller@0,01003000 {
+	pcie-controller@01003000 {
 		status = "okay";
 
 		avddio-pex-supply = <&vdd_1v05_run>;
@@ -39,8 +40,8 @@
 		};
 	};
 
-	host1x@0,50000000 {
-		hdmi@0,54280000 {
+	host1x@50000000 {
+		hdmi@54280000 {
 			status = "okay";
 
 			hdmi-supply = <&vdd_5v0_hdmi>;
@@ -53,7 +54,7 @@
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
@@ -61,7 +62,7 @@
 		vdd-supply = <&vdd_gpu>;
 	};
 
-	pinmux: pinmux@0,70000868 {
+	pinmux: pinmux@70000868 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
 
@@ -1368,12 +1369,12 @@
 	};
 
 	/* DB9 serial port */
-	serial@0,70006300 {
+	serial@70006300 {
 		status = "okay";
 	};
 
 	/* Expansion GEN1_I2C_*, mini-PCIe I2C, on-board components */
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
@@ -1401,25 +1402,25 @@
 	};
 
 	/* Expansion GEN2_I2C_* */
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
 	/* Expansion CAM_I2C_* */
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
 	/* HDMI DDC */
-	hdmi_ddc: i2c@0,7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
 	/* Expansion PWR_I2C_*, on-board components */
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -1610,12 +1611,12 @@
 	};
 
 	/* Expansion TS_SPI_* */
-	spi@0,7000d400 {
+	spi@7000d400 {
 		status = "okay";
 	};
 
 	/* Internal SPI */
-	spi@0,7000da00 {
+	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@0 {
@@ -1625,7 +1626,7 @@
 		};
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <500>;
@@ -1644,7 +1645,7 @@
 	};
 
 	/* Serial ATA */
-	sata@0,70020000 {
+	sata@70020000 {
 		status = "okay";
 
 		hvdd-supply = <&vdd_3v3_lp0>;
@@ -1655,11 +1656,11 @@
 		target-12v-supply = <&vdd_12v0_sata>;
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		status = "okay";
 	};
 
-	padctl@0,7009f000 {
+	padctl@7009f000 {
 		pinctrl-0 = <&padctl_default>;
 		pinctrl-names = "default";
 
@@ -1686,7 +1687,7 @@
 	};
 
 	/* SD card */
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -1696,40 +1697,40 @@
 	};
 
 	/* eMMC */
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
 	};
 
 	/* CPU DFLL clock */
-	clock@0,70110000 {
+	clock@70110000 {
 		status = "okay";
 		vdd-cpu-supply = <&vdd_cpu>;
 		nvidia,i2c-fs-rate = <400000>;
 	};
 
-	ahub@0,70300000 {
-		i2s@0,70301100 {
+	ahub@70300000 {
+		i2s@70301100 {
 			status = "okay";
 		};
 	};
 
 	/* mini-PCIe USB */
-	usb@0,7d004000 {
+	usb@7d004000 {
 		status = "okay";
 	};
 
-	usb-phy@0,7d004000 {
+	usb-phy@7d004000 {
 		status = "okay";
 	};
 
 	/* USB A connector */
-	usb@0,7d008000 {
+	usb@7d008000 {
 		status = "okay";
 	};
 
-	usb-phy@0,7d008000 {
+	usb-phy@7d008000 {
 		status = "okay";
 		vbus-supply = <&vdd_usb3_vbus>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index 1a5748d05dda..4458e86b2769 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -1,5 +1,5 @@
 / {
-	clock@0,60006000 {
+	clock@60006000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
@@ -67,7 +67,7 @@
 		};
 	};
 
-	emc@0,7001b000 {
+	emc@7001b000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
@@ -1754,7 +1754,7 @@
 		};
 	};
 
-	memory-controller@0,70019000 {
+	memory-controller@70019000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 2d21253ea4e3..67d7cfb32541 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -15,7 +15,7 @@
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	sdhci@0,700b0400 { /* SD Card on this bus */
+	sdhci@700b0400 { /* SD Card on this bus */
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
 	};
 
@@ -26,7 +26,7 @@
 		nvidia,model = "GoogleNyanBig";
 	};
 
-	pinmux@0,70000868 {
+	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
index 9ecd108f56cf..4e7b59e25728 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
@@ -1,5 +1,5 @@
 / {
-	clock@0,60006000 {
+	clock@60006000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
@@ -67,7 +67,7 @@
 		};
 	};
 
-	emc@0,7001b000 {
+	emc@7001b000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
@@ -1754,7 +1754,7 @@
 		};
 	};
 
-	memory-controller@0,70019000 {
+	memory-controller@70019000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index 0d30c514ffad..c9582361c26e 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -22,7 +22,7 @@
 		nvidia,model = "GoogleNyanBlaze";
 	};
 
-	pinmux@0,70000868 {
+	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index ec1aa64ded68..19bd0b9fb3f5 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -3,8 +3,8 @@
 
 / {
 	aliases {
-		rtc0 = "/i2c@0,7000d000/pmic@40";
-		rtc1 = "/rtc@0,7000e000";
+		rtc0 = "/i2c@7000d000/pmic@40";
+		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
 	};
 
@@ -12,8 +12,8 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
-	host1x@0,50000000 {
-		hdmi@0,54280000 {
+	host1x@50000000 {
+		hdmi@54280000 {
 			status = "okay";
 
 			vdd-supply = <&vdd_3v3_hdmi>;
@@ -25,29 +25,29 @@
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			status = "okay";
 
 			nvidia,dpaux = <&dpaux>;
 			nvidia,panel = <&panel>;
 		};
 
-		dpaux@0,545c0000 {
+		dpaux@545c0000 {
 			vdd-supply = <&vdd_3v3_panel>;
 			status = "okay";
 		};
 	};
 
-	serial@0,70006000 {
+	serial@70006000 {
 		/* Debug connector on the bottom of the board near SD card. */
 		status = "okay";
 	};
 
-	pwm@0,7000a000 {
+	pwm@7000a000 {
 		status = "okay";
 	};
 
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
@@ -68,7 +68,7 @@
 		};
 	};
 
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <100000>;
 
@@ -81,7 +81,7 @@
 		};
 	};
 
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -91,12 +91,12 @@
 		};
 	};
 
-	hdmi_ddc: i2c@0,7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -297,7 +297,7 @@
 		};
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		status = "okay";
 
 		cros_ec: cros-ec@0 {
@@ -338,7 +338,7 @@
 		};
 	};
 
-	spi@0,7000da00 {
+	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
 
@@ -349,7 +349,7 @@
 		};
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
 		nvidia,cpu-pwr-good-time = <500>;
@@ -360,7 +360,7 @@
 		nvidia,sys-clock-req-active-high;
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		status = "okay";
 	};
 
@@ -370,7 +370,7 @@
 		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 
-	sdhci@0,700b0000 { /* WiFi/BT on this bus */
+	sdhci@700b0000 { /* WiFi/BT on this bus */
 		status = "okay";
 		bus-width = <4>;
 		no-1-8-v;
@@ -381,7 +381,7 @@
 		keep-power-in-suspend;
 	};
 
-	sdhci@0,700b0400 { /* SD Card on this bus */
+	sdhci@700b0400 { /* SD Card on this bus */
 		status = "okay";
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
@@ -390,7 +390,7 @@
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@0,700b0600 { /* eMMC on this bus */
+	sdhci@700b0600 { /* eMMC on this bus */
 		status = "okay";
 		bus-width = <8>;
 		no-1-8-v;
@@ -398,41 +398,41 @@
 	};
 
 	/* CPU DFLL clock */
-	clock@0,70110000 {
+	clock@70110000 {
 		status = "disabled";
 		vdd-cpu-supply = <&vdd_cpu>;
 		nvidia,i2c-fs-rate = <400000>;
 	};
 
-	ahub@0,70300000 {
-		i2s@0,70301100 {
+	ahub@70300000 {
+		i2s@70301100 {
 			status = "okay";
 		};
 	};
 
-	usb@0,7d000000 { /* Rear external USB port. */
+	usb@7d000000 { /* Rear external USB port. */
 		status = "okay";
 	};
 
-	usb-phy@0,7d000000 {
+	usb-phy@7d000000 {
 		status = "okay";
 		vbus-supply = <&vdd_usb1_vbus>;
 	};
 
-	usb@0,7d004000 { /* Internal webcam. */
+	usb@7d004000 { /* Internal webcam. */
 		status = "okay";
 	};
 
-	usb-phy@0,7d004000 {
+	usb-phy@7d004000 {
 		status = "okay";
 		vbus-supply = <&vdd_run_cam>;
 	};
 
-	usb@0,7d008000 { /* Left external USB port. */
+	usb@7d008000 { /* Left external USB port. */
 		status = "okay";
 	};
 
-	usb-phy@0,7d008000 {
+	usb-phy@7d008000 {
 		status = "okay";
 		vbus-supply = <&vdd_usb3_vbus>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index cfbdf429b45d..3c357cdc8efb 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -8,8 +8,8 @@
 	compatible = "nvidia,venice2", "nvidia,tegra124";
 
 	aliases {
-		rtc0 = "/i2c@0,7000d000/pmic@40";
-		rtc1 = "/rtc@0,7000e000";
+		rtc0 = "/i2c@7000d000/pmic@40";
+		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
 	};
 
@@ -17,8 +17,8 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
-	host1x@0,50000000 {
-		hdmi@0,54280000 {
+	host1x@50000000 {
+		hdmi@54280000 {
 			status = "okay";
 
 			vdd-supply = <&vdd_3v3_hdmi>;
@@ -30,20 +30,20 @@
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			status = "okay";
 
 			nvidia,dpaux = <&dpaux>;
 			nvidia,panel = <&panel>;
 		};
 
-		dpaux@0,545c0000 {
+		dpaux@545c0000 {
 			vdd-supply = <&vdd_3v3_panel>;
 			status = "okay";
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
@@ -51,7 +51,7 @@
 		vdd-supply = <&vdd_gpu>;
 	};
 
-	pinmux: pinmux@0,70000868 {
+	pinmux: pinmux@70000868 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&pinmux_boot>;
 
@@ -592,15 +592,15 @@
 		};
 	};
 
-	serial@0,70006000 {
+	serial@70006000 {
 		status = "okay";
 	};
 
-	pwm@0,7000a000 {
+	pwm@7000a000 {
 		status = "okay";
 	};
 
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
@@ -612,7 +612,7 @@
 		};
 	};
 
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <100000>;
 
@@ -625,17 +625,17 @@
 		};
 	};
 
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
-	hdmi_ddc: i2c@0,7000c700 {
+	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -830,7 +830,7 @@
 		};
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		status = "okay";
 
 		cros_ec: cros-ec@0 {
@@ -870,7 +870,7 @@
 		};
 	};
 
-	spi@0,7000da00 {
+	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@0 {
@@ -880,7 +880,7 @@
 		};
 	};
 
-	pmc@0,7000e400 {
+	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <500>;
@@ -891,11 +891,11 @@
 		nvidia,sys-clock-req-active-high;
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		status = "okay";
 	};
 
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
@@ -904,41 +904,41 @@
 		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
 	};
 
-	ahub@0,70300000 {
-		i2s@0,70301100 {
+	ahub@70300000 {
+		i2s@70301100 {
 			status = "okay";
 		};
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
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 68669f791c8b..9ea9f8fc1ce8 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -15,7 +15,7 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	pcie-controller@0,01003000 {
+	pcie-controller@01003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
 		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
@@ -81,7 +81,7 @@
 		};
 	};
 
-	host1x@0,50000000 {
+	host1x@50000000 {
 		compatible = "nvidia,tegra124-host1x", "simple-bus";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
@@ -95,7 +95,7 @@
 
 		ranges = <0 0x54000000 0 0x54000000 0 0x01000000>;
 
-		dc@0,54200000 {
+		dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -110,7 +110,7 @@
 			nvidia,head = <0>;
 		};
 
-		dc@0,54240000 {
+		dc@54240000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -125,7 +125,7 @@
 			nvidia,head = <1>;
 		};
 
-		hdmi@0,54280000 {
+		hdmi@54280000 {
 			compatible = "nvidia,tegra124-hdmi";
 			reg = <0x0 0x54280000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -137,7 +137,7 @@
 			status = "disabled";
 		};
 
-		sor@0,54540000 {
+		sor@54540000 {
 			compatible = "nvidia,tegra124-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -151,7 +151,7 @@
 			status = "disabled";
 		};
 
-		dpaux: dpaux@0,545c0000 {
+		dpaux: dpaux@545c0000 {
 			compatible = "nvidia,tegra124-dpaux";
 			reg = <0x0 0x545c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
@@ -164,7 +164,7 @@
 		};
 	};
 
-	gic: interrupt-controller@0,50041000 {
+	gic: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -177,7 +177,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		compatible = "nvidia,gk20a";
 		reg = <0x0 0x57000000 0x0 0x01000000>,
 		      <0x0 0x58000000 0x0 0x01000000>;
@@ -207,7 +207,7 @@
 		interrupt-parent = <&gic>;
 	};
 
-	timer@0,60005000 {
+	timer@60005000 {
 		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -219,7 +219,7 @@
 		clocks = <&tegra_car TEGRA124_CLK_TIMER>;
 	};
 
-	tegra_car: clock@0,60006000 {
+	tegra_car: clock@60006000 {
 		compatible = "nvidia,tegra124-car";
 		reg = <0x0 0x60006000 0x0 0x1000>;
 		#clock-cells = <1>;
@@ -227,12 +227,12 @@
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
@@ -243,7 +243,7 @@
 		reset-names = "actmon";
 	};
 
-	gpio: gpio@0,6000d000 {
+	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra124-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
@@ -263,7 +263,7 @@
 		*/
 	};
 
-	apbdma: dma@0,60020000 {
+	apbdma: dma@60020000 {
 		compatible = "nvidia,tegra124-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
@@ -304,13 +304,13 @@
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
@@ -325,7 +325,7 @@
 	 * the APB DMA based serial driver, the comptible is
 	 * "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart".
 	 */
-	uarta: serial@0,70006000 {
+	uarta: serial@70006000 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006000 0x0 0x40>;
 		reg-shift = <2>;
@@ -338,7 +338,7 @@
 		status = "disabled";
 	};
 
-	uartb: serial@0,70006040 {
+	uartb: serial@70006040 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006040 0x0 0x40>;
 		reg-shift = <2>;
@@ -351,7 +351,7 @@
 		status = "disabled";
 	};
 
-	uartc: serial@0,70006200 {
+	uartc: serial@70006200 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006200 0x0 0x40>;
 		reg-shift = <2>;
@@ -364,7 +364,7 @@
 		status = "disabled";
 	};
 
-	uartd: serial@0,70006300 {
+	uartd: serial@70006300 {
 		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x70006300 0x0 0x40>;
 		reg-shift = <2>;
@@ -377,7 +377,7 @@
 		status = "disabled";
 	};
 
-	pwm: pwm@0,7000a000 {
+	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra124-pwm", "nvidia,tegra20-pwm";
 		reg = <0x0 0x7000a000 0x0 0x100>;
 		#pwm-cells = <2>;
@@ -387,7 +387,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c000 {
+	i2c@7000c000 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -402,7 +402,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c400 {
+	i2c@7000c400 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -417,7 +417,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c500 {
+	i2c@7000c500 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -432,7 +432,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000c700 {
+	i2c@7000c700 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
@@ -447,7 +447,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d000 {
+	i2c@7000d000 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -462,7 +462,7 @@
 		status = "disabled";
 	};
 
-	i2c@0,7000d100 {
+	i2c@7000d100 {
 		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -477,7 +477,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d400 {
+	spi@7000d400 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d400 0x0 0x200>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
@@ -492,7 +492,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d600 {
+	spi@7000d600 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d600 0x0 0x200>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000d800 {
+	spi@7000d800 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000d800 0x0 0x200>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -522,7 +522,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000da00 {
+	spi@7000da00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000da00 0x0 0x200>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -537,7 +537,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000dc00 {
+	spi@7000dc00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000dc00 0x0 0x200>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
@@ -552,7 +552,7 @@
 		status = "disabled";
 	};
 
-	spi@0,7000de00 {
+	spi@7000de00 {
 		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
 		reg = <0x0 0x7000de00 0x0 0x200>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -567,21 +567,21 @@
 		status = "disabled";
 	};
 
-	rtc@0,7000e000 {
+	rtc@7000e000 {
 		compatible = "nvidia,tegra124-rtc", "nvidia,tegra20-rtc";
 		reg = <0x0 0x7000e000 0x0 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_RTC>;
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
@@ -590,7 +590,7 @@
 		reset-names = "fuse";
 	};
 
-	mc: memory-controller@0,70019000 {
+	mc: memory-controller@70019000 {
 		compatible = "nvidia,tegra124-mc";
 		reg = <0x0 0x70019000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_MC>;
@@ -601,14 +601,14 @@
 		#iommu-cells = <1>;
 	};
 
-	emc: emc@0,7001b000 {
+	emc: emc@7001b000 {
 		compatible = "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 
 		nvidia,memory-controller = <&mc>;
 	};
 
-	sata@0,70020000 {
+	sata@70020000 {
 		compatible = "nvidia,tegra124-ahci";
 		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
 		      <0x0 0x70020000 0x0 0x7000>; /* SATA */
@@ -627,7 +627,7 @@
 		status = "disabled";
 	};
 
-	hda@0,70030000 {
+	hda@70030000 {
 		compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -642,7 +642,7 @@
 		status = "disabled";
 	};
 
-	padctl: padctl@0,7009f000 {
+	padctl: padctl@7009f000 {
 		compatible = "nvidia,tegra124-xusb-padctl";
 		reg = <0x0 0x7009f000 0x0 0x1000>;
 		resets = <&tegra_car 142>;
@@ -651,7 +651,7 @@
 		#phy-cells = <1>;
 	};
 
-	sdhci@0,700b0000 {
+	sdhci@700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -661,7 +661,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0200 {
+	sdhci@700b0200 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
@@ -671,7 +671,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0400 {
+	sdhci@700b0400 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -681,7 +681,7 @@
 		status = "disabled";
 	};
 
-	sdhci@0,700b0600 {
+	sdhci@700b0600 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
@@ -691,7 +691,7 @@
 		status = "disabled";
 	};
 
-	soctherm: thermal-sensor@0,700e2000 {
+	soctherm: thermal-sensor@700e2000 {
 		compatible = "nvidia,tegra124-soctherm";
 		reg = <0x0 0x700e2000 0x0 0x1000>;
 		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
@@ -703,7 +703,7 @@
 		#thermal-sensor-cells = <1>;
 	};
 
-	dfll: clock@0,70110000 {
+	dfll: clock@70110000 {
 		compatible = "nvidia,tegra124-dfll";
 		reg = <0 0x70110000 0 0x100>, /* DFLL control */
 		      <0 0x70110000 0 0x100>, /* I2C output control */
@@ -727,7 +727,7 @@
 		status = "disabled";
 	};
 
-	ahub@0,70300000 {
+	ahub@70300000 {
 		compatible = "nvidia,tegra124-ahub";
 		reg = <0x0 0x70300000 0x0 0x200>,
 		      <0x0 0x70300800 0x0 0x800>,
@@ -779,7 +779,7 @@
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-		tegra_i2s0: i2s@0,70301000 {
+		tegra_i2s0: i2s@70301000 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301000 0x0 0x100>;
 			nvidia,ahub-cif-ids = <4 4>;
@@ -789,7 +789,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s1: i2s@0,70301100 {
+		tegra_i2s1: i2s@70301100 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301100 0x0 0x100>;
 			nvidia,ahub-cif-ids = <5 5>;
@@ -799,7 +799,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s2: i2s@0,70301200 {
+		tegra_i2s2: i2s@70301200 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301200 0x0 0x100>;
 			nvidia,ahub-cif-ids = <6 6>;
@@ -809,7 +809,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s3: i2s@0,70301300 {
+		tegra_i2s3: i2s@70301300 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301300 0x0 0x100>;
 			nvidia,ahub-cif-ids = <7 7>;
@@ -819,7 +819,7 @@
 			status = "disabled";
 		};
 
-		tegra_i2s4: i2s@0,70301400 {
+		tegra_i2s4: i2s@70301400 {
 			compatible = "nvidia,tegra124-i2s";
 			reg = <0x0 0x70301400 0x0 0x100>;
 			nvidia,ahub-cif-ids = <8 8>;
@@ -830,7 +830,7 @@
 		};
 	};
 
-	usb@0,7d000000 {
+	usb@7d000000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
@@ -842,7 +842,7 @@
 		status = "disabled";
 	};
 
-	phy1: usb-phy@0,7d000000 {
+	phy1: usb-phy@7d000000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d000000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
@@ -867,7 +867,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d004000 {
+	usb@7d004000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
@@ -879,7 +879,7 @@
 		status = "disabled";
 	};
 
-	phy2: usb-phy@0,7d004000 {
+	phy2: usb-phy@7d004000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d004000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
@@ -903,7 +903,7 @@
 		status = "disabled";
 	};
 
-	usb@0,7d008000 {
+	usb@7d008000 {
 		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
 		reg = <0x0 0x7d008000 0x0 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
@@ -915,7 +915,7 @@
 		status = "disabled";
 	};
 
-	phy3: usb-phy@0,7d008000 {
+	phy3: usb-phy@7d008000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d008000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
-- 
2.8.0
