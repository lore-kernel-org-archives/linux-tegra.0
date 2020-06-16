From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 53/73] arm64: tegra: Remove simple regulators bus
Date: Tue, 16 Jun 2020 15:52:18 +0200
Message-ID: <20200616135238.3001888-54-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The standard way to do this is to list out the regulators at the top-
level. Adopt the standard way to fix validation.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 247 ++++++------
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  81 ++--
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  60 ++-
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  96 ++---
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  23 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 274 +++++++------
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 361 ++++++++----------
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 177 ++++-----
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 137 +++----
 9 files changed, 671 insertions(+), 785 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 278bef2d8810..607d28a6772e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1055,142 +1055,139 @@ panel: panel {
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
+	vdd_mux: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_MUX";
+		regulator-min-microvolt = <19000000>;
+		regulator-max-microvolt = <19000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		vdd_mux: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "+VDD_MUX";
-			regulator-min-microvolt = <19000000>;
-			regulator-max-microvolt = <19000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_5v0_sys: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "+5V_SYS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			vin-supply = <&vdd_mux>;
-		};
+	vdd_3v3_sys: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_3v3_sys: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "+3.3V_SYS";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			vin-supply = <&vdd_mux>;
-		};
+	vdd_3v3_run: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_RUN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_3v3_run: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "+3.3V_RUN";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_hdmi: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_run>;
+	};
 
-		vdd_3v3_hdmi: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_led: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_LED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_led: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "+VDD_LED";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_mux>;
-		};
+	vdd_usb1_vbus: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_HS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb1_vbus: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "+5V_USB_HS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb3_vbus: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_SS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb3_vbus: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "+5V_USB_SS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_3v3_panel: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_PANEL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&as3722 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_3v3_panel: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "+3.3V_PANEL";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&as3722 4 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_hdmi_pll: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL_AP_GATE";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		vin-supply = <&vdd_1v05_run>;
+	};
 
-		vdd_hdmi_pll: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL_AP_GATE";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
-			vin-supply = <&vdd_1v05_run>;
-		};
+	vdd_5v0_hdmi: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_5v0_hdmi: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "+5V_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_ts: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_VDD_TS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_5v0_ts: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			regulator-name = "+5V_VDD_TS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_3v3_lp0: regulator@12 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_LP0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/*
+		 * TODO: find a way to wire this up with the USB EHCI
+		 * controllers so that it can be enabled on demand.
+		 */
+		regulator-always-on;
+		gpio = <&as3722 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 37ec15a14c77..43b8d643e7a1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -333,62 +333,51 @@ volume-down {
 		};
 	};
 
-	regulators {
-		vdd_sd: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
+	vdd_sd: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_CARD_SW_PWR";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 
-			regulator-name = "SD_CARD_SW_PWR";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA186_MAIN_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			gpio = <&gpio TEGRA186_MAIN_GPIO(P, 6)
-				      GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-
-			vin-supply = <&vdd_3v3_sys>;
-		};
-
-		vdd_hdmi: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-
-			regulator-name = "VDD_HDMI_5V0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-			gpio = <&exp1 14 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+	vdd_hdmi: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_HDMI_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		gpio = <&exp1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-		vdd_usb0: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-
-			regulator-name = "VDD_USB0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			gpio = <&gpio TEGRA186_MAIN_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+	vdd_usb0: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_USB0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		gpio = <&gpio TEGRA186_MAIN_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-		vdd_usb1: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			regulator-name = "VDD_USB1";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+	vdd_usb1: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_USB1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 
-			gpio = <&gpio TEGRA186_MAIN_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+		gpio = <&gpio TEGRA186_MAIN_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		vin-supply = <&vdd_5v0_sys>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index d1ed7eee949a..b5568b9ff181 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -392,45 +392,33 @@ psci {
 		method = "smc";
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gnd: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-
-			regulator-name = "GND";
-			regulator-min-microvolt = <0>;
-			regulator-max-microvolt = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		vdd_5v0_sys: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-
-			regulator-name = "VDD_5V0_SYS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	gnd: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "GND";
+		regulator-min-microvolt = <0>;
+		regulator-max-microvolt = <0>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		vdd_1v8_ap: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-			regulator-name = "VDD_1V8_AP";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+	vdd_1v8_ap: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AP";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			vin-supply = <&vdd_1v8>;
-		};
+		vin-supply = <&vdd_1v8>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 442e333ac13f..6f2c0754c870 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -293,65 +293,49 @@ temperature-sensor@4c {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v0_sys: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-
-			regulator-name = "VIN_SYS_5V0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		vdd_hdmi: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-
-			regulator-name = "VDD_5V0_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA194_MAIN_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
-
-		vdd_3v3_pcie: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-
-			regulator-name = "PEX_3V3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
-			regulator-boot-on;
-			enable-active-high;
-		};
+	vdd_5v0_sys: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		vdd_12v_pcie: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
+	vdd_hdmi: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-			regulator-name = "VDD_12V";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&gpio TEGRA194_MAIN_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
-			regulator-boot-on;
-		};
+	vdd_3v3_pcie: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "PEX_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 
-		vdd_5v_sata: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
+	vdd_12v_pcie: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_12V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+	};
 
