From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks required for usb operation
Date: Tue, 9 Aug 2011 20:29:17 +0200
Message-ID: <201108092029.17546.marvin24@gmx.de>
References: <cover.1312735430.git.marvin24@gmx.de> <76f31183766f1edce1230a925ced1c986dbdf028.1312742856.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <76f31183766f1edce1230a925ced1c986dbdf028.1312742856.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


These clocks are required for usb operation.
---
 arch/arm/mach-tegra/board-paz00.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 45111f6..89a3dda 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table paz00_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	216000000,	true },
 	{ "uartd",	"pll_p",	216000000,	true },
+
+	{ "pll_p_out4",	"pll_p",	24000000,	true },
+	{ "usbd",	"clk_m",	12000000,	true },
+	{ "usb2",	"clk_m",	12000000,	true },
+	{ "usb3",	"clk_m",	12000000,	true },
+
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.4.1
