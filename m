From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 16/16] gpio: tegra186: Use banked GPIO infrastructure
Date: Fri,  1 Sep 2017 20:57:36 +0200
Message-ID: <20170901185736.28051-17-thierry.reding@gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra186 GPIO driver to use the banked GPIO infrastructure,
which simplifies some parts of the driver.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 211 ++++++++++++++++---------------------------
 1 file changed, 79 insertions(+), 132 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 162dc6b41ae8..4926b98a05f6 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/gpio/tegra186-gpio.h>
@@ -44,15 +45,27 @@
 
 #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
 
-struct tegra_gpio_port {
+struct tegra_gpio_port_soc {
 	const char *name;
 	unsigned int offset;
 	unsigned int pins;
 	unsigned int irq;
 };
 
+struct tegra_gpio_port {
+	struct gpio_bank bank;
+	unsigned int offset;
+	const char *name;
+};
+
+static inline struct tegra_gpio_port *
+to_tegra_gpio_port(struct gpio_bank *bank)
+{
+	return container_of(bank, struct tegra_gpio_port, bank);
+}
+
 struct tegra_gpio_soc {
-	const struct tegra_gpio_port *ports;
+	const struct tegra_gpio_port_soc *ports;
 	unsigned int num_ports;
 	const char *name;
 };
@@ -60,21 +73,21 @@ struct tegra_gpio_soc {
 struct tegra_gpio {
 	struct gpio_chip gpio;
 	struct irq_chip intc;
-	unsigned int num_irq;
-	unsigned int *irq;
 
 	const struct tegra_gpio_soc *soc;
 
+	struct tegra_gpio_port *ports;
+
 	void __iomem *base;
 };
 
-static const struct tegra_gpio_port *
+static const struct tegra_gpio_port_soc *
 tegra186_gpio_get_port(struct tegra_gpio *gpio, unsigned int *pin)
 {
 	unsigned int start = 0, i;
 
 	for (i = 0; i < gpio->soc->num_ports; i++) {
-		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
+		const struct tegra_gpio_port_soc *port = &gpio->soc->ports[i];
 
 		if (*pin >= start && *pin < start + port->pins) {
 			*pin -= start;
@@ -90,7 +103,7 @@ tegra186_gpio_get_port(struct tegra_gpio *gpio, unsigned int *pin)
 static void __iomem *tegra186_gpio_get_base(struct tegra_gpio *gpio,
 					    unsigned int pin)
 {
-	const struct tegra_gpio_port *port;
+	const struct tegra_gpio_port_soc *port;
 
 	port = tegra186_gpio_get_port(gpio, &pin);
 	if (!port)
@@ -206,39 +219,10 @@ static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
 }
 
-static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
-				  const struct of_phandle_args *spec,
-				  u32 *flags)
-{
-	struct tegra_gpio *gpio = gpiochip_get_data(chip);
-	unsigned int port, pin, i, offset = 0;
-
-	if (WARN_ON(chip->of_gpio_n_cells < 2))
-		return -EINVAL;
-
-	if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
-		return -EINVAL;
-
-	port = spec->args[0] / 8;
-	pin = spec->args[0] % 8;
-
-	if (port >= gpio->soc->num_ports) {
-		dev_err(chip->parent, "invalid port number: %u\n", port);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < port; i++)
-		offset += gpio->soc->ports[i].pins;
-
-	if (flags)
-		*flags = spec->args[1];
-
-	return offset + pin;
-}
-
 static void tegra186_irq_ack(struct irq_data *data)
 {
-	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
 
 	base = tegra186_gpio_get_base(gpio, data->hwirq);
@@ -250,7 +234,8 @@ static void tegra186_irq_ack(struct irq_data *data)
 
 static void tegra186_irq_mask(struct irq_data *data)
 {
-	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
 	u32 value;
 
@@ -265,7 +250,8 @@ static void tegra186_irq_mask(struct irq_data *data)
 
 static void tegra186_irq_unmask(struct irq_data *data)
 {
-	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
 	u32 value;
 
@@ -280,7 +266,8 @@ static void tegra186_irq_unmask(struct irq_data *data)
 
 static int tegra186_irq_set_type(struct irq_data *data, unsigned int flow)
 {
-	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
 	u32 value;
 
@@ -332,76 +319,22 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int flow)
 	return 0;
 }
 
-static void tegra186_gpio_irq(struct irq_desc *desc)
-{
-	struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
-	struct irq_domain *domain = gpio->gpio.irq.domain;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned int parent = irq_desc_get_irq(desc);
-	unsigned int i, offset = 0;
-
-	chained_irq_enter(chip, desc);
-
-	for (i = 0; i < gpio->soc->num_ports; i++) {
-		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
-		void __iomem *base = gpio->base + port->offset;
-		unsigned int pin, irq;
-		unsigned long value;
-
-		/* skip ports that are not associated with this controller */
-		if (parent != gpio->irq[port->irq])
-			goto skip;
-
-		value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
-
-		for_each_set_bit(pin, &value, port->pins) {
-			irq = irq_find_mapping(domain, offset + pin);
-			if (WARN_ON(irq == 0))
-				continue;
-
-			generic_handle_irq(irq);
-		}
-
-skip:
-		offset += port->pins;
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
-					  struct device_node *np,
-					  const u32 *spec, unsigned int size,
-					  unsigned long *hwirq,
-					  unsigned int *type)
+static void tegra186_gpio_update_bank(struct gpio_bank *bank)
 {
-	struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
-	unsigned int port, pin, i, offset = 0;
-
-	if (size < 2)
-		return -EINVAL;
-
-	port = spec[0] / 8;
-	pin = spec[0] % 8;
-
-	if (port >= gpio->soc->num_ports) {
-		dev_err(gpio->gpio.parent, "invalid port number: %u\n", port);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < port; i++)
-		offset += gpio->soc->ports[i].pins;
+	struct tegra_gpio_port *port = to_tegra_gpio_port(bank);
+	struct tegra_gpio *gpio = gpiochip_get_data(bank->chip);
+	void __iomem *base = gpio->base + port->offset;
+	u32 value;
 
-	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
-	*hwirq = offset + pin;
+	value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
 
-	return 0;
+	bank->pending[0] = value;
 }
 
 static const struct irq_domain_ops tegra186_gpio_irq_domain_ops = {
 	.map = gpiochip_irq_map,
 	.unmap = gpiochip_irq_unmap,
-	.xlate = tegra186_gpio_irq_domain_xlate,
+	.xlate = gpio_banked_irq_domain_xlate,
 };
 
 static struct lock_class_key tegra186_gpio_lock_class;
@@ -420,6 +353,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	gpio->soc = of_device_get_match_data(&pdev->dev);
+	irq = &gpio->gpio.irq;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
 	gpio->base = devm_ioremap_resource(&pdev->dev, res);
@@ -430,21 +364,47 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	gpio->num_irq = err;
+	irq->num_parents = err;
 
-	gpio->irq = devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
-				 GFP_KERNEL);
-	if (!gpio->irq)
+	irq->parents = devm_kcalloc(&pdev->dev, irq->num_parents,
+				    sizeof(*irq->parents), GFP_KERNEL);
+	if (!irq->parents)
 		return -ENOMEM;
 
-	for (i = 0; i < gpio->num_irq; i++) {
+	for (i = 0; i < irq->num_parents; i++) {
 		err = platform_get_irq(pdev, i);
 		if (err < 0)
 			return err;
 
-		gpio->irq[i] = err;
+		irq->parents[i] = err;
 	}
 
+	gpio->ports = devm_kcalloc(&pdev->dev, gpio->soc->num_ports,
+				   sizeof(struct tegra_gpio_port),
+				   GFP_KERNEL);
+	if (!gpio->ports)
+		return -ENOMEM;
+
+	gpio->gpio.banks = devm_kcalloc(&pdev->dev, gpio->soc->num_ports,
+					sizeof(struct gpio_bank *),
+					GFP_KERNEL);
+	if (!gpio->gpio.banks)
+		return -ENOMEM;
+
+	for (i = 0; i < gpio->soc->num_ports; i++) {
+		const struct tegra_gpio_port_soc *soc = &gpio->soc->ports[i];
+		struct tegra_gpio_port *port = &gpio->ports[i];
+
+		gpio->gpio.banks[i] = &port->bank;
+		port->bank.parent_irq = soc->irq;
+		port->bank.num_pins = soc->pins;
+
+		port->offset = soc->offset;
+		port->name = soc->name;
+	}
+
+	gpio->gpio.num_banks = gpio->soc->num_ports;
+
 	gpio->gpio.label = gpio->soc->name;
 	gpio->gpio.parent = &pdev->dev;
 
@@ -465,7 +425,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
-		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
+		const struct tegra_gpio_port_soc *port = &gpio->soc->ports[i];
 		char *name;
 
 		for (j = 0; j < port->pins; j++) {
@@ -484,7 +444,11 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->gpio.of_node = pdev->dev.of_node;
 	gpio->gpio.of_gpio_n_cells = 2;
-	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
+	gpio->gpio.of_gpio_bank_shift = 3;
+	gpio->gpio.of_gpio_bank_mask = 0x1fffffff;
+	gpio->gpio.of_gpio_pin_shift = 0;
+	gpio->gpio.of_gpio_pin_mask = 0x7;
+	gpio->gpio.of_xlate = of_gpio_banked_xlate;
 
 	gpio->intc.name = pdev->dev.of_node->name;
 	gpio->intc.irq_ack = tegra186_irq_ack;
@@ -492,31 +456,14 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
 	gpio->intc.irq_set_type = tegra186_irq_set_type;
 
-	irq = &gpio->gpio.irq;
 	irq->chip = &gpio->intc;
 	irq->first = 0;
 	irq->domain_ops = &tegra186_gpio_irq_domain_ops;
 	irq->handler = handle_simple_irq;
 	irq->lock_key = &tegra186_gpio_lock_class;
 	irq->default_type = IRQ_TYPE_NONE;
-	irq->parent_handler = tegra186_gpio_irq;
-	irq->parent_handler_data = gpio;
-	irq->num_parents = gpio->num_irq;
-	irq->parents = gpio->irq;
-
-	irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
-				sizeof(*irq->map), GFP_KERNEL);
-	if (!irq->map)
-		return -ENOMEM;
-
-	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
-		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
-
-		for (j = 0; j < port->pins; j++)
-			irq->map[offset + j] = irq->parents[port->irq];
-
-		offset += port->pins;
-	}
+	irq->parent_handler = gpio_irq_chip_banked_handler;
+	irq->update_bank = tegra186_gpio_update_bank;
 
 	platform_set_drvdata(pdev, gpio);
 
@@ -540,7 +487,7 @@ static int tegra186_gpio_remove(struct platform_device *pdev)
 		.irq = controller,				\
 	}
 
-static const struct tegra_gpio_port tegra186_main_ports[] = {
+static const struct tegra_gpio_port_soc tegra186_main_ports[] = {
 	TEGRA_MAIN_GPIO_PORT( A, 0x2000, 7, 2),
 	TEGRA_MAIN_GPIO_PORT( B, 0x3000, 7, 3),
 	TEGRA_MAIN_GPIO_PORT( C, 0x3200, 7, 3),
@@ -580,7 +527,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 		.irq = controller,				\
 	}
 
-static const struct tegra_gpio_port tegra186_aon_ports[] = {
+static const struct tegra_gpio_port_soc tegra186_aon_ports[] = {
 	TEGRA_AON_GPIO_PORT( S, 0x0200, 5, 0),
 	TEGRA_AON_GPIO_PORT( U, 0x0400, 6, 0),
 	TEGRA_AON_GPIO_PORT( V, 0x0800, 8, 0),
-- 
2.13.3