-			regulator-name = "VDD_5V_SATA";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_5v_sata: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V_SATA";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 8a4ba371ff92..d818fac3070c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -335,18 +335,15 @@ psci {
 		method = "smc";
 	};
 
-	regulators {
-		vdd_gpu: regulator@100 {
-			compatible = "pwm-regulator";
-			reg = <100>;
-			pwms = <&pwm 1 4880>;
-			regulator-name = "VDD_GPU";
-			regulator-min-microvolt = <710000>;
-			regulator-max-microvolt = <1320000>;
-			enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
-			regulator-ramp-delay = <80>;
-			regulator-enable-ramp-delay = <2000>;
-			regulator-settling-time-us = <160>;
-		};
+	vdd_gpu: regulator@100 {
+		compatible = "pwm-regulator";
+		pwms = <&pwm 1 4880>;
+		regulator-name = "VDD_GPU";
+		regulator-min-microvolt = <710000>;
+		regulator-max-microvolt = <1320000>;
+		enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		regulator-ramp-delay = <80>;
+		regulator-enable-ramp-delay = <2000>;
+		regulator-settling-time-us = <160>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index fb0db05647c4..4771c1668825 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1518,152 +1518,6 @@ usb@700d0000 {
 		hvdd-usb-supply = <&vdd_1v8>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_sys_mux: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "VDD_SYS_MUX";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		vdd_5v0_sys: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "VDD_5V0_SYS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_sys_mux>;
-		};
-
-		vdd_3v3_sys: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "VDD_3V3_SYS";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_sys_mux>;
-
-			regulator-enable-ramp-delay = <160>;
-			regulator-disable-ramp-delay = <10000>;
-		};
-
-		vdd_5v0_io: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "VDD_5V0_IO_SYS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		vdd_3v3_sd: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "VDD_3V3_SD";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-
-			regulator-enable-ramp-delay = <472>;
-			regulator-disable-ramp-delay = <4880>;
-		};
-
-		vdd_dsi_csi: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "AVDD_DSI_CSI_1V2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			vin-supply = <&vdd_sys_1v2>;
-		};
-
-		vdd_3v3_dis: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "VDD_DIS_3V3_LCD";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
-
-		vdd_1v8_dis: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "VDD_LCD_1V8_DIS";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			gpio = <&exp1 14 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_1v8>;
-		};
-
-		vdd_5v0_rtl: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "RTL_5V";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
-
-		vdd_usb_vbus: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "USB_VBUS_EN1";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
-
-		vdd_usb_vbus_otg: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "USB_VBUS_EN0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
-
-		vdd_hdmi: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "VDD_HDMI_5V0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&exp1 12 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -1687,4 +1541,132 @@ volume_up {
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+
+	vdd_sys_mux: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SYS_MUX";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_sys_mux>;
+	};
+
+	vdd_3v3_sys: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_sys_mux>;
+
+		regulator-enable-ramp-delay = <160>;
+		regulator-disable-ramp-delay = <10000>;
+	};
+
+	vdd_5v0_io: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_IO_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3_sd: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+
+		regulator-enable-ramp-delay = <472>;
+		regulator-disable-ramp-delay = <4880>;
+	};
+
+	vdd_dsi_csi: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_DSI_CSI_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_sys_1v2>;
+	};
+
+	vdd_3v3_dis: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_DIS_3V3_LCD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
+	vdd_1v8_dis: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_LCD_1V8_DIS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		gpio = <&exp1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8>;
+	};
+
+	vdd_5v0_rtl: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "RTL_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_usb_vbus: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS_EN1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_usb_vbus_otg: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS_EN0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	vdd_hdmi: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_HDMI_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&exp1 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 9f81cabdcbb6..a348789bc5e1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1635,223 +1635,198 @@ psci {
 		method = "smc";
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		device_type = "fixed-regulators";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		battery_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd-ac-bat";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	battery_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-ac-bat";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		vdd_3v3: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd-3v3";
-			regulator-enable-ramp-delay = <160>;
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-
-			gpio = <&max77620 3 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_3v3: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-enable-ramp-delay = <160>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 
-		max77620_gpio7: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "max77620-gpio7";
-			regulator-enable-ramp-delay = <240>;
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			vin-supply = <&max77620_ldo0>;
-			regulator-always-on;
-			regulator-boot-on;
-
-			gpio = <&max77620 7 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		lcd_bl_en: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "lcd-bl-en";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-boot-on;
+	max77620_gpio7: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "max77620-gpio7";
+		regulator-enable-ramp-delay = <240>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&max77620_ldo0>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-			gpio = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	lcd_bl_en: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd-bl-en";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
 
