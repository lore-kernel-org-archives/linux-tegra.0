From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/73] ARM: tegra: Remove simple regulators bus
Date: Tue, 16 Jun 2020 15:51:28 +0200
Message-ID: <20200616135238.3001888-4-thierry.reding@gmail.com>
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

The standard way to do this is to list out the regulators at the top
level. Adopt the standard way to fix validation.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 129 +++++------
 arch/arm/boot/dts/tegra114-roth.dts       | 120 +++++-----
 arch/arm/boot/dts/tegra114-tn7.dts        |  65 +++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 238 +++++++++----------
 arch/arm/boot/dts/tegra124-nyan.dtsi      | 259 ++++++++++-----------
 arch/arm/boot/dts/tegra124-venice2.dts    | 265 ++++++++++------------
 arch/arm/boot/dts/tegra20-harmony.dts     | 121 +++++-----
 arch/arm/boot/dts/tegra20-medcom-wide.dts |  66 +++---
 arch/arm/boot/dts/tegra20-paz00.dts       |  38 ++--
 arch/arm/boot/dts/tegra20-plutux.dts      |  66 +++---
 arch/arm/boot/dts/tegra20-seaboard.dts    | 125 +++++-----
 arch/arm/boot/dts/tegra20-tamonten.dtsi   |  39 +---
 arch/arm/boot/dts/tegra20-tec.dts         |  66 +++---
 arch/arm/boot/dts/tegra20-trimslice.dts   |  85 +++----
 arch/arm/boot/dts/tegra20-ventana.dts     |  85 +++----
 arch/arm/boot/dts/tegra30-beaver.dts      | 193 ++++++++--------
 arch/arm/boot/dts/tegra30-cardhu-a02.dts  | 128 +++++------
 arch/arm/boot/dts/tegra30-cardhu-a04.dts  | 149 ++++++------
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 261 ++++++++++-----------
 19 files changed, 1130 insertions(+), 1368 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 04adfcb30cd7..1dfff574e371 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1187,83 +1187,70 @@ volume_up {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_ac_bat_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_ac_bat";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_ac_bat_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ac_bat";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		dvdd_ts_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "dvdd_ts";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
-		};
+	dvdd_ts_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "dvdd_ts";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+	};
 
-		usb1_vbus_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&tps65090_dcdc1_reg>;
-		};
+	usb1_vbus_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&tps65090_dcdc1_reg>;
+	};
 
-		usb3_vbus_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "usb2_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&tps65090_dcdc1_reg>;
-		};
+	usb3_vbus_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&tps65090_dcdc1_reg>;
+	};
 
-		vdd_hdmi_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "vdd_hdmi_5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			vin-supply = <&tps65090_dcdc1_reg>;
-		};
+	vdd_hdmi_reg: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_hdmi_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&tps65090_dcdc1_reg>;
+	};
 
-		vdd_cam_1v8_reg: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "vdd_cam_1v8_reg";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			enable-active-high;
-			gpio = <&palmas_gpio 6 0>;
-		};
+	vdd_cam_1v8_reg: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_cam_1v8_reg";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		gpio = <&palmas_gpio 6 0>;
+	};
 
-		vdd_5v0_hdmi: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "VDD_5V0_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&tps65090_dcdc1_reg>;
-		};
+	vdd_5v0_hdmi: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_5V0_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&tps65090_dcdc1_reg>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 73b83d51b59b..5249afdca577 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -1045,76 +1045,64 @@ power {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		lcd_bl_en: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "lcd_bl_en";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-		};
+	lcd_bl_en: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bl_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+	};
 
-		vdd_lcd: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd_lcd_1v8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			vin-supply = <&vdd_1v8>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
-			regulator-boot-on;
-		};
+	vdd_lcd: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_lcd_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_1v8>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+	};
 
-		regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vdd_1v8_ts";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_LOW>;
-			regulator-boot-on;
-		};
+	regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_ts";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+	};
 
-		regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "vdd_3v3_ts";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
-			regulator-boot-on;
-		};
+	regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_ts";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+	};
 
