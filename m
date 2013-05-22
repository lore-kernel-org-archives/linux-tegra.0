From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v3 6/6] ARM: tegra114: convert device tree files to use CLK defines
Date: Wed, 22 May 2013 19:45:36 +0300
Message-ID: <1369241136-21903-6-git-send-email-hdoyu@nvidia.com>
References: <1369241136-21903-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369241136-21903-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use the Tegra114 CAR binding header (tegra114-car.h) to replace magic
numbers in the device tree. For example,

-               clocks = <&tegra_car 28>;
+               clocks = <&tegra_car CLK_HOST1X>;

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 51 +++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index c376a12..2eab52e 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -1,3 +1,4 @@
+#include <dt-bindings/clk/tegra114-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -35,7 +36,7 @@
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 5>;
+		clocks = <&tegra_car TEGRA114_CLK_TIMER>;
 	};
 
 	tegra_car: clock {
@@ -79,7 +80,7 @@
 			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 34>;
+		clocks = <&tegra_car TEGRA114_CLK_APBDMA>;
 	};
 
 	ahb: ahb {
@@ -125,7 +126,7 @@
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 8>;
 		status = "disabled";
-		clocks = <&tegra_car 6>;
+		clocks = <&tegra_car TEGRA114_CLK_UARTA>;
 	};
 
 	uartb: serial@70006040 {
@@ -135,7 +136,7 @@
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 9>;
 		status = "disabled";
-		clocks = <&tegra_car 192>;
+		clocks = <&tegra_car TEGRA114_CLK_UARTB>;
 	};
 
 	uartc: serial@70006200 {
@@ -145,7 +146,7 @@
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 10>;
 		status = "disabled";
-		clocks = <&tegra_car 55>;
+		clocks = <&tegra_car TEGRA114_CLK_UARTC>;
 	};
 
 	uartd: serial@70006300 {
@@ -155,14 +156,14 @@
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 19>;
 		status = "disabled";
-		clocks = <&tegra_car 65>;
+		clocks = <&tegra_car TEGRA114_CLK_UARTD>;
 	};
 
 	pwm: pwm {
 		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
 		#pwm-cells = <2>;
-		clocks = <&tegra_car 17>;
+		clocks = <&tegra_car TEGRA114_CLK_PWM>;
 		status = "disabled";
 	};
 
@@ -172,7 +173,7 @@
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 12>;
+		clocks = <&tegra_car TEGRA114_CLK_I2C1>;
 		clock-names = "div-clk";
 		status = "disabled";
 	};
@@ -183,7 +184,7 @@
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 54>;
+		clocks = <&tegra_car TEGRA114_CLK_I2C2>;
 		clock-names = "div-clk";
 		status = "disabled";
 	};
@@ -194,7 +195,7 @@
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 67>;
+		clocks = <&tegra_car TEGRA114_CLK_I2C3>;
 		clock-names = "div-clk";
 		status = "disabled";
 	};
@@ -205,7 +206,7 @@
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 103>;
+		clocks = <&tegra_car TEGRA114_CLK_I2C4>;
 		clock-names = "div-clk";
 		status = "disabled";
 	};
@@ -216,7 +217,7 @@
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 47>;
+		clocks = <&tegra_car TEGRA114_CLK_I2C5>;
 		clock-names = "div-clk";
 		status = "disabled";
 	};
@@ -228,7 +229,7 @@
 		nvidia,dma-request-selector = <&apbdma 15>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 41>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC1>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -240,7 +241,7 @@
 		nvidia,dma-request-selector = <&apbdma 16>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 44>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC2>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -252,7 +253,7 @@
 		nvidia,dma-request-selector = <&apbdma 17>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 46>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC3>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -264,7 +265,7 @@
 		nvidia,dma-request-selector = <&apbdma 18>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 68>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC4>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -276,7 +277,7 @@
 		nvidia,dma-request-selector = <&apbdma 27>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 104>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC5>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -288,7 +289,7 @@
 		nvidia,dma-request-selector = <&apbdma 28>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 105>;
+		clocks = <&tegra_car TEGRA114_CLK_SBC6>;
 		clock-names = "spi";
 		status = "disabled";
 	};
@@ -297,21 +298,21 @@
 		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 4>;
+		clocks = <&tegra_car TEGRA114_CLK_RTC>;
 	};
 
 	kbc {
 		compatible = "nvidia,tegra114-kbc";
 		reg = <0x7000e200 0x100>;
 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 36>;
+		clocks = <&tegra_car TEGRA114_CLK_KBC>;
 		status = "disabled";
 	};
 
 	pmc {
 		compatible = "nvidia,tegra114-pmc";
 		reg = <0x7000e400 0x400>;
-		clocks = <&tegra_car 261>, <&clk32k_in>;
+		clocks = <&tegra_car TEGRA114_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 	};
 
@@ -330,7 +331,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 14>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
 		status = "disable";
 	};
 
@@ -338,7 +339,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 9>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
 		status = "disable";
 	};
 
@@ -346,7 +347,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 69>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
 		status = "disable";
 	};
 
@@ -354,7 +355,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 15>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
 		status = "disable";
 	};
 
-- 
1.8.1.5
