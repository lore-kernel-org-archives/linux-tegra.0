From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in device tree
Date: Tue, 28 Jan 2020 10:23:21 -0800
Message-ID: <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580235801-4129-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 contains VI controller for video input capture from MIPI
CSI camera sensors and also supports built-in test pattern generator.

CSI ports can be one-to-one mapped to VI channels for capturing from
an external sensor or from built-in test pattern generator.

This patch adds support for VI and CSI and enables them in Tegra210
device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b0095072bc28..ec1b3033fa03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -10,6 +10,14 @@
 			status = "okay";
 		};
 
+		vi@54080000 {
+			status = "okay";
+		};
+
+		csi@0x54080838 {
+			status = "okay";
+		};
+
 		sor@54580000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 48c63256ba7f..c6107ec03ad1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -136,9 +136,38 @@
 
 		vi@54080000 {
 			compatible = "nvidia,tegra210-vi";
-			reg = <0x0 0x54080000 0x0 0x00040000>;
+			reg = <0x0 0x54080000 0x0 0x808>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+		};
+
+		csi@0x54080838 {
+			compatible = "nvidia,tegra210-csi";
+			reg = <0x0 0x54080838 0x0 0x2000>;
+			status = "disabled";
+			assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+					  <&tegra_car TEGRA210_CLK_CILCD>,
+					  <&tegra_car TEGRA210_CLK_CILE>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+						 <&tegra_car TEGRA210_CLK_PLL_P>,
+						 <&tegra_car TEGRA210_CLK_PLL_P>;
+			assigned-clock-rates = <102000000>,
+					       <102000000>,
+					       <102000000>;
+
+			clocks = <&tegra_car TEGRA210_CLK_CSI>,
+				 <&tegra_car TEGRA210_CLK_CILAB>,
+				 <&tegra_car TEGRA210_CLK_CILCD>,
+				 <&tegra_car TEGRA210_CLK_CILE>;
+			clock-names = "csi", "cilab", "cilcd", "cile";
+
 		};
 
 		tsec@54100000 {
-- 
2.7.4
