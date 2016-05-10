From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/11] irqchip/gic: Return an error if GIC initialisation fails
Date: Tue, 10 May 2016 16:14:42 +0100
Message-ID: <1462893285-13515-9-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If the GIC initialisation fails, then currently we do not return an error
or clean-up afterwards. Although for root controllers, this failure may be
fatal anyway, for secondary controllers, it may not be fatal and so return
an error on failure and clean-up.

Update the functions gic_cpu_init() and gic_pm_init() to return an error
instead of calling BUG() and perform any necessary clean-up.

For non-banked GIC controllers, make sure that we free any memory
allocated if we fail to initialise the IRQ domain. Please note that
free_percpu() only frees memory if the pointer passed to it is not NULL
and so it is unnecessary to check if both pointers are valid or not.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/irqchip/irq-gic.c | 99 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 73 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index d84fa36a7932..f32897c587b8 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -461,7 +461,7 @@ static void __init gic_dist_init(struct gic_chip_data *gic)
 	writel_relaxed(GICD_ENABLE, base + GIC_DIST_CTRL);
 }
 
-static void gic_cpu_init(struct gic_chip_data *gic)
+static int gic_cpu_init(struct gic_chip_data *gic)
 {
 	void __iomem *dist_base = gic_data_dist_base(gic);
 	void __iomem *base = gic_data_cpu_base(gic);
@@ -477,7 +477,9 @@ static void gic_cpu_init(struct gic_chip_data *gic)
 		/*
 		 * Get what the GIC says our CPU mask is.
 		 */
-		BUG_ON(cpu >= NR_GIC_CPU_IF);
+		if (WARN_ON(cpu >= NR_GIC_CPU_IF))
+			return -EINVAL;
+
 		gic_check_cpu_features();
 		cpu_mask = gic_get_cpumask(gic);
 		gic_cpu_map[cpu] = cpu_mask;
@@ -495,6 +497,8 @@ static void gic_cpu_init(struct gic_chip_data *gic)
 
 	writel_relaxed(GICC_INT_PRI_THRESHOLD, base + GIC_CPU_PRIMASK);
 	gic_cpu_if_up(gic);
+
+	return 0;
 }
 
 int gic_cpu_if_down(unsigned int gic_nr)
@@ -708,26 +712,39 @@ static struct notifier_block gic_notifier_block = {
 	.notifier_call = gic_notifier,
 };
 
-static void __init gic_pm_init(struct gic_chip_data *gic)
+static int __init gic_pm_init(struct gic_chip_data *gic)
 {
 	gic->saved_ppi_enable = __alloc_percpu(DIV_ROUND_UP(32, 32) * 4,
 		sizeof(u32));
-	BUG_ON(!gic->saved_ppi_enable);
+	if (WARN_ON(!gic->saved_ppi_enable))
+		return -ENOMEM;
 
 	gic->saved_ppi_active = __alloc_percpu(DIV_ROUND_UP(32, 32) * 4,
 		sizeof(u32));
-	BUG_ON(!gic->saved_ppi_active);
+	if (WARN_ON(!gic->saved_ppi_active))
+		goto free_ppi_enable;
 
 	gic->saved_ppi_conf = __alloc_percpu(DIV_ROUND_UP(32, 16) * 4,
 		sizeof(u32));
-	BUG_ON(!gic->saved_ppi_conf);
+	if (WARN_ON(!gic->saved_ppi_conf))
+		goto free_ppi_active;
 
 	if (gic == &gic_data[0])
 		cpu_pm_register_notifier(&gic_notifier_block);
+
+	return 0;
+
+free_ppi_active:
+	free_percpu(gic->saved_ppi_active);
+free_ppi_enable:
+	free_percpu(gic->saved_ppi_enable);
+
+	return -ENOMEM;
 }
 #else
-static void __init gic_pm_init(struct gic_chip_data *gic)
+static int __init gic_pm_init(struct gic_chip_data *gic)
 {
+	return 0;
 }
 #endif
 
@@ -1000,13 +1017,13 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
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
 
 	BUG_ON(gic_nr >= CONFIG_ARM_GIC_MAX_NR);
 
@@ -1019,7 +1036,7 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 		gic->chip.irq_mask = gic_eoimode1_mask_irq;
 		gic->chip.irq_eoi = gic_eoimode1_eoi_irq;
 		gic->chip.irq_set_vcpu_affinity = gic_irq_set_vcpu_affinity;
-		gic->chip.name = "GICv2";
+		gic->chip.name = kasprintf(GFP_KERNEL, "GICv2");
 	} else {
 		gic->chip.name = kasprintf(GFP_KERNEL, "GIC-%d", gic_nr);
 	}
@@ -1029,17 +1046,16 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 		gic->chip.irq_set_affinity = gic_set_affinity;
 #endif
 
-#ifdef CONFIG_GIC_NON_BANKED
-	if (percpu_offset) { /* Frankein-GIC without banked registers... */
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
+			goto error;
 		}
 
 		for_each_possible_cpu(cpu) {
@@ -1051,9 +1067,8 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
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
@@ -1103,8 +1118,10 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 					hwirq_base, &gic_irq_domain_ops, gic);
 	}
 
-	if (WARN_ON(!gic->domain))
-		return;
+	if (WARN_ON(!gic->domain)) {
+		ret = -ENODEV;
+		goto error;
+	}
 
 	if (gic_nr == 0) {
 		/*
@@ -1124,8 +1141,25 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 	}
 
 	gic_dist_init(gic);
-	gic_cpu_init(gic);
-	gic_pm_init(gic);
+	ret = gic_cpu_init(gic);
+	if (ret)
+		goto error;
+
+	ret = gic_pm_init(gic);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	if (IS_ENABLED(CONFIG_GIC_NON_BANKED) && percpu_offset) {
+		free_percpu(gic->dist_base.percpu_base);
+		free_percpu(gic->cpu_base.percpu_base);
+	}
+
+	kfree(gic->chip.name);
+
+	return ret;
 }
 
 void __init gic_init(unsigned int gic_nr, int irq_start,
@@ -1209,7 +1243,7 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	void __iomem *cpu_base;
 	void __iomem *dist_base;
 	u32 percpu_offset;
-	int irq;
+	int irq, ret;
 
 	if (WARN_ON(!node))
 		return -ENODEV;
@@ -1234,8 +1268,14 @@ gic_of_init(struct device_node *node, struct device_node *parent)
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
 	if (!gic_cnt) {
 		gic_init_physaddr(node);
 		gic_of_setup_kvm_info(node);
@@ -1374,7 +1414,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 	struct acpi_madt_generic_distributor *dist;
 	void __iomem *cpu_base, *dist_base;
 	struct fwnode_handle *domain_handle;
-	int count;
+	int count, ret;
 
 	/* Collect CPU base addresses */
 	count = acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
@@ -1417,7 +1457,14 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
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
 
-- 
2.1.4
