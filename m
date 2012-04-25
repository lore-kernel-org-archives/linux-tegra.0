From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: add pll_x freq table entry for 750MHz
Date: Wed, 25 Apr 2012 12:18:12 -0600
Message-ID: <1335377892-26367-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some SKUs limit the maximum CPU frequency to 750MHz; see
tegra2_pllx_clk_init(). The pll_x frequency table needs an entry for this
frequency, or there will be continual log spam from the cpufreq driver
attempting to set this rate, yet there being no table entry for it.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 0bf0f2d..b59315c 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1768,6 +1768,12 @@ static struct clk_pll_freq_table tegra_pll_x_freq_table[] = {
 	{ 19200000, 760000000,  950,  24, 1, 8},
 	{ 26000000, 760000000,  760,  26, 1, 12},
 
+	/* 750 MHz */
+	{ 12000000, 750000000,  750,  12, 1, 12},
+	{ 13000000, 750000000,  750,  13, 1, 12},
+	{ 19200000, 750000000,  625,  16, 1, 8},
+	{ 26000000, 750000000,  750,  26, 1, 12},
+
 	/* 608 MHz */
 	{ 12000000, 608000000,  608,  12, 1, 12},
 	{ 13000000, 608000000,  608,  13, 1, 12},
-- 
1.7.0.4
