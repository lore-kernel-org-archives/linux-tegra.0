From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: trimslice: add gpio-poweroff node to DT
Date: Wed,  2 Jan 2013 11:46:16 -0700
Message-ID: <1357152377-5918-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

... and disable tri-state from the pingroup that contains the poweroff
GPIO.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-trimslice.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index b70b4cb..4b6c486 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -249,6 +249,11 @@
 					"ld23_22";
 				nvidia,pull = <1>;
 			};
+			conf_spif {
+				nvidia,pins = "spif";
+				nvidia,pull = <1>;
+				nvidia,tristate = <0>;
+			};
 		};
 	};
 
@@ -322,6 +327,11 @@
 		bus-width = <4>;
 	};
 
+	poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&gpio 191 1>; /* gpio PX7, active low */
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.7.10.4
