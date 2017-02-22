From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 6/7] clk: tegra: correct tegra210_pll_fixed_mdiv_cfg rate calculation
Date: Wed, 22 Feb 2017 17:14:01 +0200
Message-ID: <1487776444-4701-7-git-send-email-pdeschrijver@nvidia.com>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Return the actually achieved rate in cfg->output_rate rather than just the
requested rate. This is important to make clk_round_rate return the correct
result.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index fe698d2..58d7f9c 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1222,6 +1222,7 @@ static int tegra210_pll_fixed_mdiv_cfg(struct clk_hw *hw,
 	cfg->n = p_rate / cf;
 
 	cfg->sdm_data = 0;
+	cfg->output_rate = input_rate;
 	if (params->sdm_ctrl_reg) {
 		unsigned long rem = p_rate - cf * cfg->n;
 		/* If ssc is enabled SDM enabled as well, even for integer n */
@@ -1232,10 +1233,15 @@ static int tegra210_pll_fixed_mdiv_cfg(struct clk_hw *hw,
 			s -= PLL_SDM_COEFF / 2;
 			cfg->sdm_data = sdin_din_to_data(s);
 		}
+		cfg->output_rate *= cfg->n * PLL_SDM_COEFF + PLL_SDM_COEFF/2 +
+					sdin_data_to_din(cfg->sdm_data);
+		cfg->output_rate /= p * cfg->m * PLL_SDM_COEFF;
+	} else {
+		cfg->output_rate *= cfg->n;
+		cfg->output_rate /= p * cfg->m;
 	}
 
 	cfg->input_rate = input_rate;
-	cfg->output_rate = rate;
 
 	return 0;
 }
-- 
1.9.1

