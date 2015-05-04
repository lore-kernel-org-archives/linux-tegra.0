From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v4 07/20] clk: tegra: pll: Don't unconditionally set LOCK flags
Date: Mon, 4 May 2015 12:37:27 -0400
Message-ID: <1430757460-9478-8-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

SoC specific drivers should define the appropriate flags for each
PLL rather than relying on the registration functions to automatically
set flags on their behalf. This will properly allow for changes between
SoC generations where flags might be different and allow sharing the
same logic functions.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c      |   11 ++---------
 drivers/clk/tegra/clk-tegra114.c |   23 +++++++++++++----------
 drivers/clk/tegra/clk-tegra124.c |   24 +++++++++++++++---------
 drivers/clk/tegra/clk-tegra20.c  |   18 ++++++++++--------
 drivers/clk/tegra/clk-tegra30.c  |   24 +++++++++++++++---------
 5 files changed, 55 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0282d9f4f2d7..13d86c5b234d 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1434,7 +1434,7 @@ struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
 	struct clk *clk;
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1464,8 +1464,7 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
-	pll_params->flags |= TEGRA_PLL_LOCK_MISC | TEGRA_PLL_BYPASS;
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
+	pll_params->flags |= TEGRA_PLL_BYPASS;
 
 	if (!pll_params->div_nmp)
 		pll_params->div_nmp = &pll_e_nmp;
@@ -1569,7 +1568,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
 	}
 
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1592,8 +1590,6 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
 
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_LOCK_MISC;
-
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
@@ -1653,7 +1649,6 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
 	pll_params->flags |= TEGRA_PLL_BYPASS;
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
 	pll_params->flags |= TEGRA_PLLM;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
@@ -1751,7 +1746,6 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 	struct clk *clk;
 	u32 val, val_aux;
 
-	pll_params->flags |= TEGRA_PLL_HAS_LOCK_ENABLE;
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1813,7 +1807,6 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 		return ERR_PTR(-EINVAL);
 	}
 
