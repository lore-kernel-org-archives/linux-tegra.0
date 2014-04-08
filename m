From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] clk: tegra124: Enable hda to hdmi clocks
Date: Tue,  8 Apr 2014 12:17:09 -0700
Message-ID: <1396984629-14101-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the clocks used for HDMI audio played through the HDA controller.
Initialize the codec clock to 48Mhz and the HDA clock to 102MHz per
the TRM.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 166e02f..ab15d98 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1018,6 +1018,9 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "fuse", .dt_id = TEGRA124_CLK_FUSE },
 	{ .dev_id = "rtc-tegra", .dt_id = TEGRA124_CLK_RTC },
 	{ .dev_id = "timer", .dt_id = TEGRA124_CLK_TIMER },
+	{ .con_id = "hda", .dt_id = TEGRA124_CLK_HDA },
+	{ .con_id = "hda2codec_2x", .dt_id = TEGRA124_CLK_HDA2CODEC_2X },
+	{ .con_id = "hda2hdmi", .dt_id = TEGRA124_CLK_HDA2HDMI },
 };
 
 static struct clk **clks;
@@ -1371,6 +1374,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{TEGRA124_CLK_SBC4, TEGRA124_CLK_PLL_P, 12000000, 1},
 	{TEGRA124_CLK_TSEC, TEGRA124_CLK_PLL_C3, 0, 0},
 	{TEGRA124_CLK_MSENC, TEGRA124_CLK_PLL_C3, 0, 0},
+	{TEGRA124_CLK_HDA, TEGRA124_CLK_PLL_P, 102000000, 0},
+	{TEGRA124_CLK_HDA2CODEC_2X, TEGRA124_CLK_PLL_P, 48000000, 0},
 	/* This MUST be the last entry. */
 	{TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0},
 };
-- 
1.8.1.3.605.g02339dd
