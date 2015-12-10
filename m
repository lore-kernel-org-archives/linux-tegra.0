From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 2/9] clk: tegra210: Remove improper flags for lock_enable
Date: Thu, 10 Dec 2015 17:08:21 -0500
Message-ID: <1449785308-19546-3-git-send-email-rklein@nvidia.com>
References: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Most PLL's don't actually have LOCK_ENABLE bits. However, most PLL's
also had that flag set, which meant that the clk code was trying to
enable locks, and inadvertantly flipping bits in other fields.

For PLLM, ensure the correct register is used for the misc_register.
PLL_MISC0 contains the EN_LCKDET bit which should be used for enabling
the lock, and PLLM_MISC1 shouldn't be used at all.

Lastly, remove some of the settings which would point to the EN_LCKDET
bits for some PLLs. There is no need to enable the locks, and that is
done as part of the set_defaults logic already.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 42 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 58514c44ea83..f45c9adf7fb2 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1386,7 +1386,7 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.mdiv_default = 3,
 	.div_nmp = &pllc_nmp,
 	.freq_table = pll_cx_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.set_defaults = _pllc_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1425,7 +1425,7 @@ static struct tegra_clk_pll_params pll_c2_params = {
 	.ext_misc_reg[2] = PLLC2_MISC2,
 	.ext_misc_reg[3] = PLLC2_MISC3,
 	.freq_table = pll_cx_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.set_defaults = _pllc2_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1455,7 +1455,7 @@ static struct tegra_clk_pll_params pll_c3_params = {
 	.ext_misc_reg[2] = PLLC3_MISC2,
 	.ext_misc_reg[3] = PLLC3_MISC3,
 	.freq_table = pll_cx_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.set_defaults = _pllc3_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1505,7 +1505,6 @@ static struct tegra_clk_pll_params pll_c4_vco_params = {
 	.base_reg = PLLC4_BASE,
 	.misc_reg = PLLC4_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLSS_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.max_p = PLL_QLIN_PDIV_MAX,
 	.ext_misc_reg[0] = PLLC4_MISC0,
@@ -1517,8 +1516,7 @@ static struct tegra_clk_pll_params pll_c4_vco_params = {
 	.div_nmp = &pllss_nmp,
 	.freq_table = pll_c4_vco_freq_table,
 	.set_defaults = tegra210_pllc4_set_defaults,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE |
-		 TEGRA_PLL_VCO_OUT,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
 
@@ -1559,7 +1557,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.vco_min = 800000000,
 	.vco_max = 1866000000,
 	.base_reg = PLLM_BASE,
-	.misc_reg = PLLM_MISC1,
+	.misc_reg = PLLM_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
 	.lock_enable_bit_idx = PLLM_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
@@ -1588,7 +1586,6 @@ static struct tegra_clk_pll_params pll_mb_params = {
 	.base_reg = PLLMB_BASE,
 	.misc_reg = PLLMB_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLMB_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.iddq_reg = PLLMB_MISC0,
 	.iddq_bit_idx = PLLMB_IDDQ_BIT,
@@ -1598,7 +1595,7 @@ static struct tegra_clk_pll_params pll_mb_params = {
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllm_nmp,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.set_defaults = tegra210_pllmb_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1671,7 +1668,6 @@ static struct tegra_clk_pll_params pll_re_vco_params = {
 	.base_reg = PLLRE_BASE,
 	.misc_reg = PLLRE_MISC0,
 	.lock_mask = PLLRE_MISC_LOCK,
-	.lock_enable_bit_idx = PLLRE_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.max_p = PLL_QLIN_PDIV_MAX,
 	.ext_misc_reg[0] = PLLRE_MISC0,
@@ -1681,8 +1677,7 @@ static struct tegra_clk_pll_params pll_re_vco_params = {
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllre_nmp,
 	.freq_table = pll_re_vco_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_LOCK_MISC |
-		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_VCO_OUT,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_LOCK_MISC | TEGRA_PLL_VCO_OUT,
 	.set_defaults = tegra210_pllre_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1712,7 +1707,6 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.base_reg = PLLP_BASE,
 	.misc_reg = PLLP_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLP_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.iddq_reg = PLLP_MISC0,
 	.iddq_bit_idx = PLLXP_IDDQ_BIT,
@@ -1721,8 +1715,7 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_p_freq_table,
 	.fixed_rate = 408000000,
-	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK |
-		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_VCO_OUT,
+	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
 	.set_defaults = tegra210_pllp_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1750,7 +1743,7 @@ static struct tegra_clk_pll_params pll_a1_params = {
 	.ext_misc_reg[2] = PLLA1_MISC2,
 	.ext_misc_reg[3] = PLLA1_MISC3,
 	.freq_table = pll_cx_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.set_defaults = _plla1_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
@@ -1787,7 +1780,6 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.base_reg = PLLA_BASE,
 	.misc_reg = PLLA_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLA_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
@@ -1802,8 +1794,7 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.ext_misc_reg[1] = PLLA_MISC1,
 	.ext_misc_reg[2] = PLLA_MISC2,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_MDIV_NEW |
-		 TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_MDIV_NEW,
 	.set_defaults = tegra210_plla_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 	.set_gain = tegra210_clk_pll_set_gain,
@@ -1836,7 +1827,6 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.base_reg = PLLD_BASE,
 	.misc_reg = PLLD_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLD_MISC_LOCK_ENABLE,
 	.lock_delay = 1000,
 	.iddq_reg = PLLD_MISC0,
 	.iddq_bit_idx = PLLD_IDDQ_BIT,
@@ -1850,7 +1840,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.ext_misc_reg[0] = PLLD_MISC0,
 	.ext_misc_reg[1] = PLLD_MISC1,
 	.freq_table = pll_d_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.mdiv_default = 1,
 	.set_defaults = tegra210_plld_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
@@ -1876,7 +1866,6 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.base_reg = PLLD2_BASE,
 	.misc_reg = PLLD2_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLSS_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.iddq_reg = PLLD2_BASE,
 	.iddq_bit_idx = PLLSS_IDDQ_BIT,
@@ -1897,7 +1886,7 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.mdiv_default = 1,
 	.freq_table = tegra210_pll_d2_freq_table,
 	.set_defaults = tegra210_plld2_set_defaults,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 	.set_gain = tegra210_clk_pll_set_gain,
 	.adjust_vco = tegra210_clk_adjust_vco_min,
@@ -1920,7 +1909,6 @@ static struct tegra_clk_pll_params pll_dp_params = {
 	.base_reg = PLLDP_BASE,
 	.misc_reg = PLLDP_MISC,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLSS_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.iddq_reg = PLLDP_BASE,
 	.iddq_bit_idx = PLLSS_IDDQ_BIT,
@@ -1941,7 +1929,7 @@ static struct tegra_clk_pll_params pll_dp_params = {
 	.mdiv_default = 1,
 	.freq_table = pll_dp_freq_table,
 	.set_defaults = tegra210_plldp_set_defaults,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 	.set_gain = tegra210_clk_pll_set_gain,
 	.adjust_vco = tegra210_clk_adjust_vco_min,
@@ -1973,7 +1961,6 @@ static struct tegra_clk_pll_params pll_u_vco_params = {
 	.base_reg = PLLU_BASE,
 	.misc_reg = PLLU_MISC0,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLLU_MISC_LOCK_ENABLE,
 	.lock_delay = 1000,
 	.iddq_reg = PLLU_MISC0,
 	.iddq_bit_idx = PLLU_IDDQ_BIT,
@@ -1983,8 +1970,7 @@ static struct tegra_clk_pll_params pll_u_vco_params = {
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllu_nmp,
 	.freq_table = pll_u_freq_table,
-	.flags = TEGRA_PLLU | TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE |
-		 TEGRA_PLL_VCO_OUT,
+	.flags = TEGRA_PLLU | TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
 	.set_defaults = tegra210_pllu_set_defaults,
 	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
 };
-- 
1.9.1
