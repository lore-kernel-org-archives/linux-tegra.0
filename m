From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] CPU clock changes for Tegra20/30
Date: Thu, 30 Aug 2018 22:20:42 +0300
Message-ID: <20180830192045.11017-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series is a prerequisite for the CPUFREQ driver patches, it can be
applied separately. CPUFREQ will be supported on Tegra30 once this and
the CPUFREQ patch-series will be applied.

Dmitry Osipenko (3):
  clk: tegra: Convert CCLKG mux to mux + clock divider on Tegra30
  clk: tegra: Add more rates to Tegra30 PLLX frequency table
  clk: tegra: Poll PLLX lock-status on resume from suspend on Tegra20/30

 drivers/clk/tegra/clk-super.c    |  16 +++-
 drivers/clk/tegra/clk-tegra20.c  |  51 ++++++++++--
 drivers/clk/tegra/clk-tegra210.c |   2 +-
 drivers/clk/tegra/clk-tegra30.c  | 131 +++++++++++++++++++++----------
 drivers/clk/tegra/clk.h          |   9 ++-
 5 files changed, 156 insertions(+), 53 deletions(-)

-- 
2.18.0
