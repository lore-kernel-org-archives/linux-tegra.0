From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: Tegra: Harmony: Register and configure WM8903 IRQ GPIO
Date: Wed, 13 Jul 2011 14:40:17 -0600
Message-ID: <1310589618-16080-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Technically, we need to request and configure the GPIO used as the WM8903
interrupt. This prevents conflicting registrations, and assures that the
GPIO is correctly configured in all cases, e.g. if the bootloader left the
GPIO in some unexpected state.

In practice, the previous code works as-is, at least when using ChromeOS's
U-Boot as the boot-loader.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 846cd7d..e4548a5 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -109,6 +109,9 @@ static void __init harmony_i2c_init(void)
 	platform_device_register(&tegra_i2c_device3);
 	platform_device_register(&tegra_i2c_device4);
 
+	gpio_request(TEGRA_GPIO_CDC_IRQ, "wm8903");
+	gpio_direction_input(TEGRA_GPIO_CDC_IRQ);
+
 	i2c_register_board_info(0, &wm8903_board_info, 1);
 }
 
-- 
1.7.0.4
