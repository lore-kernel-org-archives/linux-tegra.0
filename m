From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 05/11] clk: tegra30: clean up init_table
Date: Fri, 27 May 2016 16:38:08 -0400
Message-ID: <1464381494-27096-6-git-send-email-rklein@nvidia.com>
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
 drivers/clk/tegra/clk-tegra30.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index fc91460ab892..8ae18b63568e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1349,12 +1349,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_UARTC, TEGRA30_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA30_CLK_UARTD, TEGRA30_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA30_CLK_UARTE, TEGRA30_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
-	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
-	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA30_CLK_CLK_OUT_1_MUX, TEGRA30_CLK_EXTERN1, 0, 0 },
-	{ TEGRA30_CLK_CLK_OUT_1, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_BLINK, TEGRA30_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA30_CLK_I2S0, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S1, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S2, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1363,11 +1359,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_SDMMC1, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_SDMMC2, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_SDMMC3, TEGRA30_CLK_PLL_P, 48000000, 0 },
-	{ TEGRA30_CLK_PLL_M, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_PCLK, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_CSITE, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_EMC, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_MSELECT, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_SBC1, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_SBC2, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_SBC3, TEGRA30_CLK_PLL_P, 100000000, 0 },
@@ -1378,7 +1369,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_HOST1X, TEGRA30_CLK_PLL_C, 150000000, 0 },
 	{ TEGRA30_CLK_DISP1, TEGRA30_CLK_PLL_P, 600000000, 0 },
 	{ TEGRA30_CLK_DISP2, TEGRA30_CLK_PLL_P, 600000000, 0 },
-	{ TEGRA30_CLK_TWD, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_GR2D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
-- 
1.9.1
