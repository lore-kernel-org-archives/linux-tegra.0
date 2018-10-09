From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 8/8] ARM: tegra: apalis_t30: further regulator clean-up
Date: Tue,  9 Oct 2018 17:25:23 +0200
Message-ID: <20181009152523.3771-9-marcel@ziswiler.com>
References: <20181009152523.3771-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009152523.3771-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename label vdd2_reg to reg_1v05.
Rename label ldo6_reg to reg_1v05_avdd_plle.
Drop unused labels.
Rename regulator tps62362-vout to +V1.2_VDD_CORE.
Reorder TPS65911 properties.
Rename +V1.05 to +V1.05_AVDD_PLLE.
Add ti,en-ck32k-xtal.
Specify TPS62362 vin-supply.
Drop spurious newline in TPS62362 properties.
Rename vddio_sdmmc_1v8_reg to reg_1v8_vddio_sdmmc3.
Rename +V1.05 to +V1.05_AVDD_PLLE.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v1: None

 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi     | 70 +++++++++++---------------
 arch/arm/boot/dts/tegra30-apalis.dtsi          | 68 +++++++++++--------------
 3 files changed, 58 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index e29dca92ba0a..34c9fcd9198f 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -251,7 +251,7 @@
 		states = <1800000 0x0
 			  3300000 0x1>;
 		startup-delay-us = <100000>;
