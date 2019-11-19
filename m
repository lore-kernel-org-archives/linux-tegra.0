From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v1 00/17] Remove direct Tegra PMC access in clock driver
Date: Mon, 18 Nov 2019 22:50:17 -0800
Message-ID: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

This series also includes patch to update clock provider from tegra_car
to pmc in the device tree tegra210-smaug.dts that uses clk_out_2 from PMC.

Tegra PMC also has WB0 PLLM overrides and PLLE pads IDDQ controls which
are currently configured by Tegra clock driver using direct PMC access.

This series also includes patches that adds helper functions in Tegra PMC
driver to allow programming these from Tegra clock driver and removes
direct PMC access from the clock driver.


Sowjanya Komatineni (17):
  soc: tegra: pmc: Add helper functions for PLLM overrides
  soc: tegra: pmc: Add helper function for PLLE IDDQ override
  dt-bindings: soc: tegra-pmc: Add Tegra PMC clock ids
  soc: tegra: Add Tegra PMC clock registrations into PMC driver
  dt-bindings: soc: tegra-pmc: Add id for Tegra PMC blink control
  soc: pmc: Add blink output clock registration to Tegra PMC
  clk: tegra: Use Tegra PMC helper functions for PLLM overrides
  clk: tegra: Use Tegra PMC helper function for PLLE IDDQ
  clk: tegra: Remove PMC base references from clock registration
  clk: tegra: Remove tegra_pmc_clk_init along with clk ids
  dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
  arm: tegra: Add clock-cells property to Tegra pmc
  arm64: tegra: Add clock-cells property to Tegra pmc
  dt-bindings: Add Tegra PMC clock configuration bindings
  dt-bindings: tegra186-pmc: Add Tegra PMC clock bindings
  arm64: tegra: smaug: Change clk_out_2 provider from tegra_car to pmc
  ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc

 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  44 ++
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  42 ++
 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 drivers/clk/tegra/Makefile                         |   1 -
 drivers/clk/tegra/clk-id.h                         |   7 -
 drivers/clk/tegra/clk-pll.c                        | 135 ++---
 drivers/clk/tegra/clk-tegra-audio.c                |   4 +-
 drivers/clk/tegra/clk-tegra-periph.c               |   8 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |  11 +-
 drivers/clk/tegra/clk-tegra114.c                   |  75 +--
 drivers/clk/tegra/clk-tegra124.c                   |  86 +--
 drivers/clk/tegra/clk-tegra20.c                    |  30 +-
 drivers/clk/tegra/clk-tegra210.c                   |  74 +--
 drivers/clk/tegra/clk-tegra30.c                    |  59 +-
 drivers/clk/tegra/clk.h                            |  48 +-
 drivers/soc/tegra/pmc.c                            | 598 ++++++++++++++++++++-
 include/dt-bindings/clock/tegra114-car.h           |  14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |  14 +-
 include/dt-bindings/clock/tegra20-car.h            |   2 +-
 include/dt-bindings/clock/tegra210-car.h           |  14 +-
 include/dt-bindings/clock/tegra30-car.h            |  14 +-
 include/dt-bindings/soc/tegra-pmc.h                |  17 +
 include/soc/tegra/pmc.h                            |   6 +
 31 files changed, 879 insertions(+), 450 deletions(-)
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

-- 
2.7.4
