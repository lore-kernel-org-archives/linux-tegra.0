From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v6 08/12] of: add notes of critical trips for soctherm
Date: Mon, 22 Feb 2016 16:10:50 +0800
Message-ID: <1456128650-29104-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, robh@kernel.org, rui.zhang@intel.com
Cc: MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The "ctirical" type trip in thermal zone can be
set to SOC_THERM hardware, it can trigger shut down
or reset event from hardware.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 Documentation/devicetree/bindings/thermal/tegra-soctherm.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
index 6b68cd150405..351a7376baa8 100644
--- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
+++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
@@ -26,6 +26,10 @@ Required properties :
     of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
     list of valid values when referring to thermal sensors.
 
+Note:
+- the "critical" type trip points will be set to SOC_THERM hardware as the
+shut down temperature. Once the temperature of this thermal zone is higher
+than it, the system will be shutdown or reset by hardware.
 
 Example :
 
@@ -51,5 +55,13 @@ Example: referring to thermal sensors :
 
                         thermal-sensors =
                                 <&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
+
+			trips {
+				cpu_shutdown_trip: shutdown-trip {
+					temperature = <102500>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
                 };
 	};
-- 
1.9.1
