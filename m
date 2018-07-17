From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] gpio: tegra: Fix tegra_gpio_irq_set_type()
Date: Tue, 17 Jul 2018 19:10:38 +0300
Message-ID: <20180717161038.21500-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
broke tegra_gpio_irq_set_type() because requesting of GPIO direction must
be done after enabling GPIO function for a pin.

This patch fixes drivers probe failure like this:

 gpio gpiochip0: (tegra-gpio): gpiochip_lock_as_irq: cannot get GPIO direction
 tegra-gpio 6000d000.gpio: unable to lock Tegra GPIO 144 as IRQ

Fixes: 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 94396caaca75..22e7c99ed69e 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -323,13 +323,6 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
-	if (ret) {
-		dev_err(tgi->dev,
-			"unable to lock Tegra GPIO %u as IRQ\n", gpio);
-		return ret;
-	}
-
 	spin_lock_irqsave(&bank->lvl_lock[port], flags);
 
 	val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
@@ -342,6 +335,14 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
 	tegra_gpio_enable(tgi, gpio);
 
+	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
+	if (ret) {
+		dev_err(tgi->dev,
+			"unable to lock Tegra GPIO %u as IRQ\n", gpio);
+		tegra_gpio_disable(tgi, gpio);
+		return ret;
+	}
+
 	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
 		irq_set_handler_locked(d, handle_level_irq);
 	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
-- 
2.18.0
