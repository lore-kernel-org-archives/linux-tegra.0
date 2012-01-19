From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 18 Jan 2012 17:16:52 -0700
Message-ID: <1326932212-30346-1-git-send-email-swarren@nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326342789-5781-12-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document a binding for the Tegra20 CAR (Clock And Reset) Controller,
add it to tegra20.dtsi, and configure it for the board in tegra-
seaboard.dts.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
All, Simon Glass is attempting to upstream Tegra USB support in U-Boot.
The driver is only instantiated from device tree, and needs to configure
clocks for the USB module. Hence, he proposed a clock binding for Tegra.
I've read through Grant's proposed common clock bindings and reworked
Simon's proposal a little, ending up with the patch below for the kernel.
I'd appreciate any comments you have.

Grant, can you confirm that it's reasonable to start making use of your
proposed common clock bindings in U-Boot, even though they're only an RFC?

Grant, there are a couple of FIXMEs in the binding documentation below.
Can you give any insight on these?

A comment on the shared enable issue:

When enabling/disabling clocks, Tegra requires you to reset the HW module
that the clock is routed to. Both reset and clock enable registers are
part of the CAR. U-Boot currently has an API to do the reset based on a
"peripheral ID", which simply means a bit number in a set of 3 "reset"
registers. The bits in those registers share the same numbering as the
"clock enable" registers. Hence, to make life easy for U-Boot, I've
defined the clock IDs in this binding to be equal to these bit numbers.
However, this breaks down where there isn't a 1:1 mapping between reset
and clock enable bits, and clocks. For example, there's a single reset
and clock enable bit for the SPDIF controller, yet this applies to two
clocks; spdif_in and spdif_out. Hence, this simplification for U-Boot
breaks down. I think the correct solution is to fix U-Boot not to
require this simplification, renumber the clocks in the CAR binding in
a completely arbitrary fashion, and require U-Boot to contain a mapping
table between CAR's DT clock IDs and any other information related to
those clocks. Do you see any alternative? We really need the two SPDIF
clocks to be different clock IDs in the binding, since each has a
completely independant mux for the clock source/parent, and the two
clocks obviously can't share the same clock ID (well, hmm, perhaps they
could if we used 2 cells for the specifier, 1 for the bit number, and
one more to differentiate clocks that use the same bit...). I'm still
inclined to simply push back on U-Boot to do it right.

 .../bindings/clock/nvidia,tegra20-car.txt          |  156 ++++++++++++++++++++
 arch/arm/boot/dts/tegra-seaboard.dts               |   18 +++
 arch/arm/boot/dts/tegra20.dtsi                     |    7 +
 3 files changed, 181 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
new file mode 100644
index 0000000..71cfdd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
@@ -0,0 +1,156 @@
+* NVIDIA Tegra20 Clock And Reset Controller
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
+- clock-names : Should contain a list of strings, with values "32k_in",
+  and "osc".
+- #clock-cells : Should be 1.
+  In clock consumers, this cell represents the clock ID exposed by the CAR.
+  For a list of valid values, see the clock-output-names property.
+
+Optional properties :
+- clock-output-names : Should contain a list of strings defining the clocks
+  that the CAR provides. The list of names and clock IDs is below. The IDs
+  may be used in clock specifiers. The names should be listed in this clock-
+  output-names property, sorted in ID order, if this property is present.
+
+  The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
+  registers. Later, subsequent IDs will be assigned to all other clocks the
+  CAR controls.
+
+    0   "cpu"
+    1   "unassigned"
+    2   "unassigned"    FIXME: Is it OK to have 2 identical (unused) names?
+    3   "ac97"
+    4   "rtc"
+    5   "tmr"
+    6   "uart1"
+    7   "uart2"
+    8   "gpio"
+    9   "sdmmc2"
+    10  "spdif"         FIXME: One enable bit controls two clocks!!!
+    11  "i2s1"
+    12  "i2c1"
+    13  "ndflash"
+    14  "sdmmc1"
+    15  "sdmmc4"
+    16  "twc"
+    17  "pwm"
+    18  "i2s2"
+    19  "epp"
+    20  "vi"            FIXME: One enable bit controls two clocks!!!
+    21  "2d"
+    22  "usbd"
+    23  "isp"
+    24  "3d"
+    25  "ide"
+    26  "disp2"
+    27  "disp1"
+    28  "host1x"
+    29  "vcp"
+    30  "unassigned"
+    31  "cache2"
+
+    32  "mem"
+    33  "ahbdma"
+    34  "apbdma"
+    35  "unassigned"
+    36  "kbc"
+    37  "stat_mon"
+    38  "pmc"
+    39  "fuse"
+    40  "kfuse"
+    41  "sbc1"
+    42  "snor"
+    43  "spi"
+    44  "sbc2"
+    45  "xio"
+    46  "sbc3"
+    47  "dvc_i2c"
+    48  "dsi"
+    49  "tvo"
+    50  "mipi"
+    51  "hdmi"
+    52  "csi"
+    53  "tvdac"
+    54  "i2c2"
+    55  "uart3"
+    56  "unassigned"
+    57  "emc"
+    58  "usb2"
+    59  "usb3"
+    60  "mpe"
+    61  "vde"
+    62  "bsea"
+    63  "bsev"
+
+    64  "speedo"
+    65  "uart4"
+    66  "uart5"
+    67  "i2c3"
+    68  "sbc4"
+    69  "sdmmc3"
+    70  "pcie"
+    71  "owr"
+    72  "afi"
+    73  "csite"
+    74  "unassigned"
+    75  "avpucq"
+    76  "unassigned"
+    77  "unassigned"
+    78  "unassigned"
+    79  "unassigned"
+    80  "unassigned"
+    81  "unassigned"
+    82  "unassigned"
+    83  "unassigned"
+    84  "irama"
+    85  "iramb"
+    86  "iramc"
+    87  "iramd"
+    88  "cram2"
+    89  "audio_2x"
+    90  "clk_d"
+    91  "unassigned"
+    92  "sus"
+    93  "cdev1"
+    94  "cdev2"
+    95  "unassigned"
+
+Example:
+
+clocks {
+	clk_32k: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	osc: oscillator@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+};
+
+tegar_car: clock@60006000 {
+	compatible = "tegra,periphclk";
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
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index b55a02e..f9347fe 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -11,6 +11,24 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	clocks {
+		clk_32k: oscillator@0 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+
+		osc: oscillator@1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <12000000>;
+		};
+	};
+
+	clock@60006000 {
+		clocks = <&clk_32k> <&osc>;
+	};
+
 	i2c@7000c000 {
 		clock-frequency = <400000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 3da7afd..be4abd2 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -4,6 +4,13 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&intc>;
 
+	tegar_car: clock@60006000 {
+		compatible = "tegra,periphclk";
+		reg = <0x60006000 1000>;
+		clock-names = "32k_in", "osc";
+		#clock-cells = <1>;
+	};
+
 	intc: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
-- 
1.7.0.4
