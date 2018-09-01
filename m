From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 04/34] ARM: tegra: colibri_t30: add missing regulators
Date: Sat,  1 Sep 2018 10:12:18 +0200
Message-ID: <20180901081248.22639-5-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add missing regulators:
- reg_module_3v3_audio being VDDA supply of SGTL5000
- VDDD supply of SGTL5000 actually being reg_1v8_vio
- reg_lan_v_bus being USB Ethernet chip vbus supply
- carrier board HDMI supply being reg_5v0
- carrier board reg_3v3 actually being backlight and panel power supply

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 10 ++++++++++
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 21 ++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 5eb665d89435..1c057b285153 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -29,6 +29,7 @@
 		};
 		hdmi@54280000 {
 			status = "okay";
+			hdmi-supply = <&reg_5v0>;
 		};
 	};
 
@@ -127,6 +128,7 @@
 		default-brightness-level = <6>;
 		/* BL_ON */
 		enable-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3v3>;
 	};
 
 	clocks {
@@ -159,6 +161,7 @@
 		compatible = "edt,et057090dhu", "simple-panel";
 
 		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
 	};
 
 	pwmleds {
@@ -181,6 +184,13 @@
 		};
 	};
 
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V_SW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_5v0: regulator-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "5V_SW";
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 4d7ed25bd594..dc54eb734f64 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -229,7 +229,8 @@
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
-			VDDA-supply = <&reg_module_3v3>;
+			VDDA-supply = <&reg_module_3v3_audio>;
+			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
 			clocks = <&tegra_car TEGRA30_CLK_EXTERN1>;
 		};
@@ -442,6 +443,7 @@
 	usb-phy@7d004000 {
 		status = "okay";
 		nvidia,is-wired = <1>;
+		vbus-supply = <&reg_lan_v_bus>;
 	};
 
 	clocks {
@@ -485,6 +487,15 @@
 		regulator-always-on;
 	};
 
+	reg_lan_v_bus: regulator-lan-v-bus {
+		compatible = "regulator-fixed";
+		regulator-name = "LAN_V_BUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_module_3v3: regulator-module-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+V3.3";
@@ -493,6 +504,14 @@
 		regulator-always-on;
 	};
 
+	reg_module_3v3_audio: regulator-module-3v3-audio {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_AUDIO_AVDD_S";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "toradex,tegra-audio-sgtl5000-colibri_t30",
 			     "nvidia,tegra-audio-sgtl5000";
-- 
2.14.4
