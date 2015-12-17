From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 1/8] irqdomain: Ensure type settings match for an existing mapping
Date: Thu, 17 Dec 2015 10:48:22 +0000
Message-ID: <1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When mapping an IRQ, if a mapping already exists, then we simply return
the virual IRQ number. However, we do not check that the type settings for
the existing mapping match those for the mapping that is about to be
created. It may be unlikely that the type settings would not match, but
check for this and don't return a valid IRQ mapping if the type settings
do not match.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 kernel/irq/irqdomain.c | 58 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 22aa9612ef7c..eae31e978ab2 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -568,8 +568,10 @@ static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
 
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 {
+	struct device_node *of_node;
 	struct irq_domain *domain;
 	irq_hw_number_t hwirq;
+	unsigned int cur_type = IRQ_TYPE_NONE;
 	unsigned int type = IRQ_TYPE_NONE;
 	int virq;
 
@@ -587,23 +589,49 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	if (irq_domain_translate(domain, fwspec, &hwirq, &type))
 		return 0;
 
-	if (irq_domain_is_hierarchy(domain)) {
-		/*
-		 * If we've already configured this interrupt,
-		 * don't do it again, or hell will break loose.
-		 */
-		virq = irq_find_mapping(domain, hwirq);
-		if (virq)
-			return virq;
+	of_node = irq_domain_get_of_node(domain);
 
-		virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
-		if (virq <= 0)
-			return 0;
+	/*
+	 * If we've already configured this interrupt,
+	 * don't do it again, or hell will break loose.
+	 */
+	virq = irq_find_mapping(domain, hwirq);
+	if (!virq) {
+		if (irq_domain_is_hierarchy(domain)) {
+			virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE,
+						     fwspec);
+			if (virq <= 0)
+				return 0;
+		} else {
+			virq = irq_domain_alloc_descs(-1, 1, hwirq,
+						      of_node_to_nid(of_node));
+			if (virq <= 0)
+				return 0;
+
+			if (irq_domain_associate(domain, virq, hwirq)) {
+				irq_free_desc(virq);
+				return 0;
+			}
+		}
 	} else {
-		/* Create mapping */
-		virq = irq_create_mapping(domain, hwirq);
-		if (!virq)
-			return virq;
+		cur_type = irq_get_trigger_type(virq);
+	}
+
+	/*
+	 * If the trigger type is not specified or matches the current
+	 * trigger type then we are done so return the interrupt number.
+	 */
+	if (type == IRQ_TYPE_NONE || type == cur_type)
+		return virq;
+
+	/*
+	 * If the trigger type is already set and does
+	 * not match this interrupt, then return 0.
+	 */
+	if (cur_type != IRQ_TYPE_NONE) {
+		pr_warn("type mismatch, failed to map hwirq-%lu for %s!\n",
+			hwirq, of_node_full_name(of_node));
+		return 0;
 	}
 
 	/* Set type if specified and different than the current one */
-- 
2.1.4
