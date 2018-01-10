From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 3/3] clk: tegra: Specify VDE clock rate
Date: Wed, 10 Jan 2018 16:59:44 +0300
Message-ID: <9e1258dfbf4f8e3702d5b43ed08c4e790813798c.1515589507.git.digetx@gmail.com>
References: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
In-Reply-To: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
References: <699ce67980d71fd315085ea9785ee6213e0772cb.1515589507.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Currently VDE clock rate is determined by clock config left from
bootloader, let's not rely on it and explicitly specify the clock
rate in the CCF driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---

Change log:
v2:     No change.
v3:     No change.

 drivers/clk/tegra/clk-tegra114.c | 1 +
 drivers/clk/tegra/clk-tegra124.c | 2 +-
 drivers/clk/tegra/clk-tegra20.c  | 1 +
 drivers/clk/tegra/clk-tegra30.c  | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index c3945c683f60..5d5a22d529f5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1189,6 +1189,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_XUSB_HS_SRC, TEGRA114_CLK_XUSB_SS_DIV2, 61200000, 0 },
 	{ TEGRA114_CLK_XUSB_FALCON_SRC, TEGRA114_CLK_PLL_P, 204000000, 0 },
 	{ TEGRA114_CLK_XUSB_HOST_SRC, TEGRA114_CLK_PLL_P, 102000000, 0 },
+	{ TEGRA114_CLK_VDE, TEGRA114_CLK_CLK_MAX, 600000000, 0 },
 	/* must be the last entry */
 	{ TEGRA114_CLK_CLK_MAX, TEGRA114_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 230f9a2c1abf..50088e976611 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1267,7 +1267,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
-	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_P, 0, 0 },
+	{ TEGRA124_CLK_VDE, TEGRA124_CLK_CLK_MAX, 600000000, 0 },
 	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
 	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
 	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index dec95919fbff..0ee56dd04cec 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1048,6 +1048,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_DISP2, TEGRA20_CLK_PLL_P, 600000000, 0 },
 	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
+	{ TEGRA20_CLK_VDE, TEGRA20_CLK_CLK_MAX, 300000000, 0 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 8428895ad475..b316dfb6f6c7 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1266,6 +1266,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
+	{ TEGRA30_CLK_VDE, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.15.1
