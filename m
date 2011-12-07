From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/8] arm/tegra: board-dt: Enable audio-related clocks
Date: Wed,  7 Dec 2011 15:13:42 -0700
Message-ID: <1323296033-28730-4-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Certain clocks are required for core audio functionality. Set up the
appropriate parenting relationships, and enable clocks that must be
on permanently.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index ad13bb0..4c1541a 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -90,6 +90,11 @@ static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	{ "usbd",	"clk_m",	12000000,	false },
 	{ "usb2",	"clk_m",	12000000,	false },
 	{ "usb3",	"clk_m",	12000000,	false },
+	{ "pll_a",      "pll_p_out1",   56448000,       true },
+	{ "pll_a_out0", "pll_a",        11289600,       true },
+	{ "cdev1",      NULL,           0,              true },
+	{ "i2s1",       "pll_a_out0",   11289600,       false},
+	{ "i2s2",       "pll_a_out0",   11289600,       false},
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.0.4
