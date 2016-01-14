From: Rhyland Klein <rklein@nvidia.com>
Subject: [Patch V2 0/9] Tegra CLK Fixes
Date: Thu, 14 Jan 2016 14:24:29 -0500
Message-ID: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch set fixes some issues found with the Tegra CLK drivers
in testing. There are also a few patches which clean up the code
and fix some naming issues.

v2:
 - Dropped "Initialize PLL_D2 to a sane rate" patch as it was not needed
 - Split "Fix PLLE SS config" patch into 2 more descriptive and better
   logically broken up patches.

Andrew Bresticker (1):
  clk: tegra: pll: Fix potential sleeping-while-atomic

Mark Kuo (2):
  clk: tegra: pll: Do not disable PLLE when under HW control
  clk: tegra: pll: Fix PLLE SS coefficients val

Rhyland Klein (6):
  clk: tegra: Fix divider on VI_I2C
  clk: tegra210: Remove improper flags for lock_enable
  clk: tegra210: Fix naming of MISC registers
  clk: tegra: Fix the misnaming of nvenc from msenc
  clk: tegra210: fix pllx dyn step calculation
  clk: tegra: pll: Fix typos around clearing plle bits during enable

 drivers/clk/tegra/clk-pll.c          | 50 +++++++++++++--------
 drivers/clk/tegra/clk-tegra-periph.c |  4 +-
 drivers/clk/tegra/clk-tegra210.c     | 86 +++++++++++++++---------------------
 3 files changed, 70 insertions(+), 70 deletions(-)

-- 
1.9.1

