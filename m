From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] clk: tegra: bpmp: Don't crash when a clock fails to register
Date: Fri, 29 Jun 2018 17:38:14 +0300
Message-ID: <20180629143814.17950-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@nvidia.com, vbhadram@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When registering clocks, we just skip any that fail to register
(leaving a NULL hole in the clock table). However, our of_xlate
function still tries to dereference each entry while looking for
the clock with the requested id, causing a crash if any clocks
failed to register. Add a check to of_xlate to skip any NULL
clocks.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index a896692b74ec..01dada561c10 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -586,9 +586,15 @@ static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *clkspec,
 	unsigned int id = clkspec->args[0], i;
 	struct tegra_bpmp *bpmp = data;
 
-	for (i = 0; i < bpmp->num_clocks; i++)
-		if (bpmp->clocks[i]->id == id)
-			return &bpmp->clocks[i]->hw;
+	for (i = 0; i < bpmp->num_clocks; i++) {
+		struct tegra_bpmp_clk *clk = bpmp->clocks[i];
+
+		if (!clk)
+			continue;
+
+		if (clk->id == id)
+			return &clk->hw;
+	}
 
 	return NULL;
 }
-- 
2.16.1