-		regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "vdd_1v8_com";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			vin-supply = <&vdd_1v8>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
-			regulator-boot-on;
-		};
+	regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_com";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_1v8>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+	};
 
-		regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "vdd_3v3_com";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3_sys>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_sys>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 94e801b7986e..90935db591a5 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -302,44 +302,35 @@ volume_up {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* FIXME: output of BQ24192 */
-		vs_sys: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "VS_SYS";
-			regulator-min-microvolt = <4200000>;
-			regulator-max-microvolt = <4200000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	/* FIXME: output of BQ24192 */
+	vs_sys: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VS_SYS";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		lcd_bl_en: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "VDD_LCD_BL";
-			regulator-min-microvolt = <16500000>;
-			regulator-max-microvolt = <16500000>;
-			gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vs_sys>;
-			regulator-boot-on;
-		};
+	lcd_bl_en: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_LCD_BL";
+		regulator-min-microvolt = <16500000>;
+		regulator-max-microvolt = <16500000>;
+		gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vs_sys>;
+		regulator-boot-on;
+	};
 
-		vdd_lcd: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "VD_LCD_1V8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_1v8>;
-			regulator-boot-on;
-		};
+	vdd_lcd: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VD_LCD_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8>;
+		regulator-boot-on;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 51b217a6507d..e97943871fd8 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1879,145 +1879,127 @@ power {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_mux: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "+VDD_MUX";
-			regulator-min-microvolt = <12000000>;
-			regulator-max-microvolt = <12000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vdd_mux: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_MUX";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
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
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+	vdd_3v3_sys: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_3v3_run: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "+3.3V_RUN";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_run: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_RUN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_3v3_hdmi: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_3v3_hdmi: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_run>;
+	};
 
-		vdd_usb1_vbus: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "+USB0_VBUS_SW";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb1_vbus: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "+USB0_VBUS_SW";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb3_vbus: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "+5V_USB_HS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb3_vbus: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_HS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_3v3_lp0: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "+3.3V_LP0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_lp0: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_LP0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_hdmi_pll: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
-			vin-supply = <&vdd_1v05_run>;
-		};
+	vdd_hdmi_pll: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		vin-supply = <&vdd_1v05_run>;
+	};
 
-		vdd_5v0_hdmi: regulator@12 {
-			compatible = "regulator-fixed";
-			reg = <12>;
-			regulator-name = "+5V_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_hdmi: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		/* Molex power connector */
-		vdd_5v0_sata: regulator@13 {
-			compatible = "regulator-fixed";
-			reg = <13>;
-			regulator-name = "+5V_SATA";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	/* Molex power connector */
+	vdd_5v0_sata: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_SATA";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_12v0_sata: regulator@14 {
-			compatible = "regulator-fixed";
-			reg = <14>;
-			regulator-name = "+12V_SATA";
-			regulator-min-microvolt = <12000000>;
-			regulator-max-microvolt = <12000000>;
-			gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_mux>;
-		};
+	vdd_12v0_sata: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "+12V_SATA";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_mux>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 4555d01094b5..b3b5c12cbda9 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -608,157 +608,138 @@ power {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_mux: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "+VDD_MUX";
-			regulator-min-microvolt = <12000000>;
-			regulator-max-microvolt = <12000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vdd_mux: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_MUX";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
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
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+	vdd_3v3_sys: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_3v3_run: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "+3.3V_RUN";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_run: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_RUN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_3v3_hdmi: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_3v3_hdmi: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_run>;
+	};
 
-		vdd_led: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "+VDD_LED";
-			gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_mux>;
-		};
+	vdd_led: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_LED";
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_5v0_ts: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "+5V_VDD_TS_SW";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_ts: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_VDD_TS_SW";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb1_vbus: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "+5V_USB_HS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb1_vbus: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_HS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb3_vbus: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "+5V_USB_SS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb3_vbus: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_SS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_3v3_panel: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "+3.3V_PANEL";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_3v3_panel: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_PANEL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_run>;
+	};
 
