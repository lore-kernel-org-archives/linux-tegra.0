From: Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCH v3] ARM: tegra124: pmu support
Date: Mon, 13 Jul 2015 10:35:45 -0700
Message-ID: <1436808945-14524-1-git-send-email-khuey@kylehuey.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch modifies the device tree for tegra124 based devices to enable
the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM
DP-06905-001_v03p.  This patch was tested on a Jetson TK1.

Updated for proper ordering and to add interrupt-affinity values.

Signed-off-by: Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 13cc7ca..de07d7e 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -918,31 +918,40 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		A15_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0>;
 		};
 
-		cpu@1 {
+		A15_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <1>;
 		};
 
-		cpu@2 {
+		A15_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <2>;
 		};
 
-		cpu@3 {
+		A15_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <3>;
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a15-pmu";
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&A15_0>, <&A15_1>, <&A15_2>, <&A15_3>;
+	};
+
 	thermal-zones {
 		cpu {
 			polling-delay-passive = <1000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
