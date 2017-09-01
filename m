From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/16] gpio: Move irq_base to struct gpio_irq_chip
Date: Fri,  1 Sep 2017 20:57:24 +0200
Message-ID: <20170901185736.28051-5-thierry.reding@gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c                      |  2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  2 +-
 include/linux/gpio/driver.h                 | 10 ++++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d8ea8a292978..e5ad28978d5c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1781,7 +1781,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		ops = &gpiochip_domain_ops;
 
 	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     gpiochip->irq_base,
+						     gpiochip->irq.first,
 						     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index e66ff18ee362..8df8a4998f48 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -681,7 +681,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	 * the chained irq with all of them.
 	 */
 	for (i = 0; i < nrirqs; i++) {
-		struct irq_data *d = irq_get_irq_data(gc->irq_base + i);
+		struct irq_data *d = irq_get_irq_data(gc->irq.first + i);
 
 		/*
 		 * The mask field is a "precomputed bitmask for
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 031037bb8670..9389406df0b1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -47,6 +47,14 @@ struct gpio_irq_chip {
 	const struct irq_domain_ops *domain_ops;
 
 	/**
+	 * @first:
+	 *
+	 * If not dynamically assigned, the base (first) IRQ to allocate GPIO
+	 * chip IRQs from (deprecated).
+	 */
+	unsigned int first;
+
+	/**
 	 * @parent_handler:
 	 *
 	 * The interrupt handler for the GPIO chip's parent interrupts, may be
@@ -152,7 +160,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
  * @irq_default_type: default IRQ triggering type applied during GPIO driver
@@ -232,7 +239,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-- 
2.13.3
