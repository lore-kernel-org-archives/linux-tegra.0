From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4] clk: tegra: pll: Improve PLLM enable-state detection
Date: Thu,  9 Jul 2020 20:20:57 +0300
Message-ID: <20200709172057.13951-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Power Management Controller (PMC) can override the PLLM clock settings,
including the enable-state. Although PMC could only act as a second level
gate, meaning that PLLM needs to be enabled by the Clock and Reset
Controller (CaR) anyways if we want it to be enabled. Hence, when PLLM is
overridden by PMC, it needs to be enabled by CaR and ungated by PMC in
order to be functional. Please note that this patch doesn't fix any known
problem, and thus, it's merely a minor improvement.

Link: https://lore.kernel.org/linux-arm-kernel/20191210120909.GA2703785@ulmo/T/
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v4: - Renamed pllm_pmc_clk_enabled() to pllm_clk_is_gated_by_pmc() as
      it was suggested by Jon Hunter in the review comment to v3.

v3: - Dropped unintended code change that was accidentally added to v2.

v2: - Added clarifying comment to the code.

    - Prettified the code.

 drivers/clk/tegra/clk-pll.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index b2d39a66f0fa..ff13b371e176 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -327,16 +327,26 @@ int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
 	return clk_pll_wait_for_lock(pll);
 }
 
+static bool pllm_clk_is_gated_by_pmc(struct tegra_clk_pll *pll)
+{
+	u32 val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
+
+	return (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE) &&
+	      !(val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE);
+}
+
 static int clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	u32 val;
 
-	if (pll->params->flags & TEGRA_PLLM) {
-		val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
-		if (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)
-			return val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE ? 1 : 0;
-	}
+	/*
+	 * Power Management Controller (PMC) can override the PLLM clock
+	 * settings, including the enable-state. The PLLM is enabled when
+	 * PLLM's CaR state is ON and when PLLM isn't gated by PMC.
+	 */
+	if ((pll->params->flags & TEGRA_PLLM) && pllm_clk_is_gated_by_pmc(pll))
+		return 0;
 
 	val = pll_readl_base(pll);
 
-- 
2.26.0
