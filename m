From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 12/37] ARM: tegra: colibri_t20: indentation/line-feed/white-space clean-up
Date: Sun,  2 Sep 2018 12:08:41 +0200
Message-ID: <20180902100906.25792-13-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Cleaning up indentation, line-feed and white-space.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 06d0be29c0b4..5559008efc5f 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -206,10 +206,10 @@
 
 	ac97: ac97@70002000 {
 		status = "okay";
-		nvidia,codec-reset-gpio = <&gpio TEGRA_GPIO(V, 0)
-			GPIO_ACTIVE_HIGH>;
-		nvidia,codec-sync-gpio = <&gpio TEGRA_GPIO(P, 0)
-			GPIO_ACTIVE_HIGH>;
+		nvidia,codec-reset-gpio =
+			<&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
+		nvidia,codec-sync-gpio =
+			<&gpio TEGRA_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
 	};
 
 	nand-controller@70008000 {
@@ -254,12 +254,9 @@
 			compatible = "ti,tps6586x";
 			reg = <0x34>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-
 			ti,system-power-controller;
-
 			#gpio-cells = <2>;
 			gpio-controller;
-
 			sys-supply = <&reg_module_3v3>;
 			vin-sm0-supply = <&reg_3v3_vsys>;
 			vin-sm1-supply = <&reg_3v3_vsys>;
@@ -468,8 +465,8 @@
 
 	usb-phy@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-			GPIO_ACTIVE_LOW>;
+		nvidia,phy-reset-gpio =
+			<&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_LOW>;
 		vbus-supply = <&reg_lan_v_bus>;
 	};
 
@@ -511,16 +508,13 @@
 		compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
 			     "nvidia,tegra-audio-wm9712";
 		nvidia,model = "Colibri T20 AC97 Audio";
-
 		nvidia,audio-routing =
 			"Headphone", "HPOUTL",
 			"Headphone", "HPOUTR",
 			"LineIn", "LINEINL",
 			"LineIn", "LINEINR",
 			"Mic", "MIC1";
-
 		nvidia,ac97-controller = <&ac97>;
-
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
 			 <&tegra_car TEGRA20_CLK_CDEV1>;
-- 
2.14.4
