From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 2/6] ARM: tegra20: convert device tree files to use CLK defines
Date: Tue, 21 May 2013 12:10:46 +0300
Message-ID: <1369127450-15203-3-git-send-email-hdoyu@nvidia.com>
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

Use the Tegra20 CAR binding header (tegra20-car.h) to replace magic
numbers in the device tree. For example,

-               clocks = <&tegra_car 28>;
+               clocks = <&tegra_car CLK_HOST1X>;

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi |   4 +-
 arch/arm/boot/dts/tegra20-harmony.dts      |   4 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts  |   4 +-
 arch/arm/boot/dts/tegra20-paz00.dts        |   4 +-
 arch/arm/boot/dts/tegra20-plutux.dts       |   4 +-
 arch/arm/boot/dts/tegra20-seaboard.dts     |   4 +-
 arch/arm/boot/dts/tegra20-tec.dts          |   4 +-
 arch/arm/boot/dts/tegra20-trimslice.dts    |   4 +-
 arch/arm/boot/dts/tegra20-ventana.dts      |   4 +-
 arch/arm/boot/dts/tegra20-whistler.dts     |   4 +-
 arch/arm/boot/dts/tegra20.dtsi             | 116 +++++++++++++++--------------
 11 files changed, 91 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 1321bce..2fcb3f2 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -492,7 +492,9 @@
 
 		nvidia,ac97-controller = <&ac97>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 61d766f..d9f89cd 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -702,7 +702,9 @@
 		nvidia,ext-mic-en-gpios = <&gpio TEGRA_GPIO(X, 1)
 			GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index 85d5792..7580578 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -59,7 +59,9 @@
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index d4b1d63..cd2f0b5 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -277,7 +277,7 @@
 		clock-frequency = <80000>;
 		request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		slave-addr = <138>;
-		clocks = <&tegra_car 67>, <&tegra_car 124>;
+		clocks = <&tegra_car TEGRA20_CLK_I2C3>, <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 	};
 
@@ -535,7 +535,7 @@
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2)
 			GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>, <&tegra_car TEGRA20_CLK_PLL_A_OUT0>, <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
index 3374e16..d7a358a 100644
--- a/arch/arm/boot/dts/tegra20-plutux.dts
+++ b/arch/arm/boot/dts/tegra20-plutux.dts
@@ -53,7 +53,9 @@
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index ce6ceb5..ab177b4 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -853,7 +853,9 @@
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
index 9eaa962..c572c43 100644
--- a/arch/arm/boot/dts/tegra20-tec.dts
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -54,7 +54,9 @@
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2)
 			GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 83ba8fa..bc199ad 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -427,7 +427,9 @@
 		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&codec>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index e0c0cc1..7f8c28d 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -654,7 +654,9 @@
 		nvidia,ext-mic-en-gpios = <&gpio TEGRA_GPIO(X, 1)
 			GPIO_ACTIVE_HIGH>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 2b92120..ea078ab 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -613,7 +613,9 @@
 		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&codec>;
 
-		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f9c6eca..e5d9cb6 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -1,3 +1,4 @@
+#include <dt-bindings/clk/tegra20-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -20,7 +21,7 @@
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
-		clocks = <&tegra_car 28>;
+		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -31,48 +32,49 @@
 			compatible = "nvidia,tegra20-mpe";
 			reg = <0x54040000 0x00040000>;
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 60>;
+			clocks = <&tegra_car TEGRA20_CLK_MPE>;
 		};
 
 		vi {
 			compatible = "nvidia,tegra20-vi";
 			reg = <0x54080000 0x00040000>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 100>;
+			clocks = <&tegra_car TEGRA20_CLK_VI>;
 		};
 
 		epp {
 			compatible = "nvidia,tegra20-epp";
 			reg = <0x540c0000 0x00040000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 19>;
+			clocks = <&tegra_car TEGRA20_CLK_EPP>;
 		};
 
 		isp {
 			compatible = "nvidia,tegra20-isp";
 			reg = <0x54100000 0x00040000>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 23>;
+			clocks = <&tegra_car TEGRA20_CLK_ISP>;
 		};
 
 		gr2d {
 			compatible = "nvidia,tegra20-gr2d";
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 21>;
+			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
 		};
 
 		gr3d {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
-			clocks = <&tegra_car 24>;
+			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
 		};
 
 		dc@54200000 {
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 27>, <&tegra_car 121>;
+			clocks = <&tegra_car TEGRA20_CLK_DISP1>,
+				 <&tegra_car TEGRA20_CLK_PLL_P>;
 			clock-names = "disp1", "parent";
 
 			rgb {
@@ -84,7 +86,8 @@
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 26>, <&tegra_car 121>;
+			clocks = <&tegra_car TEGRA20_CLK_DISP2>,
+				 <&tegra_car TEGRA20_CLK_PLL_P>;
 			clock-names = "disp2", "parent";
 
 			rgb {
@@ -96,7 +99,8 @@
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 51>, <&tegra_car 117>;
+			clocks = <&tegra_car TEGRA20_CLK_HDMI>,
+				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
 			clock-names = "hdmi", "parent";
 			status = "disabled";
 		};
@@ -105,14 +109,14 @@
 			compatible = "nvidia,tegra20-tvo";
 			reg = <0x542c0000 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car 102>;
+			clocks = <&tegra_car TEGRA20_CLK_TVO>;
 			status = "disabled";
 		};
 
 		dsi {
 			compatible = "nvidia,tegra20-dsi";
 			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car 48>;
+			clocks = <&tegra_car TEGRA20_CLK_DSI>;
 			status = "disabled";
 		};
 	};
