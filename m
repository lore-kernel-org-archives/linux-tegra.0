From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 9/9] gpio: tegra186: Implement wake event support
Date: Fri, 21 Sep 2018 12:25:46 +0200
Message-ID: <20180921102546.12745-10-thierry.reding@gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPIO controller doesn't have any controls to enable the system to
wake up from low power states based on activity on GPIO pins. An extra
hardware block that is part of the power management controller (PMC)
contains these controls. In order for the GPIO controller to be able
to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
and make it a parent to the GPIO controller's IRQ domain. This way the
PMC gets an opportunity to program the additional registers required
to enable wakeup sources on suspend.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 103 ++++++++++++++++++++++++++++++-----
 1 file changed, 89 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 66ec38bb7954..240a26defe9b 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -56,6 +56,7 @@ struct tegra_gpio_soc {
 	const struct tegra_gpio_port *ports;
 	unsigned int num_ports;
 	const char *name;
+	unsigned int instance;
 };
 
 struct tegra_gpio {
@@ -237,6 +238,38 @@ static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
 	return offset + pin;
 }
 
+static int tegra186_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	struct irq_domain *domain = chip->irq.domain;
+
+	if (!gpiochip_irqchip_irq_valid(chip, offset))
+		return -ENXIO;
+
+	if (irq_domain_is_hierarchy(domain)) {
+		struct irq_fwspec spec;
+		unsigned int i;
+
+		for (i = 0; i < gpio->soc->num_ports; i++) {
+			if (offset < gpio->soc->ports[i].pins)
+				break;
+
+			offset -= gpio->soc->ports[i].pins;
+		}
+
+		offset += i * 8;
+
+		spec.fwnode = domain->fwnode;
+		spec.param_count = 2;
+		spec.param[0] = offset;
+		spec.param[1] = 0;
+
+		return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);
+	}
+
+	return irq_create_mapping(domain, offset);
+}
+
 static void tegra186_irq_ack(struct irq_data *data)
 {
 	struct tegra_gpio *gpio = irq_data_get_irq_chip_data(data);
@@ -330,7 +363,7 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int type)
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
 
-	return 0;
+	return irq_chip_set_type_parent(data, type);
 }
 
 static void tegra186_gpio_irq(struct irq_desc *desc)
@@ -370,39 +403,67 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
-					  struct device_node *np,
-					  const u32 *spec, unsigned int size,
-					  unsigned long *hwirq,
-					  unsigned int *type)
+static int tegra186_gpio_irq_domain_translate(struct irq_domain *domain,
+					      struct irq_fwspec *fwspec,
+					      unsigned long *hwirq,
+					      unsigned int *type)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
 	unsigned int port, pin, i, offset = 0;
 
-	if (size < 2)
+	if (WARN_ON(gpio->gpio.of_gpio_n_cells < 2))
 		return -EINVAL;
 
-	port = spec[0] / 8;
-	pin = spec[0] % 8;
+	if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_cells))
+		return -EINVAL;
 
-	if (port >= gpio->soc->num_ports) {
-		dev_err(gpio->gpio.parent, "invalid port number: %u\n", port);
+	port = fwspec->param[0] / 8;
+	pin = fwspec->param[0] % 8;
+
+	if (port >= gpio->soc->num_ports)
 		return -EINVAL;
-	}
 
 	for (i = 0; i < port; i++)
 		offset += gpio->soc->ports[i].pins;
 
-	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
 	*hwirq = offset + pin;
 
 	return 0;
 }
 
+static int tegra186_gpio_irq_domain_alloc(struct irq_domain *domain, unsigned int virq, unsigned int num_irqs, void *data)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec spec;
+	unsigned long hwirq;
+	unsigned int type;
+	int err = 0;
+
+	err = tegra186_gpio_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (err < 0)
+		return err;
+
+	err = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &gpio->intc,
+					    gpio);
+	if (err < 0)
+		return err;
+
+	spec.fwnode = domain->parent->fwnode;
+	spec.param_count = 3;
+	spec.param[0] = gpio->soc->instance;
+	spec.param[1] = fwspec->param[0];
+	spec.param[2] = fwspec->param[1];
+
+	return irq_domain_alloc_irqs_parent(domain, virq, num_irqs, &spec);
+}
+
 static const struct irq_domain_ops tegra186_gpio_irq_domain_ops = {
+	.translate = tegra186_gpio_irq_domain_translate,
+	.alloc = tegra186_gpio_irq_domain_alloc,
 	.map = gpiochip_irq_map,
 	.unmap = gpiochip_irq_unmap,
-	.xlate = tegra186_gpio_irq_domain_xlate,
 };
 
 static int tegra186_gpio_probe(struct platform_device *pdev)
@@ -410,6 +471,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
+	struct device_node *np;
 	struct resource *res;
 	char **names;
 	int err;
@@ -484,12 +546,14 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.of_node = pdev->dev.of_node;
 	gpio->gpio.of_gpio_n_cells = 2;
 	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
+	gpio->gpio.to_irq = tegra186_gpio_to_irq;
 
 	gpio->intc.name = pdev->dev.of_node->name;
 	gpio->intc.irq_ack = tegra186_irq_ack;
 	gpio->intc.irq_mask = tegra186_irq_mask;
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
 	gpio->intc.irq_set_type = tegra186_irq_set_type;
+	gpio->intc.irq_set_wake = irq_chip_set_wake_parent;
 
 	irq = &gpio->gpio.irq;
 	irq->chip = &gpio->intc;
@@ -501,6 +565,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->num_parents = gpio->num_irq;
 	irq->parents = gpio->irq;
 
+	np = of_parse_phandle(pdev->dev.of_node, "wakeup-parent", 0);
+	if (np) {
+		irq->parent_domain = irq_find_host(np);
+		of_node_put(np);
+
+		if (!irq->parent_domain)
+			return -EPROBE_DEFER;
+	}
+
 	irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
 				sizeof(*irq->map), GFP_KERNEL);
 	if (!irq->map)
@@ -637,6 +710,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_main_ports),
 	.ports = tegra194_main_ports,
 	.name = "tegra194-gpio",
+	.instance = 0,
 };
 
 #define TEGRA194_AON_GPIO_PORT(port, base, count, controller)	\
@@ -659,6 +733,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_aon_ports),
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
+	.instance = 1,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.19.0
