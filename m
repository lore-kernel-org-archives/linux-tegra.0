From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: Tegra: Add pll_d table entries for 252MHz
Date: Fri, 18 Feb 2011 16:18:11 -0700
Message-ID: <1298071093-23865-2-git-send-email-swarren@nvidia.com>
References: <1298071093-23865-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298071093-23865-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This rate is required for correct generation of 640x480 HDMI video;
see subsequent patches.

Note: I tested the entry with 12MHz input. The other entries are untested,
but appear logically correct. However, I'm not familiar enough with PLLs
to know if they perhaps exceed the PLL VCO frequency, nor whether the
cpcon values are strictly correct.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 41f5953..f3ead19 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1531,6 +1531,11 @@ static struct clk_pll_freq_table tegra_pll_d_freq_table[] = {
 	{ 19200000, 216000000, 135, 12, 1, 3},
 	{ 26000000, 216000000, 216, 26, 1, 4},
 
+	{ 12000000, 252000000, 252, 12, 1, 4},
+	{ 13000000, 252000000, 252, 13, 1, 4},
+	{ 19200000, 252000000, 210, 16, 1, 3},
+	{ 26000000, 252000000, 252, 26, 1, 4},
+
 	{ 12000000, 594000000, 594, 12, 1, 8},
 	{ 13000000, 594000000, 594, 13, 1, 8},
 	{ 19200000, 594000000, 495, 16, 1, 8},
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
