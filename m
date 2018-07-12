From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v6 0/4] Multiplex sdmmc low jitter clock path
Date: Thu, 12 Jul 2018 14:52:58 +0300
Message-ID: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The SDMMC clocks have a Low Jitter (LJ) clock path which bypasses a
divider to achieve better jitter performance with high speed signaling
modes. The clock path with the divider is needed by some of the slower
signaling modes. This series automatically multiplexes the LJ and
non-LJ clock paths based on the requested frequency.

Changelog:
v6:
	- Rename div-frac.c to clk-utils.c
	- Fix checkpatch errors and warnings introduced in v5
	- Replace int mul = 2 with a macro in clk-sdmmc-mux.c
	- Remove unnecessary space from clk_sdmmc_mux_enable() return
	- Free sdmmc_mux if clk_register() fails in
	  tegra_clk_register_sdmmc_mux_div()

v5:
	- Rename div71_get() to div_frac_get()
	- Rename div71.c to div-frac.c

v4:
	- Add a changelog

v3:
	- Use <asm/div64.h> include instead of <linux/kernel.h> for
	  do_div()
	- Use SPDX tags for new files
	- Make mux_lj_idx[] and mux_non_lj_idx[] const
	- Make tegra_clk_sdmmc_mux_ops static
	- Fix the includes for fence_udelay() in a separate patch

v2:
	- Fix the type compatibility error on do_div

Aapo Vienamo (1):
  clk: tegra: Fix includes required by fence_udelay()

Peter De Schrijver (1):
  clk: tegra: Refactor fractional divider calculation

Peter De-Schrijver (2):
  clk: tegra: Add sdmmc mux divider clock
  clk: tegra: make sdmmc2 and sdmmc4 as sdmmc clocks

 drivers/clk/tegra/Makefile           |   2 +
 drivers/clk/tegra/clk-divider.c      |  30 +----
 drivers/clk/tegra/clk-id.h           |   2 -
 drivers/clk/tegra/clk-sdmmc-mux.c    | 251 +++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra-periph.c |  11 --
 drivers/clk/tegra/clk-tegra210.c     |  14 +-
 drivers/clk/tegra/clk-utils.c        |  43 ++++++
 drivers/clk/tegra/clk.h              |  30 +++++
 8 files changed, 343 insertions(+), 40 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-sdmmc-mux.c
 create mode 100644 drivers/clk/tegra/clk-utils.c

-- 
2.7.4
