From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 5/6] arm64: tegra: Add XUSB and pad controller on Tegra194
Date: Wed, 2 Oct 2019 16:00:50 +0800
Message-ID: <20191002080051.11142-6-jckuo@nvidia.com>
References: <20191002080051.11142-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002080051.11142-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Adds the XUSB pad and XUSB controllers on Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 130 +++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3c0cf54f0aab..4d3371d3a407 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1599,4 +1599,134 @@
 		interrupt-parent = <&gic>;
 		always-on;
 	};
+
+	xusb_padctl: padctl@3520000 {
+		compatible = "nvidia,tegra194-xusb-padctl";
+		reg = <0x0 0x03520000 0x0 0x1000>,
+			<0x0 0x03540000 0x0 0x1000>;
+		reg-names = "padctl", "ao";
+
+		resets = <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
+		reset-names = "padctl";
+
+		status = "disabled";
+
+		pads {
+			usb2 {
+				clocks = <&bpmp TEGRA194_CLK_USB2_TRK>;
+				clock-names = "trk";
+
+				lanes {
+					usb2-0 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb2-1 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb2-2 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb2-3 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+			usb3 {
+				lanes {
+					usb3-0 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb3-1 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb3-2 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+					usb3-3 {
+						nvidia,function = "xusb";
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "disabled";
+			};
+			usb2-1 {
+				status = "disabled";
+			};
+			usb2-2 {
+				status = "disabled";
+			};
+			usb2-3 {
+				status = "disabled";
+			};
+			usb3-0 {
+				status = "disabled";
+			};
+			usb3-1 {
+				status = "disabled";
+			};
+			usb3-2 {
+				status = "disabled";
+			};
+			usb3-3 {
+				status = "disabled";
+			};
+		};
+	};
+
+	tegra_xhci: xhci@3610000 {
+		compatible = "nvidia,tegra194-xusb";
+		reg = <0x0 0x03610000 0x0 0x40000>,
+			<0x0 0x03600000 0x0 0x10000>;
+		reg-names = "hcd", "fpci";
+
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_MUX>,
+			<&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
+			<&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
+			<&bpmp TEGRA194_CLK_XUSB_FALCON>,
+			<&bpmp TEGRA194_CLK_XUSB_FALCON_HOST>,
+			<&bpmp TEGRA194_CLK_XUSB_FALCON_SS>,
+			<&bpmp TEGRA194_CLK_XUSB_FS>,
+			<&bpmp TEGRA194_CLK_XUSB_FS_HOST>,
+			<&bpmp TEGRA194_CLK_XUSB_SS>,
+			<&bpmp TEGRA194_CLK_XUSB_SS_SUPERSPEED>,
+			<&bpmp TEGRA194_CLK_UTMIPLL>,
+			<&bpmp TEGRA194_CLK_CLK_M>,
+			<&bpmp TEGRA194_CLK_PLLE>;
+		clock-names = "xusb_hs_src", "xusb_host",
+			"xusb_core_superspeed_clk", "xusb_falcon_src",
+			"xusb_falcon_host_clk", "xusb_falcon_superspeed_clk",
+			"xusb_fs_src", "xusb_fs_host_clk", "xusb_ss_src",
+			"xusb_ss", "pll_u_480m", "clk_m", "pll_e";
+
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
+				<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
+		power-domain-names = "xusb_host", "xusb_ss";
+
+		nvidia,xusb-padctl = <&xusb_padctl>;
+		status = "disabled";
+	};
 };
-- 
2.17.1
