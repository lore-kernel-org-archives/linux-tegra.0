From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 20/21] ARM: dt: tegra124: add tegra,smmu entry
Date: Fri, 30 May 2014 14:20:33 +0300
Message-ID: <1401448834-32659-21-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add Tegra SMMU DT entry.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 6e6bc4e8185c..5b339ca8a1ab 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -1,5 +1,6 @@
 #include <dt-bindings/clock/tegra124-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
+#include <dt-bindings/memory/tegra-swgroup.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -449,6 +450,20 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+       smmu: iommu {
+               compatible = "nvidia,tegra124-smmu";
+               reg = <0x0 0x70019010 0x0 0x34
+                      0x0 0x700191f0 0x0 0x10
+                      0x0 0x70019228 0x0 0x58
+                      0x0 0x70019600 0x0 0x4
+                      0x0 0x700199b8 0x0 0x4
+                      0x0 0x700199e0 0x0 0x18
+                      0x0 0x70019a88 0x0 0x24>;
+               nvidia,#asids = <128>;
+               dma-window = <0x0 0x0 0x0 0x40000000>;
+	       iommu-cells = <2>;
+       };
+
 	sdhci@0,700b0000 {
 		compatible = "nvidia,tegra124-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
-- 
2.0.0.rc1.15.g7e76a2f
