From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v5 04/13] gpio: Move irq_base to struct gpio_irq_chip
Date: Fri, 13 Oct 2017 17:49:04 +0200
Message-ID: <20171013154913.29448-5-thierry.reding@gmail.com>
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
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  2 +-
 include/linux/gpio/driver.h                 | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index c9851bd120b4..500238d898ea 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -627,7 +627,7 @@ static void armada_37xx_irq_handler(struct irq_desc *desc)
 static unsigned int armada_37xx_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	int irq = d->hwirq - chip->irq_base;
+	int irq = d->hwirq - chip->irq.first;
 	/*
 	 * The mask field is a "precomputed bitmask for accessing the
 	 * chip registers" which was introduced for the generic
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 794bc6058282..20a056e13f60 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -46,6 +46,14 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @first:
+	 *
+	 * If not dynamically assigned, the base (first) IRQ to allocate GPIO
+	 * chip IRQs from (deprecated).
+	 */
+	unsigned int first;
+
 	/**
 	 * @parent_handler:
 	 *
@@ -130,7 +138,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
  * @irq_default_type: default IRQ triggering type applied during GPIO driver
@@ -210,7 +217,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-- 
2.14.1
