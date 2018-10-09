From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 5/8] ARM: tegra: apalis-tk1: further regulator clean-up
Date: Tue,  9 Oct 2018 17:25:20 +0200
Message-ID: <20181009152523.3771-6-marcel@ziswiler.com>
References: <20181009152523.3771-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009152523.3771-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add reg_ prefix to vddio_sdmmc1 and vddio_sdmmc3.
Reorder PMIC properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v1: None

 arch/arm/boot/dts/tegra124-apalis-eval.dts      |  4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  4 ++--
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 10 +++++-----
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 10 +++++-----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index eaee10ef6512..e553eff50499 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -171,7 +171,7 @@
 		bus-width = <4>;
 		/* MMC1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
-		vqmmc-supply = <&vddio_sdmmc1>;
+		vqmmc-supply = <&reg_vddio_sdmmc1>;
 	};
 
 	/* Apalis SD1 */
@@ -180,7 +180,7 @@
 		bus-width = <4>;
 		/* SD1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		vqmmc-supply = <&vddio_sdmmc3>;
+		vqmmc-supply = <&reg_vddio_sdmmc3>;
 	};
 
 	/* EHCI instance 0: USB1_DP/N -> USBO1_DP/N */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 7961eb4bd803..e2f94dc7ff91 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -137,7 +137,7 @@
 		bus-width = <4>;
 		/* MMC1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
-		vqmmc-supply = <&vddio_sdmmc1>;
+		vqmmc-supply = <&reg_vddio_sdmmc1>;
 	};
 
 	/* Apalis SD1 */
@@ -146,7 +146,7 @@
 		bus-width = <4>;
 		/* SD1_CD# */
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		vqmmc-supply = <&vddio_sdmmc3>;
+		vqmmc-supply = <&reg_vddio_sdmmc3>;
 	};
 
 	/* EHCI instance 0: USB1_DP/N -> USBO1_DP/N */
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 73a8e117a9b9..e532b564e4c9 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1570,12 +1570,12 @@
 		pmic: pmic@40 {
 			compatible = "ams,as3722";
 			reg = <0x40>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 			ams,system-power-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			gpio-controller;
-			#gpio-cells = <2>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&as3722_default>;
 
@@ -1679,7 +1679,7 @@
 					ams,ext-control = <1>;
 				};
 
-				vddio_sdmmc1: ldo1 {
+				reg_vddio_sdmmc1: ldo1 {
 					regulator-name = "VDDIO_SDMMC1";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
@@ -1711,7 +1711,7 @@
 
 				/* LDO5 not used */
 
-				vddio_sdmmc3: ldo6 {
+				reg_vddio_sdmmc3: ldo6 {
 					regulator-name = "VDDIO_SDMMC3";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 3e3b347afe56..3cab9bda918f 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1600,12 +1600,12 @@
 		pmic: pmic@40 {
 			compatible = "ams,as3722";
 			reg = <0x40>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 			ams,system-power-controller;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			gpio-controller;
-			#gpio-cells = <2>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&as3722_default>;
 
@@ -1709,7 +1709,7 @@
 					ams,ext-control = <1>;
 				};
 
-				vddio_sdmmc1: ldo1 {
+				reg_vddio_sdmmc1: ldo1 {
 					regulator-name = "VDDIO_SDMMC1";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
@@ -1741,7 +1741,7 @@
 
 				/* LDO5 not used */
 
-				vddio_sdmmc3: ldo6 {
+				reg_vddio_sdmmc3: ldo6 {
 					regulator-name = "VDDIO_SDMMC3";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
-- 
2.14.4
