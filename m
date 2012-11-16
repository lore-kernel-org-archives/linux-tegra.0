From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v4 1/2] ARM: tegra: paz00: Add host1x support
Date: Sat, 17 Nov 2012 00:20:31 +0100
Message-ID: <138e6f406aef20f6257a8f90af45865bd9c88092.1353107865.git.marvin24@gmx.de>
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
V4: rebase against for-3.8/DT
V3: move host1x up, revert hdmi ddc clock change

 arch/arm/boot/dts/tegra20-paz00.dts |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 6a93d14..8a14e1d 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -10,6 +10,15 @@
 		reg = <0x00000000 0x20000000>;
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
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -240,7 +249,7 @@
 		clock-frequency = <216000000>;
 	};
 
-	i2c@7000c000 {
+	lvds_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-- 
1.7.9.5