@@ -122,7 +126,7 @@
 		reg = <0x50040600 0x20>;
 		interrupts = <GIC_PPI 13
 			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
-		clocks = <&tegra_car 132>;
+		clocks = <&tegra_car TEGRA20_CLK_TWD>;
 	};
 
 	intc: interrupt-controller {
@@ -149,7 +153,7 @@
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 5>;
+		clocks = <&tegra_car TEGRA20_CLK_TIMER>;
 	};
 
 	tegra_car: clock {
@@ -177,7 +181,7 @@
 			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 34>;
+		clocks = <&tegra_car TEGRA20_CLK_APBDMA>;
 	};
 
 	ahb {
@@ -219,7 +223,7 @@
 		reg = <0x70002000 0x200>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 12>;
-		clocks = <&tegra_car 3>;
+		clocks = <&tegra_car TEGRA20_CLK_AC97>;
 		status = "disabled";
 	};
 
@@ -228,7 +232,7 @@
 		reg = <0x70002800 0x200>;
 		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 2>;
-		clocks = <&tegra_car 11>;
+		clocks = <&tegra_car TEGRA20_CLK_I2S1>;
 		status = "disabled";
 	};
 
@@ -237,7 +241,7 @@
 		reg = <0x70002a00 0x200>;
 		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 1>;
-		clocks = <&tegra_car 18>;
+		clocks = <&tegra_car TEGRA20_CLK_I2S2>;
 		status = "disabled";
 	};
 
@@ -254,7 +258,7 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 8>;
-		clocks = <&tegra_car 6>;
+		clocks = <&tegra_car TEGRA20_CLK_UARTA>;
 		status = "disabled";
 	};
 
@@ -264,7 +268,7 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 9>;
-		clocks = <&tegra_car 96>;
+		clocks = <&tegra_car TEGRA20_CLK_UARTB>;
 		status = "disabled";
 	};
 
@@ -274,7 +278,7 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 10>;
-		clocks = <&tegra_car 55>;
+		clocks = <&tegra_car TEGRA20_CLK_UARTC>;
 		status = "disabled";
 	};
 
@@ -284,7 +288,7 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 19>;
-		clocks = <&tegra_car 65>;
+		clocks = <&tegra_car TEGRA20_CLK_UARTD>;
 		status = "disabled";
 	};
 
@@ -294,7 +298,7 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 20>;
-		clocks = <&tegra_car 66>;
+		clocks = <&tegra_car TEGRA20_CLK_UARTE>;
 		status = "disabled";
 	};
 
@@ -302,7 +306,7 @@
 		compatible = "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
 		#pwm-cells = <2>;
-		clocks = <&tegra_car 17>;
+		clocks = <&tegra_car TEGRA20_CLK_PWM>;
 		status = "disabled";
 	};
 
@@ -310,7 +314,7 @@
 		compatible = "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
 		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 4>;
+		clocks = <&tegra_car TEGRA20_CLK_RTC>;
 	};
 
 	i2c@7000c000 {
@@ -319,7 +323,8 @@
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 12>, <&tegra_car 124>;
+		clocks = <&tegra_car TEGRA20_CLK_I2C1>,
+			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		status = "disabled";
 	};
@@ -331,7 +336,7 @@
 		nvidia,dma-request-selector = <&apbdma 11>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 43>;
+		clocks = <&tegra_car TEGRA20_CLK_SPI>;
 		status = "disabled";
 	};
 
@@ -341,7 +346,8 @@
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 54>, <&tegra_car 124>;
+		clocks = <&tegra_car TEGRA20_CLK_I2C2>,
+			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		status = "disabled";
 	};
@@ -352,7 +358,8 @@
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 67>, <&tegra_car 124>;
+		clocks = <&tegra_car TEGRA20_CLK_I2C3>,
+			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		status = "disabled";
 	};
@@ -363,7 +370,8 @@
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 47>, <&tegra_car 124>;
+		clocks = <&tegra_car TEGRA20_CLK_DVC>,
+			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		status = "disabled";
 	};
@@ -375,7 +383,7 @@
 		nvidia,dma-request-selector = <&apbdma 15>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 41>;
+		clocks = <&tegra_car TEGRA20_CLK_SBC1>;
 		status = "disabled";
 	};
 
