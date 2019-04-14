From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/5] clk: tegra: EMC/MC clock fixes and improvements
Date: Sun, 14 Apr 2019 22:23:16 +0300
Message-ID: <20190414192321.23294-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I was helping with fixing EMC clock scaling on T124 Nyan Big and
in process found some weak points in the code. Primarily the ram code
parsing didn't work if device-tree defines memory timings for multiple
ram codes and after fixing that I spotted few other things that could be
improved.

Changelog:

v2: Corrected "Mark Memory Controller clock as read-only" patch that
    had the "read-only divider" flag being set in a wrong place. Note
    it also turned out that this patch is needed for a proper EMC freq
    scaling on Tegra30 because some of memory timings may have
    configuration where MC clock configuration should be changed
    simultaneously with the EMC change and currently CLK framework
    reconfigure the divider back to /2 mode after EMC clock changes
    since it's the parent clock for MC. Although it's not really critical
    since system remains fully functional if MC clock configuration
    doesn't match the memory arbitration configuration.

Dmitry Osipenko (5):
  clk: tegra: emc: Don't enable EMC clock manually
  clk: tegra: emc: Support multiple RAM codes
  clk: tegra: emc: Fix EMC max-rate clamping
  clk: tegra: emc: Replace BUG() with WARN_ONCE()
  clk: tegra: divider: Mark Memory Controller clock as read-only

 drivers/clk/tegra/clk-divider.c |  3 +-
 drivers/clk/tegra/clk-emc.c     | 57 ++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.21.0
