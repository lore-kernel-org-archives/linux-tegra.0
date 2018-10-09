From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 3/8] ARM: tegra: apalis/colibri_t30: fix hdmi regulator
Date: Tue,  9 Oct 2018 17:25:18 +0200
Message-ID: <20181009152523.3771-4-marcel@ziswiler.com>
References: <20181009152523.3771-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009152523.3771-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix HDMI requiring two regulators being enabled by a single GPIO. Model
this using an intermediate reg_en_vdd_hdmi regulator being the
vin-supply of them other two. This fixes the display subsystem and gets
rid of the following error during boot:

 reg-fixed-voltage: probe of regulator-3v3-avdd-hdmi failed with error -16
 tegra-hdmi 54280000.hdmi: failed to get VDD regulator

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v1: None

 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 16 ++++++++++++----
 arch/arm/boot/dts/tegra30-apalis.dtsi      | 16 ++++++++++++----
 arch/arm/boot/dts/tegra30-colibri.dtsi     | 16 ++++++++++++----
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 02f8126481a2..065a24ac1052 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -1133,8 +1133,7 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_1v8_vio>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
@@ -1143,8 +1142,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_module_3v3>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_5v0_charge_pump: regulator-5v0-charge-pump {
@@ -1171,6 +1169,16 @@
 		regulator-always-on;
 	};
 
+	reg_en_vdd_hdmi: regulator-en-vdd-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "EN_VDD_HDMI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_module_3v3>;
+	};
+
 	sound {
 		compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
 			     "nvidia,tegra-audio-sgtl5000";
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 7f112f192fe9..6727c5868425 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1115,8 +1115,7 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_1v8_vio>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
@@ -1125,8 +1124,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_module_3v3>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_5v0_charge_pump: regulator-5v0-charge-pump {
@@ -1153,6 +1151,16 @@
 		regulator-always-on;
 	};
 
+	reg_en_vdd_hdmi: regulator-en-vdd-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "EN_VDD_HDMI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_module_3v3>;
+	};
+
 	sound {
 		compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
 			     "nvidia,tegra-audio-sgtl5000";
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 35af03ca9e90..963f26071415 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -965,8 +965,7 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_1v8_vio>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
@@ -975,8 +974,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&reg_module_3v3>;
+		vin-supply = <&reg_en_vdd_hdmi>;
 	};
 
 	reg_5v0_charge_pump: regulator-5v0-charge-pump {
@@ -1012,6 +1010,16 @@
 		regulator-always-on;
 	};
 
+	reg_en_vdd_hdmi: regulator-en-vdd-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "EN_VDD_HDMI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&reg_module_3v3>;
+	};
+
 	sound {
 		compatible = "toradex,tegra-audio-sgtl5000-colibri_t30",
 			     "nvidia,tegra-audio-sgtl5000";
-- 
2.14.4
