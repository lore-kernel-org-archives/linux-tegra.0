From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 06/11] ARM: tegra: seaboard: Don't gpio_request() ISL29018_IRQ
Date: Fri, 30 Mar 2012 16:59:59 -0600
Message-ID: <1333148404-17691-7-git-send-email-swarren@wwwdotorg.org>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148404-17691-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Don't call gpio_request() or gpio_direction_input() for ISL29018_IRQ.
This pin is only used as an IRQ, and hence no GPIO configuration should
be necessary; the GPIO/IRQ driver should (and does) perform any required
setup when the IRQ is requested.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-seaboard.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
index e6642c6..0b2b9ce 100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -199,9 +199,6 @@ static int seaboard_ehci_init(void)
 
 static void __init seaboard_i2c_init(void)
 {
-	gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
-	gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
-
 	isl29018_device.irq = gpio_to_irq(TEGRA_GPIO_ISL29018_IRQ);
 	i2c_register_board_info(0, &isl29018_device, 1);
 
-- 
1.7.0.4
