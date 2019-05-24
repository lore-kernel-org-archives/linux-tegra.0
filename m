From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/8] memory: tegra: Introduce Tegra30 EMC driver
Date: Fri, 24 May 2019 20:23:45 +0300
Message-ID: <20190524172353.29087-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series introduces driver for the External Memory Controller (EMC)
found on Tegra30 chips, it controls the external DRAM on the board. The
purpose of this driver is to program memory timing for external memory on
the EMC clock rate change. The driver was tested using the ACTMON devfreq
driver that performs memory frequency scaling based on memory-usage load.

Changelog:

v3: - Addressed review comments that were made by Stephen Boyd to v2 by
      adding explicit typing for the callback variable, by including
      "clk-provider.h" directly in the code and by dropping __clk_lookup
      usage where possible.

      Added more patches into this series:

        memory: tegra20-emc: Drop setting EMC rate to max on probe
        memory: tegra20-emc: Adapt for clock driver changes
        memory: tegra20-emc: Include io.h instead of iopoll.h
        memory: tegra20-emc: Replace clk_get_sys with devm_clk_get

      Initially I was going to include these patches into other patchset,
      but changed my mind after rearranging things a tad. The "Adapt for
      clock driver changes" patch is directly related to the clock changes
      done in the first patch of this series, the rest are minor cleanups
      that are fine to include here as well.

      Added some more words to the commit message of "Add binding for NVIDIA
      Tegra30 External Memory Controller" patch, clarifying why common DDR
      timing device-tree form isn't suitable for Tegra30.

      The Tegra30 EMC driver now explicitly selects the registers access
      mode (EMC_DBG mux), not relying on the setting left from bootloader.

v2: - Added support for changing MC clock diver configuration based on
      Memory Controller (MC) configuration which is part of the memory
      timing.

    - Merged the "Add custom EMC clock implementation" patch into this
      series because the "Introduce Tegra30 EMC driver" patch directly
      depends on it. Please note that Tegra20 EMC driver will need to be
      adapted for the clock changes as well, I'll send out the Tegra20
      patches after this series will be applied because of some other
      dependencies (devfreq) and because the temporary breakage won't
      be critical (driver will just error out on probe).

    - EMC driver now performs MC configuration validation by checking
      that the number of MC / EMC timings matches and that the timings
      rate is the same.

    - EMC driver now supports timings that want to change the MC clock
      configuration.

    - Other minor prettifying changes of the code.

Dmitry Osipenko (8):
  clk: tegra20/30: Add custom EMC clock implementation
  memory: tegra20-emc: Drop setting EMC rate to max on probe
  memory: tegra20-emc: Adapt for clock driver changes
  memory: tegra20-emc: Include io.h instead of iopoll.h
  memory: tegra20-emc: Replace clk_get_sys with devm_clk_get
  dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory
    Controller
  memory: tegra: Introduce Tegra30 EMC driver
  ARM: dts: tegra30: Add External Memory Controller node

 .../memory-controllers/nvidia,tegra30-emc.txt |  249 ++++
 arch/arm/boot/dts/tegra30.dtsi                |   11 +
 drivers/clk/tegra/Makefile                    |    2 +
 drivers/clk/tegra/clk-tegra20-emc.c           |  299 +++++
 drivers/clk/tegra/clk-tegra20.c               |   55 +-
 drivers/clk/tegra/clk-tegra30.c               |   38 +-
 drivers/clk/tegra/clk.h                       |    6 +
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/mc.c                     |    3 -
 drivers/memory/tegra/mc.h                     |   30 +-
 drivers/memory/tegra/tegra20-emc.c            |   94 +-
 drivers/memory/tegra/tegra30-emc.c            | 1165 +++++++++++++++++
 drivers/memory/tegra/tegra30.c                |   44 +
 include/linux/clk/tegra.h                     |   14 +
 15 files changed, 1903 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.txt
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
 create mode 100644 drivers/memory/tegra/tegra30-emc.c

-- 
2.21.0
