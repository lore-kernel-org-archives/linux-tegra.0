From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 7/8] clk: tegra: replace warn on with single line
Date: Fri, 20 Jul 2018 14:45:31 +0100
Message-ID: <20180720134532.13148-8-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

The use of WARN_ON(1) is a bit extreme for something that is called from
very few places. Add a function to print the ID (and maybe more info if
people really want it).

This was done as during the development of the tegra-automotive branches
we got swamped with clock errors of not very useful data.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index a2cb3d0d38bf..3bba3509ca1f 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -258,6 +258,11 @@ void __init tegra_init_dup_clks(struct tegra_clk_duplicate *dup_list,
 	}
 }
 
+static void tegra_clk_init_error(struct tegra_clk_init_table *tbl)
+{
+	pr_err("ERROR: Failed to initialise clock id %d\n", tbl->clk_id);
+}
+
 void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 				  struct clk *clks[], int clk_max)
 {
@@ -268,8 +273,7 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 		if (IS_ERR_OR_NULL(clk)) {
 			pr_err("%s: invalid entry %ld in clks array for id %d\n",
 			       __func__, PTR_ERR(clk), tbl->clk_id);
-			WARN_ON(1);
-
+			tegra_clk_init_error(tbl);
 			continue;
 		}
 
@@ -279,7 +283,7 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 				pr_err("%s: Failed to set parent %s of %s\n",
 				       __func__, __clk_get_name(parent),
 				       __clk_get_name(clk));
-				WARN_ON(1);
+				tegra_clk_init_error(tbl);
 			}
 		}
 
@@ -288,14 +292,14 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 				pr_err("%s: Failed to set rate %lu of %s\n",
 				       __func__, tbl->rate,
 				       __clk_get_name(clk));
-				WARN_ON(1);
+				tegra_clk_init_error(tbl);
 			}
 
 		if (tbl->state)
 			if (clk_prepare_enable(clk)) {
 				pr_err("%s: Failed to enable %s\n", __func__,
 				       __clk_get_name(clk));
-				WARN_ON(1);
+				tegra_clk_init_error(tbl);
 			}
 	}
 }
-- 
2.18.0
