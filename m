From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: What's in linux-tegra for 3.3 (and last call for patches)
Date: Mon, 19 Dec 2011 20:14:40 -0800
Message-ID: <CAOesGMj5=3Cbp9KYqn6OSBE05P7Q6Na5khzqhxU3su76KzhpDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is what is currently sitting in the
for-3.3/{cleanup,soc,boards,drivers,dt} trees, and what I plan on
sending up to arm-soc shortly.

If you have any outstanding patches that are not part of the below,
let me know as soon as possible. I certainly have a bunch myself that
will not make the 3.3, but will post them in a bit for review and 3.4
staging.




Leon Romanovsky (1):
      ARM: tegra: paz00: Fix board pinmux table.

Marc Dietrich (3):
      arm/dt: tegra: add dts file for paz00
      ARM: tegra: paz00: add support for wakeup gpio key
      arm/dt: tegra: add dts file for paz00

Olof Johansson (9):
      arm/tegra: fix variable formatting in makefile
      arm/dt: add basic usb nodes to tegra device trees
      USB: ehci-tegra: add probing through device tree
      arm/tegra: boards: more __init/__initdata annotations
      arm/tegra: fix variable formatting in makefile
      arm/dt: add basic usb nodes to tegra device trees
      USB: ehci-tegra: add probing through device tree
      arm/tegra: refresh defconfig for tegra30
      arm/tegra: fix variable formatting in makefile

Peter De Schrijver (15):
      arm/tegra: initial device tree for tegra30
      arm/tegra: clk_get should not be fatal
      arm/tegra: cleanup tegra20 support
      arm/tegra: prepare clock code for multiple tegra variants
      arm/tegra: don't export clk_measure_input_freq
      arm/tegra: prepare early init for multiple tegra variants
      arm/tegra: rename board-dt.c to board-dt-tegra20.c
      arm/tegra: use PMC reset
      arm/tegra: generalize L2 cache initialization
      arm/tegra: rename tegra20 pinmux files
      arm/tegra: prepare pinmux code for multiple tegra variants
      arm/tegra: add new fields to struct tegra_pingroup_desc
      arm/tegra: pinmux tables and definitions for tegra30
      arm/tegra: implement support for tegra30
      arm/tegra: add support for tegra30 based board cardhu

Stephen Warren (38):
      i2c: tegra: Add __devinit/exit to probe/remove
      i2c: tegra: Support DVC controller in device tree
      arm/dt: tegra: Clean up I2S and DAS nodes
      arm/tegra: Add device-tree support for TrimSlice board
      arm/tegra: board-dt: Fix AUXDATA typo
      arm/tegra: board-dt: Enable audio-related clocks
      arm/dt: tegra: Remove /memreserve/ from device-tree files
      arm/dt: tegra: Remove /chosen node
      arm/dt: tegra: Fix I2C nodes to match board files
      arm/dt: tegra: Fix serial nodes to match board files
      arm/dt: tegra: Fix SDHCI nodes to match board files
      arm/dt: tegra: Use new compatible value for DVC I2C controller
      arm/dt: Add ADT7461 to Seaboard
      arm/tegra: Seaboard: Add GPIO key device tree nodes
      arm/tegra: Split Seaboard GPIO table to allow for Ventana
      arm/tegra: Add AUXDATA for tegra-pinmux and tegra-gpio
      arm/tegra: Harmony PCIe: Don't touch pinmux
      arm/tegra: PCIe: Remove include of mach/pinmux.h
      arm/tegra: Remove useless entries from ventana_pinmux[]
      arm/tegra: Rework Seaboard-vs-Ventana pinmux table
      arm/tegra: Fix mistake in Trimslice's pinmux
      arm/tegra: Refactor board-*-pinmux.c to share code
      arm/tegra: Use bus notifiers to trigger pinmux setup
      arm/dt: tegra: Clean up I2S and DAS nodes
      arm/tegra: Add device-tree support for TrimSlice board
      arm/tegra: board-dt: Fix AUXDATA typo
      arm/tegra: board-dt: Enable audio-related clocks
      arm/dt: tegra: Remove /memreserve/ from device-tree files
      arm/dt: tegra: Remove /chosen node
      arm/dt: tegra: Fix I2C nodes to match board files
      arm/dt: tegra: Fix serial nodes to match board files
      arm/dt: tegra: Fix SDHCI nodes to match board files
      arm/tegra: Fix section mismatch errors in tegra20 pinmux
      arm/tegra: Fix section mismatch errors in tegra30 pinmux
      arm/tegra: Delete tegra_init_clock()
      arm/tegra: Make MACH_TEGRA_DT depend on ARCH_TEGRA_2x_SOC

      arm/tegra: Compile tegra_dt_init_irq only when CONFIG_OF
      arm/tegra: Remove code that's ifndef CONFIG_ARM_GIC

pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org (2):
      arm/tegra: convert tegra20 to GIC devicetree binding
      arm/tegra: remove unused defines
