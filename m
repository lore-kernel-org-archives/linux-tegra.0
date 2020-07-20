From: Rajesh Gumasta <rgumasta@nvidia.com>
Subject: [Patch v1 4/4] arm64: tegra: Add GPCDMA node in dt
Date: Mon, 20 Jul 2020 12:04:16 +0530
Message-ID: <1595226856-19241-5-git-send-email-rgumasta@nvidia.com>
References: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, jonathanh@nvidia.com, vkoul@kernel.org, dan.j.williams@intel.com, thierry.reding@gmail.com, p.zabel@pengutronix.de, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyarlagadda@nvidia.com, rgumasta@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Add device tree node for GPCDMA controller on Tegra186 target
and Tegra194 target.

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  4 +++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi       | 46 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 44 ++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 2fcaa2e..56ed8d8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -54,6 +54,10 @@
 		};
 	};
 
+	dma@2600000 {
+		status = "okay";
+	};
+
 	memory-controller@2c00000 {
 		status = "okay";
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58100fb..91bb17e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -70,6 +70,52 @@
 		snps,rxpbl = <8>;
 	};
 
+	gpcdma: dma@2600000 {
+			compatible = "nvidia,tegra186-gpcdma";
+			reg = <0x0 0x2600000 0x0 0x210000>;
+			resets = <&bpmp TEGRA186_RESET_GPCDMA>;
+			reset-names = "gpcdma";
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
+			dma-coherent;
+			nvidia,start-dma-channel-index = <1>;
+			dma-channels = <31>;
+			status = "disabled";
+		};
+
 	aconnect {
 		compatible = "nvidia,tegra186-aconnect",
 			     "nvidia,tegra210-aconnect";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4bc187a..0bd67bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -68,6 +68,50 @@
 			snps,rxpbl = <8>;
 		};
 
+	gpcdma: dma@2600000 {
+			compatible = "nvidia,tegra194-gpcdma";
+			reg = <0x0 0x2600000 0x0 0x210000>;
+			resets = <&bpmp TEGRA194_RESET_GPCDMA>;
+			reset-names = "gpcdma";
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			nvidia,start-dma-channel-index = <1>;
+			dma-channels = <31>;
+			status = "disabled";
+		};
+
 		aconnect@2900000 {
 			compatible = "nvidia,tegra194-aconnect",
 				     "nvidia,tegra210-aconnect";
-- 
2.7.4
