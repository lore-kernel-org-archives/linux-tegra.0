From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1] arm64: dts: tegra210: Device Tree Updates for Tegra210 I2C
Date: Tue, 18 Dec 2018 14:37:04 -0800
Message-ID: <1545172624-19287-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mperttunen@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, pchandru@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update I2C device node compatible string to be appropriate.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 2205d66b0443..a8bd13727330 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -554,7 +554,7 @@
 	};
 
 	i2c@7000c000 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -569,7 +569,7 @@
 	};
 
 	i2c@7000c400 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -584,7 +584,7 @@
 	};
 
 	i2c@7000c500 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -599,7 +599,7 @@
 	};
 
 	i2c@7000c700 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -617,7 +617,7 @@
 	};
 
 	i2c@7000d000 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -632,7 +632,7 @@
 	};
 
 	i2c@7000d100 {
-		compatible = "nvidia,tegra210-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra210-i2c", "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.7.4
