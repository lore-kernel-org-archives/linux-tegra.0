From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 5/9] irqchip/gic: Isolate early GIC initialisation code
Date: Thu, 12 May 2016 16:19:28 +0100
Message-ID: <1463066372-13115-6-git-send-email-jonathanh@nvidia.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463066372-13115-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/irqchip/irq-gic.c | 55 +++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 113e2d02c812..58ef17fa23a3 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1029,14 +1029,11 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
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
 
 	gic_check_cpu_features();
 
@@ -1137,23 +1134,6 @@ static int __init __gic_init_bases(struct gic_chip_data *gic, int irq_start,
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
@@ -1176,6 +1156,35 @@ error:
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
