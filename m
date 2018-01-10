From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 2/3] clk: tegra20: Correct PLL_C_OUT1 setup
Date: Wed, 10 Jan 2018 16:59:43 +0300
Message-ID: <0f529ec00a8481e427e9e7ee6493abd7d61064ec.1515589507.git.digetx@gmail.com>
References: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
In-Reply-To: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
References: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLL_C_OUT_1 can't produce 216 MHz defined in the init_table. Let's
set it to 240 MHz and explicitly specify HCLK rate for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---

Change log:
v2:     No change.
v3:     No change.

 drivers/clk/tegra/clk-tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index e3392ca2c2fc..dec95919fbff 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1018,9 +1018,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
 	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
 	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
-	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
-	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 0 },
-	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 0 },
+	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
+	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 240000000, 0 },
+	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
 	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
 	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
-- 
2.15.1
