From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2 10/12] gpio: tegra: implement wake event support for Tegra210 and prior GPIO
Date: Tue, 28 May 2019 16:08:54 -0700
Message-ID: <1559084936-4610-11-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The GPIO controller doesn't have any controls to enable the system to
wake up from low power states based on activity on GPIO pins. An extra
hardware block that is part of the power management controller (PMC)
contains these controls. In order for the GPIO controller to be able
to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
and make it a parent to the GPIO controller's IRQ domain. This way the
PMC gets an opportunity to program the additional registers required
to enable wakeup sources on suspend.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 116 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 6d9b6906b9d0..5190129668d3 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -32,6 +32,8 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define GPIO_BANK(x)		((x) >> 5)
 #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
 #define GPIO_BIT(x)		((x) & 0x7)
@@ -275,8 +277,22 @@ static int tegra_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	struct irq_domain *domain = tgi->irq_domain;
+
+	if (!gpiochip_irqchip_irq_valid(chip, offset))
+		return -ENXIO;
+
+	if (irq_domain_is_hierarchy(domain)) {
+		struct irq_fwspec spec;
+
+		spec.fwnode = domain->fwnode;
+		spec.param_count = 2;
+		spec.param[0] = offset;
+		spec.param[1] = IRQ_TYPE_NONE;
+		return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);
+	}
 
-	return irq_find_mapping(tgi->irq_domain, offset);
+	return irq_find_mapping(domain, offset);
 }
 
 static void tegra_gpio_irq_ack(struct irq_data *d)
@@ -365,7 +381,10 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
 		irq_set_handler_locked(d, handle_edge_irq);
 
-	return 0;
+	if (d->parent_data)
+		return irq_chip_set_type_parent(d, type);
+	else
+		return 0;
 }
 
 static void tegra_gpio_irq_shutdown(struct irq_data *d)
@@ -503,6 +522,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
 	unsigned int gpio = d->hwirq;
 	u32 port, bit, mask;
+	int ret;
 
 	port = GPIO_PORT(gpio);
 	bit = GPIO_BIT(gpio);
@@ -513,7 +533,14 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	else
 		bank->wake_enb[port] &= ~mask;
 
-	return irq_set_irq_wake(bank->irq, enable);
+	ret = irq_set_irq_wake(bank->irq, enable);
+	if (ret < 0)
+		return ret;
+
+	if (d->parent_data)
+		return irq_chip_set_wake_parent(d, enable);
+	else
+		return 0;
 }
 #endif
 
@@ -566,10 +593,78 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
+static int tegra_gpio_irq_domain_translate(struct irq_domain *domain,
+					   struct irq_fwspec *fwspec,
+					   unsigned long *hwirq,
+					   unsigned int *type)
+{
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+	*hwirq = fwspec->param[0];
+
+	return 0;
+}
+
+static int tegra_gpio_irq_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq,
+				       unsigned int num_irqs, void *data)
+{
+	struct tegra_gpio_info *tgi = gpiochip_get_data(domain->host_data);
+	struct irq_fwspec *fwspec = data, spec;
+	struct tegra_gpio_bank *bank;
+	unsigned long hwirq;
+	unsigned int type;
+	int err = 0;
+
+	if (WARN_ON(num_irqs != 1))
+		return -EINVAL;
+
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+
+	err = tegra_gpio_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (err)
+		return err;
+
+	bank = &tgi->bank_info[GPIO_BANK(hwirq)];
+	err = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &tgi->ic, bank);
+
+	if (err < 0)
+		return err;
+
+	spec.fwnode = domain->parent->fwnode;
+	spec.param_count = 3;
+	spec.param[0] = GIC_SPI;
+	spec.param[1] = fwspec->param[0];
+	spec.param[2] = fwspec->param[1];
+
+	return irq_domain_alloc_irqs_parent(domain, virq, 1, &spec);
+}
+
+static const struct irq_domain_ops tegra_gpio_irq_domain_ops = {
+	.translate = tegra_gpio_irq_domain_translate,
+	.alloc = tegra_gpio_irq_domain_alloc,
+};
+
+static const struct of_device_id tegra_pmc_of_match[] = {
+	{ .compatible = "nvidia,tegra210-pmc" },
+	{ .compatible = "nvidia,tegra132-pmc" },
+	{ .compatible = "nvidia,tegra124-pmc" },
+	{ .compatible = "nvidia,tegra114-pmc" },
+	{ .compatible = "nvidia,tegra30-pmc" },
+	{ .compatible = "nvidia,tegra20-pmc" },
+	{ }
+};
+
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
 	struct tegra_gpio_bank *bank;
+	struct device_node *np;
+	struct irq_domain *parent_domain = NULL;
 	unsigned int gpio, i, j;
 	int ret;
 
@@ -614,6 +709,13 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
 #endif
+	np = of_find_matching_node(NULL, tegra_pmc_of_match);
+	if (np) {
+		parent_domain = irq_find_host(np);
+		of_node_put(np);
+		if (!parent_domain)
+			return -EPROBE_DEFER;
+	}
 
 	platform_set_drvdata(pdev, tgi);
 
@@ -625,9 +727,11 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	if (!tgi->bank_info)
 		return -ENOMEM;
 
-	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-						tgi->gc.ngpio,
-						&irq_domain_simple_ops, NULL);
+	tgi->irq_domain = irq_domain_add_hierarchy(parent_domain, 0,
+						   tgi->gc.ngpio,
+						   pdev->dev.of_node,
+						   &tegra_gpio_irq_domain_ops,
+						   &tgi->gc);
 	if (!tgi->irq_domain)
 		return -ENODEV;
 
-- 
2.7.4
