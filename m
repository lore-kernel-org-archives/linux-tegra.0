From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Add a README, to provide a description of the project
Date: Mon, 15 Sep 2014 12:59:13 -0600
Message-ID: <1410807553-18789-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 README.txt

diff --git a/README.txt b/README.txt
new file mode 100644
index 000000000000..1c423d684f5e
--- /dev/null
+++ b/README.txt
@@ -0,0 +1,67 @@
+Introduction
+============
+
+Many aspects of many of Tegra's pins can configure via the pinmux and GPIO
+controllers. This project exists to assist with software's handling of the
+configuration of those controllers.
+
+Data files
+==========
+
+SoC definition
+
+  The exact set of configurable options varies from chip to chip. This project
+  contains a data file for each chip, which describes the available pins on
+  the chip, along with their parameters, such as the set of available pinmux
+  functions the pin supports.
+
+  An example is configs/tegra124.soc.
+
+Board configuration
+
+  Much of the programming of these controllers is directly driven by the board
+  design. This project contains a data file for each board, which describes
+  the required configuration for each pin.
+
+  An example is configs/jetson-tk1.board.
+
+Converter Scripts
+=================
+
+soc-to-kernel-pinctrl-driver.py
+
+  Reads an SoC definition data file, and emits the source code for a Linux
+  kernel pinctrl driver, e.g. drivers/pinctrl/pinctrl-tegra124.c.
+
+soc-to-uboot-driver.py
+
+  Reads an SoC definition data file, and emits the source code for a U-Boot
+  pinmux driver, e.g. arch/arm/include/asm/arch-tegra124/pinmux.h,
+  arch/arm/cpu/tegra124-common/pinmux.c
+
+csv-to-board-tegra124-xlsx.py
+
+  Part of the output from the board design process is a spreadsheet that
+  describes the required configuration for each pin. This script extracts the
+  final pinmux configuration from (a CSV representation of) such spreadsheets
+  and creates a board configuration such as configs/jetson-tk1.board.
+
+board-to-kernel-dt.py
+
+  Reads a board configuration data file, and emits a device tree fragment
+  suitable for inclusion in a board's device tree file. For example, the
+  output may form part of arch/arm/boot/dts/tegra124-jetson-tk1.dts.
+
+  Note that when at all possible, it is far preferable for the kernel not to
+  program the pinmux controller, but rather to rely upon system software to
+  have set it up. This reduces duplicate processing of pinmux data, and is
+  consistent with a model where the first software to touch any I/O controller
+  programs the pinmux configuration en mass, to avoid any potential output
+  data glitches.
+
+board-to-uboot.py
+
+  Reads a board configuration data file, and emits a header file suitable for
+  use with U-Boot's pinmux driver. For example,
+  board/nvidia/jetson-tk1/pinmux-config-jetson-tk1.h. Note also the function
+  pinmux_init() in jetson-tk1.c in that same directory.
-- 
1.9.1
