From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 00/14] Fixes for Tegra clocks
Date: Tue, 25 Jul 2017 13:34:01 +0300
Message-ID: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

A number of smaller fixes and simplifications for the Tegra clock
implementation.

Alex Frid (7):
  clk: tegra: Fix T210 effective NDIV calculation
  clk: tegra: Add TEGRA_PERIPH_ON_APB flag to I2C
  clk: tegra: Re-factor T210 PLLX registration
  clk: tegra: Update T210 PLLSS (D2/DP) registration
  clk: tegra: Fix T210 PLLRE registration
  clk: tegra: Correct Tegra210 UTMIPLL poweron delay
  clk: tegra: Fix Tegra210 PLLU initialization

Peter De Schrijver (7):
  clk: tegra: fix SS control on PLL enable/disable
  clk: tegra: Enable PLL_SS for Tegra210
  clk: tegra: disable SSC for PLL_D2
  clk: tegra210: remove non-existing VFIR clock
  clk: tegra: Init cfg structure in _get_pll_mnp
  clk: tegra: change post IDDQ release delay to 5us
  clk: tegra: don't warn for pll_d2 defaults unnecessarily

 drivers/clk/tegra/clk-pll.c              | 159 ++++++++-----------------------
 drivers/clk/tegra/clk-tegra-periph.c     |   3 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c |  11 ++-
 drivers/clk/tegra/clk-tegra210.c         |  32 ++++---
 drivers/clk/tegra/clk.h                  |   6 --
 5 files changed, 67 insertions(+), 144 deletions(-)

-- 
1.9.1
