From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5.7] clk: tegra: Fix initial rate for pll_a on Tegra124
Date: Tue,  5 May 2020 09:16:55 +0200
Message-ID: <20200505071655.644773-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

pll_a_out0 and the I2S clocks are already configured to default to rates
corresponding to a 44.1 kHz sampling rate, but the pll_a configuration
was set to a default that is not listed in the frequency table, which
caused the PLL code to compute an invalid configuration. As a result of
this invalid configuration, Jetson TK1 fails to resume from suspend.

This used to get papered over because the ASoC driver would force audio
clocks to a 44.1 kHz configuration on boot. However, that's not really
necessary and was hence removed in commit ff5d18cb04f4 ("ASoC: tegra:
Enable audio mclk during tegra_asoc_utils_init()").

Fix the initial rate for pll_a so that it matches the 44.1 kHz entry in
the pll_a frequency table.

Fixes: ff5d18cb04f4 ("ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mike, Stephen,

this fixes a regression in v5.7, so it'd be great if you could queue it
up in your fixes branch.

Thanks,
Thierry

 drivers/clk/tegra/clk-tegra124.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 64e229ddf2a5..e931319dcc9d 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1292,7 +1292,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_UARTB, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTC, TEGRA124_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA124_CLK_UARTD, TEGRA124_CLK_PLL_P, 408000000, 0 },
-	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 0 },
+	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 282240000, 0 },
 	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 0 },
 	{ TEGRA124_CLK_I2S0, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S1, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
-- 
2.24.1
