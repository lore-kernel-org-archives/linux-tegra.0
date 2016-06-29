From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/3] arm: tegra: initial support for apalis tk1
Date: Thu, 30 Jun 2016 00:23:17 +0200
Message-ID: <1467238999-10252-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds the device tree to support Toradex Apalis TK1 a
computer on module which can be used on different carrier boards.

The module consists of a Tegra TK1 SoC, a PMIC solution, 2 GB of DDR3L
RAM, a bunch of level shifters, an eMMC, a TMP451 temperature sensor
chip, an I210 gigabit Ethernet controller and a SGTL5000 audio codec.
Furthermore, there is a Kinetis MK20DN512 companion micro controller for
analogue, CAN and resistive touch functionality which is not yet
supported. Anything that is not self contained on the module is disabled
by default.

The device tree for the Evaluation Board includes the module's device
tree and enables the supported peripherals of the carrier board (the
Evaluation Board supports almost all of them).

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

---

Changes in v4:
- update comment about SGTL5000 audio codec actually being supported
  which depends on the separate patch set introducing that support
- fix pin muxing concerning clk_lb disaster

Changes in v3:
- fix glitch on reg_3v3 during boot by explicitly specifying reg_3v3_mxm
  and reg_3v3 to be always-on as well as boot-on
- don't tri-state dap2 fs and sclk pins to allow being used as outputs as
  required for HDA
- configure level-shifter as output for HDA
- integrate SGTL5000 audio codec support
- fix comments concerning AS3722 PMIC GPIO usage
- indicate regulator-boot-on for vddio_1v8 on sd5
- limit speed of GEN2_I2C aka I2C2_SDA/SCL being used for DDC/EDID to
  100 kHz
- move dr_mode property from usb-phy to usb node for correctness

Changes in v2:
- split device tree binding documentation update into 2 separate
  patches one for Colibri T30 where it was missing so far and another
  one for Apalis TK1
- using dashes aka '-' in compatible strings as suggested by Rob
- remove commas from unit addresses as suggested by Rob (this requires
  the separate patch to clean up tegra124.dtsi as well as all the other
  boards basing on it to be applied first)
- doing multiple values per line for nvidia,emc-configuration as
  suggested by Rob
- change from boot to default pinctrl-name in order for it to actually
  be used
- add a note to pin ph3 for PWM3 is actually active on pu6 being Apalis
  BKL1_PWM, configure function gmi, pull it down and tristate it
- change the note on pn2 to read SATA1_ACT# and configure it for
  function gmi (typically to be used as LED GPIO)
- remove the bogus open-drain property on pi5, pj0, pj2, pk2 and po5
  causing pinctrl not to be applied properly
- pull all SHIFT_CTRL_OE pins down in order for the level shifter
  outputs to actually be driven properly
- change ahub i2s instance to the one at base address 70301200 as on
  our design that connects to the audio codec (further audio
  integration left for future patches)

 arch/arm/boot/dts/Makefile                 |    1 +
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi | 1502 ++++++++++++++++++++
 arch/arm/boot/dts/tegra124-apalis-eval.dts |  284 ++++
 arch/arm/boot/dts/tegra124-apalis.dtsi     | 2100 ++++++++++++++++++++++++++++
 4 files changed, 3887 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-emc.dtsi
 create mode 100644 arch/arm/boot/dts/tegra124-apalis-eval.dts
 create mode 100644 arch/arm/boot/dts/tegra124-apalis.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8ff3f58..3c69aef 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -809,6 +809,7 @@ dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-roth.dtb \
 	tegra114-tn7.dtb
 dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
+	tegra124-apalis-eval.dtb \
 	tegra124-jetson-tk1.dtb \
 	tegra124-nyan-big.dtb \
 	tegra124-nyan-blaze.dtb \
diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
new file mode 100644
index 0000000..ca2c3a5
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -0,0 +1,1502 @@
+/*
+ * Copyright 2016 Toradex AG
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/ {
+	clock@60006000 {
+		emc-timings-1 {
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-300000000 {
+				clock-frequency = <300000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+			timing-396000000 {
+				clock-frequency = <396000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <528000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-600000000 {
+				clock-frequency = <600000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-924000000 {
+				clock-frequency = <924000000>;
+				nvidia,parent-clock-frequency = <924000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+		};
+	};
+
+	emc@7001b000 {
+		emc-timings-1 {
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 0x00000003
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000a 0x00000005
+					0x0000000b 0x00000000
+					0x00000000 0x00000003
+					0x00000003 0x00000000
+					0x00000006 0x00000006
+					0x00000006 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000c 0x0000000d
+					0x0000000f 0x00000060
+					0x00000000 0x00000018
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x00000007 0x0000000f
+					0x00000005 0x00000005
+					0x00000004 0x00000005
+					0x00000004 0x00000000
+					0x00000000 0x00000005
+					0x00000005 0x00000064
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x000fc000 0x000fc000
+					0x000fc000 0x000fc000
+					0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000e0e 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000007 0x00000000
+					0x00000042 0x000e000e
+					0x00000000 0x00000003
+					0x0000f2f3 0x800001c5
+					0x0000000a
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 0x00000005
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000a 0x00000005
+					0x0000000b 0x00000000
+					0x00000000 0x00000003
+					0x00000003 0x00000000
+					0x00000006 0x00000006
+					0x00000006 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000c 0x0000000d
+					0x0000000f 0x0000009a
+					0x00000000 0x00000026
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x00000007 0x0000000f
+					0x00000006 0x00000006
+					0x00000004 0x00000005
+					0x00000004 0x00000000
+					0x00000000 0x00000005
+					0x00000005 0x000000a0
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x000fc000 0x000fc000
+					0x000fc000 0x000fc000
+					0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000e0e 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x0000000b 0x00000000
+					0x00000042 0x000e000e
+					0x00000000 0x00000003
+					0x0000f2f3 0x8000023a
+					0x0000000a
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000001 0x0000000a
+					0x00000000 0x00000001
+					0x00000000 0x00000004
+					0x0000000a 0x00000005
+					0x0000000b 0x00000000
+					0x00000000 0x00000003
+					0x00000003 0x00000000
+					0x00000006 0x00000006
+					0x00000006 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000c 0x0000000d
+					0x0000000f 0x00000134
+					0x00000000 0x0000004d
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x00000008 0x0000000f
+					0x0000000c 0x0000000c
+					0x00000004 0x00000005
+					0x00000004 0x00000000
+					0x00000000 0x00000005
+					0x00000005 0x0000013f
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x000fc000 0x000fc000
+					0x000fc000 0x000fc000
+					0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000e0e 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000015 0x00000000
+					0x00000042 0x000e000e
+					0x00000000 0x00000003
+					0x0000f2f3 0x80000370
+					0x0000000a
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000003 0x00000011
+					0x00000000 0x00000002
+					0x00000000 0x00000004
+					0x0000000a 0x00000005
+					0x0000000b 0x00000000
+					0x00000000 0x00000003
+					0x00000003 0x00000000
+					0x00000006 0x00000006
+					0x00000006 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000c 0x0000000d
+					0x0000000f 0x00000202
+					0x00000000 0x00000080
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x0000000f 0x0000000f
+					0x00000013 0x00000013
+					0x00000004 0x00000005
+					0x00000004 0x00000001
+					0x00000000 0x00000005
+					0x00000005 0x00000213
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x000fc000 0x000fc000
+					0x000fc000 0x000fc000
+					0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000e0e 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000022 0x00000000
+					0x00000042 0x000e000e
+					0x00000000 0x00000003
+					0x0000f2f3 0x8000050e
+					0x0000000a
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000004 0x0000001a
+					0x00000000 0x00000003
+					0x00000001 0x00000004
+					0x0000000a 0x00000005
+					0x0000000b 0x00000001
+					0x00000001 0x00000003
+					0x00000003 0x00000000
+					0x00000006 0x00000006
+					0x00000006 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000004
+					0x0000000c 0x0000000d
+					0x0000000f 0x00000304
+					0x00000000 0x000000c1
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x00000018 0x0000000f
+					0x0000001c 0x0000001c
+					0x00000004 0x00000005
+					0x00000004 0x00000002
+					0x00000000 0x00000005
+					0x00000005 0x0000031c
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x000fc000 0x000fc000
+					0x000fc000 0x000fc000
+					0x0000fc00 0x0000fc00
+					0x0000fc00 0x0000fc00
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000e0e 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000033 0x00000000
+					0x00000042 0x000e000e
+					0x00000000 0x00000003
+					0x0000f2f3 0x80000713
+					0x0000000a
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008cd>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000009 0x00000035
+					0x00000000 0x00000006
+					0x00000002 0x00000005
+					0x0000000a 0x00000005
+					0x0000000b 0x00000002
+					0x00000002 0x00000003
+					0x00000003 0x00000000
+					0x00000005 0x00000005
+					0x00000006 0x00000002
+					0x00000000 0x00000004
+					0x00000006 0x00010000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000003
+					0x0000000d 0x0000000f
+					0x00000011 0x00000607
+					0x00000000 0x00000181
+					0x00000002 0x00000002
+					0x00000001 0x00000000
+					0x00000032 0x0000000f
+					0x00000038 0x00000038
+					0x00000004 0x00000005
+					0x00000004 0x00000006
+					0x00000000 0x00000005
+					0x00000005 0x00000638
+					0x00000000 0x00000000
+					0x00000000 0x106aa298
+					0x002c00a0 0x00008000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00080000 0x00080000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00008000 0x00000000
+					0x00000000 0x00008000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00090000 0x00090000
+					0x00090000 0x00090000
+					0x00009000 0x00009000
+					0x00009000 0x00009000
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000707 0x81f1f108
+					0x07070004 0x0000003f
+					0x016eeeee 0x51451400
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000066 0x00000000
+					0x00000100 0x000e000e
+					0x00000000 0x00000003
+					0x0000d2b3 0x80000d22
+					0x0000000a
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x000008d5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-mrs-wait-cnt = <0x0173000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000000d 0x0000004d
+					0x00000000 0x00000009
+					0x00000003 0x00000004
+					0x00000008 0x00000002
+					0x00000009 0x00000003
+					0x00000003 0x00000002
+					0x00000002 0x00000000
+					0x00000003 0x00000003
+					0x00000005 0x00000002
+					0x00000000 0x00000002
+					0x00000007 0x00020000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000001
+					0x0000000e 0x00000010
+					0x00000012 0x000008e4
+					0x00000000 0x00000239
+					0x00000001 0x00000008
+					0x00000001 0x00000000
+					0x0000004b 0x0000000e
+					0x00000052 0x00000200
+					0x00000004 0x00000005
+					0x00000004 0x00000008
+					0x00000000 0x00000005
+					0x00000005 0x00000924
+					0x00000000 0x00000000
+					0x00000000 0x104ab098
+					0x002c00a0 0x00008000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00098000 0x00098000
+					0x00000000 0x00098000
+					0x00098000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00050000 0x00050000
+					0x00050000 0x00050000
+					0x00005000 0x00005000
+					0x00005000 0x00005000
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000505 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x51451420
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x00000096 0x00000000
+					0x00000100 0x0173000e
+					0x00000000 0x00000003
+					0x000052a3 0x800012d7
+					0x00000009
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x00000895>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000521>;
+				nvidia,emc-mrs-wait-cnt = <0x015b000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000011 0x00000066
+					0x00000000 0x0000000c
+					0x00000004 0x00000004
+					0x00000008 0x00000002
+					0x0000000a 0x00000004
+					0x00000004 0x00000002
+					0x00000002 0x00000000
+					0x00000003 0x00000003
+					0x00000005 0x00000002
+					0x00000000 0x00000001
+					0x00000008 0x00020000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x0000000f 0x00000010
+					0x00000012 0x00000bd1
+					0x00000000 0x000002f4
+					0x00000001 0x00000008
+					0x00000001 0x00000000
+					0x00000063 0x0000000f
+					0x0000006c 0x00000200
+					0x00000004 0x00000005
+					0x00000004 0x0000000b
+					0x00000000 0x00000005
+					0x00000005 0x00000c11
+					0x00000000 0x00000000
+					0x00000000 0x104ab098
+					0x002c00a0 0x00008000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00030000 0x00030000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00070000 0x00070000
+					0x00000000 0x00070000
+					0x00070000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00038000 0x00038000
+					0x00038000 0x00038000
+					0x00003800 0x00003800
+					0x00003800 0x00003800
+					0x10000280 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc081
+					0x00000505 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x51451420
+					0x00514514 0x00514514
+					0x51451400 0x0000003f
+					0x000000c6 0x00000000
+					0x00000100 0x015b000e
+					0x00000000 0x00000003
+					0x000052a3 0x8000188b
+					0x00000009
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000941>;
+				nvidia,emc-mrs-wait-cnt = <0x0139000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0123133d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000018 0x00000088
+					0x00000000 0x00000010
+					0x00000006 0x00000006
+					0x00000009 0x00000002
+					0x0000000d 0x00000006
+					0x00000006 0x00000002
+					0x00000002 0x00000000
+					0x00000003 0x00000003
+					0x00000006 0x00000002
+					0x00000000 0x00000001
+					0x00000009 0x00030000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000010 0x00000012
+					0x00000014 0x00000fd6
+					0x00000000 0x000003f5
+					0x00000002 0x0000000b
+					0x00000001 0x00000000
+					0x00000085 0x00000012
+					0x00000090 0x00000200
+					0x00000004 0x00000005
+					0x00000004 0x00000010
+					0x00000000 0x00000006
+					0x00000006 0x00001017
+					0x00000000 0x00000000
+					0x00000000 0x104ab098
+					0xe01200b1 0x00008000
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00054000 0x00054000
+					0x00000000 0x00054000
+					0x00054000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x0000000c 0x0000000c
+					0x0000000c 0x0000000c
+					0x0000000c 0x0000000c
+					0x0000000c 0x0000000c
+					0x100002a0 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc085
+					0x00000505 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x51451420
+					0x00514514 0x00514514
+					0x51451400 0x0606003f
+					0x00000000 0x00000000
+					0x00000100 0x0139000e
+					0x00000000 0x00000003
+					0x000042a0 0x80002062
+					0x0000000a
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200010>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-mrs-wait-cnt = <0x0127000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0121113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000001b 0x0000009b
+					0x00000000 0x00000013
+					0x00000007 0x00000007
+					0x0000000b 0x00000003
+					0x00000010 0x00000007
+					0x00000007 0x00000002
+					0x00000002 0x00000000
+					0x00000005 0x00000005
+					0x0000000a 0x00000002
+					0x00000000 0x00000003
+					0x0000000b 0x00070000
+					0x00000003 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000002
+					0x00000012 0x00000016
+					0x00000018 0x00001208
+					0x00000000 0x00000482
+					0x00000002 0x0000000d
+					0x00000001 0x00000000
+					0x00000097 0x00000015
+					0x000000a3 0x00000200
+					0x00000004 0x00000005
+					0x00000004 0x00000013
+					0x00000000 0x00000006
+					0x00000006 0x00001248
+					0x00000000 0x00000000
+					0x00000000 0x104ab098
+					0xe00e00b1 0x00008000
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00048000 0x00048000
+					0x00000000 0x00048000
+					0x00048000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x0000000d 0x0000000d
+					0x0000000d 0x0000000d
+					0x0000000d 0x0000000d
+					0x0000000d 0x0000000d
+					0x100002a0 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc085
+					0x00000505 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x51451420
+					0x00514514 0x00514514
+					0x51451400 0x0606003f
+					0x00000000 0x00000000
+					0x00000100 0x0127000e
+					0x00000000 0x00000003
+					0x000040a0 0x800024aa
+					0x0000000e
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200018>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-mrs-wait-cnt = <0x00f7000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000024 0x000000cd
+					0x00000000 0x00000019
+					0x0000000a 0x00000008
+					0x0000000d 0x00000004
+					0x00000013 0x0000000a
+					0x0000000a 0x00000004
+					0x00000002 0x00000000
+					0x00000006 0x00000006
+					0x0000000b 0x00000002
+					0x00000000 0x00000002
+					0x0000000d 0x00080000
+					0x00000004 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000001
+					0x00000014 0x00000018
+					0x0000001a 0x000017e2
+					0x00000000 0x000005f8
+					0x00000003 0x00000011
+					0x00000001 0x00000000
+					0x000000c7 0x00000018
+					0x000000d7 0x00000200
+					0x00000005 0x00000006
+					0x00000005 0x00000019
+					0x00000000 0x00000008
+					0x00000008 0x00001822
+					0x00000000 0x00000000
+					0x00000000 0x104ab098
+					0xe00700b1 0x00008000
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x007fc008 0x007fc008
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00034000 0x00034000
+					0x00000000 0x00034000
+					0x00034000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x00000005 0x00000005
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x0000000a 0x0000000a
+					0x100002a0 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc085
+					0x00000000 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x61861820
+					0x00514514 0x00514514
+					0x61861800 0x0606003f
+					0x00000000 0x00000000
+					0x00000100 0x00f7000e
+					0x00000000 0x00000004
+					0x00004080 0x80003012
+					0x0000000f
+				>;
+			};
+
+			timing-924000000 {
+				clock-frequency = <924000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430303>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200020>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000f15>;
+				nvidia,emc-mrs-wait-cnt = <0x00cd000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120113d>;
+				nvidia,emc-zcal-cnt-long = <0x0000004c>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000002b 0x000000f0
+					0x00000000 0x0000001e
+					0x0000000b 0x00000009
+					0x0000000f 0x00000005
+					0x00000016 0x0000000b
+					0x0000000b 0x00000004
+					0x00000002 0x00000000
+					0x00000007 0x00000007
+					0x0000000d 0x00000002
+					0x00000000 0x00000002
+					0x0000000f 0x000a0000
+					0x00000004 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000001
+					0x00000016 0x0000001a
+					0x0000001c 0x00001be7
+					0x00000000 0x000006f9
+					0x00000004 0x00000015
+					0x00000001 0x00000000
+					0x000000e7 0x0000001b
+					0x000000fb 0x00000200
+					0x00000006 0x00000007
+					0x00000006 0x0000001e
+					0x00000000 0x0000000a
+					0x0000000a 0x00001c28
+					0x00000000 0x00000000
+					0x00000000 0x104ab898
+					0xe00400b1 0x00008000
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x007f800a 0x007f800a
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x0002c000 0x0002c000
+					0x00000000 0x0002c000
+					0x0002c000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000000 0x00000000
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000004 0x00000004
+					0x00000008 0x00000008
+					0x00000008 0x00000008
+					0x00000008 0x00000008
+					0x00000008 0x00000008
+					0x100002a0 0x00000000
+					0x00111111 0x00000000
+					0x00000000 0x77ffc085
+					0x00000000 0x81f1f108
+					0x07070004 0x00000000
+					0x016eeeee 0x5d75d720
+					0x00514514 0x00514514
+					0x5d75d700 0x0606003f
+					0x00000000 0x00000000
+					0x00000128 0x00cd000e
+					0x00000000 0x00000004
+					0x00004080 0x800037ea
+					0x00000011
+				>;
+			};
+
+		};
+	};
+
+	memory-controller@70019000 {
+		emc-timings-1 {
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 0x8000000a
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x77e30303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 0x80000012
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x76230303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 0x80000017
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x74a30303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 0x8000001e
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x74230403 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 0x80000026
+					0x00000001 0x00000001
+					0x00000003 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0503
+					0x73c30504 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 0x80000040
+					0x00000001 0x00000001
+					0x00000004 0x00000002
+					0x00000003 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000004 0x00000006
+					0x06040203 0x000a0504
+					0x73840a05 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 0x80000040
+					0x00000001 0x00000002
+					0x00000007 0x00000004
+					0x00000004 0x00000001
+					0x00000002 0x00000007
+					0x00000002 0x00000002
+					0x00000004 0x00000006
+					0x06040202 0x000b0607
+					0x77450e08 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 0x80000040
+					0x00000001 0x00000002
+					0x00000009 0x00000005
+					0x00000006 0x00000001
+					0x00000002 0x00000008
+					0x00000002 0x00000002
+					0x00000004 0x00000006
+					0x06040202 0x000d0709
+					0x7586120a 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 0x80000040
+					0x00000002 0x00000003
+					0x0000000c 0x00000007
+					0x00000008 0x00000001
+					0x00000002 0x00000009
+					0x00000002 0x00000002
+					0x00000005 0x00000006
+					0x06050202 0x0010090c
+					0x7428180d 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 0x80000040
+					0x00000003 0x00000004
+					0x0000000e 0x00000009
+					0x0000000a 0x00000001
+					0x00000003 0x0000000b
+					0x00000002 0x00000002
+					0x00000005 0x00000007
+					0x07050202 0x00130b0e
+					0x73a91b0f 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b 0x80000040
+					0x00000004 0x00000005
+					0x00000013 0x0000000c
+					0x0000000d 0x00000002
+					0x00000003 0x0000000c
+					0x00000002 0x00000002
+					0x00000006 0x00000008
+					0x08060202 0x00170e13
+					0x736c2414 0x70000f02
+					0x001f0000
+				>;
+			};
+
+			timing-924000000 {
+				clock-frequency = <924000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000d 0x80000040
+					0x00000005 0x00000006
+					0x00000016 0x0000000e
+					0x0000000f 0x00000002
+					0x00000004 0x0000000e
+					0x00000002 0x00000002
+					0x00000006 0x00000009
+					0x09060202 0x001a1016
+					0x734e2a17 0x70000f02
+					0x001f0000
+				>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
new file mode 100644
index 0000000..653044a
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -0,0 +1,284 @@
+/*
+ * Copyright 2016 Toradex AG
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include "tegra124-apalis.dtsi"
+
+/ {
+	model = "Toradex Apalis TK1 on Apalis Evaluation Board";
+	compatible = "toradex,apalis-tk1-eval", "toradex,apalis-tk1",
+		     "nvidia,tegra124";
+
+	aliases {
+		rtc0 = "/i2c@7000c000/rtc@68";
+		rtc1 = "/i2c@7000d000/pmic@40";
+		rtc2 = "/rtc@7000e000";
+		serial0 = &uarta;
+		serial1 = &uartb;
+		serial2 = &uartc;
+		serial3 = &uartd;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	pcie-controller@01003000 {
+		pci@1,0 {
+			status = "okay";
+		};
+	};
+
+	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+		};
+	};
+
+	/* Apalis UART1 */
+	serial@70006000 {
+		status = "okay";
+	};
+
+	/* Apalis UART2 */
+	serial@70006040 {
+		status = "okay";
+	};
+
+	/* Apalis UART3 */
+	serial@70006200 {
+		status = "okay";
+	};
+
+	/* Apalis UART4 */
+	serial@70006300 {
+		status = "okay";
+	};
+
+	pwm@7000a000 {
+		status = "okay";
+	};
+
+	/*
+	 * GEN1_I2C: I2C1_SDA/SCL on MXM3 pin 209/211 (e.g. RTC on carrier
+	 * board)
+	 */
+	i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		pcie-switch@58 {
+			compatible = "plx,pex8605";
+			reg = <0x58>;
+		};
+
+		/* M41T0M6 real time clock on carrier board */
+		rtc@68 {
+			compatible = "st,m41t00";
+			reg = <0x68>;
+		};
+	};
+
+	/*
+	 * GEN2_I2C: I2C2_SDA/SCL (DDC) on MXM3 pin 205/207 (e.g. display EDID)
+	 */
+	hdmi_ddc: i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	/*
+	 * CAM_I2C: I2C3_SDA/SCL (CAM) on MXM3 pin 201/203 (e.g. camera sensor
+	 * on carrier board)
+	 */
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	/* I2C4 (DDC): unused */
+
+	/* SPI1: Apalis SPI1 */
+	spi@7000d400 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+
+		spidev0: spidev@0 {
+			compatible = "spidev";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+
+	/* SPI4: Apalis SPI2 */
+	spi@7000da00 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+
+		spidev1: spidev@0 {
+			compatible = "spidev";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+
+	/* Apalis Serial ATA */
+	sata@70020000 {
+		status = "okay";
+	};
+
+	hda@70030000 {
+		status = "okay";
+	};
+
+	usb@70090000 {
+		status = "okay";
+	};
+
+	/* Apalis MMC1 */
+	sdhci@700b0000 {
+		status = "okay";
+		/* MMC1_CD# */
+		cd-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_LOW>;
+		bus-width = <4>;
+		vqmmc-supply = <&vddio_sdmmc1>;
+	};
+
+	/* Apalis SD1 */
+	sdhci@700b0400 {
+		status = "okay";
+		/*
+		 * Don't use SD1_CD# aka SDMMC3_CLK_LB_OUT for now as it
+		 * features some magic properties even though the external
+		 * loopback is disabled and the internal loopback used as per
+		 * SDMMC_VENDOR_MISC_CNTRL_0 register's SDMMC_SPARE1 bits being
+		 * set to 0xfffd according to the TRM!
+		 * cd-gpios = <&gpio TEGRA_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+		 */
+		bus-width = <4>;
+		vqmmc-supply = <&vddio_sdmmc3>;
+	};
+
+	/* EHCI instance 0: USB1_DP/N -> USBO1_DP/N */
+	usb@7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+		vbus-supply = <&reg_usbo1_vbus>;
+	};
+
+	/* EHCI instance 1: USB2_DP/N -> USBH2_DP/N */
+	usb@7d004000 {
+		status = "okay";
+	};
+
+	usb-phy@7d004000 {
+		status = "okay";
+		vbus-supply = <&reg_usbh_vbus>;
+	};
+
+	/* EHCI instance 2: USB3_DP/N -> USBH4_DP/N */
+	usb@7d008000 {
+		status = "okay";
+	};
+
+	usb-phy@7d008000 {
+		status = "okay";
+		vbus-supply = <&reg_usbh_vbus>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		/* BKL1_PWM */
+		pwms = <&pwm 3 5000000>;
+		brightness-levels = <255 231 223 207 191 159 127 0>;
+		default-brightness-level = <6>;
+		/* BKL1_ON */
+		enable-gpios = <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup {
+			label = "WAKE1_MICO";
+			gpios = <&gpio TEGRA_GPIO(DD, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_SW";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* USBO1_EN */
+	reg_usbo1_vbus: regulator-usbo1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_USBO1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_5v0>;
+	};
+
+	/* USBH_EN */
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_USBH(2A|2C|2D|3|4)";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_5v0>;
+	};
+};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
new file mode 100644
index 0000000..e7a73db
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -0,0 +1,2100 @@
+/*
+ * Copyright 2016 Toradex AG
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "tegra124.dtsi"
+#include "tegra124-apalis-emc.dtsi"
+
+/*
+ * Toradex Apalis TK1 Module Device Tree
+ * Compatible for Revisions 2GB: V1.0A
+ */
+/ {
+	model = "Toradex Apalis TK1";
+	compatible = "toradex,apalis-tk1", "nvidia,tegra124";
+
+	memory {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+
+	pcie-controller@01003000 {
+		status = "okay";
+
+		avddio-pex-supply = <&vdd_1v05>;
+		avdd-pex-pll-supply = <&vdd_1v05>;
+		avdd-pll-erefe-supply = <&avdd_1v05>;
+		dvddio-pex-supply = <&vdd_1v05>;
+		hvdd-pex-pll-e-supply = <&reg_3v3>;
+		hvdd-pex-supply = <&reg_3v3>;
+		vddio-pex-ctl-supply = <&reg_3v3>;
+
+		/* Apalis PCIe (additional lane Apalis type specific) */
+		pci@1,0 {
+			/* PCIE1_RX/TX and TS_DIFF1/2 */
+			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>,
+			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>;
+			phy-names = "pcie-0", "pcie-1";
+		};
+
+		/* I210 Gigabit Ethernet Controller (On-module) */
+		pci@2,0 {
+			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
+			phy-names = "pcie-0";
+			status = "okay";
+		};
+	};
+
+	host1x@50000000 {
+		hdmi@54280000 {
+			pll-supply = <&reg_1v05_avdd_hdmi_pll>;
+			vdd-supply = <&reg_3v3_avdd_hdmi>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpu@0,57000000 {
+		/*
+		 * Node left disabled on purpose - the bootloader will enable
+		 * it after having set the VPR up
+		 */
+		vdd-supply = <&vdd_gpu>;
+	};
+
+	pinmux: pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			/* Analogue Audio (On-module) */
+			dap3_fs_pp0 {
+				nvidia,pins = "dap3_fs_pp0";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap3_din_pp1 {
+				nvidia,pins = "dap3_din_pp1";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap3_dout_pp2 {
+				nvidia,pins = "dap3_dout_pp2";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap3_sclk_pp3 {
+				nvidia,pins = "dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap_mclk1_pw4 {
+				nvidia,pins = "dap_mclk1_pw4";
+				nvidia,function = "extperiph1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis BKL1_ON */
+			pbb5 {
+				nvidia,pins = "pbb5";
+				nvidia,function = "vgp5";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis BKL1_PWM */
+			pu6 {
+				nvidia,pins = "pu6";
+				nvidia,function = "pwm3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis CAM1_MCLK */
+			cam_mclk_pcc0 {
+				nvidia,pins = "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis Digital Audio */
+			dap2_fs_pa2 {
+				nvidia,pins = "dap2_fs_pa2";
+				nvidia,function = "hda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap2_sclk_pa3 {
+				nvidia,pins = "dap2_sclk_pa3";
+				nvidia,function = "hda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap2_din_pa4 {
+				nvidia,pins = "dap2_din_pa4";
+				nvidia,function = "hda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dap2_dout_pa5 {
+				nvidia,pins = "dap2_dout_pa5";
+				nvidia,function = "hda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pbb3 { /* DAP1_RESET */
+				nvidia,pins = "pbb3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk3_out_pee0 {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis GPIO */
+			ddc_scl_pv4 {
+				nvidia,pins = "ddc_scl_pv4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ddc_sda_pv5 {
+				nvidia,pins = "ddc_sda_pv5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l0_rst_n_pdd1 {
+				nvidia,pins = "pex_l0_rst_n_pdd1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l0_clkreq_n_pdd2 {
+				nvidia,pins = "pex_l0_clkreq_n_pdd2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l1_rst_n_pdd5 {
+				nvidia,pins = "pex_l1_rst_n_pdd5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pex_l1_clkreq_n_pdd6 {
+				nvidia,pins = "pex_l1_clkreq_n_pdd6";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			dp_hpd_pff0 {
+				nvidia,pins = "dp_hpd_pff0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pff2 {
+				nvidia,pins = "pff2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			owr { /* PEX_L1_CLKREQ_N multiplexed GPIO6 */
+				nvidia,pins = "owr";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis HDMI1_CEC */
+			hdmi_cec_pee3 {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis HDMI1_HPD */
+			hdmi_int_pn7 {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis I2C1 */
+			gen1_i2c_scl_pc4 {
+				nvidia,pins = "gen1_i2c_scl_pc4";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			gen1_i2c_sda_pc5 {
+				nvidia,pins = "gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis I2C2 (DDC) */
+			gen2_i2c_scl_pt5 {
+				nvidia,pins = "gen2_i2c_scl_pt5";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			gen2_i2c_sda_pt6 {
+				nvidia,pins = "gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis I2C3 (CAM) */
+			cam_i2c_scl_pbb1 {
+				nvidia,pins = "cam_i2c_scl_pbb1";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			cam_i2c_sda_pbb2 {
+				nvidia,pins = "cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis MMC1 */
+			sdmmc1_cd_n_pv3 { /* CD# GPIO */
+				nvidia,pins = "sdmmc1_wp_n_pv3";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2_out_pw5 { /* D5 GPIO */
+				nvidia,pins = "clk2_out_pw5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_dat3_py4 {
+				nvidia,pins = "sdmmc1_dat3_py4";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_dat2_py5 {
+				nvidia,pins = "sdmmc1_dat2_py5";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_dat1_py6 {
+				nvidia,pins = "sdmmc1_dat1_py6";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_dat0_py7 {
+				nvidia,pins = "sdmmc1_dat0_py7";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_clk_pz0 {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc1_cmd_pz1 {
+				nvidia,pins = "sdmmc1_cmd_pz1";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			clk2_req_pcc5 { /* D4 GPIO */
+				nvidia,pins = "clk2_req_pcc5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			/*
+			 * Don't use MMC1_D6 aka SDMMC3_CLK_LB_IN for now as it
+			 * features some magic properties even though the
+			 * external loopback is disabled and the internal
+			 * loopback used as per SDMMC_VENDOR_MISC_CNTRL_0
+			 * register's SDMMC_SPARE1 bits being set to 0xfffd
+			 * according to the TRM!
+			 */
+			sdmmc3_clk_lb_in_pee5 { /* D6 GPIO */
+				nvidia,pins = "sdmmc3_clk_lb_in_pee5";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			usb_vbus_en2_pff1 { /* D7 GPIO */
+				nvidia,pins = "usb_vbus_en2_pff1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis PWM */
+			ph0 {
+				nvidia,pins = "ph0";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph1 {
+				nvidia,pins = "ph1";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph2 {
+				nvidia,pins = "ph2";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			/* PWM3 active on pu6 being Apalis BKL1_PWM */
+			ph3 {
+				nvidia,pins = "ph3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis SATA1_ACT# */
+			dap1_dout_pn2 {
+				nvidia,pins = "dap1_dout_pn2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis SD1 */
+			sdmmc3_clk_pa6 {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_cmd_pa7 {
+				nvidia,pins = "sdmmc3_cmd_pa7";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_dat3_pb4 {
+				nvidia,pins = "sdmmc3_dat3_pb4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_dat2_pb5 {
+				nvidia,pins = "sdmmc3_dat2_pb5";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_dat1_pb6 {
+				nvidia,pins = "sdmmc3_dat1_pb6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc3_dat0_pb7 {
+				nvidia,pins = "sdmmc3_dat0_pb7";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			/*
+			 * Don't use SD1_CD# aka SDMMC3_CLK_LB_OUT for now as it
+			 * features some magic properties even though the
+			 * external loopback is disabled and the internal
+			 * loopback used as per SDMMC_VENDOR_MISC_CNTRL_0
+			 * register's SDMMC_SPARE1 bits being set to 0xfffd
+			 * according to the TRM!
+			 */
+			sdmmc3_clk_lb_out_pee4 { /* CD# GPIO */
+				nvidia,pins = "sdmmc3_clk_lb_out_pee4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis SPDIF */
+			spdif_out_pk5 {
+				nvidia,pins = "spdif_out_pk5";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			spdif_in_pk6 {
+				nvidia,pins = "spdif_in_pk6";
+				nvidia,function = "spdif";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis SPI1 */
+			ulpi_clk_py0 {
+				nvidia,pins = "ulpi_clk_py0";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_dir_py1 {
+				nvidia,pins = "ulpi_dir_py1";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			ulpi_nxt_py2 {
+				nvidia,pins = "ulpi_nxt_py2";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_stp_py3 {
+				nvidia,pins = "ulpi_stp_py3";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis SPI2 */
+			pg5 {
+				nvidia,pins = "pg5";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg6 {
+				nvidia,pins = "pg6";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg7 {
+				nvidia,pins = "pg7";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pi3 {
+				nvidia,pins = "pi3";
+				nvidia,function = "spi4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis UART1 */
+			pb1 { /* DCD GPIO */
+				nvidia,pins = "pb1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pk7 { /* RI GPIO */
+				nvidia,pins = "pk7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart1_txd_pu0 {
+				nvidia,pins = "pu0";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart1_rxd_pu1 {
+				nvidia,pins = "pu1";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart1_cts_n_pu2 {
+				nvidia,pins = "pu2";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart1_rts_n_pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart3_cts_n_pa1 { /* DSR GPIO */
+				nvidia,pins = "uart3_cts_n_pa1";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart3_rts_n_pc0 { /* DTR GPIO */
+				nvidia,pins = "uart3_rts_n_pc0";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis UART2 */
+			uart2_txd_pc2 {
+				nvidia,pins = "uart2_txd_pc2";
+				nvidia,function = "irda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart2_rxd_pc3 {
+				nvidia,pins = "uart2_rxd_pc3";
+				nvidia,function = "irda";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart2_cts_n_pj5 {
+				nvidia,pins = "uart2_cts_n_pj5";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart2_rts_n_pj6 {
+				nvidia,pins = "uart2_rts_n_pj6";
+				nvidia,function = "uartb";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis UART3 */
+			uart3_txd_pw6 {
+				nvidia,pins = "uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			uart3_rxd_pw7 {
+				nvidia,pins = "uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis UART4 */
+			uart4_rxd_pb0 {
+				nvidia,pins = "pb0";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			uart4_txd_pj7 {
+				nvidia,pins = "pj7";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis USBH_EN */
+			usb_vbus_en1_pn5 {
+				nvidia,pins = "usb_vbus_en1_pn5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis USBH_OC# */
+			pbb0 {
+				nvidia,pins = "pbb0";
+				nvidia,function = "vgp6";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis USBO1_EN */
+			usb_vbus_en0_pn4 {
+				nvidia,pins = "usb_vbus_en0_pn4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Apalis USBO1_OC# */
+			pbb4 {
+				nvidia,pins = "pbb4";
+				nvidia,function = "vgp4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Apalis WAKE1_MICO */
+			pex_wake_n_pdd3 {
+				nvidia,pins = "pex_wake_n_pdd3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* CORE_PWR_REQ */
+			core_pwr_req {
+				nvidia,pins = "core_pwr_req";
+				nvidia,function = "pwron";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* CPU_PWR_REQ */
+			cpu_pwr_req {
+				nvidia,pins = "cpu_pwr_req";
+				nvidia,function = "cpu";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* DVFS */
+			dvfs_pwm_px0 {
+				nvidia,pins = "dvfs_pwm_px0";
+				nvidia,function = "cldvfs";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dvfs_clk_px2 {
+				nvidia,pins = "dvfs_clk_px2";
+				nvidia,function = "cldvfs";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* eMMC */
+			sdmmc4_dat0_paa0 {
+				nvidia,pins = "sdmmc4_dat0_paa0";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat1_paa1 {
+				nvidia,pins = "sdmmc4_dat1_paa1";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat2_paa2 {
+				nvidia,pins = "sdmmc4_dat2_paa2";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat3_paa3 {
+				nvidia,pins = "sdmmc4_dat3_paa3";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat4_paa4 {
+				nvidia,pins = "sdmmc4_dat4_paa4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat5_paa5 {
+				nvidia,pins = "sdmmc4_dat5_paa5";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat6_paa6 {
+				nvidia,pins = "sdmmc4_dat6_paa6";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_dat7_paa7 {
+				nvidia,pins = "sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_clk_pcc4 {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			sdmmc4_cmd_pt7 {
+				nvidia,pins = "sdmmc4_cmd_pt7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* JTAG_RTCK */
+			jtag_rtck {
+				nvidia,pins = "jtag_rtck";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* LAN_DEV_OFF# */
+			ulpi_data5_po6 {
+				nvidia,pins = "ulpi_data5_po6";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* LAN_RESET# */
+			kb_row10_ps2 {
+				nvidia,pins = "kb_row10_ps2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* LAN_WAKE# */
+			ulpi_data4_po5 {
+				nvidia,pins = "ulpi_data4_po5";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* MCU_INT1# */
+			pk2 {
+				nvidia,pins = "pk2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* MCU_INT2# */
+			pj2 {
+				nvidia,pins = "pj2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* MCU_INT3# */
+			pi5 {
+				nvidia,pins = "pi5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* MCU_INT4# */
+			pj0 {
+				nvidia,pins = "pj0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* MCU_RESET */
+			pbb6 {
+				nvidia,pins = "pbb6";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* MCU SPI */
+			gpio_x4_aud_px4 {
+				nvidia,pins = "gpio_x4_aud_px4";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gpio_x5_aud_px5 {
+				nvidia,pins = "gpio_x5_aud_px5";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gpio_x6_aud_px6 { /* MCU_CS */
+				nvidia,pins = "gpio_x6_aud_px6";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gpio_x7_aud_px7 {
+				nvidia,pins = "gpio_x7_aud_px7";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gpio_w2_aud_pw2 { /* MCU_CSEZP */
+				nvidia,pins = "gpio_w2_aud_pw2";
+				nvidia,function = "spi2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* PMIC_CLK_32K */
+			clk_32k_in {
+				nvidia,pins = "clk_32k_in";
+				nvidia,function = "clk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PMIC_CPU_OC_INT */
+			clk_32k_out_pa0 {
+				nvidia,pins = "clk_32k_out_pa0";
+				nvidia,function = "soc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PWR_I2C */
+			pwr_i2c_scl_pz6 {
+				nvidia,pins = "pwr_i2c_scl_pz6";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+			pwr_i2c_sda_pz7 {
+				nvidia,pins = "pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* PWR_INT_N */
+			pwr_int_n {
+				nvidia,pins = "pwr_int_n";
+				nvidia,function = "pmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* RESET_MOCI_CTRL */
+			pu4 {
+				nvidia,pins = "pu4";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* RESET_OUT_N */
+			reset_out_n {
+				nvidia,pins = "reset_out_n";
+				nvidia,function = "reset_out_n";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SHIFT_CTRL_DIR_IN */
+			kb_row0_pr0 {
+				nvidia,pins = "kb_row0_pr0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row1_pr1 {
+				nvidia,pins = "kb_row1_pr1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Configure level-shifter as output for HDA */
+			kb_row11_ps3 {
+				nvidia,pins = "kb_row11_ps3";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SHIFT_CTRL_DIR_OUT */
+			kb_col5_pq5 {
+				nvidia,pins = "kb_col5_pq5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col6_pq6 {
+				nvidia,pins = "kb_col6_pq6";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col7_pq7 {
+				nvidia,pins = "kb_col7_pq7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SHIFT_CTRL_OE */
+			kb_col0_pq0 {
+				nvidia,pins = "kb_col0_pq0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col1_pq1 {
+				nvidia,pins = "kb_col1_pq1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col2_pq2 {
+				nvidia,pins = "kb_col2_pq2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col4_pq4 {
+				nvidia,pins = "kb_col4_pq4";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row2_pr2 {
+				nvidia,pins = "kb_row2_pr2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* GPIO_PI6 aka TEMP_ALERT_L */
+			pi6 {
+				nvidia,pins = "pi6";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* TOUCH_INT */
+			gpio_w3_aud_pw3 {
+				nvidia,pins = "gpio_w3_aud_pw3";
+				nvidia,function = "spi6";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pc7 { /* NC */
+				nvidia,pins = "pc7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg0 { /* NC */
+				nvidia,pins = "pg0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg1 { /* NC */
+				nvidia,pins = "pg1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg2 { /* NC */
+				nvidia,pins = "pg2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg3 { /* NC */
+				nvidia,pins = "pg3";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pg4 { /* NC */
+				nvidia,pins = "pg4";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph4 { /* NC */
+				nvidia,pins = "ph4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph5 { /* NC */
+				nvidia,pins = "ph5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph6 { /* NC */
+				nvidia,pins = "ph6";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ph7 { /* NC */
+				nvidia,pins = "ph7";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pi0 { /* NC */
+				nvidia,pins = "pi0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pi1 { /* NC */
+				nvidia,pins = "pi1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pi2 { /* NC */
+				nvidia,pins = "pi2";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pi4 { /* NC */
+				nvidia,pins = "pi4";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pi7 { /* NC */
+				nvidia,pins = "pi7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pk0 { /* NC */
+				nvidia,pins = "pk0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pk1 { /* NC */
+				nvidia,pins = "pk1";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pk3 { /* NC */
+				nvidia,pins = "pk3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pk4 { /* NC */
+				nvidia,pins = "pk4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap1_fs_pn0 { /* NC */
+				nvidia,pins = "dap1_fs_pn0";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap1_din_pn1 { /* NC */
+				nvidia,pins = "dap1_din_pn1";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap1_sclk_pn3 { /* NC */
+				nvidia,pins = "dap1_sclk_pn3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data7_po0 { /* NC */
+				nvidia,pins = "ulpi_data7_po0";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data0_po1 { /* NC */
+				nvidia,pins = "ulpi_data0_po1";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data1_po2 { /* NC */
+				nvidia,pins = "ulpi_data1_po2";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data2_po3 { /* NC */
+				nvidia,pins = "ulpi_data2_po3";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data3_po4 { /* NC */
+				nvidia,pins = "ulpi_data3_po4";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			ulpi_data6_po7 { /* NC */
+				nvidia,pins = "ulpi_data6_po7";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap4_fs_pp4 { /* NC */
+				nvidia,pins = "dap4_fs_pp4";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap4_din_pp5 { /* NC */
+				nvidia,pins = "dap4_din_pp5";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap4_dout_pp6 { /* NC */
+				nvidia,pins = "dap4_dout_pp6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap4_sclk_pp7 { /* NC */
+				nvidia,pins = "dap4_sclk_pp7";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_col3_pq3 { /* NC */
+				nvidia,pins = "kb_col3_pq3";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row3_pr3 { /* NC */
+				nvidia,pins = "kb_row3_pr3";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row4_pr4 { /* NC */
+				nvidia,pins = "kb_row4_pr4";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row5_pr5 { /* NC */
+				nvidia,pins = "kb_row5_pr5";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row6_pr6 { /* NC */
+				nvidia,pins = "kb_row6_pr6";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row7_pr7 { /* NC */
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row8_ps0 { /* NC */
+				nvidia,pins = "kb_row8_ps0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row9_ps1 { /* NC */
+				nvidia,pins = "kb_row9_ps1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row12_ps4 { /* NC */
+				nvidia,pins = "kb_row12_ps4";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row13_ps5 { /* NC */
+				nvidia,pins = "kb_row13_ps5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row14_ps6 { /* NC */
+				nvidia,pins = "kb_row14_ps6";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row15_ps7 { /* NC */
+				nvidia,pins = "kb_row15_ps7";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row16_pt0 { /* NC */
+				nvidia,pins = "kb_row16_pt0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			kb_row17_pt1 { /* NC */
+				nvidia,pins = "kb_row17_pt1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pu5 { /* NC */
+				nvidia,pins = "pu5";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pv0 { /* NC */
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pv1 { /* NC */
+				nvidia,pins = "pv1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			sdmmc3_cd_n_pv2 { /* NC */
+				nvidia,pins = "sdmmc3_cd_n_pv2";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gpio_x1_aud_px1 { /* NC */
+				nvidia,pins = "gpio_x1_aud_px1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			gpio_x3_aud_px3 { /* NC */
+				nvidia,pins = "gpio_x3_aud_px3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pbb7 { /* NC */
+				nvidia,pins = "pbb7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pcc1 { /* NC */
+				nvidia,pins = "pcc1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			pcc2 { /* NC */
+				nvidia,pins = "pcc2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			clk3_req_pee1 { /* NC */
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+			dap_mclk1_req_pee2 { /* NC */
+				nvidia,pins = "dap_mclk1_req_pee2";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+		};
+	};
+
+	serial@70006040 {
+		compatible = "nvidia,tegra124-hsuart";
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra124-hsuart";
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra124-hsuart";
+	};
+
+	hdmi_ddc: i2c@7000c400 {
+		clock-frequency = <100000>;
+	};
+
+	/* PWR_I2C: power I2C to audio codec, PMIC and temperature sensor */
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		/* SGTL5000 audio codec */
+		sgtl5000: codec@0a {
+			compatible = "fsl,sgtl5000";
+			reg = <0x0a>;
+			VDDA-supply = <&reg_3v3>;
+			VDDIO-supply = <&vddio_1v8>;
+			clocks = <&tegra_car TEGRA124_CLK_EXTERN1>;
+		};
+
+		pmic: pmic@40 {
+			compatible = "ams,as3722";
+			reg = <0x40>;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			ams,system-power-controller;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&as3722_default>;
+
+			as3722_default: pinmux {
+				gpio2_7 {
+					pins = "gpio2", /* PWR_EN_+V3.3 */
+					       "gpio7"; /* +V1.6_LPO */
+					function = "gpio";
+					bias-pull-up;
+				};
+
+				gpio1_3_4_5_6 {
+					pins = "gpio1", "gpio3", "gpio4",
+					       "gpio5", "gpio6";
+					bias-high-impedance;
+				};
+			};
+
+			regulators {
+				vsup-sd2-supply = <&reg_3v3>;
+				vsup-sd3-supply = <&reg_3v3>;
+				vsup-sd4-supply = <&reg_3v3>;
+				vsup-sd5-supply = <&reg_3v3>;
+				vin-ldo0-supply = <&vddio_ddr_1v35>;
+				vin-ldo1-6-supply = <&reg_3v3>;
+				vin-ldo2-5-7-supply = <&vddio_1v8>;
+				vin-ldo3-4-supply = <&reg_3v3>;
+				vin-ldo9-10-supply = <&reg_3v3>;
+				vin-ldo11-supply = <&reg_3v3>;
+
+				vdd_cpu: sd0 {
+					regulator-name = "+VDD_CPU_AP";
+					regulator-min-microvolt = <700000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-min-microamp = <3500000>;
+					regulator-max-microamp = <3500000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ams,ext-control = <2>;
+				};
+
+				sd1 {
+					regulator-name = "+VDD_CORE";
+					regulator-min-microvolt = <700000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-min-microamp = <2500000>;
+					regulator-max-microamp = <4000000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ams,ext-control = <1>;
+				};
+
+				vddio_ddr_1v35: sd2 {
+					regulator-name =
+						"+V1.35_VDDIO_DDR(sd2)";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				sd3 {
+					regulator-name =
+						"+V1.35_VDDIO_DDR(sd3)";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v05: sd4 {
+					regulator-name = "+V1.05";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+				};
+
+				vddio_1v8: sd5 {
+					regulator-name = "+V1.8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				vdd_gpu: sd6 {
+					regulator-name = "+VDD_GPU_AP";
+					regulator-min-microvolt = <650000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-min-microamp = <3500000>;
+					regulator-max-microamp = <3500000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				avdd_1v05: ldo0 {
+					regulator-name = "+V1.05_AVDD";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-boot-on;
+					regulator-always-on;
+					ams,ext-control = <1>;
+				};
+
+				vddio_sdmmc1: ldo1 {
+					regulator-name = "VDDIO_SDMMC1";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo2 {
+					regulator-name = "+V1.2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				ldo3 {
+					regulator-name = "+V1.05_RTC";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-boot-on;
+					regulator-always-on;
+					ams,enable-tracking;
+				};
+
+				/* 1.8V for LVDS, 3.3V for eDP */
+				ldo4 {
+					regulator-name = "AVDD_LVDS0_PLL";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				/* LDO5 not used */
+
+				vddio_sdmmc3: ldo6 {
+					regulator-name = "VDDIO_SDMMC3";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				/* LDO7 not used */
+
+				ldo9 {
+					regulator-name = "+V3.3_ETH(ldo9)";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo10 {
+					regulator-name = "+V3.3_ETH(ldo10)";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo11 {
+					regulator-name = "+V1.8_VPP_FUSE";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+			};
+		};
+
+		/*
+		 * TMP451 temperature sensor
+		 * Note: THERM_N directly connected to AS3722 PMIC THERM
+		 */
+		temperature-sensor@4c {
+			compatible = "ti,tmp451";
+			reg = <0x4c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	/* SPI2: MCU SPI */
+	spi@7000d600 {
+		status = "okay";
+		spi-max-frequency = <25000000>;
+	};
+
+	pmc@7000e400 {
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <500>;
+		nvidia,cpu-pwr-off-time = <300>;
+		nvidia,core-pwr-good-time = <641 3845>;
+		nvidia,core-pwr-off-time = <61036>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+
+		/* Set power_off bit in ResetControl register of AS3722 PMIC */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x40>;
+			nvidia,reg-addr = <0x36>;
+			nvidia,reg-data = <0x2>;
+		};
+	};
+
+	sata@70020000 {
+		phys = <&{/padctl@7009f000/pads/sata/lanes/sata-0}>;
+		phy-names = "sata-0";
+
+		avdd-supply = <&vdd_1v05>;
+		hvdd-supply = <&reg_3v3>;
+		vddio-supply = <&vdd_1v05>;
+	};
+
+	usb@70090000 {
+		/* USBO1, USBO1 (SS), USBH2, USBH4 and USBH4 (SS) */
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
+		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-1}>,
+		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>,
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>;
+		phy-names = "usb2-0", "usb3-1", "usb2-1", "usb2-2", "usb3-0";
+
+		avddio-pex-supply = <&vdd_1v05>;
+		avdd-pll-erefe-supply = <&avdd_1v05>;
+		avdd-pll-utmip-supply = <&vddio_1v8>;
+		avdd-usb-ss-pll-supply = <&vdd_1v05>;
+		avdd-usb-supply = <&reg_3v3>;
+		dvddio-pex-supply = <&vdd_1v05>;
+		hvdd-usb-ss-pll-e-supply = <&reg_3v3>;
+		hvdd-usb-ss-supply = <&reg_3v3>;
+	};
+
+	padctl@7009f000 {
+		pads {
+			usb2 {
+				status = "okay";
+
+				lanes {
+					usb2-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-2 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				lanes {
+					pcie-0 {
+						nvidia,function = "usb3-ss";
+						status = "okay";
+					};
+
+					pcie-1 {
+						nvidia,function = "usb3-ss";
+						status = "okay";
+					};
+
+					pcie-2 {
+						nvidia,function = "pcie";
+						status = "okay";
+					};
+
+					pcie-3 {
+						nvidia,function = "pcie";
+						status = "okay";
+					};
+
+					pcie-4 {
+						nvidia,function = "pcie";
+						status = "okay";
+					};
+				};
+			};
+
+			sata {
+				status = "okay";
+
+				lanes {
+					sata-0 {
+						nvidia,function = "sata";
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			/* USBO1 */
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+
+				vbus-supply = <&reg_usbo1_vbus>;
+			};
+
+			/* USBH2 */
+			usb2-1 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&reg_usbh_vbus>;
+			};
+
+			/* USBH4 */
+			usb2-2 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&reg_usbh_vbus>;
+			};
+
+			usb3-0 {
+				nvidia,usb2-companion = <2>;
+				status = "okay";
+			};
+
+			usb3-1 {
+				nvidia,usb2-companion = <0>;
+				status = "okay";
+			};
+		};
+	};
+
+	/* eMMC */
+	sdhci@700b0600 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+	};
+
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		vdd-cpu-supply = <&vdd_cpu>;
+		nvidia,i2c-fs-rate = <400000>;
+	};
+
+	ahub@70300000 {
+		i2s@70301200 {
+			status = "okay";
+		};
+	};
+
+	clocks {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clk32k_in: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	cpus {
+		cpu@0 {
+			vdd-cpu-supply = <&vdd_cpu>;
+		};
+	};
+
+	reg_1v05_avdd_hdmi_pll: regulator-1v05-avdd-hdmi-pll {
+		compatible = "regulator-fixed";
+		regulator-name = "+V1.05_AVDD_HDMI_PLL";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		vin-supply = <&vdd_1v05>;
+	};
+
+	reg_3v3_mxm: regulator-3v3-mxm {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_MXM";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		/* PWR_EN_+V3.3 */
+		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_3v3_mxm>;
+	};
+
+	reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_AVDD_HDMI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_1v05>;
+	};
+
+	sound {
+		compatible = "toradex,tegra-audio-sgtl5000-apalis_tk1",
+			     "nvidia,tegra-audio-sgtl5000";
+		nvidia,model = "Toradex Apalis TK1";
+		nvidia,audio-routing =
+			"Headphone Jack", "HP_OUT",
+			"LINE_IN", "Line In Jack",
+			"MIC_IN", "Mic Jack";
+		nvidia,i2s-controller = <&tegra_i2s2>;
+		nvidia,audio-codec = <&sgtl5000>;
+		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
+			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+	};
+
+	thermal-zones {
+		cpu {
+			trips {
+				trip@0 {
+					temperature = <101000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/*
+				 * There are currently no cooling maps because
+				 * there are no cooling devices
+				 */
+			};
+		};
+
+		mem {
+			trips {
+				trip@0 {
+					temperature = <101000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/*
+				 * There are currently no cooling maps because
+				 * there are no cooling devices
+				 */
+			};
+		};
+
+		gpu {
+			trips {
+				trip@0 {
+					temperature = <101000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/*
+				 * There are currently no cooling maps because
+				 * there are no cooling devices
+				 */
+			};
+		};
+	};
+};
-- 
2.5.5
