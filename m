From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 14/15] gpio: Introduce struct gpio_irq_chip.first
Date: Tue,  7 Nov 2017 19:15:58 +0100
Message-ID: <20171107181559.6318-15-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some GPIO chips cannot support sparse IRQ numbering and therefore need
to manually allocate their interrupt descriptors statically. For these
cases, a driver can pass the first allocated IRQ via the struct
gpio_irq_chip's "first" field and thereby cause the IRQ domain to map
all IRQs during initialization.

Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 3 ++-
 include/linux/gpio/driver.h | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 17f4b843f058..35fb13e98d84 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1778,7 +1778,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		ops = &gpiochip_domain_ops;
 
 	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     0, ops, gpiochip);
+						     gpiochip->irq.first,
+						     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3fd7438f3596..241af05498f9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -129,6 +129,14 @@ struct gpio_irq_chip {
 	 * in IRQ domain of the chip.
 	 */
 	unsigned long *valid_mask;
+
+	/**
+	 * @first:
+	 *
+	 * Required for static IRQ allocation. If set, irq_domain_add_simple()
+	 * will allocate and map all IRQs during initialization.
+	 */
+	unsigned int first;
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
-- 
2.14.1
