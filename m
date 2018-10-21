From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 0/8] Tegra20 External Memory Controller driver
Date: Sun, 21 Oct 2018 21:30:44 +0300
Message-ID: <20181021183052.32023-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Changelog:

v6:
        - Driver now handles "refresh request overflow" interrupt by
          reporting error message.

        - EMC rate is set during driver initialization to ensure that clock
          divider is in a proper state.

v5:
        - Fixed wrong EMC clock divider type in the "Turn EMC clock gate into
          divider" patch. It is a Tegra's fractional 7.1 divider and not a
          simple integer divider. Peter, please take a look at the change.

v4:
        - Fixed "bad of_node_put()" error which was revealed by enabling
          some extra kernel debug config options.

        - The "emc-table" DT nodes are now parsed starting from the "emc"
          node instead of the DT root.

        - Adjusted code comment in the "Turn EMC clock gate into divider"
          patch as was suggested by Stephen Boyd to the v3.

v3:
        - Handle "nvidia,use-ram-code" DT property, its handling was missed
          in the previous versions.

        - Honor "emc-tables" DT node naming which is explicitly specified
          in the DT binding, also was missed in the previous versions.

        - Two new DT binding patches: one adds the EMC clock property,
          other relocates the binding doc file to the appropriate directory.
          One new patch that adds EMC clock property to the DTS file.

        - Addressed v2 review comments from Thierry Reding. Driver does not
          preserve backwards compatibility with older device tree binding.

        - The PLL_M and PLL_P clocks are kept internal to the driver because
          after some more considering I couldn't find a really good reason why
          these clocks should be in the device tree.

        - Some minor cleanups and fixes in the drivers code.

v2:
        - Minor code cleanups like consistent use of writel_relaxed instead
          of non-relaxed version, reworded error messages, etc.

        - Factored out use_pllm_ud bit checking into a standalone patch for
          consistency.

Dmitry Osipenko (8):
  dt: bindings: tegra20-emc: Document interrupt property
  dt: bindings: tegra20-emc: Document clock property
  dt: bindings: Move tegra20-emc binding to memory-controllers directory
  ARM: dts: tegra20: Add interrupt entry to External Memory Controller
  ARM: dts: tegra20: Add clock entry to External Memory Controller
  clk: tegra20: Turn EMC clock gate into divider
  clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC
  memory: tegra: Introduce Tegra20 EMC driver

 .../nvidia,tegra20-emc.txt                    |   4 +
 arch/arm/boot/dts/tegra20.dtsi                |   2 +
 drivers/clk/tegra/clk-tegra20.c               |  46 +-
 drivers/memory/tegra/Kconfig                  |  10 +
 drivers/memory/tegra/Makefile                 |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 591 ++++++++++++++++++
 6 files changed, 644 insertions(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (95%)
 create mode 100644 drivers/memory/tegra/tegra20-emc.c

-- 
2.19.0
