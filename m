From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 01/12] gpio: Introduce struct gpio_irq_chip
Date: Thu,  2 Nov 2017 18:49:30 +0100
Message-ID: <20171102174941.3461-2-thierry.reding@gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This new structure will be used to group all fields related to interrupt
handling in a GPIO chip. Doing so will properly namespace these fields
and make it easier to distinguish which fields are used for IRQ support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/gpio/driver.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ed04fa2a00a8..36a065521fa0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -19,6 +19,36 @@ struct module;
 
 #ifdef CONFIG_GPIOLIB
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+/**
+ * struct gpio_irq_chip - GPIO interrupt controller
+ */
+struct gpio_irq_chip {
+	/**
+	 * @domain_ops:
+	 *
+	 * Table of interrupt domain operations for this IRQ chip.
+	 */
+	const struct irq_domain_ops *domain_ops;
+
+	/**
+	 * @parent_handler:
+	 *
+	 * The interrupt handler for the GPIO chip's parent interrupts, may be
+	 * NULL if the parent interrupts are nested rather than cascaded.
+	 */
+	irq_flow_handler_t parent_handler;
+
+	/**
+	 * @parent_handler_data:
+	 *
+	 * Data associated, and passed to, the handler for the parent
+	 * interrupt.
+	 */
+	void *parent_handler_data;
+};
+#endif
+
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: a functional name for the GPIO device, such as a part
@@ -176,6 +206,14 @@ struct gpio_chip {
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
+
+	/**
+	 * @irq:
+	 *
+	 * Integrates interrupt chip functionality with the GPIO chip. Can be
+	 * used to handle IRQs for most practical cases.
+	 */
+	struct gpio_irq_chip irq;
 #endif
 
 #if defined(CONFIG_OF_GPIO)
-- 
2.14.1
