From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/5] gpio: Add support for hierarchical IRQ domains
Date: Thu, 29 Nov 2018 18:03:08 +0100
Message-ID: <20181129170312.23625-2-thierry.reding@gmail.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129170312.23625-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hierarchical IRQ domains can be used to stack different IRQ controllers
on top of each other. One specific use-case where this can be useful is
if a power management controller has top-level controls for wakeup
interrupts. In such cases, the power management controller can be a
parent to other interrupt controllers and program additional registers
when an IRQ has its wake capability enabled or disabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- select IRQ_DOMAIN_HIERARCHY to avoid build failure
- move more code into the gpiolib core

 drivers/gpio/Kconfig        |  2 +-
 drivers/gpio/gpiolib.c      | 33 +++++++++++++++++++++++++++++----
 include/linux/gpio/driver.h |  6 ++++++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 587e5f005b61..1d8abaab09f7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -43,7 +43,7 @@ config GPIO_ACPI
 	depends on ACPI
 
 config GPIOLIB_IRQCHIP
-	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
 	bool
 
 config DEBUG_GPIO
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cd84315ad586..247ca4c1241f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1777,9 +1777,22 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
+	struct irq_domain *domain = chip->irq.domain;
+
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
 
+	if (irq_domain_is_hierarchy(domain)) {
+		struct irq_fwspec spec;
+
+		spec.fwnode = domain->fwnode;
+		spec.param_count = 2;
+		spec.param[0] = offset;
+		spec.param[1] = 0;
+
+		return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);
+	}
+
 	return irq_create_mapping(chip->irq.domain, offset);
 }
 
@@ -1888,7 +1901,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->to_irq = gpiochip_to_irq;
+	/*
+	 * Allow GPIO chips to override the ->to_irq() if they really need to.
+	 * This should only be very rarely needed, the majority should be fine
+	 * with gpiochip_to_irq().
+	 */
+	if (!gpiochip->to_irq)
+		gpiochip->to_irq = gpiochip_to_irq;
+
 	gpiochip->irq.default_type = type;
 	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.request_key = request_key;
@@ -1898,9 +1918,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 	else
 		ops = &gpiochip_domain_ops;
 
-	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     gpiochip->irq.first,
-						     ops, gpiochip);
+	if (gpiochip->irq.parent_domain)
+		gpiochip->irq.domain = irq_domain_add_hierarchy(gpiochip->irq.parent_domain,
+								0, gpiochip->ngpio,
+								np, ops, gpiochip);
+	else
+		gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+							     gpiochip->irq.first,
+							     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9c8d5d491680..eb8b35f1d8b6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -47,6 +47,12 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @parent_domain:
+	 *
+	 */
+	struct irq_domain *parent_domain;
+
 	/**
 	 * @handler:
 	 *
-- 
2.19.1
