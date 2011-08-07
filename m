From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 4/5] ARM: tegra: paz00: add clocks required for usb operation
Date: Sun,  7 Aug 2011 21:00:54 +0200
Message-ID: <76f31183766f1edce1230a925ced1c986dbdf028.1312742856.git.marvin24@gmx.de>
References: <cover.1312735430.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1312735430.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1312742856.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1312742856.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These clocks are required for usb operation.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/mach-tegra/board-paz00.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 45111f6..8a2d1ce 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -145,6 +145,11 @@ static __initdata struct tegra_clk_init_table paz00_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	216000000,	true },
 	{ "uartd",	"pll_p",	216000000,	true },
+
+	{ "pll_a",      "pll_p_out1",   56448000,       true },
+	{ "pll_a_out0", "pll_a",        11289600,       true },
+	{ "pll_p_out4", "pll_p",        24000000,       true },
+
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.4.1
