From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/7] arm64: tegra: Enable XUSB controller on Tegra210 Smaug
Date: Tue, 9 Aug 2016 16:21:22 +0100
Message-ID: <1470756082-19099-8-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the XUSB controller on Tegra210 Smaug. The Smaug has a USB Type-C
connector with one of the USB2.0 lanes and one of the USB3.0 lanes
populated.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 8cdd71f4d9ba..854701cc271d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1613,6 +1613,63 @@
 		status = "okay";
 	};
 
+	usb@70090000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>;
+		phy-names = "usb2-0", "usb3-0";
+
+		dvddio-pex-supply = <&avddio_1v05>;
+		hvddio-pex-supply = <&pp1800>;
+		avdd-usb-supply = <&pp3300>;
+		avdd-pll-utmip-supply = <&pp1800>;
+		avdd-pll-uerefe-supply = <&pp1050_avdd>;
+		dvdd-pex-pll-supply = <&avddio_1v05>;
+		hvdd-pex-pll-e-supply = <&pp1800>;
+
+		status = "okay";
+	};
+
+	padctl@7009f000 {
+		status = "okay";
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
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				lanes {
+					pcie-6 {
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
+				vbus-supply = <&usbc_vbus>;
+				mode = "otg";
+			};
+
+			usb3-0 {
+				nvidia,usb2-companion = <0>;
+				status = "okay";
+			};
+		};
+	};
+
 	sdhci@700b0600 {
 		bus-width = <8>;
 		non-removable;
-- 
2.1.4
