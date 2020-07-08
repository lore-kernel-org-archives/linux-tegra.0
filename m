From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 5/6] gpio: max77620: Use irqchip template
Date: Wed,  8 Jul 2020 23:23:54 +0300
Message-ID: <20200708202355.28507-6-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This change addresses one of the GPIO-core TODOs for the MAX77620 driver
which requires modern drivers to use the irqchip template. Instead of
using the GPIO's irqchip-helpers for creating the IRQ domain, the
gpio_irq_chip structure is now filled by the driver itself and then
gpiochip_add_data() takes care of instantiating the IRQ domain for us.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 9121d2507f60..6c516aa7732d 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -277,6 +277,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	if (!mgpio)
 		return -ENOMEM;
 
+	mutex_init(&mgpio->buslock);
 	mgpio->rmap = chip->rmap;
 	mgpio->dev = &pdev->dev;
 
@@ -291,6 +292,11 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
 
+	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
+	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
+	mgpio->gpio_chip.irq.handler = handle_edge_irq;
+	mgpio->gpio_chip.irq.threaded = true;
+
 	platform_set_drvdata(pdev, mgpio);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &mgpio->gpio_chip, mgpio);
@@ -299,11 +305,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mutex_init(&mgpio->buslock);
-
-	gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
-				    0, handle_edge_irq, IRQ_TYPE_NONE);
-
 	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
 					max77620_gpio_irqhandler, IRQF_ONESHOT,
 					"max77620-gpio", mgpio);
@@ -312,9 +313,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gpiochip_set_nested_irqchip(&mgpio->gpio_chip, &max77620_gpio_irqchip,
-				    gpio_irq);
-
 	return 0;
 }
 
-- 
2.26.0
