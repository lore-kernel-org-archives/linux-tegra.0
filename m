From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 00/25] Tegra210 Clock Support
Date: Thu, 18 Jun 2015 17:28:15 -0400
Message-ID: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series updates the tegra common clock driver and adds
support for the Tegra210 clocks. The clocks in Tegra210 changed
significantly in some ways from earlier generations, so to support
them, we need to extend our base framework a bit and add some new
features.

Some patches here also address issues found while adding features
and other cleanup type work.

Note this series does depend on
"clk: tegra: Fix comments for structure definitions"
which has been reviewed already.

v6:
  - Add new clks for pllp_out* and xusb clks
  - Fixed up UTMI programming for XUSB support
  - Reordered patches to ensure bisectability

v5:
  - Reorderd some patches
  - Added Thierry's kerneldoc update patch as dependency

v4:
  - Fixed minor checkpatch errors and other typos
  - Rebased ontop of linux-next 20150504

v3:
  - Added a fix from Andrew Bresticker that was found while testing
    this code.


Andrew Bresticker (2):
  clk: tegra: pll: Fix issues with rates for VCO PLLs
  clk: tegra: Add interface to enable hardware control of SATA/XUSB
    PLLs

Bill Huang (8):
  clk: tegra: pll-params: change misc_reg count from 3 -> 6
  clk: tegra: pll: Add code to handle if resets are supported by PLL
  clk: tegra: pll: Adjust vco_min if SDM present
  clk: tegra: pll: Add Set_default logic
  clk: tegra: pll: Add logic for SS
  clk: tegra: Add Super Gen5 Logic
  clk: tegra: fix WARN_ON in PLL_RE registration
  clk: tegra: read correct iddq register in PLL_SS registration

Danny Huang (1):
  clk: tegra: Update PLLM handling

Rhyland Klein (13):
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
  clk: tegra: pll: Add dyn_ramp callback
  clk: tegra: pll: Fix _pll_ramp_calc_pll logic and
    _calc_dynamic_ramp_rate
  clk: tegra210: add support for Tegra210 clocks

Thierry Reding (1):
  clk: tegra: Update struct tegra_clk_pll_params kerneldoc

 .../bindings/clock/nvidia,tegra210-car.txt         |   56 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-id.h                         |   75 +-
 drivers/clk/tegra/clk-pll.c                        |  749 ++++-
 drivers/clk/tegra/clk-tegra-audio.c                |   25 +-
 drivers/clk/tegra/clk-tegra-periph.c               |  371 ++-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |  142 +-
 drivers/clk/tegra/clk-tegra114.c                   |   32 +-
 drivers/clk/tegra/clk-tegra124.c                   |   32 +-
 drivers/clk/tegra/clk-tegra20.c                    |   18 +-
 drivers/clk/tegra/clk-tegra210.c                   | 2905 ++++++++++++++++++++
 drivers/clk/tegra/clk-tegra30.c                    |   32 +-
 drivers/clk/tegra/clk.h                            |  135 +-
 include/dt-bindings/clock/tegra210-car.h           |  401 +++
 include/linux/clk/tegra.h                          |    5 +
 15 files changed, 4768 insertions(+), 211 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 create mode 100644 drivers/clk/tegra/clk-tegra210.c
 create mode 100644 include/dt-bindings/clock/tegra210-car.h

-- 
1.7.9.5
