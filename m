From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 01/20] clk: tegra: Modify tegra_audio_clk_init to accept more plls
Date: Mon, 4 May 2015 12:37:21 -0400
Message-ID: <1430757460-9478-2-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra_audio_clk_init was written expecting a single PLL to be
passed in directly. Change this to accept an array which will
allow for supporting multiple plls and specifying specific data
about them, like their parent, which may change over time.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-audio.c |   25 ++++++++++++++++++-------
 drivers/clk/tegra/clk-tegra114.c    |    7 ++++++-
 drivers/clk/tegra/clk-tegra124.c    |    7 ++++++-
 drivers/clk/tegra/clk-tegra30.c     |    7 ++++++-
 drivers/clk/tegra/clk.h             |   18 +++++++++++++++++-
 5 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-audio.c b/drivers/clk/tegra/clk-tegra-audio.c
index 5c38aab2c5b8..b7b88660f261 100644
--- a/drivers/clk/tegra/clk-tegra-audio.c
+++ b/drivers/clk/tegra/clk-tegra-audio.c
@@ -126,18 +126,29 @@ static struct tegra_audio2x_clk_initdata audio2x_clks[] = {
 
 void __init tegra_audio_clk_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
-			struct tegra_clk_pll_params *pll_a_params)
+			struct tegra_audio_clk_info *audio_info,
+			int num_plls)
 {
 	struct clk *clk;
 	struct clk **dt_clk;
 	int i;
 
-	/* PLLA */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_pll_a, tegra_clks);
-	if (dt_clk) {
-		clk = tegra_clk_register_pll("pll_a", "pll_p_out1", clk_base,
-				pmc_base, 0, pll_a_params, NULL);
-		*dt_clk = clk;
+	if (!audio_info || num_plls < 1) {
+		pr_err("No audio data passed to tegra_audio_clk_init\n");
+		WARN_ON(1);
+		return;
+	}
+
+	for (i = 0; i < num_plls; i++) {
+		struct tegra_audio_clk_info *info = &audio_info[i];
+
+		dt_clk = tegra_lookup_dt_id(info->clk_id, tegra_clks);
+		if (dt_clk) {
+			clk = tegra_clk_register_pll(info->name, info->parent,
+					clk_base, pmc_base, 0, info->pll_params,
+					NULL);
+			*dt_clk = clk;
+		}
 	}
 
 	/* PLLA_OUT0 */
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 8237d16b4075..0d67efb3dd6a 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -935,6 +935,10 @@ static u32 mux_pllm_pllc2_c_c3_pllp_plla_idx[] = {
 	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 6,
 };
 
+static struct tegra_audio_clk_info tegra114_audio_plls[] = {
+	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
+};
+
 static struct clk **clks;
 
 static unsigned long osc_freq;
@@ -1483,7 +1487,8 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra114_fixed_clk_init(clk_base);
 	tegra114_pll_init(clk_base, pmc_base);
 	tegra114_periph_clk_init(clk_base, pmc_base);
-	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks, &pll_a_params);
+	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
+			     &tegra114_audio_plls, 1);
 	tegra_pmc_clk_init(pmc_base, tegra114_clks);
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 11f857cd5f6a..169e236f3627 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1413,6 +1413,10 @@ static struct tegra_clk_init_table tegra132_init_table[] __initdata = {
 	{TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0},
 };
 
+static struct tegra_audio_clk_info tegra124_audio_plls[] = {
+	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
+};
+
 /**
  * tegra124_clock_apply_init_table - initialize clocks on Tegra124 SoCs
  *
@@ -1489,7 +1493,8 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 	tegra_fixed_clk_init(tegra124_clks);
 	tegra124_pll_init(clk_base, pmc_base);
 	tegra124_periph_clk_init(clk_base, pmc_base);
-	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks, &pll_a_params);
+	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks,
+			     tegra124_audio_plls, 1);
 	tegra_pmc_clk_init(pmc_base, tegra124_clks);
 
 	/* For Tegra124 & Tegra132, PLLD is the only source for DSIA & DSIB */
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 4b26509fc218..3198c7b7946c 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1406,6 +1406,10 @@ static const struct of_device_id pmc_match[] __initconst = {
 	{},
 };
 
+static struct tegra_audio_clk_info tegra30_audio_plls[] = {
+	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
+};
+
 static void __init tegra30_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1443,7 +1447,8 @@ static void __init tegra30_clock_init(struct device_node *np)
 	tegra30_pll_init();
 	tegra30_super_clk_init();
 	tegra30_periph_clk_init();
-	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks, &pll_a_params);
+	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks,
+			     &tegra30_audio_plls, 1);
 	tegra_pmc_clk_init(pmc_base, tegra30_clks);
 
 	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 9da799849e04..dfea6f367977 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -258,6 +258,21 @@ struct tegra_clk_pll {
 
 #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
 
+/**
+ * struct tegra_audio_clk_info - Tegra Audio Clk Information
+ *
+ * @name:	name for the audio pll
+ * @pll_params:	pll_params for audio pll
+ * @clk_id:	clk_ids for the audio pll
+ * @parent:	name of the parent of the audio pll
+ */
+struct tegra_audio_clk_info {
+	char *name;
+	struct tegra_clk_pll_params *pll_params;
+	int clk_id;
+	char *parent;
+};
+
 extern const struct clk_ops tegra_clk_pll_ops;
 extern const struct clk_ops tegra_clk_plle_ops;
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
@@ -607,7 +622,8 @@ void tegra_register_devclks(struct tegra_devclk *dev_clks, int num);
 
 void tegra_audio_clk_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
-			struct tegra_clk_pll_params *pll_params);
+			struct tegra_audio_clk_info *audio_info,
+			int num_plls);
 
 void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
 			struct tegra_clk *tegra_clks,
-- 
1.7.9.5
