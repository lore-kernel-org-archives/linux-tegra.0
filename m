From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] clk: tegra: Changes for v4.8-rc1
Date: Fri,  1 Jul 2016 17:00:54 +0200
Message-ID: <20160701150056.26537-1-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-clk

for you to fetch changes up to 15d68e8c2e95e8b62465c7cb3bc642784365ee1b:

  clk: tegra: Initialize UTMI PLL when enabling PLLU (2016-06-30 17:43:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v4.8-rc1

Fixes and enhancements mostly for Tegra210 clocks that allow DSI and
HDMI to work on Tegra X1. There's also a refactoring, including fixes,
the USB PLL.

----------------------------------------------------------------
Andrew Bresticker (1):
      clk: tegra: Initialize UTMI PLL when enabling PLLU

Thierry Reding (7):
      clk: tegra: Fixup post dividers on Tegra210
      clk: tegra: Disable spread spectrum on pll_d2
      clk: tegra: Squash sor1 safe/brick/src into a single mux
      clk: tegra: Enable sor1 and sor1_src on Tegra210
      clk: tegra: Mark timer clock as critical
      clk: tegra: Make sor_safe the parent of dpaux and dpaux1
      clk: tegra: Micro-optimize Tegra210 clock setup

 drivers/clk/tegra/clk-id.h               |   1 -
 drivers/clk/tegra/clk-pll.c              | 505 +++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra-periph.c     |  25 +-
 drivers/clk/tegra/clk-tegra114.c         | 156 +---------
 drivers/clk/tegra/clk-tegra124.c         | 156 +---------
 drivers/clk/tegra/clk-tegra210.c         | 295 ++++--------------
 drivers/clk/tegra/clk-tegra30.c          | 113 +------
 drivers/clk/tegra/clk.h                  |  17 ++
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 9 files changed, 603 insertions(+), 667 deletions(-)
