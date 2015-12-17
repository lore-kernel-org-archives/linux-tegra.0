From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 6/8] irqchip/gic: Assign irqchip dynamically
Date: Thu, 17 Dec 2015 10:48:27 +0000
Message-ID: <1450349309-8107-7-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Dynamically assign the irqchip structure for each GIC controller
instance. This is necessary in order to populate the "dev" member
of the irqchip structure for GIC instances that require runtime
power management support. This also allows us to populate a unique
name for each GIC controller.

This is based upon a patch by Linus Walleij <linus.walleij@linaro.org>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 5d1f1d4396c2..ebfbb2379320 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -69,6 +69,7 @@ union gic_base {
 };
 
 struct gic_chip_data {
+	struct irq_chip chip;
 	union gic_base dist_base;
 	union gic_base cpu_base;
 #ifdef CONFIG_CPU_PM
@@ -383,7 +384,6 @@ static void gic_handle_cascade_irq(struct irq_desc *desc)
 }
 
 static struct irq_chip gic_chip = {
-	.name			= "GIC",
 	.irq_mask		= gic_mask_irq,
 	.irq_unmask		= gic_unmask_irq,
 	.irq_eoi		= gic_eoi_irq,
@@ -398,23 +398,6 @@ static struct irq_chip gic_chip = {
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static struct irq_chip gic_eoimode1_chip = {
-	.name			= "GICv2",
-	.irq_mask		= gic_eoimode1_mask_irq,
-	.irq_unmask		= gic_unmask_irq,
-	.irq_eoi		= gic_eoimode1_eoi_irq,
-	.irq_set_type		= gic_set_type,
-#ifdef CONFIG_SMP
-	.irq_set_affinity	= gic_set_affinity,
-#endif
-	.irq_get_irqchip_state	= gic_irq_get_irqchip_state,
-	.irq_set_irqchip_state	= gic_irq_set_irqchip_state,
-	.irq_set_vcpu_affinity	= gic_irq_set_vcpu_affinity,
-	.flags			= IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE |
-				  IRQCHIP_MASK_ON_SUSPEND,
-};
-
 void __init gic_cascade_irq(unsigned int gic_nr, unsigned int irq)
 {
 	if (gic_nr >= MAX_GIC_NR)
@@ -925,20 +908,15 @@ void __init gic_init_physaddr(struct device_node *node)
 static int gic_irq_domain_map(struct irq_domain *d, unsigned int irq,
 				irq_hw_number_t hw)
 {
-	struct irq_chip *chip = &gic_chip;
-
-	if (static_key_true(&supports_deactivate)) {
-		if (d->host_data == (void *)&gic_data[0])
-			chip = &gic_eoimode1_chip;
-	}
+	struct gic_chip_data *gic = d->host_data;
 
 	if (hw < 32) {
 		irq_set_percpu_devid(irq);
-		irq_domain_set_info(d, irq, hw, chip, d->host_data,
+		irq_domain_set_info(d, irq, hw, &gic->chip, d->host_data,
 				    handle_percpu_devid_irq, NULL, NULL);
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 	} else {
-		irq_domain_set_info(d, irq, hw, chip, d->host_data,
+		irq_domain_set_info(d, irq, hw, &gic->chip, d->host_data,
 				    handle_fasteoi_irq, NULL, NULL);
 		irq_set_probe(irq);
 	}
@@ -1046,6 +1024,15 @@ static int __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 
 	gic = &gic_data[gic_nr];
 
+	gic->chip = gic_chip;
+	gic->chip.name = kasprintf(GFP_KERNEL, "GIC%d", gic_nr);
+
+	if (gic_nr == 0 && static_key_true(&supports_deactivate)) {
+		gic->chip.irq_mask = gic_eoimode1_mask_irq;
+		gic->chip.irq_eoi = gic_eoimode1_eoi_irq;
+		gic->chip.irq_set_vcpu_affinity = gic_irq_set_vcpu_affinity;
+	}
+
 	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
 		/* Frankein-GIC without banked registers... */
 		unsigned int cpu;
@@ -1147,6 +1134,8 @@ static int __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 	return 0;
 
 err:
+	kfree(gic->chip.name);
+
 	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
 		free_percpu(gic->dist_base.percpu_base);
 		free_percpu(gic->cpu_base.percpu_base);
-- 
2.1.4
