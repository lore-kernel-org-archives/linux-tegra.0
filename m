From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: tegra: Use match_string() helper to simplify the code
Date: Sat, 9 Nov 2019 11:42:26 +0800
Message-ID: <20191109034226.21044-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/tegra/clk-emc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index ea39caf..745f9fa 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -403,20 +403,16 @@ static int load_one_timing_from_dt(struct tegra_clk_emc *tegra,
 	}
 
 	timing->parent_index = 0xff;
-	for (i = 0; i < ARRAY_SIZE(emc_parent_clk_names); i++) {
-		if (!strcmp(emc_parent_clk_names[i],
-			    __clk_get_name(timing->parent))) {
-			timing->parent_index = i;
-			break;
-		}
-	}
-	if (timing->parent_index == 0xff) {
+	i = match_string(emc_parent_clk_names, ARRAY_SIZE(emc_parent_clk_names),
+			 __clk_get_name(timing->parent));
+	if (i < 0) {
 		pr_err("timing %pOF: %s is not a valid parent\n",
 		       node, __clk_get_name(timing->parent));
 		clk_put(timing->parent);
 		return -EINVAL;
 	}
 
+	timing->parent_index = i;
 	return 0;
 }
 
-- 
2.7.4
