From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 6/9] irqchip/gic: Add helper function for chip initialisation
Date: Thu, 12 May 2016 16:19:29 +0100
Message-ID: <1463066372-13115-7-git-send-email-jonathanh@nvidia.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

For GICs that require runtime power-management it is necessary to
populate the 'parent_device' member of the irqchip structure. In
preparation for supporting such GICs, move the code that initialises
the irqchip structure for a GIC into its own function called
gic_init_chip() where the parent device pointer is also set.

Instead of calling gic_init_chip() from within gic_init_bases(), move
the calls to outside of this function, so that in the future we can
avoid having to pass additional parameters to gic_init_bases() in order
set the parent device pointer or set the name to a specific string.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 58ef17fa23a3..e043a19631b1 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1029,31 +1029,33 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static int gic_init_bases(struct gic_chip_data *gic, int irq_start,
-			  struct fwnode_handle *handle)
+static void gic_init_chip(struct gic_chip_data *gic, struct device *dev,
+			  const char *name, bool use_eoimode1)
 {
-	irq_hw_number_t hwirq_base;
-	int gic_irqs, irq_base, ret;
-
-	gic_check_cpu_features();
-
 	/* Initialize irq_chip */
 	gic->chip = gic_chip;
+	gic->chip.name = name;
+	gic->chip.parent_device = dev;
 
-	if (static_key_true(&supports_deactivate) && gic == &gic_data[0]) {
+	if (use_eoimode1) {
 		gic->chip.irq_mask = gic_eoimode1_mask_irq;
 		gic->chip.irq_eoi = gic_eoimode1_eoi_irq;
 		gic->chip.irq_set_vcpu_affinity = gic_irq_set_vcpu_affinity;
-		gic->chip.name = kasprintf(GFP_KERNEL, "GICv2");
-	} else {
-		gic->chip.name = kasprintf(GFP_KERNEL, "GIC-%d",
-					   (int)(gic - &gic_data[0]));
 	}
 
 #ifdef CONFIG_SMP
 	if (gic == &gic_data[0])
 		gic->chip.irq_set_affinity = gic_set_affinity;
 #endif
+}
+
+static int gic_init_bases(struct gic_chip_data *gic, int irq_start,
+			  struct fwnode_handle *handle)
+{
+	irq_hw_number_t hwirq_base;
+	int gic_irqs, irq_base, ret;
+
+	gic_check_cpu_features();
 
 	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && gic->percpu_offset) {
 		/* Frankein-GIC without banked registers... */
@@ -1151,8 +1153,6 @@ error:
 		free_percpu(gic->cpu_base.percpu_base);
 	}
 
-	kfree(gic->chip.name);
-
 	return ret;
 }
 
@@ -1160,7 +1160,8 @@ static int __init __gic_init_bases(struct gic_chip_data *gic,
 				   int irq_start,
 				   struct fwnode_handle *handle)
 {
-	int i;
+	char *name;
+	int i, ret;
 
 	if (WARN_ON(!gic || gic->domain))
 		return -EINVAL;
@@ -1182,7 +1183,19 @@ static int __init __gic_init_bases(struct gic_chip_data *gic,
 			pr_info("GIC: Using split EOI/Deactivate mode\n");
 	}
 
-	return gic_init_bases(gic, irq_start, handle);
+	if (static_key_true(&supports_deactivate) && gic == &gic_data[0]) {
+		name = kasprintf(GFP_KERNEL, "GICv2");
+		gic_init_chip(gic, NULL, name, true);
+	} else {
+		name = kasprintf(GFP_KERNEL, "GIC-%d", (int)(gic-&gic_data[0]));
+		gic_init_chip(gic, NULL, name, false);
+	}
+
+	ret = gic_init_bases(gic, irq_start, handle);
+	if (ret)
+		kfree(name);
+
+	return ret;
 }
 
 void __init gic_init(unsigned int gic_nr, int irq_start,
-- 
2.1.4
