From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 13 Jun 2019 14:40:52 +0530
Message-ID: <1560417053-2966-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add DT nodes for following devices on Tegra186 and Tegra194
 * ACONNECT
 * ADMA
 * AGIC

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 changes in current revision
  * use single address range for all APE modules
  * fix address range for agic

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 426ac0b..b4d735e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1295,4 +1295,71 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	aconnect@2a41000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&bpmp TEGRA186_CLK_APE>,
+			 <&bpmp TEGRA186_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_AUD>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x02900000 0x0 0x02900000 0x1FFFFF>;
+		status = "disabled";
+
+		dma-controller@2930000 {
+			compatible = "nvidia,tegra186-adma";
+			reg = <0x02930000 0x50000>;
+			interrupt-parent = <&agic>;
+			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&bpmp TEGRA186_CLK_AHUB>;
+			clock-names = "d_audio";
+			status = "disabled";
+		};
+
+		agic: agic@2a41000 {
+			compatible = "nvidia,tegra210-agic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x02a41000 0x1000>,
+			      <0x02a42000 0x2000>;
+			interrupts = <GIC_SPI 145
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&bpmp TEGRA186_CLK_APE>;
+			clock-names = "clk";
+			status = "disabled";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c77ca21..60ef2a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1054,4 +1054,71 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	aconnect@2a41000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&bpmp TEGRA194_CLK_APE>,
+			 <&bpmp TEGRA194_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x02900000 0x0 0x02900000 0x1FFFFF>;
+		status = "disabled";
+
+		dma-controller@2930000 {
+			compatible = "nvidia,tegra186-adma";
+			reg = <0x02930000 0x50000>;
+			interrupt-parent = <&agic>;
+			interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&bpmp TEGRA194_CLK_AHUB>;
+			clock-names = "d_audio";
+			status = "disabled";
+		};
+
+		agic: agic@2a41000 {
+			compatible = "nvidia,tegra210-agic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x02a41000 0x1000>,
+			      <0x02a42000 0x2000>;
+			interrupts = <GIC_SPI 145
+				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&bpmp TEGRA194_CLK_APE>;
+			clock-names = "clk";
+			status = "disabled";
+		};
+	};
 };
-- 
2.7.4
