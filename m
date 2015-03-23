From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] clk: tegra: Register the proper number of resets
Date: Mon, 23 Mar 2015 11:21:39 +0100
Message-ID: <1427106099-12767-2-git-send-email-thierry.reding@gmail.com>
References: <1427106099-12767-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427106099-12767-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The number of resets controls is 32 times the number of peripheral
register banks rather than 32 times the number of clocks. This reduces
(drastically) the number of reset controls registered from 10080 (315
clocks * 32) to 224 (6 peripheral register banks * 32).

This also fixes a potential crash because trying to use any of the
excess reset controls (224-10079) would have caused accesses beyond
the array bounds of the peripheral register banks definition array.

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Fixes: 6d5b988e7dc5 ("clk: tegra: implement a reset driver")
Cc: stable@vger.kernel.org # 3.14+
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 8b9b7a27616b..41cd87c67be6 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -286,7 +286,7 @@ void __init tegra_add_of_provider(struct device_node *np)
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
 	rst_ctlr.of_node = np;
-	rst_ctlr.nr_resets = clk_num * 32;
+	rst_ctlr.nr_resets = periph_banks * 32;
 	reset_controller_register(&rst_ctlr);
 }
 
-- 
2.3.2
