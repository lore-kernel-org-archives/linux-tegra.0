From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v5 10/13] gpio: Move lock_key into struct gpio_irq_chip
Date: Fri, 13 Oct 2017 17:49:10 +0200
Message-ID: <20171013154913.29448-11-thierry.reding@gmail.com>
References: <20171013154913.29448-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013154913.29448-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 4 ++--
 include/linux/gpio/driver.h | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4407423dc29b..eb487af120d9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1640,7 +1640,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * This lock class tells lockdep that GPIO irqs are in a different
 	 * category than their parents, so it won't report false recursion.
 	 */
-	irq_set_lockdep_class(irq, chip->lock_key);
+	irq_set_lockdep_class(irq, chip->irq.lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq.nested)
@@ -1825,7 +1825,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	gpiochip->irq.handler = handler;
 	gpiochip->irq.default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->lock_key = lock_key;
+	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.domain = irq_domain_add_simple(of_node,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index fc25fb070843..4ae8dd945617 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -70,6 +70,13 @@ struct gpio_irq_chip {
 	 */
 	unsigned int default_type;
 
+	/**
+	 * @lock_key:
+	 *
+	 * Per GPIO IRQ chip lockdep class.
+	 */
+	struct lock_class_key *lock_key;
+
 	/**
 	 * @parent_handler:
 	 *
@@ -191,7 +198,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -258,7 +264,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct lock_class_key	*lock_key;
 
 	/**
 	 * @irq:
-- 
2.14.1
