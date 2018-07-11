From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v5 0/4] Multiplex sdmmc low jitter clock path
Date: Wed, 11 Jul 2018 17:39:21 +0300
Message-ID: <1531319965-19689-1-git-send-email-avienamo@nvidia.com>
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
  clk: tegra: refactor 7.1 div calculation

Peter De-Schrijver (2):
  clk: tegra: Add sdmmc mux divider clock
  clk: tegra: make sdmmc2 and sdmmc4 as sdmmc clocks

 drivers/clk/tegra/Makefile           |   2 +
 drivers/clk/tegra/clk-divider.c      |  30 +----
 drivers/clk/tegra/clk-id.h           |   2 -
 drivers/clk/tegra/clk-sdmmc-mux.c    | 249 +++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra-periph.c |  11 --
 drivers/clk/tegra/clk-tegra210.c     |  14 +-
 drivers/clk/tegra/clk.h              |  30 +++++
 drivers/clk/tegra/div-frac.c         |  43 ++++++
 8 files changed, 341 insertions(+), 40 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-sdmmc-mux.c
 create mode 100644 drivers/clk/tegra/div-frac.c

-- 
2.7.4
