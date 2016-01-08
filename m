From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 1/9] clk: tegra: Fix divider on VI_I2C
Date: Fri, 8 Jan 2016 13:37:03 -0500
Message-ID: <1452278231-9546-2-git-send-email-rklein@nvidia.com>
References: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VI-I2C has 16 bits available for its divider. Switch the divider
width to 16 instead of 8 so correct rates can be set.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 6ad381a888a6..105405ca85ab 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -782,7 +782,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	NODIV("sor1", mux_clkm_sor1_brick_sor1_src, CLK_SOURCE_SOR1, 15, MASK(1), 183, 0, tegra_clk_sor1, &sor1_lock),
 	MUX8("sdmmc_legacy", mux_pllp_out3_clkm_pllp_pllc4, CLK_SOURCE_SDMMC_LEGACY, 193, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_sdmmc_legacy),
 	MUX8("qspi", mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_QSPI, 211, TEGRA_PERIPH_ON_APB, tegra_clk_qspi),
-	MUX("vii2c", mux_pllp_pllc_clkm, CLK_SOURCE_VI_I2C, 208, TEGRA_PERIPH_ON_APB, tegra_clk_vi_i2c),
+	I2C("vii2c", mux_pllp_pllc_clkm, CLK_SOURCE_VI_I2C, 208, tegra_clk_vi_i2c),
 	MUX("mipibif", mux_pllp_clkm, CLK_SOURCE_MIPIBIF, 173, TEGRA_PERIPH_ON_APB, tegra_clk_mipibif),
 	MUX("uartape", mux_pllp_pllc_clkm, CLK_SOURCE_UARTAPE, 212, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_uartape),
 	MUX8("tsecb", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_TSECB, 206, 0, tegra_clk_tsecb),
-- 
1.9.1
