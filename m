From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 0/9 REPOST] Tegra CLK Fixes
Date: Fri, 8 Jan 2016 13:45:05 -0500
Message-ID: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch set fixes some issues found with the Tegra CLK drivers
in testing. There are also a few patches which clean up the code
and fix some naming issues.

Resending with correct email address for Mike Turquette.

Andrew Bresticker (1):
  clk: tegra: pll: Fix potential sleeping-while-atomic

Mark Kuo (2):
  clk: tegra: pll: Do not disable PLLE when under HW control
  clk: tegra: pll: Fix PLLE SS config

Rhyland Klein (6):
  clk: tegra: Fix divider on VI_I2C
  clk: tegra210: Remove improper flags for lock_enable
  clk: tegra210: Fix naming of MISC registers
  clk: tegra: Fix the misnaming of nvenc from msenc
  clk: tegra210: fix pllx dyn step calculation
  clk: tegra210: Initialize PLL_D2 to a sane rate

 drivers/clk/tegra/clk-pll.c          | 50 +++++++++++++--------
 drivers/clk/tegra/clk-tegra-periph.c |  4 +-
 drivers/clk/tegra/clk-tegra210.c     | 87 +++++++++++++++---------------------
 3 files changed, 71 insertions(+), 70 deletions(-)

-- 
1.9.1

