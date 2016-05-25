From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 06/11] clk: tegra114: clean up init_table
Date: Wed, 25 May 2016 18:24:26 -0400
Message-ID: <1464215071-28696-7-git-send-email-rklein@nvidia.com>
References: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove entries from the init_table where the clks are now defined
as CRITICAL clks, if we were only enabling them in the init_table.

Remove the flag to signal to enable CRITICAL clks if they are still
needed in the init_table to set other properties.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index b78054fac0a8..29fc8c2e4359 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1318,19 +1318,16 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_UARTB, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA114_CLK_UARTC, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA114_CLK_UARTD, TEGRA114_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA114_CLK_PLL_A, TEGRA114_CLK_CLK_MAX, 564480000, 1 },
-	{ TEGRA114_CLK_PLL_A_OUT0, TEGRA114_CLK_CLK_MAX, 11289600, 1 },
-	{ TEGRA114_CLK_EXTERN1, TEGRA114_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1_MUX, TEGRA114_CLK_EXTERN1, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1, TEGRA114_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA114_CLK_PLL_A, TEGRA114_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA114_CLK_PLL_A_OUT0, TEGRA114_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA114_CLK_I2S0, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S1, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S2, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S3, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S4, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_HOST1X, TEGRA114_CLK_PLL_P, 136000000, 0 },
-	{ TEGRA114_CLK_DFLL_SOC, TEGRA114_CLK_PLL_P, 51000000, 1 },
-	{ TEGRA114_CLK_DFLL_REF, TEGRA114_CLK_PLL_P, 51000000, 1 },
+	{ TEGRA114_CLK_DFLL_SOC, TEGRA114_CLK_PLL_P, 51000000, 0 },
+	{ TEGRA114_CLK_DFLL_REF, TEGRA114_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA114_CLK_DISP1, TEGRA114_CLK_PLL_P, 0, 0 },
 	{ TEGRA114_CLK_DISP2, TEGRA114_CLK_PLL_P, 0, 0 },
 	{ TEGRA114_CLK_GR2D, TEGRA114_CLK_PLL_C2, 300000000, 0 },
-- 
1.9.1
