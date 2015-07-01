From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v1 1/3] gpio: defer probe if pinctrl cannot be found
Date: Wed,  1 Jul 2015 14:45:51 +0200
Message-ID: <1435754753-31307-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
the pin controller isn't available.

Otherwise, the GPIO range wouldn't be set at all unless the pin
controller probed always before the GPIO chip.

With this change, the probe of the GPIO chip will be deferred and will
be retried at a later point, hopefully once the pin controller has been
registered and probed already.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

 drivers/gpio/gpiolib-of.c | 27 ++++++++++++++++++---------
 drivers/gpio/gpiolib.c    |  5 ++++-
 include/linux/of_gpio.h   |  4 ++--
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 9a0ec48..4e1f73b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -338,7 +338,7 @@ void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc)
 EXPORT_SYMBOL(of_mm_gpiochip_remove);
 
 #ifdef CONFIG_PINCTRL
-static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
+static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 {
 	struct device_node *np = chip->of_node;
 	struct of_phandle_args pinspec;
@@ -349,7 +349,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	struct property *group_names;
 
 	if (!np)
-		return;
+		return 0;
 
 	group_names = of_find_property(np, group_names_propname, NULL);
 
@@ -361,7 +361,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 
 		pctldev = of_pinctrl_get(pinspec.np);
 		if (!pctldev)
-			break;
+			return -EPROBE_DEFER;
 
 		if (pinspec.args[2]) {
 			if (group_names) {
@@ -381,7 +381,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 					pinspec.args[1],
 					pinspec.args[2]);
 			if (ret)
-				break;
+				return ret;
 		} else {
 			/* npins == 0: special range */
 			if (pinspec.args[1]) {
@@ -411,32 +411,41 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			ret = gpiochip_add_pingroup_range(chip, pctldev,
 						pinspec.args[0], name);
 			if (ret)
-				break;
+				return ret;
 		}
 	}
+
+	return 0;
 }
 
 #else
-static void of_gpiochip_add_pin_range(struct gpio_chip *chip) {}
+static int of_gpiochip_add_pin_range(struct gpio_chip *chip) { return 0; }
 #endif
 
-void of_gpiochip_add(struct gpio_chip *chip)
+int of_gpiochip_add(struct gpio_chip *chip)
 {
+	int status;
+
 	if ((!chip->of_node) && (chip->dev))
 		chip->of_node = chip->dev->of_node;
 
 	if (!chip->of_node)
-		return;
+		return 0;
 
 	if (!chip->of_xlate) {
 		chip->of_gpio_n_cells = 2;
 		chip->of_xlate = of_gpio_simple_xlate;
 	}
 
-	of_gpiochip_add_pin_range(chip);
+	status = of_gpiochip_add_pin_range(chip);
+	if (status)
+		return status;
+
 	of_node_get(chip->of_node);
 
 	of_gpiochip_scan_hogs(chip);
+
+	return 0;
 }
 
 void of_gpiochip_remove(struct gpio_chip *chip)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d..a8cab33 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -287,7 +287,10 @@ int gpiochip_add(struct gpio_chip *chip)
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
 
-	of_gpiochip_add(chip);
+	status = of_gpiochip_add(chip);
+	if (status)
+		goto err_remove_chip;
+
 	acpi_gpiochip_add(chip);
 
 	status = gpiochip_sysfs_register(chip);
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 69dbe31..f319182 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -54,7 +54,7 @@ extern int of_mm_gpiochip_add(struct device_node *np,
 			      struct of_mm_gpio_chip *mm_gc);
 extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 
-extern void of_gpiochip_add(struct gpio_chip *gc);
+extern int of_gpiochip_add(struct gpio_chip *gc);
 extern void of_gpiochip_remove(struct gpio_chip *gc);
 extern int of_gpio_simple_xlate(struct gpio_chip *gc,
 				const struct of_phandle_args *gpiospec,
@@ -76,7 +76,7 @@ static inline int of_gpio_simple_xlate(struct gpio_chip *gc,
 	return -ENOSYS;
 }
 
-static inline void of_gpiochip_add(struct gpio_chip *gc) { }
+static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
 static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 
 #endif /* CONFIG_OF_GPIO */
-- 
2.4.1

