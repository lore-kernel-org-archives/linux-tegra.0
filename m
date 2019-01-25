From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/6] arm64: tegra: Add XUSB and pad controller on Tegra186
Date: Fri, 25 Jan 2019 12:30:11 +0100
Message-ID: <20190125113013.11447-4-thierry.reding@gmail.com>
References: <20190125113013.11447-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125113013.11447-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Adds the XUSB pad and XUSB controllers on Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 135 +++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 22815db4a3ed..09d3b0d60e41 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -338,6 +338,141 @@
 		status = "disabled";
 	};
 
+	padctl: padctl@3520000 {
+		compatible = "nvidia,tegra186-xusb-padctl";
+		reg = <0x0 0x03520000 0x0 0x1000>,
+		      <0x0 0x03540000 0x0 0x1000>;
+		reg-names = "padctl", "ao";
+
+		resets = <&bpmp TEGRA186_RESET_XUSB_PADCTL>;
+		reset-names = "padctl";
+
+		status = "disabled";
+
+		pads {
+			usb2 {
+				clocks = <&bpmp TEGRA186_CLK_USB2_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				lanes {
+					usb2-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					usb2-1 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					usb2-2 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+
+			hsic {
+				clocks = <&bpmp TEGRA186_CLK_HSIC_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				lanes {
+					hsic-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+
+			usb3 {
+				status = "disabled";
+
+				lanes {
+					usb3-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					usb3-1 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					usb3-2 {
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
+
+			usb2-1 {
+				status = "disabled";
+			};
+
+			usb2-2 {
+				status = "disabled";
+			};
+
+			hsic-0 {
+				status = "disabled";
+			};
+
+			usb3-0 {
+				status = "disabled";
+			};
+
+			usb3-1 {
+				status = "disabled";
+			};
+
+			usb3-2 {
+				status = "disabled";
+			};
+		};
+	};
+
+	usb@3530000 {
+		compatible = "nvidia,tegra186-xusb";
+		reg = <0x0 0x03530000 0x0 0x8000>,
+		      <0x0 0x03538000 0x0 0x1000>;
+		reg-names = "hcd", "fpci";
+
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
+			 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
+			 <&bpmp TEGRA186_CLK_XUSB_SS>,
+			 <&bpmp TEGRA186_CLK_XUSB_CORE_SS>,
+			 <&bpmp TEGRA186_CLK_CLK_M>,
+			 <&bpmp TEGRA186_CLK_XUSB_FS>,
+			 <&bpmp TEGRA186_CLK_PLLU>,
+			 <&bpmp TEGRA186_CLK_CLK_M>,
+			 <&bpmp TEGRA186_CLK_PLLE>;
+		clock-names = "xusb_host", "xusb_falcon_src", "xusb_ss",
+			      "xusb_ss_src", "xusb_hs_src", "xusb_fs_src",
+			      "pll_u_480m", "clk_m", "pll_e";
+
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBC>,
+				<&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
+		power-domain-names = "xusb_host", "xusb_ss";
+		nvidia,xusb-padctl = <&padctl>;
+
+		status = "disabled";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	fuse@3820000 {
 		compatible = "nvidia,tegra186-efuse";
 		reg = <0x0 0x03820000 0x0 0x10000>;
-- 
2.19.1
