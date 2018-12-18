From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1 2/2] arm64: dts: tegra186: Device Tree Updates for Tegra186 I2C
Date: Tue, 18 Dec 2018 14:40:56 -0800
Message-ID: <1545172856-19509-2-git-send-email-skomatineni@nvidia.com>
References: <1545172856-19509-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545172856-19509-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mperttunen@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, talho@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update I2C Device node compatible string to be appropriate.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2f3c8e29520d..31c7278f4c03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -136,7 +136,7 @@
 	};
 
 	gen1_i2c: i2c@3160000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x03160000 0x0 0x10000>;
 		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -149,7 +149,7 @@
 	};
 
 	cam_i2c: i2c@3180000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x03180000 0x0 0x10000>;
 		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -163,7 +163,7 @@
 
 	/* shares pads with dpaux1 */
 	dp_aux_ch1_i2c: i2c@3190000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x03190000 0x0 0x10000>;
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -177,7 +177,7 @@
 
 	/* controlled by BPMP, should not be enabled */
 	pwr_i2c: i2c@31a0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x031a0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -191,7 +191,7 @@
 
 	/* shares pads with dpaux0 */
 	dp_aux_ch0_i2c: i2c@31b0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x031b0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -204,7 +204,7 @@
 	};
 
 	gen7_i2c: i2c@31c0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x031c0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -217,7 +217,7 @@
 	};
 
 	gen9_i2c: i2c@31e0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x031e0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -346,7 +346,7 @@
 	};
 
 	gen2_i2c: i2c@c240000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x0c240000 0x0 0x10000>;
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -359,7 +359,7 @@
 	};
 
 	gen8_i2c: i2c@c250000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
 		reg = <0x0 0x0c250000 0x0 0x10000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.7.4
