From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 09/11] clk: tegra210: clean up init_table
Date: Wed, 25 May 2016 18:24:29 -0400
Message-ID: <1464215071-28696-10-git-send-email-rklein@nvidia.com>
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
 drivers/clk/tegra/clk-tegra210.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 156dc8ec6bf6..f6d9d890502e 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2794,24 +2794,20 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA210_CLK_UARTD, TEGRA210_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1 },
-	{ TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1 },
-	{ TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S3, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
-	{ TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1 },
-	{ TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1 },
-	{ TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 1 },
-	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1 },
-	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
-	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
-	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 1 },
-	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
+	{ TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 0 },
+	{ TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 0 },
+	{ TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 0 },
+	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 0 },
+	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 0 },
+	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 0 },
+	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 0 },
 	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
 	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },
 	{ TEGRA210_CLK_XUSB_HS_SRC, TEGRA210_CLK_XUSB_SS_SRC, 120000000, 0 },
@@ -2821,9 +2817,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_XUSB_DEV_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 102000000, 0 },
 	{ TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0 },
 	{ TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0 },
-	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0 },
 	{ TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0 },
 	{ TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0 },
@@ -2833,7 +2826,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_I2C6, TEGRA210_CLK_PLL_P, 0, 0 },
 	{ TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0 },
 	{ TEGRA210_CLK_SOC_THERM, TEGRA210_CLK_PLL_P, 51000000, 0 },
-	{ TEGRA210_CLK_CCLK_G, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	/* This MUST be the last entry. */
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
-- 
1.9.1
