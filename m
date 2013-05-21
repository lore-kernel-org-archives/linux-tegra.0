From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 6/6] ARM: tegra114: convert device tree files to use CLK defines
Date: Tue, 21 May 2013 12:10:50 +0300
Message-ID: <1369127450-15203-7-git-send-email-hdoyu@nvidia.com>
References: <1369127450-15203-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369127450-15203-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use the Tegra114 CAR binding header (tegra114-car.h) to replace magic
numbers in the device tree. For example,

-               clocks = <&tegra_car 28>;
+               clocks = <&tegra_car CLK_HOST1X>;

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts |  4 +-
 arch/arm/boot/dts/tegra114.dtsi        | 79 +++++++++++++++++++---------------
 2 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 680f0a8..3a4c4ce 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -972,7 +972,9 @@
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 216>, <&tegra_car 217>, <&tegra_car 120>;
+		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
+			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA114_CLK_EXTERN1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 15d1b58..4ce77ba 100644
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
 
@@ -336,11 +337,19 @@
 			<&apbdma 3>, <&apbdma 4>, <&apbdma 6>, <&apbdma 7>,
 			<&apbdma 12>, <&apbdma 13>, <&apbdma 14>,
 			<&apbdma 29>;
-		clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
-			 <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
-			 <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
-			 <&tegra_car 110>, <&tegra_car 194>, <&tegra_car 153>,
-			 <&tegra_car 154>;
+		clocks = <&tegra_car TEGRA114_CLK_D_AUDIO>,
+			 <&tegra_car TEGRA114_CLK_APBIF>,
+			 <&tegra_car TEGRA114_CLK_I2S0>,
+			 <&tegra_car TEGRA114_CLK_I2S1>,
+			 <&tegra_car TEGRA114_CLK_I2S2>,
+			 <&tegra_car TEGRA114_CLK_I2S3>,
+			 <&tegra_car TEGRA114_CLK_I2S4>,
+			 <&tegra_car TEGRA114_CLK_DAM0>,
+			 <&tegra_car TEGRA114_CLK_DAM1>,
+			 <&tegra_car TEGRA114_CLK_DAM2>,
+			 <&tegra_car TEGRA114_CLK_SPDIF_IN>,
+			 <&tegra_car TEGRA114_CLK_AMX>,
+			 <&tegra_car TEGRA114_CLK_ADX>;
 		clock-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
 			      "i2s3", "i2s4", "dam0", "dam1", "dam2",
 			      "spdif_in", "amx", "adx";
@@ -352,7 +361,7 @@
 			compatible = "nvidia,tegra114-i2s", "nvidia,tegra30-i2s";
 			reg = <0x70080300 0x100>;
 			nvidia,ahub-cif-ids = <4 4>;
-			clocks = <&tegra_car 30>;
+			clocks = <&tegra_car TEGRA114_CLK_I2S0>;
 			status = "disabled";
 		};
 
@@ -360,7 +369,7 @@
 			compatible = "nvidia,tegra114-i2s", "nvidia,tegra30-i2s";
 			reg = <0x70080400 0x100>;
 			nvidia,ahub-cif-ids = <5 5>;
-			clocks = <&tegra_car 11>;
+			clocks = <&tegra_car TEGRA114_CLK_I2S1>;
 			status = "disabled";
 		};
 
@@ -368,7 +377,7 @@
 			compatible = "nvidia,tegra114-i2s", "nvidia,tegra30-i2s";
 			reg = <0x70080500 0x100>;
 			nvidia,ahub-cif-ids = <6 6>;
-			clocks = <&tegra_car 18>;
+			clocks = <&tegra_car TEGRA114_CLK_I2S2>;
 			status = "disabled";
 		};
 
@@ -376,7 +385,7 @@
 			compatible = "nvidia,tegra114-i2s", "nvidia,tegra30-i2s";
 			reg = <0x70080600 0x100>;
 			nvidia,ahub-cif-ids = <7 7>;
-			clocks = <&tegra_car 101>;
+			clocks = <&tegra_car TEGRA114_CLK_I2S3>;
 			status = "disabled";
 		};
 
@@ -384,7 +393,7 @@
 			compatible = "nvidia,tegra114-i2s", "nvidia,tegra30-i2s";
 			reg = <0x70080700 0x100>;
 			nvidia,ahub-cif-ids = <8 8>;
-			clocks = <&tegra_car 102>;
+			clocks = <&tegra_car TEGRA114_CLK_I2S4>;
 			status = "disabled";
 		};
 	};
@@ -393,7 +402,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 14>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
 		status = "disable";
 	};
 
@@ -401,7 +410,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 9>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
 		status = "disable";
 	};
 
@@ -409,7 +418,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 69>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
 		status = "disable";
 	};
 
@@ -417,7 +426,7 @@
 		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 15>;
+		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
 		status = "disable";
 	};
 
-- 
1.8.1.5