-	pll_params->flags = TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_USE_LOCK;
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 0d67efb3dd6a..5830c921c847 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -234,7 +234,7 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.pdiv_tohw = pllxc_p,
 	.div_nmp = &pllxc_nmp,
 	.freq_table = pll_c_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct div_nmp pllcx_nmp = {
@@ -353,7 +353,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.pmc_divnm_reg = PMC_PLLM_WB0_OVERRIDE,
 	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE_2,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct div_nmp pllp_nmp = {
@@ -388,7 +388,8 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.lock_delay = 300,
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_p_freq_table,
-	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate = 408000000,
 };
 
@@ -418,7 +419,8 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.lock_delay = 300,
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_d_freq_table[] = {
@@ -457,7 +459,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_d2_params = {
@@ -475,7 +477,7 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct pdiv_map pllu_p[] = {
@@ -518,7 +520,7 @@ static struct tegra_clk_pll_params pll_u_params = {
 	.div_nmp = &pllu_nmp,
 	.freq_table = pll_u_freq_table,
 	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
@@ -553,7 +555,7 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.pdiv_tohw = pllxc_p,
 	.div_nmp = &pllxc_nmp,
 	.freq_table = pll_x_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_e_freq_table[] = {
@@ -588,7 +590,7 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_delay = 300,
 	.div_nmp = &plle_nmp,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate = 100000000,
 };
 
@@ -616,7 +618,8 @@ static struct tegra_clk_pll_params pll_re_vco_params = {
 	.iddq_reg = PLLRE_MISC,
 	.iddq_bit_idx = PLLRE_IDDQ_BIT,
 	.div_nmp = &pllre_nmp,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_LOCK_MISC,
 };
 
 /* possible OSC frequencies in Hz */
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 169e236f3627..44b3cc4a0aa0 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -216,7 +216,7 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.pdiv_tohw = pllxc_p,
 	.div_nmp = &pllxc_nmp,
 	.freq_table = pll_x_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_c_freq_table[] = {
@@ -250,7 +250,7 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.pdiv_tohw = pllxc_p,
 	.div_nmp = &pllxc_nmp,
 	.freq_table = pll_c_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct div_nmp pllcx_nmp = {
@@ -384,6 +384,7 @@ static struct tegra_clk_pll_params pll_c4_params = {
 	.ext_misc_reg[1] = 0x5b0,
 	.ext_misc_reg[2] = 0x5b4,
 	.freq_table = pll_c4_freq_table,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct pdiv_map pllm_p[] = {
@@ -431,7 +432,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.pmc_divnm_reg = PMC_PLLM_WB0_OVERRIDE,
 	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE_2,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_e_freq_table[] = {
@@ -467,7 +468,7 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_delay = 300,
 	.div_nmp = &plle_nmp,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate = 100000000,
 };
 
@@ -505,7 +506,8 @@ static struct tegra_clk_pll_params pll_re_vco_params = {
 	.iddq_reg = PLLRE_MISC,
 	.iddq_bit_idx = PLLRE_IDDQ_BIT,
 	.div_nmp = &pllre_nmp,
-	.flags = TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_LOCK_MISC,
 };
 
 static struct div_nmp pllp_nmp = {
@@ -541,7 +543,8 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_p_freq_table,
 	.fixed_rate = 408000000,
-	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
@@ -569,7 +572,8 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.lock_delay = 300,
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct div_nmp plld_nmp = {
@@ -617,7 +621,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.div_nmp = &plld_nmp,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table tegra124_pll_d2_freq_table[] = {
@@ -650,6 +654,7 @@ static struct tegra_clk_pll_params tegra124_pll_d2_params = {
 	.ext_misc_reg[2] = 0x578,
 	.max_p = 15,
 	.freq_table = tegra124_pll_d2_freq_table,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_freq_table pll_dp_freq_table[] = {
@@ -682,6 +687,7 @@ static struct tegra_clk_pll_params pll_dp_params = {
 	.ext_misc_reg[2] = 0x5a0,
 	.max_p = 5,
 	.freq_table = pll_dp_freq_table,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct pdiv_map pllu_p[] = {
@@ -724,7 +730,7 @@ static struct tegra_clk_pll_params pll_u_params = {
 	.div_nmp = &pllu_nmp,
 	.freq_table = pll_u_freq_table,
 	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 struct utmi_clk_param {
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 41272dcc9e22..98ed1a9b8f65 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -303,7 +303,7 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_c_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_m_params = {
@@ -319,7 +319,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_p_params = {
@@ -335,7 +335,8 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_p_freq_table,
-	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_CPCON |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate =  216000000,
 };
 
@@ -352,7 +353,7 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_d_params = {
@@ -368,7 +369,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.lock_enable_bit_idx = PLLDU_MISC_LOCK_ENABLE,
 	.lock_delay = 1000,
 	.freq_table = pll_d_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct pdiv_map pllu_p[] = {
@@ -391,7 +392,7 @@ static struct tegra_clk_pll_params pll_u_params = {
 	.lock_delay = 1000,
 	.pdiv_tohw = pllu_p,
 	.freq_table = pll_u_freq_table,
-	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_x_params = {
@@ -407,7 +408,7 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_x_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_e_params = {
@@ -423,7 +424,8 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_enable_bit_idx = PLLE_MISC_LOCK_ENABLE,
 	.lock_delay = 0,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_LOCK_MISC |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate = 100000000,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 3198c7b7946c..0d84e7ee10cd 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -423,7 +423,8 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_c_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct div_nmp pllm_nmp = {
@@ -455,7 +456,8 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE,
 	.freq_table = pll_m_freq_table,
 	.flags = TEGRA_PLLM | TEGRA_PLL_HAS_CPCON |
-		 TEGRA_PLL_SET_DCCON | TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_SET_DCCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_p_params = {
@@ -471,7 +473,8 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_p_freq_table,
-	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 	.fixed_rate = 408000000,
 };
 
@@ -488,7 +491,8 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_d_params = {
@@ -505,7 +509,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.lock_delay = 1000,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 
 };
 
@@ -523,7 +527,7 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.lock_delay = 1000,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_u_params = {
@@ -540,7 +544,8 @@ static struct tegra_clk_pll_params pll_u_params = {
 	.lock_delay = 1000,
 	.pdiv_tohw = pllu_p,
 	.freq_table = pll_u_freq_table,
-	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON,
+	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_x_params = {
@@ -557,7 +562,7 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.lock_delay = 300,
 	.freq_table = pll_x_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_DCCON |
-		 TEGRA_PLL_USE_LOCK,
+		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_e_params = {
@@ -573,7 +578,8 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_enable_bit_idx = PLLE_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLLE_CONFIGURE | TEGRA_PLL_FIXED,
+	.flags = TEGRA_PLLE_CONFIGURE | TEGRA_PLL_FIXED |
+		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_LOCK_MISC,
 	.fixed_rate = 100000000,
 };
 
-- 
1.7.9.5
