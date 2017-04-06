From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] clk: tegra: Changes for v4.12-rc1
Date: Fri,  7 Apr 2017 01:09:01 +0200
Message-ID: <20170406230901.31704-1-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.12-clk

for you to fetch changes up to 1116d5a7aff205b6d9879a6458788cac20d0cdf3:

  clk: tegra: Don't reset PLL-CX if it is already enabled (2017-04-04 16:06:05 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v4.12-rc1

This contains a bunch of fixes and cleanups, mostly to the Tegra210
clock driver.

----------------------------------------------------------------
Alex Frid (1):
      clk: tegra: Propagate clk_out_x rate to parent

Jon Hunter (1):
      clk: tegra: Don't reset PLL-CX if it is already enabled

Mikko Perttunen (1):
      clk: tegra: Implement reset control reset

Peter De Schrijver (20):
      clk: tegra: Fix pll_a1 iddq register, add pll_a1
      clk: tegra: Fix ISP clock modelling
      clk: tegra: Correct afi clock parent
      clk: tegra: Remove non-existing pll_m_out1 clock
      clk: tegra: Don't warn for PLL defaults unnecessarily
      clk: tegra: Correct tegra210_pll_fixed_mdiv_cfg rate calculation
      clk: tegra: Fix type for m field
      clk: tegra: Add CEC clock
      clk: tegra: Define Tegra210 DMIC sync clocks
      clk: tegra: Fix constness for peripheral clocks
      clk: tegra: Define Tegra210 DMIC clocks
      clk: tegra: Add super clock mux/divider
      clk: tegra: Add aclk
      clk: tegra: Handle UTMIPLL IDDQ
      clk: tegra: Fix disable unused for clocks sharing enable bit
      clk: tegra: Rework pll_u
      clk: tegra: Add Tegra210 special resets
      clk: tegra: Add SATA seq input control
      clk: tegra: Mark TEGRA210_CLK_DBGAPB as always on
      clk: tegra: Add missing Tegra210 clocks

Thierry Reding (1):
      clk: tegra: Fix build warnings on Tegra20/Tegra30

 drivers/clk/tegra/clk-id.h                      |  17 +
 drivers/clk/tegra/clk-periph-gate.c             |   3 +
 drivers/clk/tegra/clk-periph.c                  |   6 +-
 drivers/clk/tegra/clk-pll.c                     | 174 ---------
 drivers/clk/tegra/clk-super.c                   |  87 ++++-
 drivers/clk/tegra/clk-tegra-audio.c             |  85 ++--
 drivers/clk/tegra/clk-tegra-periph.c            |  41 +-
 drivers/clk/tegra/clk-tegra-pmc.c               |   6 +-
 drivers/clk/tegra/clk-tegra114.c                |   1 +
 drivers/clk/tegra/clk-tegra124.c                |   1 +
 drivers/clk/tegra/clk-tegra210.c                | 499 ++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra30.c                 |   1 +
 drivers/clk/tegra/clk.c                         |  16 +
 drivers/clk/tegra/clk.h                         |  15 +-
 include/dt-bindings/clock/tegra114-car.h        |   2 +-
 include/dt-bindings/clock/tegra124-car-common.h |   2 +-
 include/dt-bindings/clock/tegra210-car.h        |  33 +-
 include/dt-bindings/clock/tegra30-car.h         |   2 +-
 include/dt-bindings/reset/tegra210-car.h        |  13 +
 include/linux/clk/tegra.h                       |   3 +
 20 files changed, 739 insertions(+), 268 deletions(-)
 create mode 100644 include/dt-bindings/reset/tegra210-car.h