@@ -386,7 +394,7 @@
 		nvidia,dma-request-selector = <&apbdma 16>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 44>;
+		clocks = <&tegra_car TEGRA20_CLK_SBC2>;
 		status = "disabled";
 	};
 
@@ -397,7 +405,7 @@
 		nvidia,dma-request-selector = <&apbdma 17>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 46>;
+		clocks = <&tegra_car TEGRA20_CLK_SBC3>;
 		status = "disabled";
 	};
 
@@ -408,7 +416,7 @@
 		nvidia,dma-request-selector = <&apbdma 18>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&tegra_car 68>;
+		clocks = <&tegra_car TEGRA20_CLK_SBC4>;
 		status = "disabled";
 	};
 
@@ -416,14 +424,14 @@
 		compatible = "nvidia,tegra20-kbc";
 		reg = <0x7000e200 0x100>;
 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 36>;
+		clocks = <&tegra_car TEGRA20_CLK_KBC>;
 		status = "disabled";
 	};
 
 	pmc {
 		compatible = "nvidia,tegra20-pmc";
 		reg = <0x7000e400 0x400>;
-		clocks = <&tegra_car 110>, <&clk32k_in>;
+		clocks = <&tegra_car TEGRA20_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 	};
 
@@ -453,7 +461,7 @@
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
 		nvidia,has-legacy-mode;
-		clocks = <&tegra_car 22>;
+		clocks = <&tegra_car TEGRA20_CLK_USBD>;
 		nvidia,needs-double-reset;
 		nvidia,phy = <&phy1>;
 		status = "disabled";
@@ -463,10 +471,10 @@
 		compatible = "nvidia,tegra20-usb-phy";
 		reg = <0xc5000000 0x4000 0xc5000000 0x4000>;
 		phy_type = "utmi";
-		clocks = <&tegra_car 22>,
-			 <&tegra_car 127>,
-			 <&tegra_car 106>,
-			 <&tegra_car 22>;
+		clocks = <&tegra_car TEGRA20_CLK_USBD>,
+			 <&tegra_car TEGRA20_CLK_PLL_U>,
+			 <&tegra_car TEGRA20_CLK_CLK_M>,
+			 <&tegra_car TEGRA20_CLK_USBD>;
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
 		nvidia,has-legacy-mode;
 		hssync_start_delay = <9>;
@@ -484,7 +492,7 @@
 		reg = <0xc5004000 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "ulpi";
-		clocks = <&tegra_car 58>;
+		clocks = <&tegra_car TEGRA20_CLK_USB2>;
 		nvidia,phy = <&phy2>;
 		status = "disabled";
 	};
@@ -493,9 +501,9 @@
 		compatible = "nvidia,tegra20-usb-phy";
 		reg = <0xc5004000 0x4000>;
 		phy_type = "ulpi";
-		clocks = <&tegra_car 58>,
-			 <&tegra_car 127>,
-			 <&tegra_car 93>;
+		clocks = <&tegra_car TEGRA20_CLK_USB2>,
+			 <&tegra_car TEGRA20_CLK_PLL_U>,
+			 <&tegra_car TEGRA20_CLK_CDEV2>;
 		clock-names = "reg", "pll_u", "ulpi-link";
 		status = "disabled";
 	};
@@ -505,7 +513,7 @@
 		reg = <0xc5008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
-		clocks = <&tegra_car 59>;
+		clocks = <&tegra_car TEGRA20_CLK_USB3>;
 		nvidia,phy = <&phy3>;
 		status = "disabled";
 	};
@@ -514,10 +522,10 @@
 		compatible = "nvidia,tegra20-usb-phy";
 		reg = <0xc5008000 0x4000 0xc5000000 0x4000>;
 		phy_type = "utmi";
-		clocks = <&tegra_car 59>,
-			 <&tegra_car 127>,
-			 <&tegra_car 106>,
-			 <&tegra_car 22>;
+		clocks = <&tegra_car TEGRA20_CLK_USB3>,
+			 <&tegra_car TEGRA20_CLK_PLL_U>,
+			 <&tegra_car TEGRA20_CLK_CLK_M>,
+			 <&tegra_car TEGRA20_CLK_USBD>;
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
 		hssync_start_delay = <9>;
 		idle_wait_delay = <17>;
@@ -533,7 +541,7 @@
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 14>;
+		clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
 		status = "disabled";
 	};
 
@@ -541,7 +549,7 @@
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 9>;
+		clocks = <&tegra_car TEGRA20_CLK_SDMMC2>;
 		status = "disabled";
 	};
 
@@ -549,7 +557,7 @@
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 69>;
+		clocks = <&tegra_car TEGRA20_CLK_SDMMC3>;
 		status = "disabled";
 	};
 
@@ -557,7 +565,7 @@
 		compatible = "nvidia,tegra20-sdhci";
 		reg = <0xc8000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car 15>;
+		clocks = <&tegra_car TEGRA20_CLK_SDMMC4>;
 		status = "disabled";
 	};
 
-- 
1.8.1.5
