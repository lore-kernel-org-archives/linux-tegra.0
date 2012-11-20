From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] ARM: dt: tegra: cardhu: Add drm components
Date: Tue, 20 Nov 2012 15:27:52 +0800
Message-ID: <1353396472-24167-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds the rgb node which is needed by
tegra drm driver.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in V2:
- Remove HDMI node in dts. Currently tegra drm driver doesn't 
  work while RGB and HDMI are enabled simultaneously

 arch/arm/boot/dts/tegra30-cardhu.dtsi |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index bdb2a66..20af79e 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -27,6 +27,15 @@
 	model = "NVIDIA Tegra30 Cardhu evaluation board";
 	compatible = "nvidia,cardhu", "nvidia,tegra30";
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,ddc-i2c-bus = <&rgbddc>;
+			};
+		};
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
@@ -114,7 +123,7 @@
 		clock-frequency = <408000000>;
 	};
 
-	i2c@7000c000 {
+	rgbddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
-- 
1.7.9.5
