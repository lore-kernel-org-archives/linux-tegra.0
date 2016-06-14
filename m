From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] clk: tegra: Disable spread spectrum on pll_d2
Date: Tue, 14 Jun 2016 14:00:42 +0200
Message-ID: <20160614120044.30734-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enabling spread spectrum on pll_d2 can lead to issues with display
modes. HDMI monitors, for example, would report "Signal Error" and
some modes driven over DisplayPort would generate fuzzy horizontal
bands.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 6bd1235d09b1..cd141a364c9d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1914,8 +1914,9 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.sdm_din_mask = PLLA_SDM_DIN_MASK,
 	.sdm_ctrl_reg = PLLD2_MISC1,
 	.sdm_ctrl_en_mask = PLLD2_SDM_EN_MASK,
-	.ssc_ctrl_reg = PLLD2_MISC1,
-	.ssc_ctrl_en_mask = PLLD2_SSC_EN_MASK,
+	/* disable spread-spectrum for pll_d2 */
+	.ssc_ctrl_reg = 0,
+	.ssc_ctrl_en_mask = 0,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllss_nmp,
-- 
2.8.3
