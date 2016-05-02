From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 5/6] pinctrl: tegra: Add DT binding for io pads control
Date: Mon, 2 May 2016 17:47:13 +0530
Message-ID: <1462191434-28933-6-git-send-email-ldewangan@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
or 3.3V I/O voltage levels. Also IO pads can be configured for
power down state if it is not in used. SW needs to configure the
voltage level of IO pads based on IO rail voltage and its power
state based on platform usage.

Add DT binding document for detailing the DT properties for
configuring IO pads voltage levels and its power state.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
- Reworked on DT properties to use generic pinconf DT. Also add macros
for voltage support. Now all DT properties are in flat DT instead of
sub node based.
---
 .../bindings/pinctrl/nvidia,tegra210-io-pad.txt    | 88 ++++++++++++++++++++++
 .../dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h  | 20 +++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
new file mode 100644
index 0000000..7616380
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
@@ -0,0 +1,88 @@
+NVIDIA Tegra210 PMC IO pad controller
+
+NVIDIA Tegra210 supports IO pads which can operate at 1.8V or 3.3V I/O
+power rail source. SW needs to configure the voltage level of IO pads
+based on platform specific power tree.
+
+The voltage configurations of IO pads should be done in boot if it is not
+going to change other wise dynamically based on IO rail voltage on that
+IO pads.
+
+The DT property of the io pads must be under the node of pmc i.e.
+pmc@7000e400 for Tegra210.
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
+<dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
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
+				<dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
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
+Valid values for pin for low power mode supports are:
+	audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
+	dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
+	gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
+	pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
+	usb1, usb2, usb3.
+
+Example:
+	#include <dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h>
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
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h b/include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h
new file mode 100644
index 0000000..77fd448
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h
@@ -0,0 +1,20 @@
+/*
+ * This header provides constants for Tegra210 IO pads pinctrl bindings.
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
+#ifndef _DT_BINDINGS_PINCTRL_TEGRA210_IO_PAD_H
+#define _DT_BINDINGS_PINCTRL_TEGRA210_IO_PAD_H
+
+/* Power source voltage for Tegra IO Pad. */
+#define TEGRA_IO_PAD_POWER_SOURCE_1800000UV		0
+#define TEGRA_IO_PAD_POWER_SOURCE_3300000UV		1
+
+#endif
-- 
2.1.4
