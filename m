From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/7] clk: tegra: correct tegra210_pll_fixed_mdiv_cfg rate calculation
Date: Thu, 23 Feb 2017 12:44:43 +0200
Message-ID: <1487846686-6388-7-git-send-email-pdeschrijver@nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487846686-6388-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Return the actually achieved rate in cfg->output_rate rather than just the
requested rate. This is important to make clk_round_rate return the correct
result.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
