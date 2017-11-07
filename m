From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2] clk: tegra: Changes for v4.15-rc1
Date: Tue,  7 Nov 2017 16:25:32 +0100
Message-ID: <20171107152532.13918-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-clk-2

for you to fetch changes up to 22ef01a203d27fee8b7694020b7e722db7efd2a7:

  clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init() (2017-11-01 15:00:07 +0100)

Note that this pulls in parts from two other tags that are going to go
in via the ARM SoC tree. Those are needed to a couple of resolve build
dependencies.

This is the follow-up pull request that includes Jon's fix for the pclk
issue.

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

Jon Hunter (1):
      clk: tegra: Mark APB clock as critical

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
 drivers/clk/tegra/clk-tegra-super-gen4.c   |  2 +-
 drivers/clk/tegra/clk-tegra114.c           |  4 +--
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 12 +++----
 drivers/clk/tegra/clk-tegra20.c            | 13 +++-----
 drivers/clk/tegra/clk-tegra210.c           | 51 ++++++++++++++++++++++++++++--
 drivers/clk/tegra/clk-tegra30.c            | 23 +++++++-------
 drivers/clk/tegra/clk.h                    |  3 ++
 drivers/firmware/tegra/bpmp.c              | 22 +++++++++----
 include/dt-bindings/clock/tegra210-car.h   |  1 +
 include/soc/tegra/bpmp.h                   |  1 +
 16 files changed, 120 insertions(+), 72 deletions(-)
