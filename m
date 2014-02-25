From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 2/2] ARM: tegra: Enable USB on Venice2
Date: Tue, 25 Feb 2014 22:36:00 +0100
Message-ID: <1393364160-28253-3-git-send-email-thierry.reding@gmail.com>
References: <1393364160-28253-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393364160-28253-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

USB1 and USB3 are routed to two external connectors, while USB2 is used
for the integrated webcam.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index ed2cbf5b5999..6c146c685d7b 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -751,7 +751,7 @@
 					ams,enable-tracking;
 				};
 
-				ldo4 {
+				vdd_run_cam: ldo4 {
 					regulator-name = "+3.3V_RUN_CAM";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
@@ -943,6 +943,33 @@
 		};
 	};
 
+	usb@7d000000 {
+		status = "okay";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		vbus-supply = <&vdd_usb1_vbus>;
+	};
+
+	usb@7d004000 {
+		status = "okay";
+	};
+
+	usb-phy@7d004000 {
+		status = "okay";
+		vbus-supply = <&vdd_run_cam>;
+	};
+
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		status = "okay";
+		vbus-supply = <&vdd_usb3_vbus>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.8.4.2
