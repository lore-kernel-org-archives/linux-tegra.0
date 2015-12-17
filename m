From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 5/8] irqchip/gic: Return an error if GIC initialisation fails
Date: Thu, 17 Dec 2015 10:48:26 +0000
Message-ID: <1450349309-8107-6-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the GIC initialisation fails, then currently we do not return an error
or clean-up afterwards. Although for root controllers, this failure may be
fatal anyway, for secondary controllers, it may not be fatal and so return
an error on failure and clean-up.

Also for non-banked GIC controllers, make sure that we free any memory
allocated if we fail to initialise the IRQ domain.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 56 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 561a5cb5b8bc..5d1f1d4396c2 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1032,30 +1032,30 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
+static int __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 			   void __iomem *dist_base, void __iomem *cpu_base,
 			   u32 percpu_offset, struct fwnode_handle *handle)
 {
 	irq_hw_number_t hwirq_base;
 	struct gic_chip_data *gic;
-	int gic_irqs, irq_base, i;
+	int gic_irqs, irq_base, i, ret;
 
 	BUG_ON(gic_nr >= MAX_GIC_NR);
 
 	gic_check_cpu_features();
 
 	gic = &gic_data[gic_nr];
-#ifdef CONFIG_GIC_NON_BANKED
-	if (percpu_offset) { /* Frankein-GIC without banked registers... */
+
+	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
+		/* Frankein-GIC without banked registers... */
 		unsigned int cpu;
 
 		gic->dist_base.percpu_base = alloc_percpu(void __iomem *);
 		gic->cpu_base.percpu_base = alloc_percpu(void __iomem *);
 		if (WARN_ON(!gic->dist_base.percpu_base ||
 			    !gic->cpu_base.percpu_base)) {
-			free_percpu(gic->dist_base.percpu_base);
-			free_percpu(gic->cpu_base.percpu_base);
-			return;
+			ret = -ENOMEM;
+			goto err;
 		}
 
 		for_each_possible_cpu(cpu) {
@@ -1067,9 +1067,8 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 		}
 
 		gic_set_base_accessor(gic, gic_get_percpu_base);
-	} else
-#endif
-	{			/* Normal, sane GIC... */
+	} else {
+		/* Normal, sane GIC... */
 		WARN(percpu_offset,
 		     "GIC_NON_BANKED not enabled, ignoring %08x offset!",
 		     percpu_offset);
@@ -1119,8 +1118,10 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 					hwirq_base, &gic_irq_domain_ops, gic);
 	}
 
-	if (WARN_ON(!gic->domain))
-		return;
+	if (WARN_ON(!gic->domain)) {
+		ret = -ENODEV;
+		goto err;
+	}
 
 	if (gic_nr == 0) {
 		/*
@@ -1142,6 +1143,16 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 	gic_dist_init(gic);
 	gic_cpu_init(gic);
 	gic_pm_init(gic);
+
+	return 0;
+
+err:
+	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
+		free_percpu(gic->dist_base.percpu_base);
+		free_percpu(gic->cpu_base.percpu_base);
+	}
+
+	return ret;
 }
 
 void __init gic_init(unsigned int gic_nr, int irq_start,
@@ -1202,7 +1213,7 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	void __iomem *cpu_base;
 	void __iomem *dist_base;
 	u32 percpu_offset;
-	int irq;
+	int irq, ret;
 
 	if (WARN_ON(!node))
 		return -ENODEV;
@@ -1227,8 +1238,14 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
 		percpu_offset = 0;
 
-	__gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset,
+	ret = __gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset,
 			 &node->fwnode);
+	if (ret) {
+		iounmap(dist_base);
+		iounmap(cpu_base);
+		return ret;
+	}
+
 	if (!gic_cnt)
 		gic_init_physaddr(node);
 
@@ -1317,7 +1334,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 	struct acpi_madt_generic_distributor *dist;
 	void __iomem *cpu_base, *dist_base;
 	struct fwnode_handle *domain_handle;
-	int count;
+	int count, ret;
 
 	/* Collect CPU base addresses */
 	count = acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
@@ -1360,7 +1377,14 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 		return -ENOMEM;
 	}
 
-	__gic_init_bases(0, -1, dist_base, cpu_base, 0, domain_handle);
+	ret = __gic_init_bases(0, -1, dist_base, cpu_base, 0, domain_handle);
+	if (ret) {
+		pr_err("Failed to initialise GIC\n");
+		irq_domain_free_fwnode(domain_handle);
+		iounmap(cpu_base);
+		iounmap(dist_base);
+		return ret;
+	}
 
 	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, domain_handle);
 	return 0;
-- 
2.1.4
