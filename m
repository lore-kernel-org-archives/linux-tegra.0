From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 06/14] clk: tegra: Fix T210 effective NDIV calculation
Date: Tue, 25 Jul 2017 13:34:07 +0300
Message-ID: <1500978856-5981-7-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

Don't take the fractional part into account to calculate the effective
NDIV if fractional ndiv is not enabled.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index dc4a813..a4d7d94 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -241,6 +241,9 @@
 #define PLL_SDM_COEFF BIT(13)
 #define sdin_din_to_data(din)	((u16)((din) ? : 0xFFFFU))
 #define sdin_data_to_din(dat)	(((dat) == 0xFFFFU) ? 0 : (s16)dat)
+/* This macro returns ndiv effective scaled to SDM range */
+#define sdin_get_n_eff(cfg)	((cfg)->n * PLL_SDM_COEFF + ((cfg)->sdm_data ? \
+		(PLL_SDM_COEFF/2 + sdin_data_to_din((cfg)->sdm_data)) : 0))
 
 /* Tegra CPU clock and reset control regs */
 #define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS	0x470
@@ -1288,8 +1291,7 @@ static int tegra210_pll_fixed_mdiv_cfg(struct clk_hw *hw,
 			s -= PLL_SDM_COEFF / 2;
 			cfg->sdm_data = sdin_din_to_data(s);
 		}
-		cfg->output_rate *= cfg->n * PLL_SDM_COEFF + PLL_SDM_COEFF/2 +
-					sdin_data_to_din(cfg->sdm_data);
+		cfg->output_rate *= sdin_get_n_eff(cfg);
 		cfg->output_rate /= p * cfg->m * PLL_SDM_COEFF;
 	} else {
 		cfg->output_rate *= cfg->n;
@@ -1314,8 +1316,7 @@ static int tegra210_pll_fixed_mdiv_cfg(struct clk_hw *hw,
  */
 static void tegra210_clk_pll_set_gain(struct tegra_clk_pll_freq_table *cfg)
 {
-	cfg->n = cfg->n * PLL_SDM_COEFF + PLL_SDM_COEFF/2 +
-			sdin_data_to_din(cfg->sdm_data);
+	cfg->n = sdin_get_n_eff(cfg);
 	cfg->m *= PLL_SDM_COEFF;
 }
 
-- 
1.9.1
