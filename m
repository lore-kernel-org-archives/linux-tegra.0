From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH V2 2/8] irqdomain: Don't set type when mapping an IRQ
Date: Thu, 17 Dec 2015 10:48:23 +0000
Message-ID: <1450349309-8107-3-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some IRQ chips, such as GPIO controllers or secondary level interrupt
controllers, may require require additional runtime power management
control to ensure they are accessible. For such IRQ chips, it makes sense
to enable the IRQ chip when interrupts are requested and disabled them
again once all interrupts have been freed.

When mapping an IRQ, the IRQ type settings are read and then programmed.
The mapping of the IRQ happens before the IRQ is requested and so the
programming of the type settings occurs before the IRQ is requested. This
is a problem for IRQ chips that require additional power management
control because they may not be accessible yet. Therefore, when mapping
the IRQ, don't program the type settings, just save them and then program
these saved settings when the IRQ is requested (so long as if they are not
overridden via the call to request the IRQ).

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 kernel/irq/irqdomain.c | 18 ++++++++++++++----
 kernel/irq/manage.c    |  7 +++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index eae31e978ab2..4322d6fd0b8f 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -570,6 +570,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 {
 	struct device_node *of_node;
 	struct irq_domain *domain;
+	struct irq_data *irq_data;
 	irq_hw_number_t hwirq;
 	unsigned int cur_type = IRQ_TYPE_NONE;
 	unsigned int type = IRQ_TYPE_NONE;
@@ -634,10 +635,19 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 		return 0;
 	}
 
-	/* Set type if specified and different than the current one */
-	if (type != IRQ_TYPE_NONE &&
-	    type != irq_get_trigger_type(virq))
-		irq_set_irq_type(virq, type);
+	irq_data = irq_get_irq_data(virq);
+	if (!irq_data) {
+		if (irq_domain_is_hierarchy(domain))
+			irq_domain_free_irqs(virq, 1);
+		else
+			irq_dispose_mapping(virq);
+
+		return 0;
+	}
+
+	/* Store trigger type */
+	irqd_set_trigger_type(irq_data, type);
+
 	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 0eebaeef317b..2a429b061171 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1119,6 +1119,13 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	new->irq = irq;
 
 	/*
+	 * If the trigger type is not specified by the caller,
+	 * then use the default for this interrupt.
+	 */
+	if (!(new->flags & IRQF_TRIGGER_MASK))
+		new->flags |= irqd_get_trigger_type(&desc->irq_data);
+
+	/*
 	 * Check whether the interrupt nests into another interrupt
 	 * thread.
 	 */
-- 
2.1.4