-		vin-supply = <&vddio_sdmmc_1v8_reg>;
+		vin-supply = <&reg_1v8_vddio_sdmmc3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 05e412a7ea17..600680b5ae6c 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -13,14 +13,14 @@
 
 	pcie@3000 {
 		status = "okay";
-		avdd-pexa-supply = <&vdd2_reg>;
-		avdd-pexb-supply = <&vdd2_reg>;
-		avdd-pex-pll-supply = <&vdd2_reg>;
-		avdd-plle-supply = <&ldo6_reg>;
+		avdd-pexa-supply = <&reg_1v05>;
+		avdd-pexb-supply = <&reg_1v05>;
+		avdd-pex-pll-supply = <&reg_1v05>;
+		avdd-plle-supply = <&reg_1v05>;
 		hvdd-pex-supply = <&reg_module_3v3>;
 		vddio-pex-ctl-supply = <&reg_module_3v3>;
-		vdd-pexa-supply = <&vdd2_reg>;
-		vdd-pexb-supply = <&vdd2_reg>;
+		vdd-pexa-supply = <&reg_1v05>;
+		vdd-pexb-supply = <&reg_1v05>;
 
 		/* Apalis type specific */
 		pci@1,0 {
@@ -864,16 +864,13 @@
 		pmic: pmic@2d {
 			compatible = "ti,tps65911";
 			reg = <0x2d>;
-
+			#gpio-cells = <2>;
+			gpio-controller;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-
+			ti,en-ck32k-xtal;
 			ti,system-power-controller;
-
-			#gpio-cells = <2>;
-			gpio-controller;
-
 			vcc1-supply = <&reg_module_3v3>;
 			vcc2-supply = <&reg_module_3v3>;
 			vcc3-supply = <&reg_1v8_vio>;
@@ -884,38 +881,38 @@
 			vccio-supply = <&reg_module_3v3>;
 
 			regulators {
-				vdd1_reg: vdd1 {
+				reg_1v8_vio: vio {
+					regulator-name = "+V1.8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				vdd1 {
 					regulator-name = "+V1.35_VDDIO_DDR";
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
 				};
 
-				vdd2_reg: vdd2 {
+				reg_1v05: vdd2 {
 					regulator-name = "+V1.05";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 				};
 
-				vddctrl_reg: vddctrl {
+				vddctrl {
 					regulator-name = "+V1.0_VDD_CPU";
 					regulator-min-microvolt = <1150000>;
 					regulator-max-microvolt = <1150000>;
 					regulator-always-on;
 				};
 
-				reg_1v8_vio: vio {
-					regulator-name = "+V1.8";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
 				/*
 				 * 1.8 volt +VDDIO_SDMMC3 in case EN_+3.3_SDMMC3
 				 * is off
 				 */
-				vddio_sdmmc_1v8_reg: ldo1 {
+				reg_1v8_vddio_sdmmc3: ldo1 {
 					regulator-name = "+VDDIO_SDMMC3_1V8";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
@@ -927,20 +924,20 @@
 				 * +V3.3_AUDIO_AVDD_S, +V3.3
 				 * see also +V3.3 fixed supply
 				 */
-				ldo2_reg: ldo2 {
+				ldo2 {
 					regulator-name = "EN_+V3.3";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
 				};
 
-				ldo3_reg: ldo3 {
+				ldo3 {
 					regulator-name = "+V1.2_CSI";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 				};
 
-				ldo4_reg: ldo4 {
+				ldo4 {
 					regulator-name = "+V1.2_VDD_RTC";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -951,32 +948,23 @@
 				 * +V2.8_AVDD_VDAC:
 				 * only required for (unsupported) analog RGB
 				 */
-				ldo5_reg: ldo5 {
+				ldo5 {
 					regulator-name = "+V2.8_AVDD_VDAC";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
 					regulator-always-on;
 				};
 
-				/*
-				 * +V1.05_AVDD_PLLE: avdd_plle should be 1.05V
-				 * but LDO6 can't set voltage in 50mV
-				 * granularity
-				 */
-				ldo6_reg: ldo6 {
-					regulator-name = "+V1.05_AVDD_PLLE";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-				};
+				/* LDO6: unused */
 
-				ldo7_reg: ldo7 {
+				ldo7 {
 					regulator-name = "+V1.2_AVDD_PLL";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-always-on;
 				};
 
-				ldo8_reg: ldo8 {
+				ldo8 {
 					regulator-name = "+V1.0_VDD_DDR_HS";
 					regulator-min-microvolt = <1000000>;
 					regulator-max-microvolt = <1000000>;
@@ -1034,8 +1022,7 @@
 		regulator@60 {
 			compatible = "ti,tps62362";
 			reg = <0x60>;
-
-			regulator-name = "tps62362-vout";
+			regulator-name = "+V1.2_VDD_CORE";
 			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <1400000>;
 			regulator-boot-on;
@@ -1043,6 +1030,7 @@
 			ti,vsel0-state-low;
 			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
 			ti,vsel1-state-low;
+			vin-supply =<&reg_module_3v3>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 0f0d0ae93075..85f4b70ed73d 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -12,14 +12,14 @@
 
 	pcie@3000 {
 		status = "okay";
-		avdd-pexa-supply = <&vdd2_reg>;
-		avdd-pexb-supply = <&vdd2_reg>;
-		avdd-pex-pll-supply = <&vdd2_reg>;
-		avdd-plle-supply = <&ldo6_reg>;
+		avdd-pexa-supply = <&reg_1v05>;
+		avdd-pexb-supply = <&reg_1v05>;
+		avdd-pex-pll-supply = <&reg_1v05>;
+		avdd-plle-supply = <&reg_1v05>;
 		hvdd-pex-supply = <&reg_module_3v3>;
 		vddio-pex-ctl-supply = <&reg_module_3v3>;
-		vdd-pexa-supply = <&vdd2_reg>;
-		vdd-pexb-supply = <&vdd2_reg>;
+		vdd-pexa-supply = <&reg_1v05>;
+		vdd-pexb-supply = <&reg_1v05>;
 
 		/* Apalis type specific */
 		pci@1,0 {
@@ -855,16 +855,13 @@
 		pmic: pmic@2d {
 			compatible = "ti,tps65911";
 			reg = <0x2d>;
-
+			#gpio-cells = <2>;
+			gpio-controller;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-
+			ti,en-ck32k-xtal;
 			ti,system-power-controller;
-
-			#gpio-cells = <2>;
-			gpio-controller;
-
 			vcc1-supply = <&reg_module_3v3>;
 			vcc2-supply = <&reg_module_3v3>;
 			vcc3-supply = <&reg_1v8_vio>;
@@ -875,33 +872,33 @@
 			vccio-supply = <&reg_module_3v3>;
 
 			regulators {
-				vdd1_reg: vdd1 {
+				reg_1v8_vio: vio {
+					regulator-name = "+V1.8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				vdd1 {
 					regulator-name = "+V1.35_VDDIO_DDR";
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
 				};
 
-				vdd2_reg: vdd2 {
+				reg_1v05: vdd2 {
 					regulator-name = "+V1.05";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 				};
 
-				vddctrl_reg: vddctrl {
+				vddctrl {
 					regulator-name = "+V1.0_VDD_CPU";
 					regulator-min-microvolt = <1150000>;
 					regulator-max-microvolt = <1150000>;
 					regulator-always-on;
 				};
 
-				reg_1v8_vio: vio {
-					regulator-name = "+V1.8";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
 				/* LDO1: unused */
 
 				/*
@@ -909,20 +906,20 @@
 				 * +V3.3_AUDIO_AVDD_S, +V3.3
 				 * see also +V3.3 fixed supply
 				 */
-				ldo2_reg: ldo2 {
+				ldo2 {
 					regulator-name = "EN_+V3.3";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
 				};
 
-				ldo3_reg: ldo3 {
+				ldo3 {
 					regulator-name = "+V1.2_CSI";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 				};
 
-				ldo4_reg: ldo4 {
+				ldo4 {
 					regulator-name = "+V1.2_VDD_RTC";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -933,32 +930,23 @@
 				 * +V2.8_AVDD_VDAC:
 				 * only required for (unsupported) analog RGB
 				 */
-				ldo5_reg: ldo5 {
+				ldo5 {
 					regulator-name = "+V2.8_AVDD_VDAC";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
 					regulator-always-on;
 				};
 
-				/*
-				 * +V1.05_AVDD_PLLE: avdd_plle should be 1.05V
-				 * but LDO6 can't set voltage in 50mV
-				 * granularity
-				 */
-				ldo6_reg: ldo6 {
-					regulator-name = "+V1.05_AVDD_PLLE";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-				};
+				/* LDO6: unused */
 
-				ldo7_reg: ldo7 {
+				ldo7 {
 					regulator-name = "+V1.2_AVDD_PLL";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-always-on;
 				};
 
-				ldo8_reg: ldo8 {
+				ldo8 {
 					regulator-name = "+V1.0_VDD_DDR_HS";
 					regulator-min-microvolt = <1000000>;
 					regulator-max-microvolt = <1000000>;
@@ -1016,8 +1004,7 @@
 		regulator@60 {
 			compatible = "ti,tps62362";
 			reg = <0x60>;
-
-			regulator-name = "tps62362-vout";
+			regulator-name = "+V1.2_VDD_CORE";
 			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <1400000>;
 			regulator-boot-on;
@@ -1025,6 +1012,7 @@
 			ti,vsel0-state-low;
 			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
 			ti,vsel1-state-low;
+			vin-supply =<&reg_module_3v3>;
 		};
 	};
 
-- 
2.14.4