-		vdd_3v3_lp0: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "+3.3V_LP0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			/*
-			 * TODO: find a way to wire this up with the USB EHCI
-			 * controllers so that it can be enabled on demand.
-			 */
-			regulator-always-on;
-			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_lp0: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_LP0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/*
+		 * TODO: find a way to wire this up with the USB EHCI
+		 * controllers so that it can be enabled on demand.
+		 */
+		regulator-always-on;
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_hdmi_pll: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
-			vin-supply = <&vdd_1v05_run>;
-		};
+	vdd_hdmi_pll: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		vin-supply = <&vdd_1v05_run>;
+	};
 
-		vdd_5v0_hdmi: regulator@12 {
-			compatible = "regulator-fixed";
-			reg = <12>;
-			regulator-name = "+5V_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_hdmi: regulator@12 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 6a7a31c831c5..effdb303c7f7 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1077,164 +1077,145 @@ power {
 
 	panel: panel {
 		compatible = "lg,lp129qe";
-
+		power-supply = <&vdd_3v3_panel>;
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_mux: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "+VDD_MUX";
-			regulator-min-microvolt = <12000000>;
-			regulator-max-microvolt = <12000000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vdd_mux: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_MUX";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
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
+	vdd_5v0_sys: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+	vdd_3v3_sys: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_SYS";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_3v3_run: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "+3.3V_RUN";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_run: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_RUN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_3v3_hdmi: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_3v3_hdmi: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3_run>;
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
+	vdd_led: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_LED";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_mux>;
+	};
 
-		vdd_5v0_ts: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "+5V_VDD_TS_SW";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_ts: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_VDD_TS_SW";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb1_vbus: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "+5V_USB_HS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb1_vbus: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_HS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_usb3_vbus: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "+5V_USB_SS";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_usb3_vbus: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_USB_SS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_sys>;
+	};
 
-		vdd_3v3_panel: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "+3.3V_PANEL";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_run>;
-		};
+	vdd_3v3_panel: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_PANEL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_run>;
+	};
 
-		vdd_3v3_lp0: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "+3.3V_LP0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			/*
-			 * TODO: find a way to wire this up with the USB EHCI
-			 * controllers so that it can be enabled on demand.
-			 */
-			regulator-always-on;
-			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_3v3_sys>;
-		};
+	vdd_3v3_lp0: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3.3V_LP0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/*
+		 * TODO: find a way to wire this up with the USB EHCI
+		 * controllers so that it can be enabled on demand.
+		 */
+		regulator-always-on;
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
 
-		vdd_hdmi_pll: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
-			vin-supply = <&vdd_1v05_run>;
-		};
+	vdd_hdmi_pll: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		vin-supply = <&vdd_1v05_run>;
+	};
 
-		vdd_5v0_hdmi: regulator@12 {
-			compatible = "regulator-fixed";
-			reg = <12>;
-			regulator-name = "+5V_HDMI_CON";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_sys>;
-		};
+	vdd_5v0_hdmi: regulator@12 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5V_HDMI_CON";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_sys>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index bdfbe26fa26a..b051d75d4642 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -666,79 +666,66 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v0_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd_1v5";
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		};
+	regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+	};
 
-		regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vdd_1v2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		pci_vdd_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "vdd_1v05";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	pci_vdd_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_pnl_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "vdd_pnl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_pnl_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_bl_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "vdd_bl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_bl_reg: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_5v0_hdmi: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "VDDIO_HDMI";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(T, 2) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	vdd_5v0_hdmi: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_HDMI";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(T, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_reg>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index c73510cd501c..049181421a86 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -92,44 +92,38 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	regulators {
-		vcc_24v_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
-			regulator-name = "vcc_24v";
-			regulator-min-microvolt = <24000000>;
-			regulator-max-microvolt = <24000000>;
-			regulator-always-on;
-		};
+	vcc_24v_reg: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_24v";
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+		regulator-always-on;
+	};
 
