From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] gpio: tps65910: Use correct offset for gpio initialization
Date: Wed, 18 Jan 2012 20:07:35 +0530
Message-ID: <1326897455-8298-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Using the correct gpio offset for setting the initial value
of gpio when setting output direction.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tps65910.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index b9c1c29..91f45b9 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -52,7 +52,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
 	struct tps65910 *tps65910 = container_of(gc, struct tps65910, gpio);
 
 	/* Set the initial value */
-	tps65910_gpio_set(gc, 0, value);
+	tps65910_gpio_set(gc, offset, value);
 
 	return tps65910_set_bits(tps65910, TPS65910_GPIO0 + offset,
 						GPIO_CFG_MASK);
-- 
1.7.1.1
