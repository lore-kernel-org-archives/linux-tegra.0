From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 06/10] of: Add bindings of hw-trips for soctherm
Date: Wed, 13 Jan 2016 16:00:22 +0800
Message-ID: <1452672022-387-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add hw-trips sub-node for soctherm, which is
used to describe the hardware trip points for
each soctherm sensors.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 .../devicetree/bindings/thermal/tegra-soctherm.txt | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
index 6b68cd150405..77aef0b4968b 100644
--- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
+++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
@@ -26,6 +26,18 @@ Required properties :
     of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
     list of valid values when referring to thermal sensors.
 
+Optional properties:
+- hw-trips : A sub-node which is a container of hardware trip points
+    for each sensors.
+  * sensors: Sub-nodes which are used to describe the HW trip points info,
+        must be named as "cpu", "gpu", "mem", "pll".
+      Properties:
+      - therm-temp : Shutdown temperature in millicelsius, once the
+        temperature of this sensor is higher than the therm-temp, the system
+        will be reset or shutdown.
+      - throt-temp : HW throttle temperature in millicelsius, once the
+        temperature of this sensor is higher than the throt-temp, the HW
+        throttle will be triggered in soctherm. (Not implement yet)
 
 Example :
 
@@ -40,6 +52,23 @@ Example :
 		reset-names = "soctherm";
 
 		#thermal-sensor-cells = <1>;
+
+		hw-trips {
+			cpu {
+				therm-temp = <103000>;
+				throt-temp = <98500>;
+			};
+			gpu {
+				therm-temp = <103500>;
+				throt-temp = <100000>;
+			};
+			mem {
+				therm-temp = <103500>;
+			};
+			pll {
+				therm-temp = <105000>;
+			};
+		};
 	};
 
 Example: referring to thermal sensors :
-- 
1.9.1
