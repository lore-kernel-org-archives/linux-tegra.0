From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 3/3] arm64: dts: tegra210: set thermtrip
Date: Fri, 7 Dec 2018 18:10:07 +0800
Message-ID: <1544177407-20203-4-git-send-email-wni@nvidia.com>
References: <1544177407-20203-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544177407-20203-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Set "nvidia,thermtrips" property, it used to set
HW shutdown temperatures.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 8fe47d6445a5..f2e89b218b23 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1330,6 +1330,9 @@
 		reset-names = "soctherm";
 		#thermal-sensor-cells = <1>;
 
+		nvidia,thermtrips = <TEGRA124_SOCTHERM_SENSOR_CPU 102500
+				     TEGRA124_SOCTHERM_SENSOR_GPU 103000>;
+
 		throttle-cfgs {
 			throttle_heavy: heavy {
 				nvidia,priority = <100>;
@@ -1349,8 +1352,8 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
 
 			trips {
-				cpu-shutdown-trip {
-					temperature = <102500>;
+				cpu-critical-trip {
+					temperature = <102000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -1377,7 +1380,7 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_MEM>;
 
 			trips {
-				mem-shutdown-trip {
+				mem-critical-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
@@ -1399,8 +1402,8 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_GPU>;
 
 			trips {
-				gpu-shutdown-trip {
-					temperature = <103000>;
+				gpu-critical-trip {
+					temperature = <102500>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -1427,7 +1430,7 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_PLLX>;
 
 			trips {
-				pllx-shutdown-trip {
+				pllx-critical-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
-- 
2.7.4
