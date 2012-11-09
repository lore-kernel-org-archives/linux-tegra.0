From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: tamonten: Add NCT1008 temperature sensor
Date: Fri,  9 Nov 2012 23:00:08 +0100
Message-ID: <1352498408-31955-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tamonten SOM has an ON Semiconductor NCT1008 connected to the DVC
bus which is used to measure the ambient (local) temperature as well as
the on-die (remote) temperature.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v2:
- rename nct1008 node to temperature-sensor

 arch/arm/boot/dts/tegra20-tamonten.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index c3540e0..95df80e 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -440,6 +440,11 @@
 				};
 			};
 		};
+
+		temperature-sensor@4c {
+			compatible = "onnn,nct1008";
+			reg = <0x4c>;
+		};
 	};
 
 	pmc {
-- 
1.8.0
