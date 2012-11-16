From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dt: tegra: cardhu: Add drm components
Date: Fri, 16 Nov 2012 13:00:45 +0800
Message-ID: <1353042045-3182-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds the rgb and hdmi nodes which are necessary for
tegra drm driver.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi |   23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index bdb2a66..9af6987 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -27,6 +27,25 @@
 	model = "NVIDIA Tegra30 Cardhu evaluation board";
 	compatible = "nvidia,cardhu", "nvidia,tegra30";
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,ddc-i2c-bus = <&rgbddc>;
+			};
+		};
+
+		hdmi {
+			status = "okay";
+
+			vdd-supply = <&sys_3v3_reg>;
+			pll-supply = <&vio_reg>;
+
+			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
+			nvidia,ddc-i2c-bus = <&hdmiddc>;
+		};
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
@@ -114,7 +133,7 @@
 		clock-frequency = <408000000>;
 	};
 
-	i2c@7000c000 {
+	rgbddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
@@ -137,7 +156,7 @@
 		};
 	};
 
-	i2c@7000c700 {
+	hdmiddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
-- 
1.7.9.5
