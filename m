From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 05/14] clk: tegra: Init cfg structure in _get_pll_mnp
Date: Tue, 25 Jul 2017 13:34:06 +0300
Message-ID: <1500978856-5981-6-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Not all fields are read from the hw depending on the PLL type. Make sure
the other fields are 0 by clearing the structure beforehand to prevent
users such as the rate re-calculation code from using bogus values.

Based on work by  Alex Frid <afrid@nvidia.com>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index fbd8726..1c36b8a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -690,6 +690,8 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
 	struct tegra_clk_pll_params *params = pll->params;
 	struct div_nmp *div_nmp = params->div_nmp;
 
+	*cfg = (struct tegra_clk_pll_freq_table) { };
+
 	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
 			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
-- 
1.9.1
