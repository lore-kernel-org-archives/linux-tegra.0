From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: turn on UART A clock at boot
Date: Tue, 24 Jul 2012 16:50:00 -0600
Message-ID: <1343170200-28228-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some boards use UART D for the main serial console, and some use UART A.
UART D's clock is listed in board-dt-tegra20.c's clock table, whereas
UART A's clock is not. This causes the clock code to think UART A's
clock is unsed. The common clock framework turns off unused clocks at
boot time. This makes the kernel appear to hang. Add UART A's clock into
the clock table to prevent this. Eventually, this requirement should be
handled by the UART driver, and/or properties in a board-specific device
tree file.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 70a19a9..5daffd5 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -71,6 +71,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 
 static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	/* name		parent		rate		enabled */
+	{ "uarta",	"pll_p",	216000000,	true },
 	{ "uartd",	"pll_p",	216000000,	true },
 	{ "usbd",	"clk_m",	12000000,	false },
 	{ "usb2",	"clk_m",	12000000,	false },
-- 
1.7.0.4
