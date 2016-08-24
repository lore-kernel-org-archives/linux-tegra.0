From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: tegra: remove TEGRA_PLL_USE_LOCK for PLLD/PLLD2
Date: Wed, 24 Aug 2016 15:56:56 +0200
Message-ID: <20160824135656.5025-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra114 has a HW bug that the PLLD/PLLD2 lock bit cannot be asserted when
the DIS power domain is during up-powergating process but the clamp to this
domain is not removed yet. That causes a timeout and aborts the power
sequence, although the PLLD/PLLD2 has already locked. To remove the false
alarm, we don't use the lock for PLLD/PLLD2. Just wait 1ms and treat the
clocks as locked.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi Mike, Stephen,

This patch is part of a fix for a regression that was introduced in
v4.8-rc1 and it'd be great to see this applied for fixes.

Thanks,
Thierry

 drivers/clk/tegra/clk-tegra114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 64da7b79a6e4..933b5dd698b8 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -428,7 +428,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static struct tegra_clk_pll_params pll_d2_params = {
@@ -446,7 +446,7 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
 	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+		 TEGRA_PLL_HAS_LOCK_ENABLE,
 };
 
 static const struct pdiv_map pllu_p[] = {
-- 
2.9.0
