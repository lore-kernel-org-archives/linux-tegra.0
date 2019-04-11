From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/5] clk: tegra: emc: Fix EMC max-rate clamping
Date: Fri, 12 Apr 2019 01:02:28 +0300
Message-ID: <20190411220230.21726-4-digetx@gmail.com>
References: <20190411220230.21726-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411220230.21726-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

When a clk user requests rate that is higher than the maximum possible,
the rate shall be clamped to the maximum and not to the current value.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 28068584ff6e..9a0179235939 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -121,7 +121,7 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	struct tegra_clk_emc *tegra;
 	u8 ram_code = tegra_read_ram_code();
 	struct emc_timing *timing = NULL;
-	int i, k;
+	int i, k, t;
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
 
@@ -130,12 +130,17 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 			break;
 	}
 
-	for (i = k; i < tegra->num_timings; i++) {
-		if (tegra->timings[i].ram_code != ram_code)
+	for (t = k; t < tegra->num_timings; t++) {
+		if (tegra->timings[t].ram_code != ram_code)
 			break;
+	}
 
+	for (i = k; i < t; i++) {
 		timing = tegra->timings + i;
 
+		if (timing->rate < req->rate && i != t - 1)
+			continue;
+
 		if (timing->rate > req->max_rate) {
 			i = max(i, k + 1);
 			req->rate = tegra->timings[i - 1].rate;
@@ -145,10 +150,8 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 		if (timing->rate < req->min_rate)
 			continue;
 
-		if (timing->rate >= req->rate) {
-			req->rate = timing->rate;
-			return 0;
-		}
+		req->rate = timing->rate;
+		return 0;
 	}
 
 	if (timing) {
-- 
2.21.0
