From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 10/29] ARM: tegra: Add interconnect properties to Tegra30 device-tree
Date: Mon, 18 Nov 2019 23:02:28 +0300
Message-ID: <20191118200247.3567-11-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes to describe interconnection
of these nodes.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 55ae050042ce..69a239f1a823 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/gpio/tegra-gpio.h>
 #include <dt-bindings/memory/tegra30-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+#include <dt-bindings/interconnect/tegra-icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -207,6 +208,9 @@
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA_ICC_MC_DC &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
+
 			rgb {
 				status = "disabled";
 			};
@@ -226,6 +230,9 @@
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA_ICC_MC_DCB &emc TEGRA_ICC_EMEM>;
+			interconnect-names = "dma-mem";
+
 			rgb {
 				status = "disabled";
 			};
@@ -731,15 +738,18 @@
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra30-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <1>;
 	};
 
 	fuse@7000f800 {
-- 
2.23.0
