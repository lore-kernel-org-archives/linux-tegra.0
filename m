From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 1/6] ARM: tegra20: create a DT header defining CLK IDs
Date: Tue, 21 May 2013 12:10:45 +0300
Message-ID: <1369127450-15203-2-git-send-email-hdoyu@nvidia.com>
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

Create a header file to define the clock IDs used by the Tegra20 clock
binding. Remove the list of definitions from the binding documentation,
and refer the reader to the header file.

This will allow the same header to be used by both device tree files,
and drivers implementing this binding, which guarantees that the two
stay in sync. This also makes device trees more readable by using names
instead of magic numbers.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/clock/nvidia,tegra20-car.txt          | 154 +-------------------
 include/dt-bindings/clk/tegra20-car.h              | 158 +++++++++++++++++++++
 2 files changed, 162 insertions(+), 150 deletions(-)
 create mode 100644 include/dt-bindings/clk/tegra20-car.h

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
index e885680..e6b9986 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
@@ -12,155 +12,9 @@ Required properties :
 - clocks : Should contain phandle and clock specifiers for two clocks:
   the 32 KHz "32k_in", and the board-specific oscillator "osc".
 - #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the CAR.
-
-  The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
-  registers. These IDs often match those in the CAR's RST_DEVICES registers,
-  but not in all cases. Some bits in CLK_OUT_ENB affect multiple clocks. In
-  this case, those clocks are assigned IDs above 95 in order to highlight
-  this issue. Implementations that interpret these clock IDs as bit values
-  within the CLK_OUT_ENB or RST_DEVICES registers should be careful to
-  explicitly handle these special cases.
-
-  The balance of the clocks controlled by the CAR are assigned IDs of 96 and
-  above.
-
-  0	cpu
-  1	unassigned
-  2	unassigned
-  3	ac97
-  4	rtc
-  5	tmr
-  6	uart1
-  7	unassigned	(register bit affects uart2 and vfir)
-  8	gpio
-  9	sdmmc2
-  10	unassigned	(register bit affects spdif_in and spdif_out)
-  11	i2s1
-  12	i2c1
-  13	ndflash
-  14	sdmmc1
-  15	sdmmc4
-  16	twc
-  17	pwm
-  18	i2s2
-  19	epp
-  20	unassigned	(register bit affects vi and vi_sensor)
-  21	2d
-  22	usbd
-  23	isp
-  24	3d
-  25	ide
-  26	disp2
-  27	disp1
-  28	host1x
-  29	vcp
-  30	unassigned
-  31	cache2
-
-  32	mem
-  33	ahbdma
-  34	apbdma
-  35	unassigned
-  36	kbc
-  37	stat_mon
-  38	pmc
-  39	fuse
-  40	kfuse
-  41	sbc1
-  42	snor
-  43	spi1
-  44	sbc2
-  45	xio
-  46	sbc3
-  47	dvc
-  48	dsi
-  49	unassigned	(register bit affects tvo and cve)
-  50	mipi
-  51	hdmi
-  52	csi
-  53	tvdac
-  54	i2c2
-  55	uart3
-  56	unassigned
-  57	emc
-  58	usb2
-  59	usb3
-  60	mpe
-  61	vde
-  62	bsea
-  63	bsev
-
-  64	speedo
-  65	uart4
-  66	uart5
-  67	i2c3
-  68	sbc4
-  69	sdmmc3
-  70	pcie
-  71	owr
-  72	afi
-  73	csite
-  74	unassigned
-  75	avpucq
-  76	la
-  77	unassigned
-  78	unassigned
-  79	unassigned
-  80	unassigned
-  81	unassigned
-  82	unassigned
-  83	unassigned
-  84	irama
-  85	iramb
-  86	iramc
-  87	iramd
-  88	cram2
-  89	audio_2x	a/k/a audio_2x_sync_clk
-  90	clk_d
-  91	unassigned
-  92	sus
-  93	cdev2
-  94	cdev1
-  95	unassigned
-
-  96	uart2
-  97	vfir
-  98	spdif_in
-  99	spdif_out
-  100	vi
-  101	vi_sensor
-  102	tvo
-  103	cve
-  104	osc
-  105	clk_32k		a/k/a clk_s
-  106	clk_m
-  107	sclk
-  108	cclk
-  109	hclk
-  110	pclk
-  111	blink
-  112	pll_a
-  113	pll_a_out0
-  114	pll_c
-  115	pll_c_out1
-  116	pll_d
-  117	pll_d_out0
-  118	pll_e
-  119	pll_m
-  120	pll_m_out1
-  121	pll_p
-  122	pll_p_out1
-  123	pll_p_out2
-  124	pll_p_out3
-  125	pll_p_out4
-  126	pll_s
-  127	pll_u
-  128	pll_x
-  129	cop		a/k/a avp
-  130	audio		a/k/a audio_sync_clk
-  131	pll_ref
-  132	twd
+  In clock consumers, this cell represents the clock ID exposed by the
+  CAR. The assignments may be found in header file
+  <dt-bindings/clk/tegra20-car.h>.
 
 Example SoC include file:
 
