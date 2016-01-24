From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] clk: tegra: clk-emc: Add missing of_node_put
Date: Sun, 24 Jan 2016 20:45:20 +0530
Message-ID: <20160124151519.GA23923@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: linux-tegra@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
to break out of the loop an of_node_put is required.

Found using Coccinelle. The semantic patch used for this is as follows:

// <smpl>
@@
expression e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 138a94b..6aaccf9 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -450,8 +450,10 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 		struct emc_timing *timing = tegra->timings + (i++);
 
 		err = load_one_timing_from_dt(tegra, timing, child);
-		if (err)
+		if (err) {
+			of_node_put(child);
 			return err;
+		}
 
 		timing->ram_code = ram_code;
 	}
@@ -501,9 +503,9 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 		 * fuses until the apbmisc driver is loaded.
 		 */
 		err = load_timings_from_dt(tegra, node, node_ram_code);
+		of_node_put(node);
 		if (err)
 			return ERR_PTR(err);
-		of_node_put(node);
 		break;
 	}
 
-- 
1.9.1

