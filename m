From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/4] ARM: dt: tegra seaboard: configure I2C2 pinmux
Date: Thu, 26 Apr 2012 11:52:49 -0600
Message-ID: <1335462771-21791-2-git-send-email-swarren@wwwdotorg.org>
References: <1335462771-21791-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335462771-21791-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The I2C2 controller can be routed to either pingroup DDC or PTA. Seaboard
actually uses this as an I2C bus mux, and devices are connected to both
pingroups. This change statically assigns the I2C2 controller to pingroup
PTA, so that on-board devices can be accessed. The DDC pingroup is used
for EDID/DDC accesses which are not yet required, given the absence of
any Tegra graphics support. I2C muxing will be supported later.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 96516fb..19db40a 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -100,7 +100,7 @@
 			};
 			hdint {
 				nvidia,pins = "hdint", "lpw0", "lpw2", "lsc1",
-					"lsck", "lsda", "pta";
+					"lsck", "lsda";
 				nvidia,function = "hdmi";
 			};
 			i2cp {
@@ -134,6 +134,10 @@
 				nvidia,pins = "pmc";
 				nvidia,function = "pwr_on";
 			};
+			pta {
+				nvidia,pins = "pta";
+				nvidia,function = "i2c2";
+			};
 			rm {
 				nvidia,pins = "rm";
 				nvidia,function = "i2c1";
-- 
1.7.0.4
