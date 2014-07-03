From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: roth: add display DT node
Date: Thu, 3 Jul 2014 12:15:07 +0900
Message-ID: <1404357307-7594-1-git-send-email-acourbot@nvidia.com>
References: <1404303560-32209-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404303560-32209-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DSI support has been fixed to support continuous clock behavior that the
panel used on SHIELD requires, so finally add its device tree node since
it is functional.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
- Removed unneeded regulator-always-on property for vdd_lcd regulator
Only patch 4/4 of the original series has been resent for this v2.

 arch/arm/boot/dts/tegra114-roth.dts | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index ba210c6e189f..c7c6825f11fb 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -28,6 +28,22 @@
 		reg = <0x80000000 0x79600000>;
 	};
 
+	host1x@50000000 {
+		dsi@54300000 {
+			status = "okay";
+
+			vdd-supply = <&vdd_1v2_ap>;
+
+			panel@0 {
+				compatible = "lg,lh500wx1-sd03";
+				reg = <0>;
+
+				power-supply = <&vdd_lcd>;
+				backlight = <&backlight>;
+			};
+		};
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -811,7 +827,6 @@
 						regulator-name = "vdd-1v8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
@@ -858,10 +873,11 @@
 						regulator-name = "vdd-2v8-display";
 						regulator-min-microvolt = <2800000>;
 						regulator-max-microvolt = <2800000>;
+						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					ldo3 {
+					vdd_1v2_ap: ldo3 {
 						regulator-name = "avdd-1v2";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
@@ -1048,7 +1064,7 @@
 			regulator-boot-on;
 		};
 
-		regulator@1 {
+		vdd_lcd: regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
 			regulator-name = "vdd_lcd_1v8";
-- 
2.0.0
