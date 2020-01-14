From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 02/22] clk: tegra: Add support for OSC_DIV fixed clocks
Date: Mon, 13 Jan 2020 23:24:07 -0800
Message-ID: <1578986667-16041-3-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra30 through Tegra210 has OSC_DIV2 and OSC_DIV4 fixed clocks
from the OSC pads.

This patch adds support for these clocks.

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h          |  2 ++
 drivers/clk/tegra/clk-tegra-fixed.c | 16 ++++++++++++++++
 drivers/clk/tegra/clk-tegra114.c    |  4 ++++
 drivers/clk/tegra/clk-tegra124.c    |  4 ++++
 drivers/clk/tegra/clk-tegra210.c    |  4 ++++
 drivers/clk/tegra/clk-tegra30.c     |  4 ++++
 6 files changed, 34 insertions(+)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index c4faebd32760..17d8b252cd0a 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -46,6 +46,8 @@ enum clk_id {
 	tegra_clk_clk_m,
 	tegra_clk_clk_m_div2,
 	tegra_clk_clk_m_div4,
+	tegra_clk_osc_div2,
+	tegra_clk_osc_div4,
 	tegra_clk_clk_out_1,
 	tegra_clk_clk_out_1_mux,
 	tegra_clk_clk_out_2,
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 7c6c8abfcde6..990106391334 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -48,6 +48,22 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 
 	osc = clk_register_fixed_rate(NULL, "osc", NULL, 0, *osc_freq);
 
+	/* osc_div2 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div2, clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div2", "osc",
+						0, 1, 2);
+		*dt_clk = clk;
+	}
+
+	/* osc_div4 */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_osc_div4, clks);
+	if (dt_clk) {
+		clk = clk_register_fixed_factor(NULL, "osc_div4", "osc",
+						0, 1, 4);
+		*dt_clk = clk;
+	}
+
 	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m, clks);
 	if (!dt_clk)
 		return 0;
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 4efcaaf51b3a..d44cb8db0ef6 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -737,6 +737,8 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA114_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA114_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA114_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA114_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA114_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA114_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA114_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA114_CLK_PLL_C_OUT1, .present = true },
@@ -817,6 +819,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA114_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA114_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA114_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA114_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA114_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA114_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA114_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA114_CLK_PLL_C2 },
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index b3110d5b5a6c..32f3dd1ccbad 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -862,6 +862,8 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA124_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA124_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA124_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA124_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA124_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA124_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA124_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA124_CLK_PLL_C_OUT1, .present = true },
@@ -943,6 +945,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA124_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA124_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA124_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA124_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA124_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA124_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA124_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA124_CLK_PLL_C2 },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 762cd186f714..899d8ca68c4f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2373,6 +2373,8 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA210_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA210_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA210_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA210_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA210_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA210_CLK_PLL_REF, .present = true },
 	[tegra_clk_pll_c] = { .dt_id = TEGRA210_CLK_PLL_C, .present = true },
 	[tegra_clk_pll_c_out1] = { .dt_id = TEGRA210_CLK_PLL_C_OUT1, .present = true },
@@ -2499,6 +2501,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA210_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA210_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA210_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA210_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA210_CLK_OSC_DIV4 },
 	{ .con_id = "pll_c", .dt_id = TEGRA210_CLK_PLL_C },
 	{ .con_id = "pll_c_out1", .dt_id = TEGRA210_CLK_PLL_C_OUT1 },
 	{ .con_id = "pll_c2", .dt_id = TEGRA210_CLK_PLL_C2 },
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index c8bc18e4d7e5..c2da1f1d2b58 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -583,6 +583,8 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "clk_32k", .dt_id = TEGRA30_CLK_CLK_32K },
 	{ .con_id = "clk_m_div2", .dt_id = TEGRA30_CLK_CLK_M_DIV2 },
 	{ .con_id = "clk_m_div4", .dt_id = TEGRA30_CLK_CLK_M_DIV4 },
+	{ .con_id = "osc_div2", .dt_id = TEGRA30_CLK_OSC_DIV2 },
+	{ .con_id = "osc_div4", .dt_id = TEGRA30_CLK_OSC_DIV4 },
 	{ .con_id = "cml0", .dt_id = TEGRA30_CLK_CML0 },
 	{ .con_id = "cml1", .dt_id = TEGRA30_CLK_CML1 },
 	{ .con_id = "clk_m", .dt_id = TEGRA30_CLK_CLK_M },
@@ -685,6 +687,8 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_clk_m] = { .dt_id = TEGRA30_CLK_CLK_M, .present = true },
 	[tegra_clk_clk_m_div2] = { .dt_id = TEGRA30_CLK_CLK_M_DIV2, .present = true },
 	[tegra_clk_clk_m_div4] = { .dt_id = TEGRA30_CLK_CLK_M_DIV4, .present = true },
+	[tegra_clk_osc_div2] = { .dt_id = TEGRA30_CLK_OSC_DIV2, .present = true },
+	[tegra_clk_osc_div4] = { .dt_id = TEGRA30_CLK_OSC_DIV4, .present = true },
 	[tegra_clk_pll_ref] = { .dt_id = TEGRA30_CLK_PLL_REF, .present = true },
 	[tegra_clk_spdif_in_sync] = { .dt_id = TEGRA30_CLK_SPDIF_IN_SYNC, .present = true },
 	[tegra_clk_i2s0_sync] = { .dt_id = TEGRA30_CLK_I2S0_SYNC, .present = true },
-- 
2.7.4
