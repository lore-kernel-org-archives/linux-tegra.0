From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri,  9 Nov 2012 22:58:43 +0100
Message-ID: <1352498323-31845-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Harmony board has an Analog Devices ADT7461 temperature sensor
connected to the DVC bus. It can be used to monitor the ambient (local)
and on-die (remote) temperatures.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v2:
- rename adt7641 node to temperature-sensor

 arch/arm/boot/dts/tegra20-harmony.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 74b8a47..a3f2f38 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -396,6 +396,11 @@
 				};
 			};
 		};
+
+		temperature-sensor@4c {
+			compatible = "adi,adt7461";
+			reg = <0x4c>;
+		};
 	};
 
 	pmc {
-- 
1.8.0
