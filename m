From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 02/11] clk: tegra20: Mark required clks as CRITICAL
Date: Wed, 25 May 2016 18:24:22 -0400
Message-ID: <1464215071-28696-3-git-send-email-rklein@nvidia.com>
References: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Mark clks that are required to be on as CRITICAL clks.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra20.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 837e5cbd60e9..4a60a25d7e61 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -715,13 +715,15 @@ static void tegra20_super_clk_init(void)
 
 	/* CCLK */
 	clk = tegra_clk_register_super_mux("cclk", cclk_parents,
-			      ARRAY_SIZE(cclk_parents), CLK_SET_RATE_PARENT,
+			      ARRAY_SIZE(cclk_parents),
+			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			      clk_base + CCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
 	clks[TEGRA20_CLK_CCLK] = clk;
 
 	/* SCLK */
 	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-			      ARRAY_SIZE(sclk_parents), CLK_SET_RATE_PARENT,
+			      ARRAY_SIZE(sclk_parents),
+			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
 	clks[TEGRA20_CLK_SCLK] = clk;
 
@@ -814,11 +816,11 @@ static void __init tegra20_periph_clk_init(void)
 	/* emc */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
-			       CLK_SET_RATE_NO_REPARENT,
+			       CLK_SET_RATE_NO_REPARENT | CLK_IS_CRITICAL,
 			       clk_base + CLK_SOURCE_EMC,
 			       30, 2, 0, &emc_lock);
-	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base, 0,
-				    57, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base,
+				    CLK_IS_CRITICAL, 57, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_EMC] = clk;
 
 	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-- 
1.9.1
