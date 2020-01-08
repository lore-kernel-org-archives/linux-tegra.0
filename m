From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 04/21] clk: tegra: Add Tegra OSC to clock lookup
Date: Tue, 7 Jan 2020 20:24:58 -0800
Message-ID: <1578457515-3477-5-git-send-email-skomatineni@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

OSC is one of the parent for Tegra clocks clk_out_1, clk_out_2,
and clk_out_3.

So, this patch adds Tegra OSC to clock lookup.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-id.h          | 1 +
 drivers/clk/tegra/clk-tegra-fixed.c | 5 +++++
 drivers/clk/tegra/clk-tegra114.c    | 2 ++
 drivers/clk/tegra/clk-tegra124.c    | 2 ++
 drivers/clk/tegra/clk-tegra210.c    | 2 ++
 drivers/clk/tegra/clk-tegra30.c     | 2 ++
 6 files changed, 14 insertions(+)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 1bf21766d3e8..cf42e5995794 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -44,6 +44,7 @@ enum clk_id {
 	tegra_clk_clk72Mhz,
 	tegra_clk_clk72Mhz_8,
 	tegra_clk_clk_m,
+	tegra_clk_osc,
 	tegra_clk_osc_div2,
 	tegra_clk_osc_div4,
 	tegra_clk_clk_out_1,
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 8304f8cf9dd2..205d1a6d3e77 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -46,7 +46,12 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		return -EINVAL;
 	}
 
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc, clks);
+	if (!dt_clk)
+		return 0;
+
 	osc = clk_register_fixed_rate(NULL, "osc", NULL, 0, *osc_freq);
+	*dt_clk = osc;
 
 	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m, clks);
 	if (!dt_clk)
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 9d2ca387114c..180ddc2abfd2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -735,6 +735,7 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA114_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA114_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA114_CLK_CLK_M, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA114_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA114_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA114_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA114_CLK_PLL_REF, .present = true },
@@ -815,6 +816,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA114_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA114_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA114_CLK_CLK_32K },
+	{ .con_id = "osc", .dt_id = TEGRA114_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA114_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA114_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA114_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 15f42718f4cb..7a16e50eb20f 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -860,6 +860,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA124_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA124_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA124_CLK_CLK_M, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA124_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA124_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA124_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA124_CLK_PLL_REF, .present = true },
@@ -941,6 +942,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA124_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA124_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA124_CLK_CLK_32K },
+	{ .con_id = "osc", .dt_id = TEGRA124_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA124_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA124_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA124_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 5687fcda620e..45d54ead30bc 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2371,6 +2371,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_fuse_burn] = { .dt_id = TEGRA210_CLK_FUSE_BURN, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA210_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA210_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA210_CLK_PLL_REF, .present = true },
@@ -2497,6 +2498,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_m", .dt_id = TEGRA210_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA210_CLK_PLL_REF },
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
+	{ .con_id = "osc", .dt_id = TEGRA210_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA210_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 1322188edb72..ddc5ab66d09e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -581,6 +581,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "twd", .dt_id = TEGRA30_CLK_TWD },
 	{ .con_id = "emc", .dt_id = TEGRA30_CLK_EMC },
 	{ .con_id = "clk_32k", .dt_id = TEGRA30_CLK_CLK_32K },
+	{ .con_id = "osc", .dt_id = TEGRA30_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA30_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA30_CLK_OSC_DIV4 },
 	{ .con_id = "cml0", .dt_id = TEGRA30_CLK_CML0 },
@@ -683,6 +684,7 @@ static struct tegra_devclk devclks[] __initdata = {
 static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA30_CLK_CLK_32K, .present = true },
 	[tegra_clk_clk_m] = { .dt_id = TEGRA30_CLK_CLK_M, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA30_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA30_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA30_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA30_CLK_PLL_REF, .present = true },
-- 
2.7.4
