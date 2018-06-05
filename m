From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] clk: tegra: emc: Avoid out-of-bounds bug
Date: Tue,  5 Jun 2018 15:12:32 +0300
Message-ID: <20180605121232.7121-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Apparently there was an attempt to avoid out-of-bounds accesses when there
is only one memory timing available, but there is a typo in the code that
neglects that attempt.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 5234acd30e89..0621a3a82ea6 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -132,7 +132,7 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 		timing = tegra->timings + i;
 
 		if (timing->rate > req->max_rate) {
-			i = min(i, 1);
+			i = max(i, 1);
 			req->rate = tegra->timings[i - 1].rate;
 			return 0;
 		}
-- 
2.17.0
