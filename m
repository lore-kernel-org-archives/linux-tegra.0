From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v3 00/15] Move PMC clocks into Tegra PMC driver
Date: Thu, 5 Dec 2019 18:48:40 -0800
Message-ID: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
are currently registered by Tegra clock driver using clk_regiser_mux and
clk_register_gate which performs direct Tegra PMC register access.

When Tegra PMC is in secure mode, any access from non-secure world will
not go through.

This patch series adds these Tegra PMC clocks and blink controls to Tegra
PMC driver with PMC as clock provider and removed them from Tegra clock
driver. This also adds PMC specific clock id's to use in device tree and
removed clock ids of PMC clock from Tegra clock driver.

clk_out_1 is dedicated for audio mclk and current ASoC driver does not
setting extern1 as parent for clk_out_1 and enabling clk_out_1 and
currently this is taken care by Tegra clock driver during clock inits
and there is no need to enable this during clock init.

So, this series also includes patch that updates ASoC driver to take
care of configuring parent of mclk and enabling mclk using both extern1
and clk_out_1 and updates all device trees to use clk_out_1 from pmc as
mclk incase if device tree don't specify assigned-clock-parents.

This series also includes a patch for mclk fallback to use extern1
when retrieving mclk fails with new device tree which uses pmc provider
to have this backward compatible of new DT with old kernels.

This series also includes a patch to remove clock ids for these clocks
from clock dt-binding as these clocks are not used in any of the existing
device tree except in tegra210-smaug.dts and this series includes a patch
to update clock provider from tegra_car to pmc in tegra210-smaug.dts for
clk_out_2.

[v3]:	Changes between v2 and v3 are
	- Removes set parent of clk_out_1_mux to extern1 and enabling
	  extern1 from the clock driver.
	- Doesn't enable clk_out_1 and blink by default in pmc driver
	- Updates ASoC driver to take care of audio mclk parent
	  configuration incase if device tree don't specify assigned
	  clock parent properties and enables mclk using both clk_out_1
	  and extern1.
	- updates all device trees using extern1 as mclk in sound node
	  to use clk_out_1 from pmc.
	- patch for YAML format pmc dt-binding
	- Includes v2 feedback

[v2]:	Changes between v1 and v2 are
	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
	- feedback related to pmc clocks in Tegra PMC driver from v1
	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
	  by the clock driver using helper functions from Tegra PMC.

 	  Note:
	  To use helper functions from PMC driver, PMC early init need to
	  happen prior to using helper functions and these helper functions are
	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
	  clock registration which happen in clock_init prior to Tegra PMC
	  probe.
	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
	  tegra_mc_init.
	  This implementation of configuring PMC registers thru helper
	  functions in clock driver needs proper changes across PMC, Clock,
	  EMC and MC inits to have it work across all Tegra platforms.

	  Currently PLLM Override is not enabled in the bootloader so proper
	  patches for this fix will be taken care separately.

[v1]:	v1 includes patches for below fixes.
	- adding clk_out_1, clk_out_2, clk_out_3, blink controls to Tegra PMC
	  driver and removing clk-tegra-pmc.
	- updated clock provider from tegra_car to pmc in the device tree
	  tegra210-smaug.dts that uses clk_out_2.
	- Added helper functions in PMC driver for WB0 PLLM overrides and PLLE
	  IDDQ programming to use by clock driver and updated clock driver to
	  use these helper functions and removed direct PMC access from clock
	  driver and all pmc base address references in clock driver.


Sowjanya Komatineni (15):
  dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
  dt-bindings: tegra: Convert Tegra PMC bindings to YAML
  soc: tegra: Add Tegra PMC clock registrations into PMC driver
  dt-bindings: soc: tegra-pmc: Add id for Tegra PMC blink control
  soc: pmc: Add blink output clock registration to Tegra PMC
  clk: tegra: Remove tegra_pmc_clk_init along with clk ids
  dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
  ASoC: tegra: Add audio mclk control through clk_out_1 and extern1
  ASoC: tegra: Add fallback for audio mclk
  clk: tegra: Remove extern1 and cdev1 from clocks inittable
  ARM: dts: tegra: Add clock-cells property to pmc
  arm64: tegra: Add clock-cells property to Tegra PMC node
  ARM: tegra: Update sound node clocks in device tree
  arm64: tegra: smaug: Change clk_out_2 provider to pmc
  ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  45 ++-
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 291 ++++++++++++++++++
 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |   7 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   7 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |   7 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   7 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |   7 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   7 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   7 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |   7 +-
 arch/arm/boot/dts/tegra30-beaver.dts               |   7 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |   7 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |   7 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 drivers/clk/tegra/Makefile                         |   1 -
 drivers/clk/tegra/clk-id.h                         |   7 -
 drivers/clk/tegra/clk-tegra-pmc.c                  | 122 --------
 drivers/clk/tegra/clk-tegra114.c                   |  12 -
 drivers/clk/tegra/clk-tegra124.c                   |  28 +-
 drivers/clk/tegra/clk-tegra20.c                    |   5 -
 drivers/clk/tegra/clk-tegra210.c                   |  12 -
 drivers/clk/tegra/clk-tegra30.c                    |  13 -
 drivers/clk/tegra/clk.h                            |   1 -
 drivers/soc/tegra/pmc.c                            | 340 +++++++++++++++++++++
 include/dt-bindings/clock/tegra114-car.h           |  14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |  14 +-
 include/dt-bindings/clock/tegra20-car.h            |   2 +-
 include/dt-bindings/clock/tegra210-car.h           |  14 +-
 include/dt-bindings/clock/tegra30-car.h            |  14 +-
 include/dt-bindings/soc/tegra-pmc.h                |  19 ++
 sound/soc/tegra/tegra_asoc_utils.c                 |  76 ++++-
 sound/soc/tegra/tegra_asoc_utils.h                 |   1 +
 39 files changed, 890 insertions(+), 244 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

-- 
2.7.4
