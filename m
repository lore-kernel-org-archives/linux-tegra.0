From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] clk: tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:27:30 +0200
Message-ID: <20200515142730.1573945-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-clk

for you to fetch changes up to dec396322d25ca5ce2f307b6da897060fdf9a782:

  clk: tegra: Add Tegra210 CSI TPG clock gate (2020-05-12 22:48:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.8-rc1

Thise are a couple of changes to implement EMC frequency scaling on
Tegra210, CPU frequency scaling on Tegra20 and Tegra30 as well as a
special clock gate for the CSI test pattern generator on Tegra210.

----------------------------------------------------------------
Dmitry Osipenko (5):
      clk: tegra: Add custom CCLK implementation
      clk: tegra: pll: Add pre/post rate-change hooks
      clk: tegra: cclk: Add helpers for handling PLLX rate changes
      clk: tegra20: Use custom CCLK implementation
      clk: tegra30: Use custom CCLK implementation

Joseph Lo (4):
      clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
      clk: tegra: Export functions for EMC clock scaling
      clk: tegra: Implement Tegra210 EMC clock
      clk: tegra: Remove the old emc_mux clock for Tegra210

Sowjanya Komatineni (2):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      clk: tegra: Add Tegra210 CSI TPG clock gate

Thierry Reding (2):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/clk
      clk: tegra: Rename Tegra124 EMC clock source file

 drivers/clk/tegra/Kconfig                          |   4 -
 drivers/clk/tegra/Makefile                         |   4 +-
 drivers/clk/tegra/clk-pll.c                        |  12 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           | 212 ++++++++++++
 .../clk/tegra/{clk-emc.c => clk-tegra124-emc.c}    |   0
 drivers/clk/tegra/clk-tegra20.c                    |   7 +-
 drivers/clk/tegra/clk-tegra210-emc.c               | 369 +++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c                   |  94 ++++--
 drivers/clk/tegra/clk-tegra30.c                    |   6 +-
 drivers/clk/tegra/clk.h                            |  24 +-
 include/dt-bindings/clock/tegra210-car.h           |   6 +-
 include/linux/clk/tegra.h                          |  27 ++
 12 files changed, 730 insertions(+), 35 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
