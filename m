From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH V2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 23:46:17 +0100
Message-ID: <d64fa5be6ea5275896024515981e33b02b237ccb.1353105923.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds host1x support which includes LVDS support. HDMI is disabled
for now as the tegra drm cannot handle two different display timings
at the same time.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index e884fa5..5ea346e 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -244,7 +244,7 @@
 		clock-frequency = <216000000>;
 	};
 
-	i2c@7000c000 {
+	lvds_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -258,7 +258,7 @@
 
 	i2c@7000c400 {
 		status = "okay";
-		clock-frequency = <400000>;
+		clock-frequency = <100000>;
 	};
 
 	nvec {
@@ -499,6 +499,15 @@
 		};
 	};
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,ddc-i2c-bus = <&lvds_ddc>;
+			};
+		};
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-alc5632-paz00",
 			"nvidia,tegra-audio-alc5632";
-- 
1.7.9.5
