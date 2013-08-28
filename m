From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] ARM: tegra: Add host1x, dc and hdmi to Tegra114 device tree
Date: Wed, 28 Aug 2013 13:40:58 +0300
Message-ID: <1377686459-16634-5-git-send-email-mperttunen@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377686459-16634-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add host1x, dc (display controller) and hdmi devices to Tegra114
device tree.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 43 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 2905145..ce5a95c 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -27,6 +27,49 @@
 			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	host1x {
+		compatible = "nvidia,tegra114-host1x", "nvidia,tegra30-host1x",
+				"simple-bus";
+		reg = <0x50000000 0x00028000>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0x54000000 0x54000000 0x04000000>;
+
+		dc@54200000 {
+			compatible = "nvidia,tegra114-dc", "nvidia,tegra30-dc";
+			reg = <0x54200000 0x00040000>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
+				    <&tegra_car TEGRA114_CLK_PLL_P>;
+			clock-names = "disp1", "parent";
+		};
+
+		dc@54240000 {
+			compatible = "nvidia,tegra114-dc", "nvidia,tegra30-dc";
+			reg = <0x54240000 0x00040000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
+				    <&tegra_car TEGRA114_CLK_PLL_P>;
+			clock-names = "disp2", "parent";
+		};
+
+		hdmi {
+			compatible = "nvidia,tegra114-hdmi";
+			reg = <0x54280000 0x00040000>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_HDMI>,
+				    <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
+			clock-names = "hdmi", "parent";
+
+			status = "disabled";
+		};
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
-- 
1.8.1.5
