From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] clk: Tegra124 PLLM fixes
Date: Fri, 12 Apr 2019 00:48:33 +0300
Message-ID: <20190411214835.19947-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello, here are two trivial patches that are correcting PLLM on Tegra124.
First fixes system lockup due to a bad hardware configuration, second
removes usage of a non-existent register bit.

Dmitry Osipenko (2):
  clk: tegra: Fix PLLM programming on Tegra124+ when PMC overrides
    divider
  clk: tegra124: Remove lock-enable bit from PLLM

 drivers/clk/tegra/clk-pll.c      | 4 ++--
 drivers/clk/tegra/clk-tegra124.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.21.0
