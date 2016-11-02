From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Wed, 2 Nov 2016 14:39:01 +0530
Message-ID: <1478077742-25437-2-git-send-email-ldewangan@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: jonathanh@nvidia.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra124 and later SoCs support the multi-voltage level and
low power state of some of its IO pads. The IO pads can work in
the voltage of the 1.8V and 3.3V of IO power rail sources. When IO
interface are not used then IO pads can be configure in low power
state to reduce the power from that IO pads.

On Tegra124, the IO power rail source is auto detected by SoC and hence
it is only require to configure in low power mode if IO pads are not
used.

On T210 onwards, the auto-detection is removed from SoC and hence SW
must configure the PMC register explicitly to set proper voltage in
IO pads based on IO rail power source voltage.

Add DT binding document for detailing the DT properties for
configuring IO pads voltage levels and its power state.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
On top of the branch from Thierry's T186 work
	https://github.com/thierryreding/linux/tree/tegra186

 .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 112 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h |  21 ++++
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
new file mode 100644
index 0000000..15cd21c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
@@ -0,0 +1,112 @@
+NVIDIA Tegra PMC IO pad controller
+
+NVIDIA Tegra124 and later SoCs support the multi-voltage level and
+low power state of some of its IO pads. The IO pads can work in
+the voltage of the 1.8V and 3.3V of IO power rail sources. When IO
+interface are not used then IO pads can be configure in low power
+state to reduce the power from that IO pads.
+
+On Tegra124, the IO power rail source is auto detected by SoC and hence
+it is only require to configure in low power mode if IO pads are not
+used.
+
+On T210 onwards, the auto-detection is removed from SoC and hence SW
+must configure the PMC register explicitly to set proper voltage in
+IO pads based on IO rail power source voltage.
+
+The voltage configurations and low power state of IO pads should be done
+in boot if it is not going to change other wise dynamically based on IO
+rail voltage on that IO pads and usage of IO pads
+
+The DT property of the io pads must be under the node of pmc i.e.
+pmc@7000e400 for Tegra124 onwards.
+
+Please refer to <pinctrl-bindings.txt> in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+Tegra's pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for an
+IO pads, or a list of IO pads. This configuration can include the voltage and
+power enable/disable control
+
+The name of each subnode is not important; all subnodes should be enumerated
+and processed purely based on their content. Each subnode only affects those
+parameters that are explicitly listed. Unspecified is represented as an absent
+property,
+
+See the TRM to determine which properties and values apply to each IO pads.
+Macro values for property values are defined in
+<dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+
+The voltage supported on the pads are 1.8V and 3.3V. The enums are defined as:
+	For 1.8V, use TEGRA_IO_PAD_POWER_SOURCE_1800000UV
+	For 3.3V, use TEGRA_IO_PAD_POWER_SOURCE_3300000UV
+
+Required subnode-properties:
+==========================
+- pins : An array of strings. Each string contains the name of an IO pads. Valid
+	 values for these names are listed below.
+
+Optional subnode-properties:
+==========================
+-nvidia,power-source-voltage:	Integer. The voltage level of IO pads. The
+				valid values are 1.8V and 3.3V. Macros are
+				defined for these voltage levels in
+				<dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+				Use TEGRA_IO_PAD_POWER_SOURCE_1800000UV for 1.8V
+				Use TEGRA_IO_PAD_POWER_SOURCE_3300000UV for 3.3V
+
+				All IO pads do not support the 1.8V/3.3V
+				configurations. Valid values for "pins" are
+				audio-hv, dmic, gpio, sdmmc1, sdmmc3, spi-hv.
+
+Other than above, following properties are supported from generic pin
+configuration explained in <dt-bindings/pinctrl/pinctrl-binding.txt>.
+low-power-enable:		enable low power mode.
+low-power-disable:		disable low power mode.
+
+Valid values for pin for T124 are:
+	audio, bb, cam, comp, csia, csib, csie, dsi, dsib, dsic, dsid, hdmi,
+	hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
+	pex-ctrl, sdmmc1, sdmmc3, sdmmc4, sys-ddc, uart, usb0, usb1, usb2,
+	usb-bias
+
+	All above pins support low power mode.
+
+Valid values for pin for T210 are:
+	audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
+	dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
+	gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
+	pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
+	usb1, usb2, usb3.
+
+	All above pins support low power mode. However, all IO pads do not
+	support the 1.8V/3.3V configurations. Valid values for
+	nvidia,io-pad-voltage are:
+		audio, audio-hv, cam, dbg, dmic, gpio, pex-ctrl, sdmmc1, sdmmc3,
+		spi, spi-hv,uart
+
+Example:
+	#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+	pmc@7000e400 {
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tegra_io_pad_volt_default>;
+		tegra_io_pad_volt_default: common {
+			audio-hv {
+				pins = "audio-hv";
+				nvidia,power-source-voltage = <TEGRA_IO_PAD_POWER_SOURCE_3300000UV>;
+			};
+
+			gpio {
+				pins = "gpio";
+				invidia,power-source-voltage = <TEGRA_IO_PAD_POWER_SOURCE_1800000UV>;
+			};
+
+			audio {
+				pins = "audio", "dmic", "sdmmc1", "sdmmc3";
+				low-power-enable;
+			};
+		};
+	};
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h b/include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
new file mode 100644
index 0000000..ae55768
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
@@ -0,0 +1,21 @@
+/*
+ * pinctrl-tegra-io-pad.h: Provides constants for Tegra IO pads
+ *			   pinctrl bindings.
+ *
+ * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * Author: Laxman Dewangan <ldewangan@nvidia.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_TEGRA_IO_PAD_H
+#define _DT_BINDINGS_PINCTRL_TEGRA_IO_PAD_H
+
+/* Power source voltage of IO pads. */
+#define TEGRA_IO_PAD_POWER_SOURCE_1800000UV	0
+#define TEGRA_IO_PAD_POWER_SOURCE_3300000UV	1
+
+#endif
-- 
2.1.4
