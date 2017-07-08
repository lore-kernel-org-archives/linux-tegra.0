From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC/RFT PATCH 3/3] gpiolib: make gpio irqchip compatible with sparse_irq
Date: Sat, 8 Jul 2017 17:44:13 -0500
Message-ID: <20170708224413.18281-4-grygorii.strashko@ti.com>
References: <20170708224413.18281-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170708224413.18281-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-tegra@vger.kernel.org

Now IRQ mappings are always created for all (allowed) GPIOs in gpio irqchip in
gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
as result, leads to:
 - increasing of memory consumption because of allocated IRQ descriptors most
of which will never ever be used (especially on platform with a
high number of GPIOs)
 - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
GPIO IRQ functionality as IRQ crossbar/multiplexer which has only limited
number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
IRQs).

Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
instead replace irq_find_mapping() with irq_create_mapping() in
gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
in gpiochip_to_irq() and gpiochip_irq_map().

After this change gpio2irq mapping will happen the following way when GPIO
irqchip APIs are used by gpio driver:
 - IRQ mappings will be created statically if driver passes first_irq>0
vlaue in gpiochip_irqchip_add_key().
 - IRQ mappings will be created dynamically from gpio_to_irq() or
of_irq_get().

[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1435847.html
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpiolib.c      | 29 ++++++-----------------------
 include/linux/gpio/driver.h |  1 -
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9568708..ee6ba07 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1605,6 +1605,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct gpio_chip *chip = d->host_data;
 
+	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
+		return -ENXIO;
+
 	irq_set_chip_data(irq, chip);
 	/*
 	 * This lock class tells lockdep that GPIO irqs are in a different
@@ -1671,7 +1674,9 @@ static void gpiochip_irq_relres(struct irq_data *d)
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_find_mapping(chip->irqdomain, offset);
+	if (!gpiochip_irqchip_irq_valid(chip, offset))
+		return -ENXIO;
+	return irq_create_mapping(chip->irqdomain, offset);
 }
 
 /**
@@ -1747,9 +1752,6 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
-	bool irq_base_set = false;
-	unsigned int offset;
-	unsigned irq_base = 0;
 
 	if (!gpiochip || !irqchip)
 		return -EINVAL;
@@ -1806,25 +1808,6 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		irqchip->irq_release_resources = gpiochip_irq_relres;
 	}
 
-	/*
-	 * Prepare the mapping since the irqchip shall be orthogonal to
-	 * any gpiochip calls. If the first_irq was zero, this is
-	 * necessary to allocate descriptors for all IRQs.
-	 */
-	for (offset = 0; offset < gpiochip->ngpio; offset++) {
-		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
-			continue;
-		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-		if (!irq_base_set) {
-			/*
-			 * Store the base into the gpiochip to be used when
-			 * unmapping the irqs.
-			 */
-			gpiochip->irq_base = irq_base;
-			irq_base_set = true;
-		}
-	}
-
 	acpi_gpiochip_request_interrupts(gpiochip);
 
 	return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index af20369..a3e2e3e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -165,7 +165,6 @@ struct gpio_chip {
 	 */
 	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
-	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-- 
2.10.1