-		en_vdd_sd: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "en-vdd-sd";
-			regulator-enable-ramp-delay = <472>;
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3>;
-
-			gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		gpio = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		en_vdd_cam: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "en-vdd-cam";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+	en_vdd_sd: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "en-vdd-sd";
+		regulator-enable-ramp-delay = <472>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3>;
 
-			gpio = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_sys_boost: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "vdd-sys-boost";
-			regulator-enable-ramp-delay = <3090>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-
-			gpio = <&max77620 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	en_vdd_cam: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "en-vdd-cam";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 
-		vdd_hdmi: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "vdd-hdmi";
-			regulator-enable-ramp-delay = <468>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			vin-supply = <&vdd_sys_boost>;
-			regulator-boot-on;
-
-			gpio = <&gpio TEGRA_GPIO(CC, 7) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		gpio = <&gpio TEGRA_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		en_vdd_cpu_fixed: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "vdd-cpu-fixed";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
+	vdd_sys_boost: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-sys-boost";
+		regulator-enable-ramp-delay = <3090>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 
-		vdd_aux_3v3: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "aux-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_snsr_pm: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "snsr_pm";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
+	vdd_hdmi: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-hdmi";
+		regulator-enable-ramp-delay = <468>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vdd_sys_boost>;
+		regulator-boot-on;
+
+		gpio = <&gpio TEGRA_GPIO(CC, 7) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-			enable-active-high;
-		};
+	en_vdd_cpu_fixed: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpu-fixed";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+	};
 
-		vdd_usb_5v0: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			status = "disabled";
-			regulator-name = "vdd-usb-5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			vin-supply = <&vdd_3v3>;
+	vdd_aux_3v3: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "aux-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 
-			enable-active-high;
-		};
+	vdd_snsr_pm: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "snsr_pm";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 
-		vdd_cdc_1v2_aud: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			status = "disabled";
-			regulator-name = "vdd_cdc_1v2_aud";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			startup-delay-us = <250000>;
+		enable-active-high;
+	};
 