@@ -172,7 +26,7 @@ Example SoC include file:
 	};
 
 	usb@c5004000 {
-		clocks = <&tegra_car 58>; /* usb2 */
+		clocks = <&tegra_car TEGRA20_CLK_USB2>;
 	};
 };
 
diff --git a/include/dt-bindings/clk/tegra20-car.h b/include/dt-bindings/clk/tegra20-car.h
new file mode 100644
index 0000000..e30b4bd
--- /dev/null
+++ b/include/dt-bindings/clk/tegra20-car.h
@@ -0,0 +1,158 @@
+/*
+ * This header provides constants for binding nvidia,tegra20-car.
+ *
+ * The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
+ * registers. These IDs often match those in the CAR's RST_DEVICES registers,
+ * but not in all cases. Some bits in CLK_OUT_ENB affect multiple clocks. In
+ * this case, those clocks are assigned IDs above 95 in order to highlight
+ * this issue. Implementations that interpret these clock IDs as bit values
+ * within the CLK_OUT_ENB or RST_DEVICES registers should be careful to
+ * explicitly handle these special cases.
+ *
+ * The balance of the clocks controlled by the CAR are assigned IDs of 96 and
+ * above.
+ */
+
+#ifndef _DT_BINDINGS_CLK_TEGRA20_CAR_H
+#define _DT_BINDINGS_CLK_TEGRA20_CAR_H
+
+#define TEGRA20_CLK_CPU 0
+/* 1 */
+/* 2 */
+#define TEGRA20_CLK_AC97 3
+#define TEGRA20_CLK_RTC 4
+#define TEGRA20_CLK_TIMER 5
+#define TEGRA20_CLK_UARTA 6
+/* 7 (register bit affects uart2 and vfir) */
+#define TEGRA20_CLK_GPIO 8
+#define TEGRA20_CLK_SDMMC2 9
+/* 10 (register bit affects spdif_in and spdif_out) */
+#define TEGRA20_CLK_I2S1 11
+#define TEGRA20_CLK_I2C1 12
+#define TEGRA20_CLK_NDFLASH 13
+#define TEGRA20_CLK_SDMMC1 14
+#define TEGRA20_CLK_SDMMC4 15
+#define TEGRA20_CLK_TWC 16
+#define TEGRA20_CLK_PWM 17
+#define TEGRA20_CLK_I2S2 18
+#define TEGRA20_CLK_EPP 19
+/* 20 (register bit affects vi and vi_sensor) */
+#define TEGRA20_CLK_GR2D 21
+#define TEGRA20_CLK_USBD 22
+#define TEGRA20_CLK_ISP 23
+#define TEGRA20_CLK_GR3D 24
+#define TEGRA20_CLK_IDE 25
+#define TEGRA20_CLK_DISP2 26
+#define TEGRA20_CLK_DISP1 27
+#define TEGRA20_CLK_HOST1X 28
+#define TEGRA20_CLK_VCP 29
+/* 30 */
+#define TEGRA20_CLK_CACHE2 31
+
+#define TEGRA20_CLK_MEM 32
+#define TEGRA20_CLK_AHBDMA 33
+#define TEGRA20_CLK_APBDMA 34
+/* 35 */
+#define TEGRA20_CLK_KBC 36
+#define TEGRA20_CLK_STAT_MON 37
+#define TEGRA20_CLK_PMC 38
+#define TEGRA20_CLK_FUSE 39
+#define TEGRA20_CLK_KFUSE 40
+#define TEGRA20_CLK_SBC1 41
+#define TEGRA20_CLK_NOR 42
+#define TEGRA20_CLK_SPI 43
+#define TEGRA20_CLK_SBC2 44
+#define TEGRA20_CLK_XIO 45
+#define TEGRA20_CLK_SBC3 46
+#define TEGRA20_CLK_DVC 47
+#define TEGRA20_CLK_DSI 48
+/* 49 (register bit affects tvo and cve) */
+#define TEGRA20_CLK_MIPI 50
+#define TEGRA20_CLK_HDMI 51
+#define TEGRA20_CLK_CSI 52
+#define TEGRA20_CLK_TVDAC 53
+#define TEGRA20_CLK_I2C2 54
+#define TEGRA20_CLK_UARTC 55
+/* 56 */
+#define TEGRA20_CLK_EMC 57
+#define TEGRA20_CLK_USB2 58
+#define TEGRA20_CLK_USB3 59
+#define TEGRA20_CLK_MPE 60
+#define TEGRA20_CLK_VDE 61
+#define TEGRA20_CLK_BSEA 62
+#define TEGRA20_CLK_BSEV 63
+
+#define TEGRA20_CLK_SPEEDO 64
+#define TEGRA20_CLK_UARTD 65
+#define TEGRA20_CLK_UARTE 66
+#define TEGRA20_CLK_I2C3 67
+#define TEGRA20_CLK_SBC4 68
+#define TEGRA20_CLK_SDMMC3 69
+#define TEGRA20_CLK_PEX 70
+#define TEGRA20_CLK_OWR 71
+#define TEGRA20_CLK_AFI 72
+#define TEGRA20_CLK_CSITE 73
+#define TEGRA20_CLK_PCIE_XCLK 74
+#define TEGRA20_CLK_AVPUCQ 75
+#define TEGRA20_CLK_LA 76
+/* 77 */
+/* 78 */
+/* 79 */
+/* 80 */
+/* 81 */
+/* 82 */
+/* 83 */
+#define TEGRA20_CLK_IRAMA 84
+#define TEGRA20_CLK_IRAMB 85
+#define TEGRA20_CLK_IRAMC 86
+#define TEGRA20_CLK_IRAMD 87
+#define TEGRA20_CLK_CRAM2 88
+#define TEGRA20_CLK_AUDIO_2X 89 /* a/k/a audio_2x_sync_clk */
+#define TEGRA20_CLK_CLK_D 90
+/* 91 */
+#define TEGRA20_CLK_CSUS 92
+#define TEGRA20_CLK_CDEV2 93
+#define TEGRA20_CLK_CDEV1 94
+/* 95 */
+
+#define TEGRA20_CLK_UARTB 96
+#define TEGRA20_CLK_VFIR 97
+#define TEGRA20_CLK_SPDIF_IN 98
+#define TEGRA20_CLK_SPDIF_OUT 99
+#define TEGRA20_CLK_VI 100
+#define TEGRA20_CLK_VI_SENSOR 101
+#define TEGRA20_CLK_TVO 102
+#define TEGRA20_CLK_CVE 103
+#define TEGRA20_CLK_OSC 104
+#define TEGRA20_CLK_CLK_32K 105 /* a/k/a clk_s */
+#define TEGRA20_CLK_CLK_M 106
+#define TEGRA20_CLK_SCLK 107
+#define TEGRA20_CLK_CCLK 108
+#define TEGRA20_CLK_HCLK 109
+#define TEGRA20_CLK_PCLK 110
+#define TEGRA20_CLK_BLINK 111
+#define TEGRA20_CLK_PLL_A 112
+#define TEGRA20_CLK_PLL_A_OUT0 113
+#define TEGRA20_CLK_PLL_C 114
+#define TEGRA20_CLK_PLL_C_OUT1 115
+#define TEGRA20_CLK_PLL_D 116
+#define TEGRA20_CLK_PLL_D_OUT0 117
+#define TEGRA20_CLK_PLL_E 118
+#define TEGRA20_CLK_PLL_M 119
+#define TEGRA20_CLK_PLL_M_OUT1 120
+#define TEGRA20_CLK_PLL_P 121
+#define TEGRA20_CLK_PLL_P_OUT1 122
+#define TEGRA20_CLK_PLL_P_OUT2 123
+#define TEGRA20_CLK_PLL_P_OUT3 124
+#define TEGRA20_CLK_PLL_P_OUT4 125
+#define TEGRA20_CLK_PLL_S 126
+#define TEGRA20_CLK_PLL_U 127
+
+#define TEGRA20_CLK_PLL_X 128
+#define TEGRA20_CLK_COP 129 /* a/k/a avp */
+#define TEGRA20_CLK_AUDIO 130 /* a/k/a audio_sync_clk */
+#define TEGRA20_CLK_PLL_REF 131
+#define TEGRA20_CLK_TWD 132
+#define TEGRA20_CLK_CLK_MAX 133
+
+#endif	/* _DT_BINDINGS_CLK_TEGRA20_CAR_H */
-- 
1.8.1.5
