From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] clk: tegra124: Remove lock-enable bit from PLLM
Date: Fri, 12 Apr 2019 00:48:35 +0300
Message-ID: <20190411214835.19947-3-digetx@gmail.com>
References: <20190411214835.19947-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411214835.19947-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

According to the Tegra124 TRM documentation, PLLM_MISC2 register doesn't
have the lock-enable bit as well as any other PLLM-related register. Hence
PLLM re-locking can't be initiated by software. The incorrect bit setting
should have been harmless since that bit is undefined according to TRM.

Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra124.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index df0018f7bf7e..940592375583 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -413,7 +413,6 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.base_reg = PLLM_BASE,
 	.misc_reg = PLLM_MISC,
 	.lock_mask = PLL_BASE_LOCK,
-	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.max_p = 5,
 	.pdiv_tohw = pllm_p,
@@ -421,7 +420,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.pmc_divnm_reg = PMC_PLLM_WB0_OVERRIDE,
 	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE_2,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_freq_table pll_e_freq_table[] = {
-- 
2.21.0
