From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 08/11] clk: tegra210: Mark required clks as CRITICAL
Date: Fri, 27 May 2016 16:38:11 -0400
Message-ID: <1464381494-27096-9-git-send-email-rklein@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Mark clks that are required to be on as CRITICAL clks.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index b8551813ec43..156dc8ec6bf6 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2655,7 +2655,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 
 	/* PLLRE */
 	clk = tegra_clk_register_pllre_tegra210("pll_re_vco", "pll_ref",
-						clk_base, pmc, 0,
+						clk_base, pmc, CLK_IS_CRITICAL,
 						&pll_re_vco_params,
 						&pll_re_lock, pll_ref_freq);
 	clk_register_clkdev(clk, "pll_re_vco", NULL);
-- 
1.9.1
