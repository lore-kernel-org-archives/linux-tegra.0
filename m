From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 04/17] clk: tegra20: Support custom CCLK implementation
Date: Wed, 16 Oct 2019 00:16:05 +0300
Message-ID: <20191015211618.20758-5-digetx@gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015211618.20758-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We're going to switch to the generic cpufreq-dt driver on Tegra20 and
thus CCLK intermediate re-parenting will be performed by the clock driver.
There is now special CCLK implementation that supports all CCLK quirks,
this patch makes Tegra20 SoCs to use that implementation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cceefbd67a3b..bb3d84182b78 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -391,6 +391,8 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.lock_delay = 300,
 	.freq_table = pll_x_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.pre_rate_change = tegra_cclk_pre_pllx_rate_change,
+	.post_rate_change = tegra_cclk_post_pllx_rate_change,
 };
 
 static struct tegra_clk_pll_params pll_e_params = {
@@ -704,9 +706,9 @@ static void tegra20_super_clk_init(void)
 	struct clk *clk;
 
 	/* CCLK */
-	clk = tegra_clk_register_super_mux("cclk", cclk_parents,
+	clk = tegra_clk_register_super_cclk("cclk", cclk_parents,
 			      ARRAY_SIZE(cclk_parents), CLK_SET_RATE_PARENT,
-			      clk_base + CCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
+			      clk_base + CCLK_BURST_POLICY, 0, NULL);
 	clks[TEGRA20_CLK_CCLK] = clk;
 
 	/* SCLK */
-- 
2.23.0
