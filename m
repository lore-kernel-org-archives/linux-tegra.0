From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 03/22] clk: tegra: Add Tegra OSC to clock lookup
Date: Mon, 13 Jan 2020 23:24:08 -0800
Message-ID: <1578986667-16041-4-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

OSC is one of the parent for Tegra PMC clocks clk_out_1, clk_out_2,
and clk_out_3.

This patch adds Tegra OSC to clock lookup.

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h          | 1 +
 drivers/clk/tegra/clk-tegra-fixed.c | 5 +++++
 drivers/clk/tegra/clk-tegra114.c    | 2 ++
 drivers/clk/tegra/clk-tegra124.c    | 2 ++
 drivers/clk/tegra/clk-tegra210.c    | 2 ++
 drivers/clk/tegra/clk-tegra30.c     | 2 ++
 6 files changed, 14 insertions(+)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 17d8b252cd0a..17c13d1aa6bc 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -46,6 +46,7 @@ enum clk_id {
 	tegra_clk_clk_m,
 	tegra_clk_clk_m_div2,
 	tegra_clk_clk_m_div4,
+	tegra_clk_osc,
 	tegra_clk_osc_div2,
 	tegra_clk_osc_div4,
 	tegra_clk_clk_out_1,
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 990106391334..0dc2d5f5cfb5 100644
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
 
 	/* osc_div2 */
 	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div2, clks);
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index d44cb8db0ef6..e3c68eca54b7 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -737,6 +737,7 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA114_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA114_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA114_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA114_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA114_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA114_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA114_CLK_PLL_REF, .present = true },
@@ -819,6 +820,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA114_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA114_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA114_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc", .dt_id = TEGRA114_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA114_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA114_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA114_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 32f3dd1ccbad..ef0f928f0259 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -862,6 +862,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA124_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA124_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA124_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA124_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA124_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA124_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA124_CLK_PLL_REF, .present = true },
@@ -945,6 +946,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA124_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA124_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA124_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc", .dt_id = TEGRA124_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA124_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA124_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA124_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 899d8ca68c4f..958f5f6c894d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2373,6 +2373,7 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA210_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA210_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA210_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA210_CLK_PLL_REF, .present = true },
@@ -2501,6 +2502,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA210_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA210_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc", .dt_id = TEGRA210_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA210_CLK_PLL_C },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index c2da1f1d2b58..5f3484758123 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -583,6 +583,7 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA30_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA30_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA30_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc", .dt_id = TEGRA30_CLK_OSC },
 	{ .con_id = "osc_div2", .dt_id = TEGRA30_CLK_OSC_DIV2 },
 	{ .con_id = "osc_div4", .dt_id = TEGRA30_CLK_OSC_DIV4 },
 	{ .con_id = "cml0", .dt_id = TEGRA30_CLK_CML0 },
@@ -687,6 +688,7 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA30_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA30_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA30_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc] = { .dt_id = TEGRA30_CLK_OSC, .present = true },
 	[tegra_clk_osc_div2] = { .dt_id = TEGRA30_CLK_OSC_DIV2, .present = true },
 	[tegra_clk_osc_div4] = { .dt_id = TEGRA30_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA30_CLK_PLL_REF, .present = true },
-- 
2.7.4
