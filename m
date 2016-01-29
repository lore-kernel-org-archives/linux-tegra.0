From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V5 07/11] of: Add bindings of hw-trip-points for soctherm
Date: Fri, 29 Jan 2016 16:47:40 +0800
Message-ID: <1454057260-16412-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, rui.zhang@intel.com
Cc: MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add hw-trips sub-node for soctherm, which is
used to describe the hardware trip points for
each soctherm sensors.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 .../devicetree/bindings/thermal/tegra-soctherm.txt | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
index 6b68cd150405..fb397191faa7 100644
--- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
+++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
@@ -26,6 +26,15 @@ Required properties :
     of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
     list of valid values when referring to thermal sensors.
 
+Optional properties:
+- hw-trip-points : A sub-node which is a container of hardware trip points
+    for each sensors.
+  * sensors: Sub-nodes which are used to describe the HW trip points info,
+        must be named as "cpu", "gpu", "mem", "pll".
+      Properties:
+      - thermtrip-mC : Shutdown or reset temperature in millicelsius,
+        once the temperature of this sensor is higher than it, the system
+        will be shutdown or reset.
 
 Example :
 
@@ -40,6 +49,21 @@ Example :
 		reset-names = "soctherm";
 
 		#thermal-sensor-cells = <1>;
+
+		hw-trip-points {
+			cpu {
+				thermtrip-mC = <103000>;
+			};
+			gpu {
+				thermtrip-mC = <103500>;
+			};
+			mem {
+				thermtrip-mC = <103500>;
+			};
+			pll {
+				thermtrip-mC = <105000>;
+			};
+		};
 	};
 
 Example: referring to thermal sensors :
-- 
1.9.1
