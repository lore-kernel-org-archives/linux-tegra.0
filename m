From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] ARM: dts: tegra20: Add Memory Client reset to VDE
Date: Sun, 20 May 2018 16:48:44 +0300
Message-ID: <20180520134846.31046-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hook up Memory Client reset of the Video Decoder to the decoders DT node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 983dd5c14794..f9495f12e731 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/tegra20-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
+#include <dt-bindings/memory/tegra20-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -282,7 +283,8 @@
 			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
 		interrupt-names = "sync-token", "bsev", "sxe";
 		clocks = <&tegra_car TEGRA20_CLK_VDE>;
-		resets = <&tegra_car 61>;
+		reset-names = "vde", "mc";
+		resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
 	};
 
 	apbmisc@70000800 {
@@ -593,11 +595,12 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
-	memory-controller@7000f000 {
+	mc: memory-controller@7000f000 {
 		compatible = "nvidia,tegra20-mc";
 		reg = <0x7000f000 0x024
 		       0x7000f03c 0x3c4>;
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		#reset-cells = <1>;
 	};
 
 	iommu@7000f024 {
-- 
2.17.0
