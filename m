From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 07/11] clk: tegra124: clean up init_table
Date: Fri, 27 May 2016 16:38:10 -0400
Message-ID: <1464381494-27096-8-git-send-email-rklein@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
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
 drivers/clk/tegra/clk-tegra124.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index f4fbbf16a056..ab5437da63fb 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1409,26 +1409,23 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_UARTB, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTC, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTD, TEGRA124_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 1 },
-	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 1 },
-	{ TEGRA124_CLK_EXTERN1, TEGRA124_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1_MUX, TEGRA124_CLK_EXTERN1, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1, TEGRA124_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA124_CLK_I2S0, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S1, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_P, 0, 0 },
-	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
+	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 0 },
 	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
 	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
-	{ TEGRA124_CLK_SCLK, TEGRA124_CLK_PLL_P_OUT2, 102000000, 1 },
-	{ TEGRA124_CLK_DFLL_SOC, TEGRA124_CLK_PLL_P, 51000000, 1 },
-	{ TEGRA124_CLK_DFLL_REF, TEGRA124_CLK_PLL_P, 51000000, 1 },
+	{ TEGRA124_CLK_SCLK, TEGRA124_CLK_PLL_P_OUT2, 102000000, 0 },
+	{ TEGRA124_CLK_DFLL_SOC, TEGRA124_CLK_PLL_P, 51000000, 0 },
+	{ TEGRA124_CLK_DFLL_REF, TEGRA124_CLK_PLL_P, 51000000, 0 },
 	{ TEGRA124_CLK_PLL_C, TEGRA124_CLK_CLK_MAX, 768000000, 0 },
 	{ TEGRA124_CLK_PLL_C_OUT1, TEGRA124_CLK_CLK_MAX, 100000000, 0 },
-	{ TEGRA124_CLK_SBC4, TEGRA124_CLK_PLL_P, 12000000, 1 },
+	{ TEGRA124_CLK_SBC4, TEGRA124_CLK_PLL_P, 12000000, 0 },
 	{ TEGRA124_CLK_TSEC, TEGRA124_CLK_PLL_C3, 0, 0 },
 	{ TEGRA124_CLK_MSENC, TEGRA124_CLK_PLL_C3, 0, 0 },
 	{ TEGRA124_CLK_PLL_RE_VCO, TEGRA124_CLK_CLK_MAX, 672000000, 0 },
@@ -1439,8 +1436,6 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_XUSB_HOST_SRC, TEGRA124_CLK_PLL_RE_OUT, 112000000, 0 },
 	{ TEGRA124_CLK_SATA, TEGRA124_CLK_PLL_P, 104000000, 0 },
 	{ TEGRA124_CLK_SATA_OOB, TEGRA124_CLK_PLL_P, 204000000, 0 },
-	{ TEGRA124_CLK_MSELECT, TEGRA124_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA124_CLK_CSITE, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_TSENSOR, TEGRA124_CLK_CLK_M, 400000, 0 },
 	/* must be the last entry */
 	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
-- 
1.9.1
