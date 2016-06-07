From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 5/9] irqchip/gic: Isolate early GIC initialisation code
Date: Tue, 7 Jun 2016 16:12:30 +0100
Message-ID: <1465312354-27778-6-git-send-email-jonathanh@nvidia.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To re-use the code that initialises the GIC (found in
__gic_init_bases()), from within a platform driver, it is necessary to
move the code from the __init section so that it is always present and
not removed. Unfortunately, it is not possible to simply drop the __init
from the function declaration for __gic_init_bases() because it contains
calls to set_smp_cross_call() and set_handle_irq() which are both
located in the __init section. Fortunately, these calls are only
required for the root controller and because the initial platform driver
will only support non-root controllers that can be initialised later in
the boot process, we can move these calls to another function.

Move the bulk of the code from __gic_init_bases() to a new function
called gic_init_bases() which is not located in the __init section and
can be used by the platform driver. Update __gic_init_bases() to call
gic_init_bases() and if necessary, set_smp_cross_call() and
set_handle_irq().

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 55 +++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index fbc4ae2afd29..fa0dd98993fa 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1032,14 +1032,11 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static int __init __gic_init_bases(struct gic_chip_data *gic, int irq_start,
-				   struct fwnode_handle *handle)
+static int gic_init_bases(struct gic_chip_data *gic, int irq_start,
+			  struct fwnode_handle *handle)
 {
 	irq_hw_number_t hwirq_base;
-	int gic_irqs, irq_base, i, ret;
-
-	if (WARN_ON(!gic || gic->domain))
-		return -EINVAL;
+	int gic_irqs, irq_base, ret;
 
 	/* Initialize irq_chip */
 	gic->chip = gic_chip;
@@ -1138,23 +1135,6 @@ static int __init __gic_init_bases(struct gic_chip_data *gic, int irq_start,
 		goto error;
 	}
 
-	if (gic == &gic_data[0]) {
-		/*
-		 * Initialize the CPU interface map to all CPUs.
-		 * It will be refined as each CPU probes its ID.
-		 * This is only necessary for the primary GIC.
-		 */
-		for (i = 0; i < NR_GIC_CPU_IF; i++)
-			gic_cpu_map[i] = 0xff;
-#ifdef CONFIG_SMP
-		set_smp_cross_call(gic_raise_softirq);
-		register_cpu_notifier(&gic_cpu_notifier);
-#endif
-		set_handle_irq(gic_handle_irq);
-		if (static_key_true(&supports_deactivate))
-			pr_info("GIC: Using split EOI/Deactivate mode\n");
-	}
-
 	gic_dist_init(gic);
 	ret = gic_cpu_init(gic);
 	if (ret)
@@ -1177,6 +1157,35 @@ error:
 	return ret;
 }
 
+static int __init __gic_init_bases(struct gic_chip_data *gic,
+				   int irq_start,
+				   struct fwnode_handle *handle)
+{
+	int i;
+
+	if (WARN_ON(!gic || gic->domain))
+		return -EINVAL;
+
+	if (gic == &gic_data[0]) {
+		/*
+		 * Initialize the CPU interface map to all CPUs.
+		 * It will be refined as each CPU probes its ID.
+		 * This is only necessary for the primary GIC.
+		 */
+		for (i = 0; i < NR_GIC_CPU_IF; i++)
+			gic_cpu_map[i] = 0xff;
+#ifdef CONFIG_SMP
+		set_smp_cross_call(gic_raise_softirq);
+		register_cpu_notifier(&gic_cpu_notifier);
+#endif
+		set_handle_irq(gic_handle_irq);
+		if (static_key_true(&supports_deactivate))
+			pr_info("GIC: Using split EOI/Deactivate mode\n");
+	}
+
+	return gic_init_bases(gic, irq_start, handle);
+}
+
 void __init gic_init(unsigned int gic_nr, int irq_start,
 		     void __iomem *dist_base, void __iomem *cpu_base)
 {
-- 
2.1.4