-		vdd_5v0_reg: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "vdd_5v0";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		vdd_3v3_reg: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-			regulator-name = "vdd_3v3";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	vdd_3v3_reg: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		vdd_1v8_reg: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
-			regulator-name = "vdd_1v8";
-			vin-supply = <&vdd_3v3_reg>;
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	vdd_1v8_reg: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8";
+		vin-supply = <&vdd_3v3_reg>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index bfc9625a6c72..2a0e5754f50f 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -606,30 +606,22 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		p5valw_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "+5valw";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	p5valw_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "+5valw";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		vdd_pnl_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "+3VS,vdd_pnl";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			gpio = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_pnl_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+3VS,vdd_pnl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
index 429e4605fbdb..378f23b2958b 100644
--- a/arch/arm/boot/dts/tegra20-plutux.dts
+++ b/arch/arm/boot/dts/tegra20-plutux.dts
@@ -60,44 +60,38 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	regulators {
-		vcc_24v_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
-			regulator-name = "vcc_24v";
-			regulator-min-microvolt = <24000000>;
-			regulator-max-microvolt = <24000000>;
-			regulator-always-on;
-		};
+	vcc_24v_reg: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_24v";
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+		regulator-always-on;
+	};
 
-		vdd_5v0_reg: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "vdd_5v0";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		vdd_3v3_reg: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-			regulator-name = "vdd_3v3";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	vdd_3v3_reg: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		vdd_1v8_reg: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
-			regulator-name = "vdd_1v8";
-			vin-supply = <&vdd_3v3_reg>;
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	vdd_1v8_reg: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8";
+		vin-supply = <&vdd_3v3_reg>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 28dcff3b7d7e..9a1ab4bd43e0 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -828,81 +828,68 @@ panel: panel {
 		ddc-i2c-bus = <&lvds_ddc>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v0_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd_1v5";
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		};
+	regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+	};
 
-		regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vdd_1v2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vbus_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "vdd_vbus_wup1";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(D, 0) 0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vbus_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_vbus_wup1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(D, 0) 0>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		vdd_pnl_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "vdd_pnl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_pnl_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_bl_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "vdd_bl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_bl_reg: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_hdmi: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "VDDIO_HDMI";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	vdd_hdmi: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_HDMI";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_5v0_reg>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 20137fc578b1..95e6bccdb4f6 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -495,40 +495,25 @@ usb-phy@c5008000 {
 		status = "okay";
 	};
 
-	sdhci@c8000600 {
+	mmc@c8000600 {
 		cd-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 		wp-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		status = "okay";
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pci_vdd_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd_1v05";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			gpio = <&pmic 2 0>;
-			enable-active-high;
-		};
+	pci_vdd_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&pmic 2 0>;
+		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
index 4dec27737238..44ced60315de 100644
--- a/arch/arm/boot/dts/tegra20-tec.dts
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -69,44 +69,38 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	regulators {
-		vcc_24v_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
-			regulator-name = "vcc_24v";
-			regulator-min-microvolt = <24000000>;
-			regulator-max-microvolt = <24000000>;
-			regulator-always-on;
-		};
+	vcc_24v_reg: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_24v";
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+		regulator-always-on;
+	};
 
-		vdd_5v0_reg: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "vdd_5v0";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		vdd_3v3_reg: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-			regulator-name = "vdd_3v3";
-			vin-supply = <&vcc_24v_reg>;
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	vdd_3v3_reg: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		vin-supply = <&vcc_24v_reg>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		vdd_1v8_reg: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
-			regulator-name = "vdd_1v8";
-			vin-supply = <&vdd_3v3_reg>;
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	vdd_1v8_reg: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8";
+		vin-supply = <&vdd_3v3_reg>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 5b26482a55b7..4bc87bc0c2a4 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -401,58 +401,47 @@ poweroff {
 		gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		hdmi_vdd_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "avdd_hdmi";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	hdmi_vdd_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_hdmi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		hdmi_pll_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "avdd_hdmi_pll";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	hdmi_pll_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_hdmi_pll";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
 
-		vbus_reg: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(V, 2) 0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	vbus_reg: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(V, 2) 0>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 
-		pci_clk_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "pci_clk";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	pci_clk_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pci_clk";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		pci_vdd_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "pci_vdd";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			regulator-always-on;
-		};
+	pci_vdd_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pci_vdd";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-always-on;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 59998d3708a1..ccc24674be03 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -613,58 +613,47 @@ panel: panel {
 		ddc-i2c-bus = <&lvds_ddc>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v0_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v0_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vdd_1v5";
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		};
+	regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+	};
 
