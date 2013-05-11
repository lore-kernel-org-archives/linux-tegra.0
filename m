From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] ARM: DT: tegra: Add gpio-leds to Tegra30 Beaver
Date: Fri, 10 May 2013 17:40:29 -0700
Message-ID: <1368232829-25716-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for general-purpose LEDs present on Beaver

Signed-off-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-beaver.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 6248b24..d44cd81 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -383,4 +383,17 @@
 			vin-supply = <&sys_3v3_reg>;
 		};
 	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		gpled1 {
+			label = "LED1"; /* CR5A1 (blue) */
+			gpios = <&gpio 89 0>; /* gpio PL1 */
+		};
+		gpled2 {
+			label = "LED2"; /* CR4A2 (green) */
+			gpios = <&gpio 88 0>; /* gpio PL0 */
+		};
+	};
 };
-- 
1.8.1.5
nvpublic
