From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH resend 1/2] clk: tegra: remove USB from clk init table
Date: Mon, 15 Apr 2013 09:31:44 +0200
Message-ID: <1366011105-2351-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The USB clocks are just clock gates, so no need to set a specific clock.
In fact trying to set a specific clock is just a NOP if the requested
clockrate is the same as those of the parent (clk_m) or will trigger a
WARN_ON() if rates don't match up.

As we are not setting a specific rate, nor activating the clocks at
init, there is no point in keeping the the usb entries in the clock init
table.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
Trace produced by system with 13MHz clk_m:

tegra_init_from_table: Failed to set rate 12000000 of usbd
------------[ cut here ]------------
WARNING: at drivers/clk/tegra/clk.c:64
tegra_init_from_table+0xc0/0x158()
Modules linked in:
[<c0013a84>] (unwind_backtrace+0x0/0xf8) from
[<c0021a24>](warn_slowpath_common+0x4c/0x64)
[<c0021a24>] (warn_slowpath_common+0x4c/0x64) from [<c0021a58>]
(warn_slowpath_null+0x1c/0x24)
[<c0021a58>] (warn_slowpath_null+0x1c/0x24) from [<c069343c>]
(tegra_init_from_table+0xc0/0x158)
[<c069343c>] (tegra_init_from_table+0xc0/0x158) from [<c0694878>]
(tegra20_clock_init+0x1398/0x13d4)
[<c0694878>] (tegra20_clock_init+0x1398/0x13d4) from [<c0693298>]
(of_clk_init+0x30/0x58)
[<c0693298>] (of_clk_init+0x30/0x58) from [<c0681e5c>]
(tegra_dt_init_irq+0x8/0x1c)
[<c0681e5c>] (tegra_dt_init_irq+0x8/0x1c) from [<c067d334>]
(init_IRQ+0x14/0x1c)
[<c067d334>] (init_IRQ+0x14/0x1c) from [<c067b6b4>]
(start_kernel+0x1a0/0x2f8)
[<c067b6b4>] (start_kernel+0x1a0/0x2f8) from [<0000807c>] (0x807c)
---[ end trace 1b75b31a2719ed1c ]---
---
 drivers/clk/tegra/clk-tegra20.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index f873dce..a73278f 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1259,9 +1259,6 @@ static __initdata struct tegra_clk_init_table init_table[] = {
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
1.8.1.4
