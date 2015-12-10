From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/9] clk: tegra: Fix divider on VI_I2C
Date: Thu, 10 Dec 2015 17:08:20 -0500
Message-ID: <1449785308-19546-2-git-send-email-rklein@nvidia.com>
References: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449785308-19546-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

VI-I2C has 16 bits available for its divider. Switch the divider
width to 16 instead of 8 so correct rates can be set.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
