From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: Propagate clk_out_x rate to parent
Date: Wed, 22 Mar 2017 15:38:19 +0200
Message-ID: <1490189899-19401-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

Given that externx can only be used as a parent for clk_out_x, it makes
sense to propagate requests to make clk_out_x easier to handle.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 91377ab..a35579a 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -95,7 +95,8 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 			continue;
 
 		clk = clk_register_mux(NULL, data->mux_name, data->parents,
-				data->num_parents, CLK_SET_RATE_NO_REPARENT,
+				data->num_parents,
+				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 				pmc_base + PMC_CLK_OUT_CNTRL, data->mux_shift,
 				3, 0, &clk_out_lock);
 		*dt_clk = clk;
@@ -106,7 +107,8 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 			continue;
 
 		clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
-					0, pmc_base + PMC_CLK_OUT_CNTRL,
+					CLK_SET_RATE_PARENT,
+					pmc_base + PMC_CLK_OUT_CNTRL,
 					data->gate_shift, 0, &clk_out_lock);
 		*dt_clk = clk;
 		clk_register_clkdev(clk, data->dev_name, data->gate_name);
-- 
1.9.1
