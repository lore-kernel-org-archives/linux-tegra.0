From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch V5 13/21] arm64: tegra: update OTG port entries for jetson-tx1
Date: Mon, 10 Feb 2020 13:41:39 +0530
Message-ID: <1581322307-11140-14-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Populate OTG vbus regulator. Add usb-role-switch entry to USB 2-0 port
and corresponding connector details.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2-V5:
 - No changes in this version
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b009507..18c0610 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1336,7 +1336,6 @@
 		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-5}>;
 		phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3", "usb3-0",
 			    "usb3-1";
-
 		dvddio-pex-supply = <&vdd_pex_1v05>;
 		hvddio-pex-supply = <&vdd_1v8>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
@@ -1440,7 +1439,19 @@
 		ports {
 			usb2-0 {
 				status = "okay";
+				vbus-supply = <&vdd_usb_vbus_otg>;
 				mode = "otg";
+
+				usb-role-switch;
+				connector {
+					compatible = "usb-b-connector",
+						     "gpio-usb-b-connector";
+					label = "micro-USB";
+					type = "micro";
+					vbus-gpio = <&gpio TEGRA_GPIO(Z, 0)
+						     GPIO_ACTIVE_LOW>;
+					id-gpio = <&pmic 0 0>;
+				};
 			};
 
 			usb2-1 {
@@ -1606,6 +1617,17 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 
+		vdd_usb_vbus_otg: regulator@11 {
+			compatible = "regulator-fixed";
+			reg = <9>;
+			regulator-name = "USB_VBUS_EN0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
 		vdd_hdmi: regulator@10 {
 			compatible = "regulator-fixed";
 			reg = <10>;
-- 
2.7.4
