From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpio: tegra: Fix build issue due to irq_domain rework.
Date: Mon, 13 Feb 2012 16:21:15 -0700
Message-ID: <1329175275-19404-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 7da5a66 "irq_domain: Remove 'new' irq_domain in favour of the
ppc one" changed the set of available irq domain APIs. Update the Tegra
GPIO driver to account for those changes, to solve a build break.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
With this patch, next-20120206 works. There are one or two other issues
that prevent more recent nexts from working though; I'm still tracking
those down. However, I think this patch is fine by itself, since it solves
all issues in next-20120206.

 drivers/gpio/gpio-tegra.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 98f3980..6f17671 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -75,7 +75,7 @@ struct tegra_gpio_bank {
 #endif
 };
 
-static struct irq_domain irq_domain;
+static struct irq_domain *irq_domain;
 static void __iomem *regs;
 static u32 tegra_gpio_bank_count;
 static struct tegra_gpio_bank *tegra_gpio_banks;
@@ -141,7 +141,7 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_domain_to_irq(&irq_domain, offset);
+	return irq_find_mapping(irq_domain, offset);
 }
 
 static struct gpio_chip tegra_gpio_chip = {
@@ -372,11 +372,9 @@ static int __devinit tegra_gpio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Couldn't allocate IRQ numbers\n");
 		return -ENODEV;
 	}
-	irq_domain.irq_base = irq_base;
-	irq_domain.nr_irq = tegra_gpio_chip.ngpio;
-	irq_domain.ops = &irq_domain_simple_ops;
-	irq_domain.of_node = pdev->dev.of_node;
-	irq_domain_add(&irq_domain);
+	irq_domain = irq_domain_add_legacy(pdev->dev.of_node,
+					   tegra_gpio_chip.ngpio, irq_base, 0,
+					   &irq_domain_simple_ops, NULL);
 
 	for (i = 0; i < tegra_gpio_bank_count; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
@@ -416,7 +414,7 @@ static int __devinit tegra_gpio_probe(struct platform_device *pdev)
 	gpiochip_add(&tegra_gpio_chip);
 
 	for (gpio = 0; gpio < tegra_gpio_chip.ngpio; gpio++) {
-		int irq = irq_domain_to_irq(&irq_domain, gpio);
+		int irq = irq_find_mapping(irq_domain, gpio);
 		/* No validity check; all Tegra GPIOs are valid IRQs */
 
 		bank = &tegra_gpio_banks[GPIO_BANK(gpio)];
-- 
1.7.0.4
