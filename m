From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] ARM: tegra: Harmony: Set WM8903 gpio_base
Date: Fri,  4 Mar 2011 22:42:32 -0700
Message-ID: <1299303752-7779-6-git-send-email-swarren@nvidia.com>
References: <1299303752-7779-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299303752-7779-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is the final patch to enable audio support on Harmony. It additionally
relies on the latest ASoC branch being merged in, which provides the header
defining the gpio_base field in the WM8903 platform data.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index d002d16..57dc6ef 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -87,6 +87,7 @@ static struct wm8903_platform_data harmony_wm8903_pdata = {
 	.irq_active_low = 0,
 	.micdet_cfg = 0,
 	.micdet_delay = 100,
+	.gpio_base = HARMONY_GPIO_WM8903(0),
 	.gpio_cfg = {
 		WM8903_GPIO_NO_CONFIG,
 		WM8903_GPIO_NO_CONFIG,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
