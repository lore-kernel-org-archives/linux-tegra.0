From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v6 15/19] ARM: dts: tegra: Add clock-cells property to pmc
Date: Mon, 6 Jan 2020 20:14:14 -0800
Message-ID: <1578370458-3686-16-git-send-email-skomatineni@nvidia.com>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has clk_out_1, clk_out_2, clk_out_3, and blink clock.

These clocks are moved from clock driver to pmc driver with pmc
as the clock provider for these clocks.

This patch adds #clock-cells property with 1 clock specifier to
the Tegra PMC node in device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 +++-
 arch/arm/boot/dts/tegra124.dtsi | 4 +++-
 arch/arm/boot/dts/tegra20.dtsi  | 4 +++-
 arch/arm/boot/dts/tegra30.dtsi  | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 0d7a6327e404..450a1f1b12a0 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra114-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra114";
@@ -514,11 +515,12 @@
 		status = "disabled";
 	};
 
-	pmc@7000e400 {
+	tegra_pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra114-pmc";
 		reg = <0x7000e400 0x400>;
 		clocks = <&tegra_car TEGRA114_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 	};
 
 	fuse@7000f800 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 413bfb981de8..bd7fad35d29a 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/tegra124-car.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra124";
@@ -595,11 +596,12 @@
 		clocks = <&tegra_car TEGRA124_CLK_RTC>;
 	};
 
-	pmc@7000e400 {
+	tegra_pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra124-pmc";
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA124_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 	};
 
 	fuse@7000f800 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9c58e7fcf5c0..c3b8ad53b967 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra20-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra20";
@@ -608,11 +609,12 @@
 		status = "disabled";
 	};
 
-	pmc@7000e400 {
+	tegra_pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra20-pmc";
 		reg = <0x7000e400 0x400>;
 		clocks = <&tegra_car TEGRA20_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 	};
 
 	mc: memory-controller@7000f000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 55ae050042ce..d2d05f1da274 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra30-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra30";
@@ -714,11 +715,12 @@
 		status = "disabled";
 	};
 
-	pmc@7000e400 {
+	tegra_pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra30-pmc";
 		reg = <0x7000e400 0x400>;
 		clocks = <&tegra_car TEGRA30_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 	};
 
 	mc: memory-controller@7000f000 {
-- 
2.7.4
