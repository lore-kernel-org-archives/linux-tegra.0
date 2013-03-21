From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] clk: tegra: set up audio clocks on Tegra114
Date: Thu, 21 Mar 2013 13:45:15 -0600
Message-ID: <1363895115-14129-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This sets up all the audio-related clocks on Tegra114 in the same way
as they are set up on previous chips.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Peter, do you want to roll this into your CCF series V8, or should I apply
it seperately?
---
 drivers/clk/tegra/clk-tegra114.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 81101f1..9aa87b5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1979,6 +1979,16 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{uartb, pll_p, 408000000, 0},
 	{uartc, pll_p, 408000000, 0},
 	{uartd, pll_p, 408000000, 0},
+	{pll_a, clk_max, 564480000, 1},
+	{pll_a_out0, clk_max, 11289600, 1},
+	{extern1, pll_a_out0, 0, 1},
+	{clk_out_1_mux, extern1, 0, 0},
+	{clk_out_1, clk_max, 0, 1},
+	{i2s0, pll_a_out0, 11289600, 0},
+	{i2s1, pll_a_out0, 11289600, 0},
+	{i2s2, pll_a_out0, 11289600, 0},
+	{i2s3, pll_a_out0, 11289600, 0},
+	{i2s4, pll_a_out0, 11289600, 0},
 	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry. */
 };
 
-- 
1.7.10.4
