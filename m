From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 09/37] ARM: tegra: colibri_t20: add missing regulators
Date: Sun,  2 Sep 2018 12:08:38 +0200
Message-ID: <20180902100906.25792-10-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add missing regulators:
- reg_lan_v_bus being USB Ethernet chip vbus supply
- carrier board reg_3v3 to be used as backlight and panel power supply
- carrier board HDMI supply being reg_5v0
- reg_usbc_vbus being the USB vbus supply of the EHCI instance 0

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 28 ++++++++++++++++++++++++++--
 arch/arm/boot/dts/tegra20-colibri.dtsi     |  1 +
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 6f89a417b0f2..9f0a819c68f2 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -23,6 +23,7 @@
 	host1x@50000000 {
 		hdmi@54280000 {
 			status = "okay";
+			hdmi-supply = <&reg_5v0>;
 		};
 	};
 
@@ -88,6 +89,7 @@
 
 	usb-phy@c5000000 {
 		status = "okay";
+		vbus-supply = <&reg_usbc_vbus>;
 	};
 
 	usb@c5008000 {
@@ -96,6 +98,7 @@
 
 	usb-phy@c5008000 {
 		status = "okay";
+		vbus-supply = <&reg_usbh_vbus>;
 	};
 
 	sdhci@c8000600 {
@@ -104,14 +107,35 @@
 		no-1-8-v;
 	};
 
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_usbc_vbus: regulator-usbc-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_USB2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_5v0>;
+	};
+
 	/* USBH_PEN resp. USB_P_EN */
 	reg_usbh_vbus: regulator-usbh-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_USB1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		regulator-always-on;
 		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 1cf64f197c08..5e98f225322b 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -471,6 +471,7 @@
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
 			GPIO_ACTIVE_LOW>;
+		vbus-supply = <&reg_lan_v_bus>;
 	};
 
 	sdhci@c8000600 {
-- 
2.14.4
