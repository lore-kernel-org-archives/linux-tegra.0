From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 25 Jan 2012 12:57:48 -0700
Message-ID: <1327521469-28863-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document a binding for the Tegra20 CAR (Clock And Reset) Controller,
add it to tegra20.dtsi, and configure it for the board in tegra-
seaboard.dts.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Remove clock-names, clock-output-names properties; Tegra will solely
  use integer IDs for clocks in DT.
* Fixed typo in compatible flag
* Resolve FIXME re: multiple clocks with the same "reset ID"; give each
  unique clock an ID, and ignore the reset bits, since this is purely a
  clock binding. Code (e.g. U-Boot) that wants to use this to determine
  CAR reset bit numbers would need a table to convert from the clock IDs
  in this binding to the related reset bit number, if any. In general, I
  think that's true, and the U-Boot code that handles "peripheral IDs"
  should be reworked to handle "clocks", the peripheral clocks being a
  subset of all clocks.
* Define clock IDs for all the non-peripheral clocks too; inputs, PLLs,
  etc.
* Separate tegra-seaboard.dts usage example into a separate patch.

This patch semantically relies on Grant Likely's common clock binding patch
series. Once that's finalized, this patch could be checked into the kernel
provided there are no relevant changes to Grant's patches. I believe that
Simon Glass wants to start using this within U-Boot ASAP though.
---
 .../bindings/clock/nvidia,tegra20-car.txt          |  164 ++++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |    6 +
 2 files changed, 170 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
new file mode 100644
index 0000000..acce2d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
@@ -0,0 +1,164 @@
+NVIDIA Tegra20 Clock And Reset Controller
+
+This binding uses the common clock binding:
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
+for muxing and gating Tegra's clocks, and setting their rates.
+
+Required properties :
+- compatible : Should be "nvidia,<chip>-car"
+- reg : Should contain CAR registers location and length
+- clocks : Should contain phandle and clock specifiers for two clocks:
+  the 32 KHz "32k_in", and the board-specific oscillator "osc".
+- #clock-cells : Should be 1.
+  In clock consumers, this cell represents the clock ID exposed by the CAR.
+
+  The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
+  registers. Later, subsequent IDs will be assigned to all other clocks the
+  CAR controls; mainly the PLLs.
+
+    0	osc
+    1	clk_32k		a/k/a clk_s
+    2	clk_m
+    3	sclk
+    4	cclk
+    5	hclk
+    6	pclk
+    7	blink
+    8	pll_a
+    9	pll_a_out0
+    10	pll_c
+    11	pll_c_out1
+    12	pll_d
+    13	pll_e
+    14	pll_m
+    15	pll_m_out1
+    16	pll_p
+    17	pll_p_out1
+    18	pll_p_out2
+    19	pll_p_out3
+    20	pll_p_out4
+    21	pll_s
+    22	pll_u
+    23	pll_x
+    24	audio		a/k/a audio_sync_clk
+    25	audio_2x	a/k/a audio_2x_sync_clk
+    26	cpu
+    27	cop		a/k/a avp
+    28	ac97
+    29	rtc
+    30	tmr
+    31	uart1
+    32	uart2
+    33	gpio
+    34	sdmmc2
+    35	spdif_out
+    36	spdif_in
+    37	i2s1
+    38	i2c1
+    39	ndflash
+    40	sdmmc1
+    41	sdmmc4
+    42	twc
+    43	pwm
+    44	i2s2
+    45	epp
+    46	vi
+    47	vi_sensor
+    48	2d
+    49	usbd
+    50	isp
+    51	3d
+    52	ide
+    53	disp2
+    54	disp1
+    55	host1x
+    56	vcp
+    57	cache2
+    58	mem
+    59	ahbdma
+    60	apbdma
+    61	kbc
+    62	stat_mon
+    63	pmc
+    64	fuse
+    65	kfuse
+    66	sbc1
+    67	snor
+    68	spi
+    69	sbc2
+    70	xio
+    71	sbc3
+    72	dvc
+    73	dsi
+    74	cve
+    75	tvo
+    76	mipi
+    77	hdmi
+    78	csi
+    79	tvdac
+    80	i2c2
+    81	uart3
+    82	emc
+    83	usb2
+    84	usb3
+    85	mpe
+    86	vde
+    87	bsea
+    88	bsev
+    89	speedo
+    90	uart4
+    91	uart5
+    92	i2c3
+    93	sbc4
+    94	sdmmc3
+    95	pcie
+    96	owr
+    97	afi
+    98	csite
+    99	avpucq
+    100	la
+    101	irama
+    102	iramb
+    103	iramc
+    104	iramd
+    105	cram2
+    106	clk_d
+    107	sus
+    108	cdev1
+    109	cdev2
+
+Example:
+
+clocks {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	clk_32k: clock@0 {
+		compatible = "fixed-clock";
+		reg = <0>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	osc: clock@1 {
+		compatible = "fixed-clock";
+		reg = <1>;
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+};
+
+tegra_car: clock@60006000 {
+	compatible = "nvidia,tegra20-car";
+	reg = <0x60006000 1000>;
+	clocks = <&clk_32k> <&osc>;
+	clock-names = "32k_in", "osc";
+	#clock-cells = <1>;
+};
+
+usb@c5004000 {
+	...
+	clocks = <&tegra_car 58>; /* usb2 */
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 3da7afd..8208660 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -4,6 +4,12 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&intc>;
 
+	tegra_car: clock@60006000 {
+		compatible = "nvidia,tegra20-car";
+		reg = <0x60006000 1000>;
+		#clock-cells = <1>;
+	};
+
 	intc: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
-- 
1.7.0.4
