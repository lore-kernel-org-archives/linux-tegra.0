From: Taylor Hutt <thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] arch: arm: tegra: Enable headphone detection gpio
Date: Fri, 28 Oct 2011 09:27:06 -0700
Message-ID: <1319819226-19098-1-git-send-email-thutt@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Enable the headphone detection gpio on tegra platform.

Signed-off-by: Yufeng Shen <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/mach-tegra/board-seaboard-pinmux.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/mach-tegra/board-seaboard-pinmux.c
index 9d0ba80..14e9d576 100644
--- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
+++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
@@ -205,6 +205,7 @@ static struct tegra_gpio_table common_gpio_table[] = {
 	{ .gpio = TEGRA_GPIO_NCT1008_THERM2_IRQ,.enable = true },
 	{ .gpio = TEGRA_GPIO_WLAN_POWER,	.enable = true },
 	{ .gpio = TEGRA_GPIO_AC_ONLINE,		.enable = true },
+	{ .gpio = TEGRA_GPIO_HP_DET,		.enable = true },
 	{ .gpio = TEGRA_GPIO_MXT_IRQ,		.enable = true },
 	{ .gpio = TEGRA_GPIO_HDMI_ENB,		.enable = true },
 	{ .gpio = TEGRA_GPIO_MPU3050_IRQ,	.enable = true },
-- 
1.7.3.1
