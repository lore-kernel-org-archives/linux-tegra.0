From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] clk: tegra: Changes for v4.15-rc1
Date: Fri, 20 Oct 2017 14:14:12 +0200
Message-ID: <20171020121412.10527-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-clk

for you to fetch changes up to e4e2519df9928ae923205759176599969f344cd4:

  clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init() (2017-10-20 13:37:45 +0200)

Note that this pulls in parts from two other tags that are going to go
in via the ARM SoC tree. Those are needed to a couple of resolve build
dependencies.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v4.15-rc1

This contains cleanups and minor fixes for the Tegra clock driver.

----------------------------------------------------------------
Bhumika Goyal (1):
      clk: tegra: Make tegra_clk_pll_params __ro_after_init

Dmitry Osipenko (4):
      clk: tegra: Add AHB DMA clock entry
      clk: tegra: Correct parent of the APBDMA clock
      clk: tegra: Use common definition of APBDMA clock gate
      clk: tegra: Bump SCLK clock rate to 216 MHz

Michał Mirosław (1):
      clk: tegra: Fix cclk_lp divisor register

Nicolin Chen (2):
      clk: tegra: dfll: Fix drvdata overwriting issue
      clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init()

Thierry Reding (6):
      dt-bindings: clock: tegra: Add sor1_out clock
      Merge branch 'for-4.15/dt-bindings' into for-4.15/clk
      Merge branch 'for-4.15/firmware' into for-4.15/clk
      clk: tegra: Add peripheral clock registration helper
      clk: tegra: Use tegra_clk_register_periph_data()
      clk: tegra: Fix sor1_out clock implementation

Timo Alho (2):
      firmware: tegra: Propagate error code to caller
      clk: tegra: Check BPMP response return code

 drivers/clk/tegra/clk-bpmp.c               | 15 ++++++---
 drivers/clk/tegra/clk-dfll.c               | 10 +++---
 drivers/clk/tegra/clk-dfll.h               |  2 +-
 drivers/clk/tegra/clk-id.h                 |  1 +
 drivers/clk/tegra/clk-periph.c             |  8 +++++
 drivers/clk/tegra/clk-tegra-periph.c       | 24 ++------------
 drivers/clk/tegra/clk-tegra114.c           |  4 +--
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 12 +++----
 drivers/clk/tegra/clk-tegra20.c            | 13 +++-----
 drivers/clk/tegra/clk-tegra210.c           | 51 ++++++++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra30.c            | 23 +++++++-------
 drivers/clk/tegra/clk.h                    |  3 ++
 drivers/firmware/tegra/bpmp.c              | 22 +++++++++----
 include/dt-bindings/clock/tegra210-car.h   |  1 +
 include/soc/tegra/bpmp.h                   |  1 +
 15 files changed, 119 insertions(+), 71 deletions(-)
