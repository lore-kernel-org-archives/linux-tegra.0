From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: Tegra: Seaboard: Fix I2C bus numbering for ADT7461
Date: Wed, 13 Jul 2011 12:53:53 -0600
Message-ID: <1310583233-13886-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Bus number 4 doesn't exist in the mainline kernel. The device is
attached to bus number 3. (In the ChromeOS kernel, one of the I2C
busses is split in two with a mux, this pushing all later busses
to a higher bus number. In this case, 4 is the correct bus number
for the ADT7461).

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-seaboard.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
index a8d7ace..10fbbdc 100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -159,7 +159,7 @@ static void __init seaboard_i2c_init(void)
 
 	i2c_register_board_info(0, &isl29018_device, 1);
 
-	i2c_register_board_info(4, &adt7461_device, 1);
+	i2c_register_board_info(3, &adt7461_device, 1);
 
 	tegra_i2c_device1.dev.platform_data = &seaboard_i2c1_platform_data;
 	tegra_i2c_device2.dev.platform_data = &seaboard_i2c2_platform_data;
-- 
1.7.0.4
