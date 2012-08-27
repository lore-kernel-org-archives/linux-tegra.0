From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/6] ARM: tegra: set up wlan clocks for tegra dt
Date: Mon, 27 Aug 2012 18:25:09 +0800
Message-ID: <1346063114-30361-2-git-send-email-wni@nvidia.com>
References: <1346063114-30361-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346063114-30361-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, brudley-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rvossen-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: krakesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set up the wlan clock tree for Tegra20 and Tegra30.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c |    4 ++++
 arch/arm/mach-tegra/board-dt-tegra30.c |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index d9eeae6..5efc219 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -79,8 +79,12 @@ static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	{ "pll_a",      "pll_p_out1",   56448000,       true },
 	{ "pll_a_out0", "pll_a",        11289600,       true },
 	{ "cdev1",      NULL,           0,              true },
+	{ "blink",      "clk_32k",      32768,          true },
 	{ "i2s1",       "pll_a_out0",   11289600,       false},
 	{ "i2s2",       "pll_a_out0",   11289600,       false},
+	{ "sdmmc1",	"pll_p",	48000000,	false},
+	{ "sdmmc3",	"pll_p",	48000000,	false},
+	{ "sdmmc4",	"pll_p",	48000000,	false},
 	{ NULL,		NULL,		0,		0},
 };
 
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 53bf60f..3277d1e 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -61,11 +61,15 @@ static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	{ "pll_a_out0",	"pll_a",	11289600,	true },
 	{ "extern1",	"pll_a_out0",	0,		true },
 	{ "clk_out_1",	"extern1",	0,		true },
+	{ "blink",	"clk_32k",	32768,		true },
 	{ "i2s0",	"pll_a_out0",	11289600,	false},
 	{ "i2s1",	"pll_a_out0",	11289600,	false},
 	{ "i2s2",	"pll_a_out0",	11289600,	false},
 	{ "i2s3",	"pll_a_out0",	11289600,	false},
 	{ "i2s4",	"pll_a_out0",	11289600,	false},
+	{ "sdmmc1",	"pll_p",	48000000,	false},
+	{ "sdmmc3",	"pll_p",	48000000,	false},
+	{ "sdmmc4",	"pll_p",	48000000,	false},
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
