From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] clk: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 18:04:09 +0100
Message-ID: <20200313170409.2922165-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-clk

for you to fetch changes up to efdd205ccbfaa80bd932bc2fba498026c09db502:

  clk: tegra: Remove audio clocks configuration from clock driver (2020-03-12 12:10:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.7-rc1

These changes remove PMC clocks from the clock and reset controller
driver because they are controlled by bits in the PMC controller.

----------------------------------------------------------------
Sowjanya Komatineni (10):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      clk: tegra: Add support for OSC_DIV fixed clocks
      clk: tegra: Add Tegra OSC to clock lookup
      clk: tegra: Fix Tegra PMC clock out parents
      clk: tegra: Remove CLK_M_DIV fixed clocks
      clk: tegra: Remove tegra_pmc_clk_init along with clk ids
      clk: tegra: Remove audio clocks configuration from clock driver

Thierry Reding (1):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/clk

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 drivers/clk/tegra/Makefile                         |   1 -
 drivers/clk/tegra/clk-id.h                         |  12 +-
 drivers/clk/tegra/clk-tegra-fixed.c                |  37 ++-
 drivers/clk/tegra/clk-tegra-pmc.c                  | 122 -------
 drivers/clk/tegra/clk-tegra114.c                   |  43 +--
 drivers/clk/tegra/clk-tegra124.c                   |  48 ++-
 drivers/clk/tegra/clk-tegra20.c                    |   9 +-
 drivers/clk/tegra/clk-tegra210.c                   |  32 +-
 drivers/clk/tegra/clk-tegra30.c                    |  33 +-
 drivers/clk/tegra/clk.h                            |   1 -
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 17 files changed, 459 insertions(+), 565 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
