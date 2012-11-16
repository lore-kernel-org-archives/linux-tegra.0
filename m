From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v3 1/2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 23:59:03 +0100
Message-ID: <0a45efce28b667f334b682a6b8b056e4c7a5d486.1353106697.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds host1x support which includes LVDS support. HDMI is disabled
for now as the tegra drm cannot handle two different display timings
at the same time.

--
V3: forgot to move host1x up, revert the hdmi ddc clock change

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index e884fa5..6cc6215 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -14,6 +14,15 @@
 		bootargs = "console=ttyS0,115200n8 earlyprintk root=/dev/mmcblk0p7 rootwait verbose debug tegrapart=recovery:300:a00:800,boot:d00:1000:800,mbr:1d00:200:800";
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
@@ -244,7 +253,7 @@
 		clock-frequency = <216000000>;
 	};
 
-	i2c@7000c000 {
+	lvds_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-- 
1.7.9.5
