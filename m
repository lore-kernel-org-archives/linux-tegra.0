From: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] irqchip: tegra: Switch to use irq_domain_free_irqs_common
Date: Sun, 20 Mar 2016 20:44:05 +0800
Message-ID: <1458477845.28679.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Current code calls irq_domain_alloc_irqs_parent() in .alloc,
so it should call irq_domain_free_irqs_parent() accordingly in .free.
Fix it by switching to use irq_domain_free_irqs_common() instead of
open-coded.

Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
---
 drivers/irqchip/irq-tegra.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 121ec30..50be963 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -275,22 +275,10 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
 					    &parent_fwspec);
 }
 
-static void tegra_ictlr_domain_free(struct irq_domain *domain,
-				    unsigned int virq,
-				    unsigned int nr_irqs)
-{
-	unsigned int i;
-
-	for (i = 0; i < nr_irqs; i++) {
-		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
-		irq_domain_reset_irq_data(d);
-	}
-}
-
 static const struct irq_domain_ops tegra_ictlr_domain_ops = {
 	.translate	= tegra_ictlr_domain_translate,
 	.alloc		= tegra_ictlr_domain_alloc,
-	.free		= tegra_ictlr_domain_free,
+	.free		= irq_domain_free_irqs_common,
 };
 
 static int __init tegra_ictlr_init(struct device_node *node,
-- 
2.1.4