-		regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vdd_1v2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_pnl_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "vdd_pnl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_pnl_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 
-		vdd_bl_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "vdd_bl";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	vdd_bl_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index ef3ea08f8d19..3211c61f956c 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1984,118 +1984,103 @@ gpled2 {
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_5v_in_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_5v_in";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_5v_in_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v_in";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		chargepump_5v_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "chargepump_5v";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-			regulator-always-on;
-			enable-active-high;
-			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		};
+	chargepump_5v_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "chargepump_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+	};
 
-		ddr_reg: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "vdd_ddr";
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
-			vin-supply = <&vdd_5v_in_reg>;
-		};
+	ddr_reg: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ddr";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v_in_reg>;
+	};
 
-		vdd_5v_sata_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "vdd_5v_sata";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&vdd_5v_in_reg>;
-		};
+	vdd_5v_sata_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v_sata";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v_in_reg>;
+	};
 
-		usb1_vbus_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v_in_reg>;
-		};
+	usb1_vbus_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v_in_reg>;
+	};
 
-		usb3_vbus_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "usb3_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v_in_reg>;
-		};
+	usb3_vbus_reg: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v_in_reg>;
+	};
 
-		sys_3v3_reg: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "sys_3v3,vdd_3v3_alw";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-			vin-supply = <&vdd_5v_in_reg>;
-		};
+	sys_3v3_reg: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_3v3,vdd_3v3_alw";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vdd_5v_in_reg>;
+	};
 
-		sys_3v3_pexs_reg: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "sys_3v3_pexs";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	sys_3v3_pexs_reg: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_3v3_pexs";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_5v0_hdmi: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "+VDD_5V_HDMI";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_5v0_hdmi: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "+VDD_5V_HDMI";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&sys_3v3_reg>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
index a02ec5082287..4899e05a0d9c 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
@@ -9,87 +9,75 @@ / {
 	model = "NVIDIA Tegra30 Cardhu A02 evaluation board";
 	compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ddr_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
-			regulator-name = "vdd_ddr";
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		};
+	ddr_reg: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ddr";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+	};
 
-		sys_3v3_reg: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "sys_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
-		};
+	sys_3v3_reg: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+	};
 
-		usb1_vbus_reg: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	usb1_vbus_reg: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_reg>;
+	};
 
-		usb3_vbus_reg: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
-			regulator-name = "usb3_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	usb3_vbus_reg: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_reg>;
+	};
 
