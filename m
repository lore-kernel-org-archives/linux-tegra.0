From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/8] arm64: tegra: Add Tegra210 XUSB pad controller
Date: Mon,  6 Jun 2016 18:36:34 +0200
Message-ID: <20160606163637.14234-5-thierry.reding@gmail.com>
References: <20160606163637.14234-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606163637.14234-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a device tree node for the XUSB pad controller found on Tegra210.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 155 +++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 76fe31faa1a5..694228b9cdf4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -621,6 +621,161 @@
 		status = "disabled";
 	};
 
+	padctl: padctl@7009f000 {
+		compatible = "nvidia,tegra210-xusb-padctl";
+		reg = <0x0 0x7009f000 0x0 0x1000>;
+		resets = <&tegra_car 142>;
+		reset-names = "padctl";
+
+		status = "disabled";
+
+		pads {
+			usb2 {
+				clocks = <&tegra_car TEGRA210_CLK_USB2_TRK>;
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
+
+					usb2-3 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+
+			hsic {
+				clocks = <&tegra_car TEGRA210_CLK_HSIC_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				lanes {
+					hsic-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					hsic-1 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+
+			pcie {
+				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+				clock-names = "pll";
+				resets = <&tegra_car 205>;
+				reset-names = "phy";
+				status = "disabled";
+
+				lanes {
+					pcie-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-1 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-2 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-3 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-4 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-5 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+
+					pcie-6 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
+			};
+
+			sata {
+				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+				clock-names = "pll";
+				resets = <&tegra_car 204>;
+				reset-names = "phy";
+				status = "disabled";
+
+				lanes {
+					sata-0 {
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
+			usb2-3 {
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
+
+			usb3-3 {
+				status = "disabled";
+			};
+		};
+	};
+
 	sdhci@700b0000 {
 		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
-- 
2.8.3
