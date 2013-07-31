From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra30: Don't wait for PLL_U lock bit
Date: Wed, 31 Jul 2013 20:42:31 +0300
Message-ID: <1375292551-7933-2-git-send-email-ttynkkynen@nvidia.com>
References: <1375292551-7933-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292551-7933-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The lock bit on PLL_U does not seem to be working correctly and
sometimes never gets set when waiting for the PLL to come up.
Remove the TEGRA_PLL_USE_LOCK flag to use a constant delay.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index e2c6ca0..9103fc8 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -971,7 +971,7 @@ static void __init tegra30_pll_init(void)
 	/* PLLU */
 	clk = tegra_clk_register_pll("pll_u", "pll_ref", clk_base, pmc_base, 0,
 			    0, &pll_u_params, TEGRA_PLLU | TEGRA_PLL_HAS_CPCON |
-			    TEGRA_PLL_SET_LFCON | TEGRA_PLL_USE_LOCK,
+			    TEGRA_PLL_SET_LFCON,
 			    pll_u_freq_table,
 			    NULL);
 	clk_register_clkdev(clk, "pll_u", NULL);
-- 
1.8.1.5
