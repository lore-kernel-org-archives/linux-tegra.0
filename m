From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 09/10] arm64: tegra: add soctherm node for Tegra210
Date: Wed, 13 Jan 2016 16:00:53 +0800
Message-ID: <1452672053-518-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Adds soctherm node for Tegra210, and add cpu,
gpu, mem, pllx as thermal-zones.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index bc23f4dea002..8a148f7ec348 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/memory/tegra210-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/tegra124-soctherm.h>
 
 / {
 	compatible = "nvidia,tegra210";
@@ -802,4 +803,59 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	soctherm: thermal-sensor@0,700e2000 {
+		compatible = "nvidia,tegra210-soctherm";
+		reg = <0x0 0x700e2000 0x0 0x1000>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_TSENSOR>,
+			<&tegra_car TEGRA210_CLK_SOC_THERM>;
+		clock-names = "tsensor", "soctherm";
+		resets = <&tegra_car 78>;
+		reset-names = "soctherm";
+		#thermal-sensor-cells = <1>;
+
+		hw-trips {
+			cpu {
+				therm-temp = <102500>;
+			};
+			gpu {
+				therm-temp = <103000>;
+			};
+			mem {
+				therm-temp = <103000>;
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu {
+			polling-delay-passive = <1000>;
+			polling-delay = <0>;
+
+			thermal-sensors =
+				<&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
+		};
+		mem {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors =
+				<&soctherm TEGRA124_SOCTHERM_SENSOR_MEM>;
+		};
+		gpu {
+			polling-delay-passive = <1000>;
+			polling-delay = <0>;
+
+			thermal-sensors =
+				<&soctherm TEGRA124_SOCTHERM_SENSOR_GPU>;
+		};
+		pllx {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors =
+				<&soctherm TEGRA124_SOCTHERM_SENSOR_PLLX>;
+		};
+	};
 };
-- 
1.9.1
