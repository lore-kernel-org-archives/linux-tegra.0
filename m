From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/5] clk: tegra: emc: Support multiple ram codes parsing
Date: Fri, 12 Apr 2019 01:02:27 +0300
Message-ID: <20190411220230.21726-3-digetx@gmail.com>
References: <20190411220230.21726-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411220230.21726-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The timings parser doesn't append timings, but instead it parses only
the first timing and hence doesn't store all of the timings when
device-tree has timings for multiple ram codes. In a result EMC scaling
doesn't work if timings are missing.

Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 23416982e7c7..28068584ff6e 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -121,18 +121,23 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	struct tegra_clk_emc *tegra;
 	u8 ram_code = tegra_read_ram_code();
 	struct emc_timing *timing = NULL;
-	int i;
+	int i, k;
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
 
-	for (i = 0; i < tegra->num_timings; i++) {
+	for (k = 0; k < tegra->num_timings; k++) {
+		if (tegra->timings[k].ram_code == ram_code)
+			break;
+	}
+
+	for (i = k; i < tegra->num_timings; i++) {
 		if (tegra->timings[i].ram_code != ram_code)
-			continue;
+			break;
 
 		timing = tegra->timings + i;
 
 		if (timing->rate > req->max_rate) {
-			i = max(i, 1);
+			i = max(i, k + 1);
 			req->rate = tegra->timings[i - 1].rate;
 			return 0;
 		}
@@ -282,7 +287,7 @@ static struct emc_timing *get_backup_timing(struct tegra_clk_emc *tegra,
 	for (i = timing_index+1; i < tegra->num_timings; i++) {
 		timing = tegra->timings + i;
 		if (timing->ram_code != ram_code)
-			continue;
+			break;
 
 		if (emc_parent_clk_sources[timing->parent_index] !=
 		    emc_parent_clk_sources[
@@ -293,7 +298,7 @@ static struct emc_timing *get_backup_timing(struct tegra_clk_emc *tegra,
 	for (i = timing_index-1; i >= 0; --i) {
 		timing = tegra->timings + i;
 		if (timing->ram_code != ram_code)
-			continue;
+			break;
 
 		if (emc_parent_clk_sources[timing->parent_index] !=
 		    emc_parent_clk_sources[
@@ -433,19 +438,23 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 				struct device_node *node,
 				u32 ram_code)
 {
+	struct emc_timing *timings_ptr;
 	struct device_node *child;
 	int child_count = of_get_child_count(node);
 	int i = 0, err;
+	size_t size;
+
+	size = (tegra->num_timings + child_count) * sizeof(struct emc_timing);
 
-	tegra->timings = kcalloc(child_count, sizeof(struct emc_timing),
-				 GFP_KERNEL);
+	tegra->timings = krealloc(tegra->timings, size, GFP_KERNEL);
 	if (!tegra->timings)
 		return -ENOMEM;
 
-	tegra->num_timings = child_count;
+	timings_ptr = tegra->timings + tegra->num_timings;
+	tegra->num_timings += child_count;
 
 	for_each_child_of_node(node, child) {
-		struct emc_timing *timing = tegra->timings + (i++);
+		struct emc_timing *timing = timings_ptr + (i++);
 
 		err = load_one_timing_from_dt(tegra, timing, child);
 		if (err) {
@@ -456,7 +465,7 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 		timing->ram_code = ram_code;
 	}
 
-	sort(tegra->timings, tegra->num_timings, sizeof(struct emc_timing),
+	sort(timings_ptr, child_count, sizeof(struct emc_timing),
 	     cmp_timings, NULL);
 
 	return 0;
@@ -499,10 +508,10 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 		 * fuses until the apbmisc driver is loaded.
 		 */
 		err = load_timings_from_dt(tegra, node, node_ram_code);
-		of_node_put(node);
-		if (err)
+		if (err) {
+			of_node_put(node);
 			return ERR_PTR(err);
-		break;
+		}
 	}
 
 	if (tegra->num_timings == 0)
-- 
2.21.0
