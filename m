From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 05/22] clk: tegra: Remove CLK_M_DIV fixed clocks
Date: Mon, 13 Jan 2020 23:24:10 -0800
Message-ID: <1578986667-16041-6-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra has no CLK_M_DIV2 and CLK_M_DIV4 clocks and instead it has
OSC_DIV2 and OSC_DIV4 clocks from OSC pads which are the possible
parents of PMC clocks for Tegra30 through Tegra210.

Tegra PMC clock parents are changed to use OSC_DIV clocks.

So, this patch removes CLK_M_DIV fixed clocks

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-id.h          |  2 --
 drivers/clk/tegra/clk-tegra-fixed.c | 16 ----------------
 drivers/clk/tegra/clk-tegra114.c    | 15 ---------------
 drivers/clk/tegra/clk-tegra124.c    |  4 ----
 drivers/clk/tegra/clk-tegra210.c    |  4 ----
 drivers/clk/tegra/clk-tegra30.c     |  4 ----
 6 files changed, 45 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 17c13d1aa6bc..cf42e5995794 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -44,8 +44,6 @@ enum clk_id {
 	tegra_clk_clk72Mhz,
 	tegra_clk_clk72Mhz_8,
 	tegra_clk_clk_m,
-	tegra_clk_clk_m_div2,
-	tegra_clk_clk_m_div4,
 	tegra_clk_osc,
 	tegra_clk_osc_div2,
 	tegra_clk_osc_div4,
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 0dc2d5f5cfb5..77c22cef5014 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -105,22 +105,6 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 		clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 		*dt_clk = clk;
 	}
-
-	/* clk_m_div2 */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div2, tegra_clks);
-	if (dt_clk) {
-		clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 2);
-		*dt_clk = clk;
-	}
-
-	/* clk_m_div4 */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div4, tegra_clks);
-	if (dt_clk) {
-		clk = clk_register_fixed_factor(NULL, "clk_m_div4", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 4);
-		*dt_clk = clk;
-	}
 }
 
 void tegra_clk_osc_resume(void __iomem *clk_base)
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index e3c68eca54b7..180ddc2abfd2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -735,8 +735,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA114_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA114_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA114_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA114_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA114_CLK_CLK_M_DIV4, .present = true },
 	[tegra_clk_osc] = { .dt_id = TEGRA114_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA114_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA114_CLK_OSC_DIV4, .present = true },
@@ -818,8 +816,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA114_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA114_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA114_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA114_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA114_CLK_CLK_M_DIV4 },
 	{ .con_id = "osc", .dt_id = TEGRA114_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA114_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA114_CLK_OSC_DIV4 },
@@ -906,17 +902,6 @@ static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 	/* clk_32k */
 	clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 	clks[TEGRA114_CLK_CLK_32K] = clk;
-
-	/* clk_m_div2 */
-	clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 2);
-	clks[TEGRA114_CLK_CLK_M_DIV2] = clk;
-
-	/* clk_m_div4 */
-	clk = clk_register_fixed_factor(NULL, "clk_m_div4", "clk_m",
-					CLK_SET_RATE_PARENT, 1, 4);
-	clks[TEGRA114_CLK_CLK_M_DIV4] = clk;
-
 }
 
 static void __init tegra114_pll_init(void __iomem *clk_base,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index ef0f928f0259..7a16e50eb20f 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -860,8 +860,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA124_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA124_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA124_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA124_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA124_CLK_CLK_M_DIV4, .present = true },
 	[tegra_clk_osc] = { .dt_id = TEGRA124_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA124_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA124_CLK_OSC_DIV4, .present = true },
@@ -944,8 +942,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA124_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA124_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA124_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA124_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA124_CLK_CLK_M_DIV4 },
 	{ .con_id = "osc", .dt_id = TEGRA124_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA124_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA124_CLK_OSC_DIV4 },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 958f5f6c894d..45d54ead30bc 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2371,8 +2371,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA210_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA210_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA210_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA210_CLK_CLK_M_DIV4, .present = true },
 	[tegra_clk_osc] = { .dt_id = TEGRA210_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
@@ -2500,8 +2498,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA210_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA210_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA210_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA210_CLK_CLK_M_DIV4 },
 	{ .con_id = "osc", .dt_id = TEGRA210_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 5f3484758123..ddc5ab66d09e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -581,8 +581,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "twd", .dt_id = TEGRA30_CLK_TWD },
 	{ .con_id = "emc", .dt_id = TEGRA30_CLK_EMC },
 	{ .con_id = "clk_32k", .dt_id = TEGRA30_CLK_CLK_32K },
-	{ .con_id = "clk_m_div2", .dt_id = TEGRA30_CLK_CLK_M_DIV2 },
-	{ .con_id = "clk_m_div4", .dt_id = TEGRA30_CLK_CLK_M_DIV4 },
 	{ .con_id = "osc", .dt_id = TEGRA30_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA30_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA30_CLK_OSC_DIV4 },
@@ -686,8 +684,6 @@ static struct tegra_devclk devclks[] __initdata = {
 static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA30_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA30_CLK_CLK_M, .present = true },
-	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA30_CLK_CLK_M_DIV2, .present = true },
-	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA30_CLK_CLK_M_DIV4, .present = true },
 	[tegra_clk_osc] = { .dt_id = TEGRA30_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA30_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA30_CLK_OSC_DIV4, .present = true },
-- 
2.7.4
