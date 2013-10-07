From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9] ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
Date: Mon,  7 Oct 2013 13:48:43 +0200
Message-ID: <1381146528-18069-5-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add host1x, DC (display controller) and HDMI devices to Tegra114
device tree.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index be91592..600196a 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -16,6 +16,55 @@
 		serial3 = &uartd;
 	};
 
+	host1x@50000000 {
+		compatible = "nvidia,tegra114-host1x", "simple-bus";
+		reg = <0x50000000 0x00028000>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
+			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0x54000000 0x54000000 0x01000000>;
+
+		dc@54200000 {
+			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			reg = <0x54200000 0x00040000>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
+				 <&tegra_car TEGRA114_CLK_PLL_P>;
+			clock-names = "disp1", "parent";
+
+			rgb {
+				status = "disabled";
+			};
+		};
+
+		dc@54240000 {
+			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			reg = <0x54240000 0x00040000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
+				 <&tegra_car TEGRA114_CLK_PLL_P>;
+			clock-names = "disp2", "parent";
+
+			rgb {
+				status = "disabled";
+			};
+		};
+
+		hdmi@54280000 {
+			compatible = "nvidia,tegra114-hdmi";
+			reg = <0x54280000 0x00040000>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_HDMI>,
+				 <&tegra_car TEGRA114_CLK_PLL_D2_OUT0>;
+			clock-names = "hdmi", "parent";
+			status = "disabled";
+		};
+	};
+
 	gic: interrupt-controller {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-- 
1.8.4
