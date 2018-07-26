From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] gpio: tegra: drop tegra specific GPIO lockdep classes
Date: Thu, 26 Jul 2018 17:42:52 +0200
Message-ID: <20180726154252.14137-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Since commit e45d1c80c0ee ("gpio: put GPIO IRQs into their own lock
class") and commit a0a8bcf4670c ("gpiolib: irqchip: use different
lockdep class for each gpio irqchip") GPIO lib takes care of lockdep
classes. In fact, gpiochip_irq_map() overwrites the class anyway, so
the lockdep class set by the driver is useless. Remove it.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpio/gpio-tegra.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 94396caaca75..e5fcc012179e 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -550,13 +550,6 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
-/*
- * This lock class tells lockdep that GPIO irqs are in a different category
- * than their parents, so it won't report false recursion.
- */
-static struct lock_class_key gpio_lock_class;
-static struct lock_class_key gpio_request_class;
-
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
@@ -661,8 +654,6 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 		bank = &tgi->bank_info[GPIO_BANK(gpio)];
 
-		irq_set_lockdep_class(irq, &gpio_lock_class,
-				      &gpio_request_class);
 		irq_set_chip_data(irq, bank);
 		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
 	}
-- 
2.18.0
