From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] clk: tegra: remove USB from clk init table
Date: Mon,  6 May 2013 15:11:10 -0600
Message-ID: <1367874671-11474-2-git-send-email-swarren@wwwdotorg.org>
References: <1367874671-11474-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367874671-11474-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

The USB clocks are just clock gates, so no need to set a specific clock.
In fact trying to set a specific clock is just a NOP if the requested
clockrate is the same as those of the parent (clk_m) or will trigger a
WARN_ON() if rates don't match up.

As we are not setting a specific rate, nor activating the clocks at
init, there is no point in keeping the the usb entries in the clock init
table.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index b0405b6..ecfe532 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1234,9 +1234,6 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{uartc, pll_p, 0, 0},
 	{uartd, pll_p, 0, 0},
 	{uarte, pll_p, 0, 0},
-	{usbd, clk_max, 12000000, 0},
-	{usb2, clk_max, 12000000, 0},
-	{usb3, clk_max, 12000000, 0},
 	{pll_a, clk_max, 56448000, 1},
 	{pll_a_out0, clk_max, 11289600, 1},
 	{cdev1, clk_max, 0, 1},
-- 
1.7.10.4
