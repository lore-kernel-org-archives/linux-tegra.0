From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 00/19] Tegra210 Clock Support
Date: Wed, 29 Apr 2015 13:21:30 -0400
Message-ID: <1430328109-537-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch series updates the tegra common clock driver and adds
support for the Tegra210 clocks. The clocks in Tegra210 changed
significantly in some ways from earlier generations, so to support
them, we need to extend our base framework a bit and add some new
features.

Some patches here also address issues found while adding features
and other cleanup type work.

v2:
  - Fixed some problems around plle, pllx dynamic ramping,
    iddq/reset, and some incorrect register address. See
    individual patches for more details differences.

Bill Huang (7):
  clk: tegra: pll-params: change misc_reg count from 3 -> 6
  clk: tegra: pll: Add logic for SS
  clk: tegra: pll: Add code to handle if resets are supported by PLL
  clk: tegra: pll: Adjust vco_min if SDM present
  clk: tegra: pll: Add dyn_ramp callback
  clk: tegra: pll: Add Set_default logic
  clk: tegra: Add Super Gen5 Logic

Rhyland Klein (12):
  clk: tegra: Modify tegra_audio_clk_init to accept more plls
  clk: tegra: periph: add new periph clks and muxes for Tegra210
  clk: tegra: pll: add tegra_pll_wait_for_lock to clk header
  clk: tegra: pll: simplify clk_enable_path
  clk: tegra: pll: update warning msg
  clk: tegra: pll: Don't unconditionally set LOCK flags
  clk: tegra: pll: Add logic for handling SDM data
  clk: tegra: pll: Add logic for out-of-table rates for T210
  clk: tegra: pll: Add specialized logic for T210
  clk: tegra: pll: Add support for PLLMB for T210
  clk: tegra: pll: Fix _pll_ramp_calc_pll logic and
    _calc_dynamic_ramp_rate
  clk: tegra210: add support for Tegra210 clocks

 .../bindings/clock/nvidia,tegra210-car.txt         |   56 +
 drivers/clk/tegra/Makefile                         |    2 +
 drivers/clk/tegra/clk-id.h                         |   61 +-
 drivers/clk/tegra/clk-pll.c                        |  685 ++++-
 drivers/clk/tegra/clk-tegra-audio.c                |   25 +-
 drivers/clk/tegra/clk-tegra-periph.c               |  257 +-
 drivers/clk/tegra/clk-tegra-super-gen5.c           |  150 ++
 drivers/clk/tegra/clk-tegra114.c                   |   30 +-
 drivers/clk/tegra/clk-tegra124.c                   |   31 +-
 drivers/clk/tegra/clk-tegra20.c                    |   18 +-
 drivers/clk/tegra/clk-tegra210.c                   | 2729 ++++++++++++++++++++
 drivers/clk/tegra/clk-tegra30.c                    |   31 +-
 drivers/clk/tegra/clk.h                            |   90 +-
 include/dt-bindings/clock/tegra210-car.h           |  401 +++
 14 files changed, 4423 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 create mode 100644 drivers/clk/tegra/clk-tegra-super-gen5.c
 create mode 100644 drivers/clk/tegra/clk-tegra210.c
 create mode 100644 include/dt-bindings/clock/tegra210-car.h

-- 
1.7.9.5
