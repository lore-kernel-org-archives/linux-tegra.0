From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v6 9/9] arm64: tegra: Add Tegra VI CSI support in device tree
Date: Fri, 3 Apr 2020 18:25:07 -0700
Message-ID: <1585963507-12610-10-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 contains VI controller for video input capture from MIPI
CSI camera sensors and also supports built-in test pattern generator.

CSI ports can be one-to-one mapped to VI channels for capturing from
an external sensor or from built-in test pattern generator.

This patch adds support for VI and CSI and enables them in Tegra210
device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 10 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 46 +++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 313a4c2..b57d837 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -14,6 +14,16 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+
+			csi@838 {
+				status = "okay";
+			};
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5b1dfd8..cad42a7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -137,9 +137,44 @@
 
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
+			power-domains = <&pd_venc>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x54080000 0x2000>;
+
+			csi@838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x838 0x1300>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>,
+						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>,
+						       <972000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
+					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+				power-domains = <&pd_sor>;
+			};
 		};
 
 		tsec@54100000 {
@@ -839,6 +874,15 @@
 				reset-names = "vic";
 				#power-domain-cells = <0>;
 			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA210_CLK_VI>,
+					 <&tegra_car TEGRA210_CLK_CSI>;
+				resets = <&mc TEGRA210_MC_RESET_VI>,
+					 <&tegra_car TEGRA210_RST_VI>,
+					 <&tegra_car TEGRA210_CLK_CSI>;
+				#power-domain-cells = <0>;
+			};
 		};
 
 		sdmmc1_3v3: sdmmc1-3v3 {
-- 
2.7.4
