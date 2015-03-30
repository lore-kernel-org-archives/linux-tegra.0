From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/11] clk: tegra: Use consistent indentation
Date: Mon, 30 Mar 2015 14:31:07 +0200
Message-ID: <1427718673-32011-6-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some of the .dev_id entries in the devclks table were oddly indented.
Make them consistent with the rest of the table.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 4b9d8bd3d0bf..0659db79d1c5 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -657,16 +657,16 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "fuse_burn", .dev_id = "fuse-tegra", .dt_id = TEGRA30_CLK_FUSE_BURN },
 	{ .con_id = "apbif", .dev_id = "tegra30-ahub", .dt_id = TEGRA30_CLK_APBIF },
 	{ .con_id = "hda2hdmi", .dev_id = "tegra30-hda", .dt_id = TEGRA30_CLK_HDA2HDMI },
-	{ .dev_id =  "tegra-apbdma", .dt_id = TEGRA30_CLK_APBDMA },
-	{ .dev_id =  "rtc-tegra", .dt_id = TEGRA30_CLK_RTC },
-	{ .dev_id =  "timer", .dt_id = TEGRA30_CLK_TIMER },
-	{ .dev_id =  "tegra-kbc", .dt_id = TEGRA30_CLK_KBC },
-	{ .dev_id =  "fsl-tegra-udc", .dt_id = TEGRA30_CLK_USBD },
-	{ .dev_id =  "tegra-ehci.1", .dt_id = TEGRA30_CLK_USB2 },
-	{ .dev_id =  "tegra-ehci.2", .dt_id = TEGRA30_CLK_USB2 },
-	{ .dev_id =  "kfuse-tegra", .dt_id = TEGRA30_CLK_KFUSE },
-	{ .dev_id =  "tegra_sata_cold", .dt_id = TEGRA30_CLK_SATA_COLD },
-	{ .dev_id =  "dtv", .dt_id = TEGRA30_CLK_DTV },
+	{ .dev_id = "tegra-apbdma", .dt_id = TEGRA30_CLK_APBDMA },
+	{ .dev_id = "rtc-tegra", .dt_id = TEGRA30_CLK_RTC },
+	{ .dev_id = "timer", .dt_id = TEGRA30_CLK_TIMER },
+	{ .dev_id = "tegra-kbc", .dt_id = TEGRA30_CLK_KBC },
+	{ .dev_id = "fsl-tegra-udc", .dt_id = TEGRA30_CLK_USBD },
+	{ .dev_id = "tegra-ehci.1", .dt_id = TEGRA30_CLK_USB2 },
+	{ .dev_id = "tegra-ehci.2", .dt_id = TEGRA30_CLK_USB2 },
+	{ .dev_id = "kfuse-tegra", .dt_id = TEGRA30_CLK_KFUSE },
+	{ .dev_id = "tegra_sata_cold", .dt_id = TEGRA30_CLK_SATA_COLD },
+	{ .dev_id = "dtv", .dt_id = TEGRA30_CLK_DTV },
 	{ .dev_id = "tegra30-i2s.0", .dt_id = TEGRA30_CLK_I2S0 },
 	{ .dev_id = "tegra30-i2s.1", .dt_id = TEGRA30_CLK_I2S1 },
 	{ .dev_id = "tegra30-i2s.2", .dt_id = TEGRA30_CLK_I2S2 },
-- 
2.3.2
