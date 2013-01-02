From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: paz00: enable HDMI port
Date: Wed,  2 Jan 2013 11:49:02 -0700
Message-ID: <1357152542-5982-3-git-send-email-swarren@wwwdotorg.org>
References: <1357152542-5982-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357152542-5982-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 6a93d14..1062798 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -10,6 +10,18 @@
 		reg = <0x00000000 0x20000000>;
 	};
 
+	host1x {
+		hdmi {
+			status = "okay";
+
+			vdd-supply = <&hdmi_vdd_reg>;
+			pll-supply = <&hdmi_pll_reg>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -252,7 +264,7 @@
 		};
 	};
 
-	i2c@7000c400 {
+	hdmi_ddc: i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <400000>;
 	};
@@ -367,13 +379,13 @@
 					regulator-max-microvolt = <1800000>;
 				};
 
-				ldo7 {
+				hdmi_vdd_reg: ldo7 {
 					regulator-name = "+3.3vs_ldo7,avdd_hdmi";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 				};
 
-				ldo8 {
+				hdmi_pll_reg: ldo8 {
 					regulator-name = "+1.8vs_ldo8,avdd_hdmi_pll";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
-- 
1.7.10.4
