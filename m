From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 15/15] gpio: Automatically add lockdep keys
Date: Tue,  7 Nov 2017 19:15:59 +0100
Message-ID: <20171107181559.6318-16-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to avoid lockdep boilerplate in individual drivers, turn the
gpiochip_add_data() function into a macro that creates a unique class
key for each driver.

Note that this has the slight disadvantage of adding a key for each
driver registered with the system. However, these keys are 8 bytes in
size, which is negligible and a small price to pay for generic
infrastructure.

Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 41 ++++++++++++-----------------------------
 include/linux/gpio/driver.h | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 35fb13e98d84..f227a2af2314 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -72,7 +72,8 @@ static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip);
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+				struct lock_class_key *key);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
@@ -1098,30 +1099,8 @@ static void gpiochip_setup_devs(void)
 	}
 }
 
-/**
- * gpiochip_add_data() - register a gpio_chip
- * @chip: the chip to register, with chip->base initialized
- * @data: driver-private data associated with this chip
- *
- * Context: potentially before irqs will work
- *
- * When gpiochip_add_data() is called very early during boot, so that GPIOs
- * can be freely used, the chip->parent device must be registered before
- * the gpio framework's arch_initcall().  Otherwise sysfs initialization
- * for GPIOs will fail rudely.
- *
- * gpiochip_add_data() must only be called after gpiolib initialization,
- * ie after core_initcall().
- *
- * If chip->base is negative, this requests dynamic assignment of
- * a range of valid GPIOs.
- *
- * Returns:
- * A negative errno if the chip can't be registered, such as because the
- * chip->base is invalid or already associated with a different chip.
- * Otherwise it returns zero as a success code.
- */
-int gpiochip_add_data(struct gpio_chip *chip, void *data)
+int __gpiochip_add_data(struct gpio_chip *chip, void *data,
+			struct lock_class_key *key)
 {
 	unsigned long	flags;
 	int		status = 0;
@@ -1267,7 +1246,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
-	status = gpiochip_add_irqchip(chip);
+	status = gpiochip_add_irqchip(chip, key);
 	if (status)
 		goto err_remove_chip;
 
@@ -1314,7 +1293,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	kfree(gdev);
 	return status;
 }
-EXPORT_SYMBOL_GPL(gpiochip_add_data);
+EXPORT_SYMBOL_GPL(__gpiochip_add_data);
 
 /**
  * gpiochip_get_data() - get per-subdriver data for the chip
@@ -1733,8 +1712,10 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 /**
  * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
  * @gpiochip: the GPIO chip to add the IRQ chip to
+ * @lock_key: lockdep class
  */
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+				struct lock_class_key *lock_key)
 {
 	struct irq_chip *irqchip = gpiochip->irq.chip;
 	const struct irq_domain_ops *ops;
@@ -1771,6 +1752,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq.default_type = type;
+	gpiochip->irq.lock_key = lock_key;
 
 	if (gpiochip->irq.domain_ops)
 		ops = gpiochip->irq.domain_ops;
@@ -1957,7 +1939,8 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
-static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
+				       struct lock_dep_class *lock_key)
 {
 	return 0;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 241af05498f9..a6d1a1931e86 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -322,7 +322,41 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 			unsigned offset);
 
 /* add/remove chips */
-extern int gpiochip_add_data(struct gpio_chip *chip, void *data);
+extern int __gpiochip_add_data(struct gpio_chip *chip, void *data,
+			       struct lock_class_key *lock_key);
+
+/**
+ * gpiochip_add_data() - register a gpio_chip
+ * @chip: the chip to register, with chip->base initialized
+ * @data: driver-private data associated with this chip
+ *
+ * Context: potentially before irqs will work
+ *
+ * When gpiochip_add_data() is called very early during boot, so that GPIOs
+ * can be freely used, the chip->parent device must be registered before
+ * the gpio framework's arch_initcall().  Otherwise sysfs initialization
+ * for GPIOs will fail rudely.
+ *
+ * gpiochip_add_data() must only be called after gpiolib initialization,
+ * ie after core_initcall().
+ *
+ * If chip->base is negative, this requests dynamic assignment of
+ * a range of valid GPIOs.
+ *
+ * Returns:
+ * A negative errno if the chip can't be registered, such as because the
+ * chip->base is invalid or already associated with a different chip.
+ * Otherwise it returns zero as a success code.
+ */
+#ifdef CONFIG_LOCKDEP
+#define gpiochip_add_data(chip, data) ({		\
+		static struct lock_class_key key;	\
+		__gpiochip_add_data(chip, data, &key);	\
+	})
+#else
+#define gpiochip_add_data(chip, data) __gpiochip_add_data(chip, data, NULL)
+#endif
+
 static inline int gpiochip_add(struct gpio_chip *chip)
 {
 	return gpiochip_add_data(chip, NULL);
-- 
2.14.1

