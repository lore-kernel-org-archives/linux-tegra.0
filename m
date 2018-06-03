From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] clk: tegra: Mark Memory Controller clock as critical
Date: Mon,  4 Jun 2018 01:48:05 +0300
Message-ID: <20180603224805.495-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Memory Controller should be always-on. Currently the sibling EMC clock is
marked as critical, let's mark MC clock too for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-divider.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 16e0aee14773..58874c1bbf5e 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -194,6 +194,7 @@ static const struct clk_div_table mc_div_table[] = {
 struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
 				  void __iomem *reg, spinlock_t *lock)
 {
-	return clk_register_divider_table(NULL, name, parent_name, 0, reg,
-					  16, 1, 0, mc_div_table, lock);
+	return clk_register_divider_table(NULL, name, parent_name,
+					  CLK_IS_CRITICAL, reg, 16, 1, 0,
+					  mc_div_table, lock);
 }
-- 
2.17.0
