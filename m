From: Marc Dietrich <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Subject: [PATCH V4] ARM: tegra: paz00: add clocks required for usb operation
Date: Wed, 10 Aug 2011 19:21:56 +0200
Message-ID: <201108101921.58149.marc.dietrich@ap.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These clocks are required for usb operation. pll_p_out4 needs to be set
to 24 MHz. The other clocks default to "off" in order to save some energy.
    
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 45111f6..cde36dc 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table paz00_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	216000000,	true },
 	{ "uartd",	"pll_p",	216000000,	true },
+
+	{ "pll_p_out4",	"pll_p",	24000000,	true },
+	{ "usbd",	"clk_m",	12000000,	false },
+	{ "usb2",	"clk_m",	12000000,	false },
+	{ "usb3",	"clk_m",	12000000,	false },
+
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
