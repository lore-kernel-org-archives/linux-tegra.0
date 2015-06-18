From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 20/25] clk: tegra: Add Super Gen5 Logic
Date: Thu, 18 Jun 2015 17:28:35 -0400
Message-ID: <1434662920-21469-21-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Super clock divider control and clock source mux of Tegra210 has changed
a little against prior SoCs, this patch adds Gen5 logic to address those
differences.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v6:
  - Added gen5 code into gen4 file and commonized where possible

v2:
  - Fixed sclk divider address (0x370 -> 0x2c)

 drivers/clk/tegra/clk-tegra-super-gen4.c |  142 +++++++++++++++++++++++++++---
 drivers/clk/tegra/clk.h                  |    3 +
 2 files changed, 132 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index f1f441034b86..25e7f7acea77 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -35,9 +35,25 @@
 #define CCLKLP_BURST_POLICY 0x370
 #define SCLK_BURST_POLICY 0x028
 #define SYSTEM_CLK_RATE 0x030
+#define SCLK_DIVIDER 0x2c
 
 static DEFINE_SPINLOCK(sysrate_lock);
 
+enum tegra_super_gen {
+	gen4 = 4,
+	gen5,
+};
+
+struct tegra_super_gen_info {
+	enum tegra_super_gen gen;
+	const char **sclk_parents;
+	const char **cclk_g_parents;
+	const char **cclk_lp_parents;
+	int num_sclk_parents;
+	int num_cclk_g_parents;
+	int num_cclk_lp_parents;
+};
+
 static const char *sclk_parents[] = { "clk_m", "pll_c_out1", "pll_p_out4",
 			       "pll_p", "pll_p_out2", "unused",
 			       "clk_32k", "pll_m_out1" };
@@ -52,21 +68,81 @@ static const char *cclk_lp_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
 					 "pll_p", "pll_p_out4", "unused",
 					 "unused", "pll_x", "pll_x_out0" };
 
+const struct tegra_super_gen_info tegra_super_gen_info_gen4 = {
+	.gen = gen4,
+	.sclk_parents = sclk_parents,
+	.cclk_g_parents = cclk_g_parents,
+	.cclk_lp_parents = cclk_lp_parents,
+	.num_sclk_parents = ARRAY_SIZE(sclk_parents),
+	.num_cclk_g_parents = ARRAY_SIZE(cclk_g_parents),
+	.num_cclk_lp_parents = ARRAY_SIZE(cclk_lp_parents),
+};
+
+static const char *sclk_parents_gen5[] = { "clk_m", "pll_c_out1", "pll_c4_out3",
+			       "pll_p", "pll_p_out2", "pll_c4_out1",
+			       "clk_32k", "pll_c4_out2" };
+
+static const char *cclk_g_parents_gen5[] = { "clk_m", "unused", "clk_32k", "unused",
+					"pll_p", "pll_p_out4", "unused",
+					"unused", "pll_x", "unused", "unused",
+					"unused", "unused", "unused", "unused",
+					"dfllCPU_out" };
+
+static const char *cclk_lp_parents_gen5[] = { "clk_m", "unused", "clk_32k", "unused",
+					"pll_p", "pll_p_out4", "unused",
+					"unused", "pll_x", "unused", "unused",
+					"unused", "unused", "unused", "unused",
+					"dfllCPU_out" };
+
+const struct tegra_super_gen_info tegra_super_gen_info_gen5 = {
+	.gen = gen5,
+	.sclk_parents = sclk_parents_gen5,
+	.cclk_g_parents = cclk_g_parents_gen5,
+	.cclk_lp_parents = cclk_lp_parents_gen5,
+	.num_sclk_parents = ARRAY_SIZE(sclk_parents_gen5),
+	.num_cclk_g_parents = ARRAY_SIZE(cclk_g_parents_gen5),
+	.num_cclk_lp_parents = ARRAY_SIZE(cclk_lp_parents_gen5),
+};
+
 static void __init tegra_sclk_init(void __iomem *clk_base,
-				struct tegra_clk *tegra_clks)
+				struct tegra_clk *tegra_clks,
+				const struct tegra_super_gen_info *gen_info)
 {
 	struct clk *clk;
 	struct clk **dt_clk;
 
-	/* SCLK */
-	dt_clk = tegra_lookup_dt_id(tegra_clk_sclk, tegra_clks);
+	/* SCLK_MUX */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_sclk_mux, tegra_clks);
 	if (dt_clk) {
-		clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-						ARRAY_SIZE(sclk_parents),
+		clk = tegra_clk_register_super_mux("sclk_mux",
+						gen_info->sclk_parents,
+						gen_info->num_sclk_parents,
 						CLK_SET_RATE_PARENT,
 						clk_base + SCLK_BURST_POLICY,
 						0, 4, 0, 0, NULL);
 		*dt_clk = clk;
+
+
+		/* SCLK */
+		dt_clk = tegra_lookup_dt_id(tegra_clk_sclk, tegra_clks);
+		if (dt_clk) {
+			clk = clk_register_divider(NULL, "sclk", "sclk_mux", 0,
+						clk_base + SCLK_DIVIDER, 0, 8,
+						0, &sysrate_lock);
+			*dt_clk = clk;
+		}
+	} else {
+		/* SCLK */
+		dt_clk = tegra_lookup_dt_id(tegra_clk_sclk, tegra_clks);
+		if (dt_clk) {
+			clk = tegra_clk_register_super_mux("sclk",
+						gen_info->sclk_parents,
+						gen_info->num_sclk_parents,
+						CLK_SET_RATE_PARENT,
+						clk_base + SCLK_BURST_POLICY,
+						0, 4, 0, 0, NULL);
+			*dt_clk = clk;
+		}
 	}
 
 	/* HCLK */
