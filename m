From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] dt/tegra: seaboard: add i2c devices
Date: Thu, 22 Dec 2011 18:33:13 -0800
Message-ID: <1324607593-2378-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, device-tree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the known i2c devices on seaboard to the i2c table.

Also rename the temperature sensor device node, and mark it as a nct1008 instead
of an adt7461 (which it is -- the chips are compatible though).


Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |   29 +++++++++++++++++++++++++++--
 1 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index b55a02e..b64e0bd 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -13,6 +13,18 @@
 
 	i2c@7000c000 {
 		clock-frequency = <400000>;
+
+		light-sensor@44 {
+			compatible = "isil,isl29018";
+			reg = <0x44>;
+			interrupts = < 0 202 0x04 >; /* gpio PZ2 */
+		};
+
+		gyrometer@68 {
+			compatible = "invn,mpu3050";
+			reg = <0x68>;
+			interrupts = < 0 204 0x04 >; /* gpio PZ4 */
+		};
 	};
 
 	i2c@7000c400 {
@@ -21,15 +33,28 @@
 
 	i2c@7000c500 {
 		clock-frequency = <400000>;
+
+		smart-battery@b {
+			compatible = "ti,bq20z75", "smart-battery-1.1";
+			ti,i2c-retry-count = < 2 >;
+			ti,poll-retry-count = < 10 >;
+			reg = <0xb>;
+		};
 	};
 
 	i2c@7000d000 {
 		clock-frequency = <400000>;
 
-		adt7461@4c {
-			compatible = "adt7461";
+		temperature-sensor@4c {
+			compatible = "nct1008";
 			reg = <0x4c>;
 		};
+
+		magnetometer@c {
+			compatible = "ak8975";
+			reg = <0xc>;
+			interrupts = < 0 109 0x04 >; /* gpio PN5 */
+		};
 	};
 
 	serial@70006000 {
-- 
1.7.8.GIT
