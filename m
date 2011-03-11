From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: harmony: Register and configure WM8903 IRQ GPIO
Date: Fri, 11 Mar 2011 13:25:43 -0700
Message-ID: <1299875143-19096-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
index e7c2fea..91178a6 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -130,6 +130,9 @@ static void __init harmony_i2c_init(void)
 	platform_device_register(&tegra_i2c_device3);
 	platform_device_register(&tegra_i2c_device4);
 
+	gpio_request(TEGRA_GPIO_CDC_IRQ, "wm8903");
+	gpio_direction_input(TEGRA_GPIO_CDC_IRQ);
+
 	i2c_register_board_info(0, &wm8903_board_info, 1);
 }
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