-		vdd_5v0_reg: regulator@104 {
-			compatible = "regulator-fixed";
-			reg = <104>;
-			regulator-name = "5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
-		};
+	vdd_5v0_reg: regulator@104 {
+		compatible = "regulator-fixed";
+		regulator-name = "5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+	};
 
-		vdd_bl_reg: regulator@105 {
-			compatible = "regulator-fixed";
-			reg = <105>;
-			regulator-name = "vdd_bl";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
-		};
+	vdd_bl_reg: regulator@105 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
index 9234988624ec..c1c0ca628af1 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
@@ -11,99 +11,86 @@ / {
 	model = "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board";
 	compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
 
-	sdhci@78000400 {
+	mmc@78000400 {
 		status = "okay";
 		power-gpios = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
 		keep-power-in-suspend;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ddr_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			regulator-name = "ddr";
-			reg = <100>;
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <1500000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
-		};
+	ddr_reg: regulator@100 {
+		compatible = "regulator-fixed";
+		regulator-name = "ddr";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+	};
 
-		sys_3v3_reg: regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "sys_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		};
+	sys_3v3_reg: regulator@101 {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+	};
 
-		usb1_vbus_reg: regulator@102 {
-			compatible = "regulator-fixed";
-			reg = <102>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	usb1_vbus_reg: regulator@102 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_reg>;
+	};
 
-		usb3_vbus_reg: regulator@103 {
-			compatible = "regulator-fixed";
-			reg = <103>;
-			regulator-name = "usb3_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	usb3_vbus_reg: regulator@103 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_reg>;
+	};
 
-		vdd_5v0_reg: regulator@104 {
-			compatible = "regulator-fixed";
-			reg = <104>;
-			regulator-name = "5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
-		};
+	vdd_5v0_reg: regulator@104 {
+		compatible = "regulator-fixed";
+		regulator-name = "5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
+	};
 
-		vdd_bl_reg: regulator@105 {
-			compatible = "regulator-fixed";
-			reg = <105>;
-			regulator-name = "vdd_bl";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
-		};
+	vdd_bl_reg: regulator@105 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
+	};
 
-		vdd_bl2_reg: regulator@106 {
-			compatible = "regulator-fixed";
-			reg = <106>;
-			regulator-name = "vdd_bl2";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
-		};
+	vdd_bl2_reg: regulator@106 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 	};
 
 	i2c@7000d000 {
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index c166967b6c3f..c8dc3b6ab2f6 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -434,158 +434,139 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_ac_bat_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd_ac_bat";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	vdd_ac_bat_reg: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ac_bat";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 
-		cam_1v8_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "cam_1v8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&vio_reg>;
-		};
+	cam_1v8_reg: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vio_reg>;
+	};
 
-		cp_5v_reg: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "cp_5v";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-			regulator-always-on;
-			enable-active-high;
-			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
-		};
+	cp_5v_reg: regulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cp_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+	};
 
-		emmc_3v3_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "emmc_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	emmc_3v3_reg: regulator@3 {
+		compatible = "regulator-fixed";
+		regulator-name = "emmc_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		modem_3v3_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "modem_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
-		};
+	modem_3v3_reg: regulator@4 {
+		compatible = "regulator-fixed";
+		regulator-name = "modem_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+	};
 
-		pex_hvdd_3v3_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "pex_hvdd_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	pex_hvdd_3v3_reg: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "pex_hvdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_cam1_ldo_reg: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "vdd_cam1_ldo";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_cam1_ldo_reg: regulator@6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_cam1_ldo";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_cam2_ldo_reg: regulator@7 {
-			compatible = "regulator-fixed";
-			reg = <7>;
-			regulator-name = "vdd_cam2_ldo";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_cam2_ldo_reg: regulator@7 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_cam2_ldo";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_cam3_ldo_reg: regulator@8 {
-			compatible = "regulator-fixed";
-			reg = <8>;
-			regulator-name = "vdd_cam3_ldo";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_cam3_ldo_reg: regulator@8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_cam3_ldo";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_com_reg: regulator@9 {
-			compatible = "regulator-fixed";
-			reg = <9>;
-			regulator-name = "vdd_com";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_com_reg: regulator@9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_com";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_fuse_3v3_reg: regulator@10 {
-			compatible = "regulator-fixed";
-			reg = <10>;
-			regulator-name = "vdd_fuse_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_fuse_3v3_reg: regulator@10 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fuse_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_pnl1_reg: regulator@11 {
-			compatible = "regulator-fixed";
-			reg = <11>;
-			regulator-name = "vdd_pnl1";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-boot-on;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
-			vin-supply = <&sys_3v3_reg>;
-		};
+	vdd_pnl1_reg: regulator@11 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_pnl1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		vin-supply = <&sys_3v3_reg>;
+	};
 
-		vdd_vid_reg: regulator@12 {
-			compatible = "regulator-fixed";
-			reg = <12>;
-			regulator-name = "vddio_vid";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
-			vin-supply = <&vdd_5v0_reg>;
-		};
+	vdd_vid_reg: regulator@12 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_vid";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
+		gpio-open-drain;
+		vin-supply = <&vdd_5v0_reg>;
 	};
 
 	sound {
-- 
2.24.1
