From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 5/5] clk: tegra: divider: Mark Memory Controller clock as read-only
Date: Sun, 14 Apr 2019 22:23:21 +0300
Message-ID: <20190414192321.23294-6-digetx@gmail.com>
References: <20190414192321.23294-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414192321.23294-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Memory Controller (MC) clock rate can't be simply changed and nothing
in kernel need to change the rate, hence let's make the clock read-only.
This id also needed for the EMC driver because timing configuration may
require the MC clock diver to be disabled, that is handled by the EMC
clock / EMC driver integration and CLK framework shall not touch the
MC divider configuration on the EMC clock rate change.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-divider.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 205fe8ff63f0..2a1822a22740 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -175,6 +175,7 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
 				  void __iomem *reg, spinlock_t *lock)
 {
 	return clk_register_divider_table(NULL, name, parent_name,
-					  CLK_IS_CRITICAL, reg, 16, 1, 0,
+					  CLK_IS_CRITICAL,
+					  reg, 16, 1, CLK_DIVIDER_READ_ONLY,
 					  mc_div_table, lock);
 }
-- 
2.21.0
