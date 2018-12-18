From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 03/12] arm64: dts: tegra210: set thermtrip
Date: Tue, 18 Dec 2018 15:34:35 +0800
Message-ID: <1545118484-23641-5-git-send-email-wni@nvidia.com>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545118484-23641-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Set "nvidia,thermtrips" property, it used to set
HW shutdown temperatures.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 2205d66b0443..36c7dce7fa69 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1332,6 +1332,9 @@
 		reset-names = "soctherm";
 		#thermal-sensor-cells = <1>;
 
+		nvidia,thermtrips = <TEGRA124_SOCTHERM_SENSOR_CPU 102500
+				     TEGRA124_SOCTHERM_SENSOR_GPU 103000>;
+
 		throttle-cfgs {
 			throttle_heavy: heavy {
 				nvidia,priority = <100>;
@@ -1351,8 +1354,8 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
 
 			trips {
-				cpu-shutdown-trip {
-					temperature = <102500>;
+				cpu-critical-trip {
+					temperature = <102000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -1379,7 +1382,7 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_MEM>;
 
 			trips {
-				mem-shutdown-trip {
+				mem-critical-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
@@ -1401,8 +1404,8 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_GPU>;
 
 			trips {
-				gpu-shutdown-trip {
-					temperature = <103000>;
+				gpu-critical-trip {
+					temperature = <102500>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -1429,7 +1432,7 @@
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_PLLX>;
 
 			trips {
-				pllx-shutdown-trip {
+				pllx-critical-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
-- 
2.7.4
