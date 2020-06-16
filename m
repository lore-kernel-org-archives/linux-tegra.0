From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 50/73] arm64: tegra: Enable XUSB on Norrin
Date: Tue, 16 Jun 2020 15:52:15 +0200
Message-ID: <20200616135238.3001888-51-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use the XUSB controller instead of the legacy EHCI controller to enable
USB 3.0 support.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 124 +++++++++++----
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      | 148 ++++++++++++++++--
 2 files changed, 230 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index e6fe62e5c234..bba8a4b82b0b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -671,7 +671,7 @@ vdd_gpu: sd6 {
 					regulator-boot-on;
 				};
 
-				ldo0 {
+				avdd_1v05_run: ldo0 {
 					regulator-name = "+1.05_RUN_AVDD";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
@@ -893,6 +893,101 @@ pmc@7000e400 {
 		nvidia,reset-gpio = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 	};
 
+	usb@70090000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>, /* 1st USB A */
+		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-1}>, /* Internal USB */
+		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>, /* 2nd USB A */
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>, /* 1st USB A */
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>; /* 2nd USB A */
+		phy-names = "usb2-0", "usb2-1", "usb2-2", "usb3-0", "usb3-1";
+
+		avddio-pex-supply = <&vdd_1v05_run>;
+		dvddio-pex-supply = <&vdd_1v05_run>;
+		avdd-usb-supply = <&vdd_3v3_lp0>;
+		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
+
+		status = "okay";
+	};
+
+	padctl@7009f000 {
+		avdd-pll-utmip-supply = <&vddio_1v8>;
+		avdd-pll-erefe-supply = <&avdd_1v05_run>;
+		avdd-pex-pll-supply = <&vdd_1v05_run>;
+		hvdd-pex-pll-e-supply = <&vdd_3v3_lp0>;
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				lanes {
+					usb2-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-2 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				lanes {
+					pcie-0 {
+						nvidia,function = "usb3-ss";
+						status = "okay";
+					};
+
+					pcie-1 {
+						nvidia,function = "usb3-ss";
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+
+				vbus-supply = <&vdd_usb1_vbus>;
+			};
+
+			usb2-1 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_run_cam>;
+			};
+
+			usb2-2 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_usb3_vbus>;
+			};
+
+			usb3-0 {
+				nvidia,usb2-companion = <0>;
+				status = "okay";
+			};
+
+			usb3-1 {
+				nvidia,usb2-companion = <2>;
+				status = "okay";
+			};
+		};
+	};
+
 	/* WIFI/BT module */
 	mmc@700b0000 {
 		status = "disabled";
@@ -915,33 +1010,6 @@ mmc@700b0600 {
 		non-removable;
 	};
 
-	usb@7d000000 {
-		status = "okay";
-	};
-
-	usb-phy@7d000000 {
-		status = "okay";
-		vbus-supply = <&vdd_usb1_vbus>;
-	};
-
-	usb@7d004000 {
-		status = "okay";
-	};
-
-	usb-phy@7d004000 {
-		status = "okay";
-		vbus-supply = <&vdd_run_cam>;
-	};
-
-	usb@7d008000 {
-		status = "okay";
-	};
-
-	usb-phy@7d008000 {
-		status = "okay";
-		vbus-supply = <&vdd_usb3_vbus>;
-	};
-
 	backlight: backlight {
 		compatible = "pwm-backlight";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 8558ad38b69c..0cc6b4e9f954 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -50,9 +50,6 @@ pcie@1003000 {
 		reset-names = "pex", "afi", "pcie_x";
 		status = "disabled";
 
-		phys = <&padctl TEGRA_XUSB_PADCTL_PCIE>;
-		phy-names = "pcie";
-
 		pci@1,0 {
 			device_type = "pci";
 			assigned-addresses = <0x82000800 0 0x01000000 0 0x1000>;
@@ -630,8 +627,6 @@ sata@70020000 {
 			 <&tegra_car 123>,
 			 <&tegra_car 129>;
 		reset-names = "sata", "sata-oob", "sata-cold";
-		phys = <&padctl TEGRA_XUSB_PADCTL_SATA>;
-		phy-names = "sata-phy";
 		status = "disabled";
 	};
 
@@ -651,6 +646,41 @@ hda@70030000 {
 		status = "disabled";
 	};
 
+	usb@70090000 {
+		compatible = "nvidia,tegra132-xusb", "nvidia,tegra124-xusb";
+		reg = <0x0 0x70090000 0x0 0x8000>,
+		      <0x0 0x70098000 0x0 0x1000>,
+		      <0x0 0x70099000 0x0 0x1000>;
+		reg-names = "hcd", "fpci", "ipfs";
+
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
+			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
+			 <&tegra_car TEGRA124_CLK_CLK_M>,
+			 <&tegra_car TEGRA124_CLK_PLL_E>;
+		clock-names = "xusb_host", "xusb_host_src",
+			      "xusb_falcon_src", "xusb_ss",
+			      "xusb_ss_src", "xusb_ss_div2",
+			      "xusb_hs_src", "xusb_fs_src",
+			      "pll_u_480m", "clk_m", "pll_e";
+		resets = <&tegra_car 89>, <&tegra_car 156>,
+			 <&tegra_car 143>;
+		reset-names = "xusb_host", "xusb_ss", "xusb_src";
+
+		nvidia,xusb-padctl = <&padctl>;
+
+		status = "disabled";
+	};
+
 	padctl: padctl@7009f000 {
 		compatible = "nvidia,tegra132-xusb-padctl",
 			     "nvidia,tegra124-xusb-padctl";
@@ -658,34 +688,124 @@ padctl: padctl@7009f000 {
 		resets = <&tegra_car 142>;
 		reset-names = "padctl";
 
-		#phy-cells = <1>;
+		pads {
+			usb2 {
+				status = "disabled";
 
-		phys {
-			pcie-0 {
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
+			ulpi {
 				status = "disabled";
+
+				lanes {
+					ulpi-0 {
+						status = "disabled";
+						#phy-cells = <0>;
+					};
+				};
 			};
 
-			sata-0 {
+			hsic {
 				status = "disabled";
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
 			};
 
-			usb3-0 {
+			pcie {
 				status = "disabled";
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
+				};
 			};
 
-			usb3-1 {
+			sata {
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
 				status = "disabled";
 			};
 
-			utmi-0 {
+			usb2-2 {
 				status = "disabled";
 			};
 
-			utmi-1 {
+			hsic-0 {
 				status = "disabled";
 			};
 
-			utmi-2 {
+			hsic-1 {
+				status = "disabled";
+			};
+
+			usb3-0 {
+				status = "disabled";
+			};
+
+			usb3-1 {
 				status = "disabled";
 			};
 		};
-- 
2.24.1