@@ -96,10 +172,11 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 	*dt_clk = clk;
 }
 
-void __init tegra_super_clk_gen4_init(void __iomem *clk_base,
+void __init tegra_super_clk_init(void __iomem *clk_base,
 				void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks,
-				struct tegra_clk_pll_params *params)
+				struct tegra_clk_pll_params *params,
+				const struct tegra_super_gen_info *gen_info)
 {
 	struct clk *clk;
 	struct clk **dt_clk;
@@ -107,28 +184,50 @@ void __init tegra_super_clk_gen4_init(void __iomem *clk_base,
 	/* CCLKG */
 	dt_clk = tegra_lookup_dt_id(tegra_clk_cclk_g, tegra_clks);
 	if (dt_clk) {
-		clk = tegra_clk_register_super_mux("cclk_g", cclk_g_parents,
-					ARRAY_SIZE(cclk_g_parents),
+		if (gen_info->gen == gen5) {
+			clk = tegra_clk_register_super_mux("cclk_g",
+					gen_info->cclk_g_parents,
+					gen_info->num_cclk_g_parents,
+					CLK_SET_RATE_PARENT,
+					clk_base + CCLKG_BURST_POLICY,
+					0, 4, 8, 0, NULL);
+		} else {
+			clk = tegra_clk_register_super_mux("cclk_g",
+					gen_info->cclk_g_parents,
+					gen_info->num_cclk_g_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKG_BURST_POLICY,
 					0, 4, 0, 0, NULL);
+		}
 		*dt_clk = clk;
 	}
 
 	/* CCLKLP */
 	dt_clk = tegra_lookup_dt_id(tegra_clk_cclk_lp, tegra_clks);
 	if (dt_clk) {
-		clk = tegra_clk_register_super_mux("cclk_lp", cclk_lp_parents,
-					ARRAY_SIZE(cclk_lp_parents),
+		if (gen_info->gen == gen5) {
+			clk = tegra_clk_register_super_mux("cclk_lp",
+					gen_info->cclk_lp_parents,
+					gen_info->num_cclk_lp_parents,
+					CLK_SET_RATE_PARENT,
+					clk_base + CCLKLP_BURST_POLICY,
+					0, 4, 8, 0, NULL);
+		} else {
+			clk = tegra_clk_register_super_mux("cclk_lp",
+					gen_info->cclk_lp_parents,
+					gen_info->num_cclk_lp_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKLP_BURST_POLICY,
 					TEGRA_DIVIDER_2, 4, 8, 9, NULL);
+		}
 		*dt_clk = clk;
 	}
 
-	tegra_sclk_init(clk_base, tegra_clks);
+	tegra_sclk_init(clk_base, tegra_clks, gen_info);
 
-#if defined(CONFIG_ARCH_TEGRA_114_SOC) || defined(CONFIG_ARCH_TEGRA_124_SOC)
+#if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_124_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_210_SOC)
 	/* PLLX */
 	dt_clk = tegra_lookup_dt_id(tegra_clk_pll_x, tegra_clks);
 	if (!dt_clk)
@@ -149,3 +248,20 @@ void __init tegra_super_clk_gen4_init(void __iomem *clk_base,
 #endif
 }
 
+void __init tegra_super_clk_gen4_init(void __iomem *clk_base,
+				void __iomem *pmc_base,
+				struct tegra_clk *tegra_clks,
+				struct tegra_clk_pll_params *params)
+{
+	tegra_super_clk_init(clk_base, pmc_base, tegra_clks, params,
+			     &tegra_super_gen_info_gen4);
+}
+
+void __init tegra_super_clk_gen5_init(void __iomem *clk_base,
+				void __iomem *pmc_base,
+				struct tegra_clk *tegra_clks,
+				struct tegra_clk_pll_params *params)
+{
+	tegra_super_clk_init(clk_base, pmc_base, tegra_clks, params,
+			     &tegra_super_gen_info_gen5);
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 87239298043c..3053cef1af3e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -740,6 +740,9 @@ int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 void tegra_super_clk_gen4_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
+void tegra_super_clk_gen5_init(void __iomem *clk_base,
+			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk_pll_params *pll_params);
 
 #ifdef CONFIG_TEGRA_CLK_EMC
 struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
-- 
1.7.9.5
