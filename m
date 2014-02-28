From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 09/10] ARM: tegra: Rename as3722 node to pmic
Date: Fri, 28 Feb 2014 17:40:28 +0100
Message-ID: <1393605629-30514-9-git-send-email-thierry.reding@gmail.com>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Device tree node name should reflect the kind of device rather than the
specific name of the device.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 8c36e4c47871..1ad686154286 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -8,7 +8,7 @@
 	compatible = "nvidia,venice2", "nvidia,tegra124";
 
 	aliases {
-		rtc0 = "/i2c@7000d000/as3722@40";
+		rtc0 = "/i2c@7000d000/pmic@40";
 		rtc1 = "/rtc@7000e000";
 	};
 
@@ -617,7 +617,7 @@
 		status = "okay";
 		clock-frequency = <400000>;
 
-		as3722: as3722@40 {
+		pmic: pmic@40 {
 			compatible = "ams,as3722";
 			reg = <0x40>;
 			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1067,7 +1067,7 @@
 			regulator-name = "+3.3V_RUN";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
-			gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
+			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 			vin-supply = <&vdd_3v3_sys>;
 		};
@@ -1132,7 +1132,7 @@
 			regulator-name = "+3.3V_PANEL";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
-			gpio = <&as3722 4 GPIO_ACTIVE_HIGH>;
+			gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 			vin-supply = <&vdd_3v3_run>;
 		};
@@ -1148,7 +1148,7 @@
 			 * controllers so that it can be enabled on demand.
 			 */
 			regulator-always-on;
-			gpio = <&as3722 2 GPIO_ACTIVE_HIGH>;
+			gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 			vin-supply = <&vdd_3v3_sys>;
 		};
-- 
1.8.4.2
