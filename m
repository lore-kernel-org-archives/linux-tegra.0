From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 11/12] gpio: Export gpiochip_irq_{map,unmap}()
Date: Thu,  2 Nov 2017 18:49:40 +0100
Message-ID: <20171102174941.3461-12-thierry.reding@gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Export these functions so that drivers can explicitly use these when
setting up their IRQ domain.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 8 +++++---
 include/linux/gpio/driver.h | 4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5bc99d08d538..c65322532906 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1638,8 +1638,8 @@ EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
  * gpiochip by assigning the gpiochip as chip data, and using the irqchip
  * stored inside the gpiochip.
  */
-static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
-			    irq_hw_number_t hwirq)
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
 
@@ -1667,8 +1667,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_map);
 
-static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
@@ -1677,6 +1678,7 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_unmap);
 
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 51fc7b023364..bbe5c647f29d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -367,6 +367,10 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq);
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
+
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq,
-- 
2.14.1

