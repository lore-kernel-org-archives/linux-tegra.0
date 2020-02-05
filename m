From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v2 6/6] arm64: tegra: Add Tegra VI CSI support in device tree
Date: Wed, 5 Feb 2020 13:23:26 -0800
Message-ID: <1580937806-17376-7-git-send-email-skomatineni@nvidia.com>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, helen.koike@collabora.com, sboyd@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 contains VI controller for video input capture from MIPI
CSI camera sensors and also supports built-in test pattern generator.

CSI ports can be one-to-one mapped to VI channels for capturing from
an external sensor or from built-in test pattern generator.

This patch adds support for VI and CSI and enables them in Tegra210
device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 36 +++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b0095072bc28..86817ff12f2c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -10,6 +10,14 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+
+			csi@0x54080838 {
+				status = "okay";
+			};
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 48c63256ba7f..fd47f93e4f56 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -136,9 +136,43 @@
 
 		vi@54080000 {
 			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x00040000>;
+			reg = <0x0 0x54080000 0x0 0x700>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
+
+			csi@0x54080838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x0 0x54080838 0x0 0x2000>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>;
+				clock-names = "csi", "cilab", "cilcd", "cile";
+			};
+
 		};
 
 		tsec@54100000 {
-- 
2.7.4
