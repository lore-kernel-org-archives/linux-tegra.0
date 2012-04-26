From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/4] ARM: dt: tegra seaboard: add i2c devices
Date: Thu, 26 Apr 2012 11:52:50 -0600
Message-ID: <1335462771-21791-3-git-send-email-swarren@wwwdotorg.org>
References: <1335462771-21791-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335462771-21791-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Add the known i2c devices on seaboard to the i2c table.

Also rename the temperature sensor device node, and mark it as a nct1008
instead of an adt7461 (which it is -- the chips are compatible though).

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
[swarren: Removed isl29018 from patch; it's already there now. Fixed
 interrupts properties now that Tegra GPIO is an interrupt controller.
 Moved smart-battery to the correct I2C bus.]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |   25 +++++++++++++++++++++++--
 1 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 19db40a..c4d171e 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -282,10 +282,24 @@
 			interrupt-parent = <&gpio>;
 			interrupts = < 202 0x04 >; /* GPIO PZ2 */
 		};
+
+		gyrometer@68 {
+			compatible = "invn,mpu3050";
+			reg = <0x68>;
+			interrupt-parent = <&gpio>;
+			interrupts = <204 0x04>; /* gpio PZ4 */
+		};
 	};
 
 	i2c@7000c400 {
 		clock-frequency = <100000>;
+
+		smart-battery@b {
+			compatible = "ti,bq20z75", "smart-battery-1.1";
+			reg = <0xb>;
+			ti,i2c-retry-count = <2>;
+			ti,poll-retry-count = <10>;
+		};
 	};
 
 	i2c@7000c500 {
@@ -295,10 +309,17 @@
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
+			interrupt-parent = <&gpio>;
+			interrupts = <109 0x04>; /* gpio PN5 */
+		};
 	};
 
 	i2s@70002a00 {
-- 
1.7.0.4