-			enable-active-high;
-		};
+	vdd_usb_5v0: regulator@11 {
+		compatible = "regulator-fixed";
+		status = "disabled";
+		regulator-name = "vdd-usb-5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vdd_3v3>;
 
-		vdd_disp_3v0: regulator@12 {
-			compatible = "regulator-fixed";
-			reg = <12>;
-			regulator-name = "vdd-disp-3v0";
-			regulator-enable-ramp-delay = <232>;
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-always-on;
-
-			gpio = <&gpio TEGRA_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		enable-active-high;
+	};
 
-		vdd_fan: regulator@13 {
-			compatible = "regulator-fixed";
-			reg = <13>;
-			regulator-name = "vdd-fan";
-			regulator-enable-ramp-delay = <284>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+	vdd_cdc_1v2_aud: regulator@101 {
+		compatible = "regulator-fixed";
+		status = "disabled";
+		regulator-name = "vdd_cdc_1v2_aud";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		startup-delay-us = <250000>;
 
-			gpio = <&gpio TEGRA_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+		enable-active-high;
+	};
 
-		usb_vbus1: regulator@14 {
-			compatible = "regulator-fixed";
-			reg = <14>;
-			regulator-name = "usb-vbus1";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+	vdd_disp_3v0: regulator@12 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-disp-3v0";
+		regulator-enable-ramp-delay = <232>;
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		regulator-always-on;
 
-			gpio = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-		};
+		gpio = <&gpio TEGRA_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		usb_vbus2: regulator@15 {
-			compatible = "regulator-fixed";
-			reg = <15>;
-			regulator-name = "usb-vbus2";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+	vdd_fan: regulator@13 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-fan";
+		regulator-enable-ramp-delay = <284>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 
-			gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-		};
+		gpio = <&gpio TEGRA_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_3v3_eth: regulator@16 {
-			compatible = "regulator-fixed";
-			reg = <16>;
-			regulator-name = "vdd-3v3-eth-a02";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-
-			gpio = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-		};
+	usb_vbus1: regulator@14 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+	};
+
+	usb_vbus2: regulator@15 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+	};
+
+	vdd_3v3_eth: regulator@16 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3-eth-a02";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index b888efcea86f..d7a4eced0149 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -683,120 +683,109 @@ psci {
 		method = "smc";
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v0_sys: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-
-			regulator-name = "VDD_5V0_SYS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vdd_5v0_sys: regulator@0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD_5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		vdd_3v3_sys: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "VDD_3V3_SYS";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-enable-ramp-delay = <240>;
-			regulator-disable-ramp-delay = <11340>;
-			regulator-always-on;
-			regulator-boot-on;
-
-			gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_3v3_sys: regulator@1 {
+		compatible = "regulator-fixed";
 
-		vdd_3v3_sd: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
+		regulator-name = "VDD_3V3_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <240>;
+		regulator-disable-ramp-delay = <11340>;
+		regulator-always-on;
+		regulator-boot-on;
 
-			regulator-name = "VDD_3V3_SD";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
+		gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			gpio = <&gpio TEGRA_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_sd: regulator@2 {
+		compatible = "regulator-fixed";
 
-		vdd_hdmi: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 
-			regulator-name = "VDD_HDMI_5V0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_hub_3v3: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
+	vdd_hdmi: regulator@3 {
+		compatible = "regulator-fixed";
 
-			regulator-name = "VDD_HUB_3V3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
+		regulator-name = "VDD_HDMI_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 
-			gpio = <&gpio TEGRA_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_hub_3v3: regulator@4 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD_HUB_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 
-		vdd_cpu: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
+		gpio = <&gpio TEGRA_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-			regulator-name = "VDD_CPU";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			gpio = <&pmic 5 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+	vdd_cpu: regulator@5 {
+		compatible = "regulator-fixed";
 
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		regulator-name = "VDD_CPU";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
 
-		vdd_gpu: regulator@6 {
-			compatible = "pwm-regulator";
-			reg = <6>;
-			pwms = <&pwm 1 4880>;
-			regulator-name = "VDD_GPU";
-			regulator-min-microvolt = <710000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-ramp-delay = <80>;
-			regulator-enable-ramp-delay = <2000>;
-			regulator-settling-time-us = <160>;
-			enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+		gpio = <&pmic 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 
-		avdd_io_edp_1v05: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-			regulator-name = "AVDD_IO_EDP_1V05";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
+	vdd_gpu: regulator@6 {
+		compatible = "pwm-regulator";
+		pwms = <&pwm 1 4880>;
 
-			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
+		regulator-name = "VDD_GPU";
+		regulator-min-microvolt = <710000>;
+		regulator-max-microvolt = <1320000>;
+		regulator-ramp-delay = <80>;
+		regulator-enable-ramp-delay = <2000>;
+		regulator-settling-time-us = <160>;
 
-			vin-supply = <&avdd_1v05_pll>;
-		};
+		enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
+	avdd_io_edp_1v05: regulator@7 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "AVDD_IO_EDP_1V05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&avdd_1v05_pll>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index a28ca6620b86..cc0d7b4a5834 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1803,88 +1803,73 @@ psci {
 		method = "smc";
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		device_type = "fixed-regulators";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ppvar_sys: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "PPVAR_SYS";
-			regulator-min-microvolt = <4400000>;
-			regulator-max-microvolt = <4400000>;
-			regulator-always-on;
-		};
+	ppvar_sys: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "PPVAR_SYS";
+		regulator-min-microvolt = <4400000>;
+		regulator-max-microvolt = <4400000>;
+		regulator-always-on;
+	};
 
-		pplcd_vdd: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "PPLCD_VDD";
-			regulator-min-microvolt = <4400000>;
-			regulator-max-microvolt = <4400000>;
-			gpio = <&gpio TEGRA_GPIO(V, 4) 0>;
-			enable-active-high;
-			regulator-boot-on;
-		};
+	pplcd_vdd: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "PPLCD_VDD";
+		regulator-min-microvolt = <4400000>;
+		regulator-max-microvolt = <4400000>;
+		gpio = <&gpio TEGRA_GPIO(V, 4) 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 
-		pp3000_always: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "PP3000_ALWAYS";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-always-on;
-		};
+	pp3000_always: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "PP3000_ALWAYS";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		regulator-always-on;
+	};
 
-		pp3300: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "PP3300";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			regulator-always-on;
-			enable-active-high;
-		};
+	pp3300: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PP3300";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+	};
 
-		pp5000: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "PP5000";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	pp5000: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "PP5000";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		pp1800_lcdio: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "PP1800_LCDIO";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&gpio TEGRA_GPIO(V, 3) 0>;
-			enable-active-high;
-			regulator-boot-on;
-		};
+	pp1800_lcdio: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "PP1800_LCDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(V, 3) 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 
-		pp1800_cam: regulator@6 {
-			compatible = "regulator-fixed";
-			reg= <6>;
-			regulator-name = "PP1800_CAM";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&gpio TEGRA_GPIO(K, 3) 0>;
-			enable-active-high;
-		};
+	pp1800_cam: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "PP1800_CAM";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(K, 3) 0>;
+		enable-active-high;
+	};
 
-		usbc_vbus: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "USBC_VBUS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	usbc_vbus: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "USBC_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 	};
 };
-- 
2.24.1
