From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 2/2] gpio: tegra186: Implement wake event support
Date: Wed, 29 May 2019 16:53:22 +0200
Message-ID: <20190529145322.20630-3-thierry.reding@gmail.com>
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
Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- initialize tegra_gpio_soc.instance field on Tegra186

Changes in v2:
- don't use wakeup-parent property but look up PMC by compatible

 drivers/gpio/gpio-tegra186.c | 120 +++++++++++++++++++++++++++++++----
 1 file changed, 106 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 7d42e3d7572c..59fc84be9c13 100644
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
+		spec.param[1] = IRQ_TYPE_NONE;
+
+		return irq_create_fwspec_mapping(&spec);
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
@@ -370,39 +403,82 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
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
+		return -EINVAL;
+
+	if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_cells))
 		return -EINVAL;
 
-	port = spec[0] / 8;
-	pin = spec[0] % 8;
+	port = fwspec->param[0] / 8;
+	pin = fwspec->param[0] % 8;
 
-	if (port >= gpio->soc->num_ports) {
-		dev_err(gpio->gpio.parent, "invalid port number: %u\n", port);
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
 
+static int tegra186_gpio_irq_domain_alloc(struct irq_domain *domain,
+					  unsigned int virq,
+					  unsigned int num_irqs,
+					  void *data)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec spec;
+	unsigned long hwirq;
+	unsigned int type;
+	int err;
+
+	if (WARN_ON(num_irqs > 1))
+		return -EINVAL;
+
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
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
+};
+
+static const struct of_device_id tegra186_pmc_of_match[] = {
+	{ .compatible = "nvidia,tegra186-pmc" },
+	{ .compatible = "nvidia,tegra194-pmc" },
+	{ /* sentinel */ }
 };
 
 static int tegra186_gpio_probe(struct platform_device *pdev)
@@ -410,6 +486,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
+	struct device_node *np;
 	struct resource *res;
 	char **names;
 	int err;
@@ -484,12 +561,14 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
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
@@ -501,6 +580,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->num_parents = gpio->num_irq;
 	irq->parents = gpio->irq;
 
+	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
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
@@ -567,6 +655,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra186_main_ports),
 	.ports = tegra186_main_ports,
 	.name = "tegra186-gpio",
+	.instance = 0,
 };
 
 #define TEGRA186_AON_GPIO_PORT(port, base, count, controller)	\
@@ -592,6 +681,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.num_ports = ARRAY_SIZE(tegra186_aon_ports),
 	.ports = tegra186_aon_ports,
 	.name = "tegra186-gpio-aon",
+	.instance = 1,
 };
 
 #define TEGRA194_MAIN_GPIO_PORT(port, base, count, controller)	\
@@ -637,6 +727,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_main_ports),
 	.ports = tegra194_main_ports,
 	.name = "tegra194-gpio",
+	.instance = 0,
 };
 
 #define TEGRA194_AON_GPIO_PORT(port, base, count, controller)	\
@@ -659,6 +750,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_aon_ports),
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
+	.instance = 1,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.21.0
