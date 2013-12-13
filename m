From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: Add SPI controller nodes for Tegra124
Date: Fri, 13 Dec 2013 17:24:05 +0100
Message-ID: <1386951847-6490-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The SPI controllers on Tegra124 are compatible with those found on the
Tegra114 SoC.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 2014aa4ed659..0a4e5271b5f9 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -314,6 +314,96 @@
 		status = "disabled";
 	};
 
+	spi@7000d400 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000d400 0x200>;
+		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC1>;
+		clock-names = "spi";
+		resets = <&tegra_car 41>;
+		reset-names = "spi";
+		dmas = <&apbdma 15>, <&apbdma 15>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
+	spi@7000d600 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000d600 0x200>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC2>;
+		clock-names = "spi";
+		resets = <&tegra_car 44>;
+		reset-names = "spi";
+		dmas = <&apbdma 16>, <&apbdma 16>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
+	spi@7000d800 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000d800 0x200>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC3>;
+		clock-names = "spi";
+		resets = <&tegra_car 46>;
+		reset-names = "spi";
+		dmas = <&apbdma 17>, <&apbdma 17>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
+	spi@7000da00 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000da00 0x200>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC4>;
+		clock-names = "spi";
+		resets = <&tegra_car 68>;
+		reset-names = "spi";
+		dmas = <&apbdma 18>, <&apbdma 18>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
+	spi@7000dc00 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000dc00 0x200>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC5>;
+		clock-names = "spi";
+		resets = <&tegra_car 104>;
+		reset-names = "spi";
+		dmas = <&apbdma 27>, <&apbdma 27>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
+	spi@7000de00 {
+		compatible = "nvidia,tegra124-spi", "nvidia,tegra114-spi";
+		reg = <0x7000de00 0x200>;
+		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car TEGRA124_CLK_SBC6>;
+		clock-names = "spi";
+		resets = <&tegra_car 105>;
+		reset-names = "spi";
+		dmas = <&apbdma 28>, <&apbdma 28>;
+		dma-names = "rx", "tx";
+		status = "disabled";
+	};
+
 	rtc@7000e000 {
 		compatible = "nvidia,tegra124-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
-- 
1.8.4.2
