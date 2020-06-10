From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] clk: tegra: pll: Improve PLLM enable-state detection
Date: Wed, 10 Jun 2020 19:37:38 +0300
Message-ID: <20200610163738.29304-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Power Management Controller (PMC) can override the PLLM clock settings,
including the enable-state. Although PMC could only act as a second level
gate, meaning that PLLM needs to be enabled by the Clock and Reset
Controller (CaR) anyways if we want it to be enabled. Hence, when PLLM is
overridden by PMC, it needs to be enabled by CaR and ungated by PMC in
order to be functional. Please note that this patch doesn't fix any known
problem, and thus, it's merely a minor improvement.

Link: https://lore.kernel.org/linux-arm-kernel/20191210120909.GA2703785@ulmo/T/
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0b212cf2e794..4fd1edba8caf 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -330,17 +330,18 @@ int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
 static int clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	bool pllm_enabled = true;
 	u32 val;
 
 	if (pll->params->flags & TEGRA_PLLM) {
 		val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
 		if (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)
-			return val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE ? 1 : 0;
+			pllm_enabled = !!(val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE);
 	}
 
 	val = pll_readl_base(pll);
 
-	return val & PLL_BASE_ENABLE ? 1 : 0;
+	return pllm_enabled && (val & PLL_BASE_ENABLE);
 }
 
 static void _clk_pll_enable(struct clk_hw *hw)
-- 
2.26.0
