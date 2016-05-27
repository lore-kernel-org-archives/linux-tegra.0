From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 03/11] clk: tegra20: clean up init_table
Date: Fri, 27 May 2016 16:38:06 -0400
Message-ID: <1464381494-27096-4-git-send-email-rklein@nvidia.com>
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
 drivers/clk/tegra/clk-tegra20.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 4a60a25d7e61..c5bbd84735b8 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1021,28 +1021,23 @@ static struct tegra_cpu_car_ops tegra20_cpu_car_ops = {
 };
 
 static struct tegra_clk_init_table init_table[] __initdata = {
-	{ TEGRA20_CLK_PLL_P, TEGRA20_CLK_CLK_MAX, 216000000, 1 },
-	{ TEGRA20_CLK_PLL_P_OUT1, TEGRA20_CLK_CLK_MAX, 28800000, 1 },
-	{ TEGRA20_CLK_PLL_P_OUT2, TEGRA20_CLK_CLK_MAX, 48000000, 1 },
-	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
-	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
-	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 1 },
-	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 120000000, 1 },
-	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 1 },
-	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 1 },
-	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_EMC, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA20_CLK_PLL_P, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
+	{ TEGRA20_CLK_PLL_P_OUT1, TEGRA20_CLK_CLK_MAX, 28800000, 0 },
+	{ TEGRA20_CLK_PLL_P_OUT2, TEGRA20_CLK_CLK_MAX, 48000000, 0 },
+	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 0 },
+	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 0 },
+	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
+	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 120000000, 0 },
+	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 0 },
+	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
 	{ TEGRA20_CLK_UARTA, TEGRA20_CLK_PLL_P, 0, 0 },
 	{ TEGRA20_CLK_UARTB, TEGRA20_CLK_PLL_P, 0, 0 },
 	{ TEGRA20_CLK_UARTC, TEGRA20_CLK_PLL_P, 0, 0 },
 	{ TEGRA20_CLK_UARTD, TEGRA20_CLK_PLL_P, 0, 0 },
 	{ TEGRA20_CLK_UARTE, TEGRA20_CLK_PLL_P, 0, 0 },
-	{ TEGRA20_CLK_PLL_A, TEGRA20_CLK_CLK_MAX, 56448000, 1 },
-	{ TEGRA20_CLK_PLL_A_OUT0, TEGRA20_CLK_CLK_MAX, 11289600, 1 },
-	{ TEGRA20_CLK_CDEV1, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_BLINK, TEGRA20_CLK_CLK_MAX, 32768, 1 },
+	{ TEGRA20_CLK_PLL_A, TEGRA20_CLK_CLK_MAX, 56448000, 0 },
+	{ TEGRA20_CLK_PLL_A_OUT0, TEGRA20_CLK_CLK_MAX, 11289600, 0 },
+	{ TEGRA20_CLK_BLINK, TEGRA20_CLK_CLK_MAX, 32768, 0 },
 	{ TEGRA20_CLK_I2S1, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_I2S2, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_SDMMC1, TEGRA20_CLK_PLL_P, 48000000, 0 },
-- 
1.9.1
