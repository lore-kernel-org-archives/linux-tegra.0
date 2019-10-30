From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/2] clk: tegra20/30: Don't pre-initialize displays parent clock
Date: Thu, 31 Oct 2019 00:58:26 +0300
Message-ID: <20191030215827.15533-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Both Tegra20 and Tegra30 are initializing display's parent clock
incorrectly because PLLP is running at 216/408MHz while display rate is
set to 600MHz, but pre-setting the parent isn't needed at all because
display driver selects proper parent anyways.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: I accidentally didn't include the second "VDE" patch into the patchset
    in v1.

 drivers/clk/tegra/clk-tegra20.c | 2 --
 drivers/clk/tegra/clk-tegra30.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index eb821666ca61..0d6441621989 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1049,8 +1049,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_SBC3, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_SBC4, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_HOST1X, TEGRA20_CLK_PLL_C, 150000000, 0 },
-	{ TEGRA20_CLK_DISP1, TEGRA20_CLK_PLL_P, 600000000, 0 },
-	{ TEGRA20_CLK_DISP2, TEGRA20_CLK_PLL_P, 600000000, 0 },
 	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_CLK_MAX, 300000000, 0 },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 0fe03d69fe1a..8146cc49ca3b 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1253,8 +1253,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_SBC6, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_PLL_C, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
 	{ TEGRA30_CLK_HOST1X, TEGRA30_CLK_PLL_C, 150000000, 0 },
-	{ TEGRA30_CLK_DISP1, TEGRA30_CLK_PLL_P, 600000000, 0 },
-	{ TEGRA30_CLK_DISP2, TEGRA30_CLK_PLL_P, 600000000, 0 },
 	{ TEGRA30_CLK_TWD, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_GR2D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
-- 
2.23.0
