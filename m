From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Wed, 29 May 2019 16:53:21 +0200
Message-ID: <20190529145322.20630-2-thierry.reding@gmail.com>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529145322.20630-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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
Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- add missing kerneldoc for new parent_domain field
- keep IRQ_DOMAIN dependency for clarity

Changes in v2:
- select IRQ_DOMAIN_HIERARCHY to avoid build failure
- move more code into the gpiolib core

 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpiolib.c      | 33 +++++++++++++++++++++++++++++----
 include/linux/gpio/driver.h |  8 ++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 62f3fe06cd2f..b87cc36005d8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -45,6 +45,7 @@ config GPIO_ACPI
 
 config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
 	bool
 
 config DEBUG_GPIO
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..6b64bfa90089 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1825,9 +1825,22 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
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
+		spec.param[1] = IRQ_TYPE_NONE;
+
+		return irq_create_fwspec_mapping(&spec);
+	}
+
 	return irq_create_mapping(chip->irq.domain, offset);
 }
 
@@ -1936,7 +1949,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
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
@@ -1946,9 +1966,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
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
index a1d273c96016..472f2c127bf6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -48,6 +48,14 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @parent_domain:
+	 *
+	 * If non-NULL, will be set as the parent of this GPIO interrupt
+	 * controller's IRQ domain to establish a hierarchy.
+	 */
+	struct irq_domain *parent_domain;
+
 	/**
 	 * @handler:
 	 *
-- 
2.21.0
