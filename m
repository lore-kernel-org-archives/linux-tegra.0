From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/5] clk: tegra: EMC/MC clock fixes and improvements
Date: Fri, 12 Apr 2019 01:02:25 +0300
Message-ID: <20190411220230.21726-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello, I was helping with fixing EMC clock scaling on T124 Nyan Big and
in process found some weak points in the code. Primarily the ram code
parsing didn't work if device-tree defines memory timings for multiple
ram codes and after fixing that I spotted few other things that could be
improved.

Dmitry Osipenko (5):
  clk: tegra: emc: Don't enable EMC clock manually
  clk: tegra: emc: Support multiple ram codes parsing
  clk: tegra: emc: Fix EMC max-rate clamping
  clk: tegra: emc: Replace BUG() with WARN_ONCE()
  clk: tegra: divider: Mark Memory Controller clock as read-only

 drivers/clk/tegra/clk-divider.c |  5 +--
 drivers/clk/tegra/clk-emc.c     | 57 ++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 24 deletions(-)

-- 
2.21.0
