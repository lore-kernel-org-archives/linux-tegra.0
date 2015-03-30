From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/11] clk: tegra: Enable HDA to HDMI clocks on Tegra124
Date: Mon, 30 Mar 2015 14:31:05 +0200
Message-ID: <1427718673-32011-4-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add the clocks used for HDMI audio played through the HDA controller.
Initialize the codec clock to 48Mhz and the HDA clock to 102MHz per
the TRM.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 9a893f2fe8e9..29b39c8c3151 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1014,6 +1014,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "fuse", .dt_id = TEGRA124_CLK_FUSE },
 	{ .dev_id = "rtc-tegra", .dt_id = TEGRA124_CLK_RTC },
 	{ .dev_id = "timer", .dt_id = TEGRA124_CLK_TIMER },
+	{ .con_id = "hda", .dt_id = TEGRA124_CLK_HDA },
+	{ .con_id = "hda2codec_2x", .dt_id = TEGRA124_CLK_HDA2CODEC_2X },
+	{ .con_id = "hda2hdmi", .dt_id = TEGRA124_CLK_HDA2HDMI },
 };
 
 static struct clk **clks;
@@ -1395,6 +1398,8 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 static struct tegra_clk_init_table tegra124_init_table[] __initdata = {
 	{TEGRA124_CLK_SOC_THERM, TEGRA124_CLK_PLL_P, 51000000, 0},
 	{TEGRA124_CLK_CCLK_G, TEGRA124_CLK_CLK_MAX, 0, 1},
+	{TEGRA124_CLK_HDA, TEGRA124_CLK_PLL_P, 102000000, 0},
+	{TEGRA124_CLK_HDA2CODEC_2X, TEGRA124_CLK_PLL_P, 48000000, 0},
 	/* This MUST be the last entry. */
 	{TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0},
 };
-- 
2.3.2
