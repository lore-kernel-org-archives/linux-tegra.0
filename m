From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/7] clk: tegra: fix host1x clock on Tegra124
Date: Thu, 26 Dec 2013 16:44:24 -0800
Message-ID: <1388105067-24438-5-git-send-email-abrestic@chromium.org>
References: <1388105067-24438-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388105067-24438-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The host1x clock on Tegra124 is a 3-bit wide mux with 6 parents.
Change thte id to tegra_clk_host1x_8 so that the correct clock gets
registered.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 0fc9126..743ccb4 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -775,7 +775,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_gr3d] = { .dt_id = TEGRA124_CLK_GR_3D, .present = true },
 	[tegra_clk_disp2] = { .dt_id = TEGRA124_CLK_DISP2, .present = true },
 	[tegra_clk_disp1] = { .dt_id = TEGRA124_CLK_DISP1, .present = true },
-	[tegra_clk_host1x] = { .dt_id = TEGRA124_CLK_HOST1X, .present = true },
+	[tegra_clk_host1x_8] = { .dt_id = TEGRA124_CLK_HOST1X, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA124_CLK_VCP, .present = true },
 	[tegra_clk_i2s0] = { .dt_id = TEGRA124_CLK_I2S0, .present = true },
 	[tegra_clk_apbdma] = { .dt_id = TEGRA124_CLK_APBDMA, .present = true },
-- 
1.8.5.1
