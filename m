From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 7/8] irqchip/gic: Prepare for adding platform driver
Date: Thu, 17 Dec 2015 10:48:28 +0000
Message-ID: <1450349309-8107-8-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To support GIC chips located in power-domains outside of the CPU subsystem
it is necessary to add a platform driver for these chips, so that the
probing of the chip can be deferred if the power-domain has not yet been
registered with the generic power-domain infrastructure. Before adding a
platform driver for these chips, it is first necessary to move the function
__gic_init_bases() from the __init section so that it is always present
and not removed so it can be used by the platform driver.

The platform driver will only support non-root interrupt controllers
because the root interrupt controller needs to be initialised early. To
avoid section mis-matches it is also necessary to move function calls for
set_smp_cross_call() and set_handle_irq() from __gic_init_bases() (which
are only required for root controllers) because these are also located in
the __init section. Therefore, add the function __gic_init_root() which
will handle root controller specific initialisation and internally call
__gic_init_bases().

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic-common.c |  4 +-
 drivers/irqchip/irq-gic.c        | 94 +++++++++++++++++++++++++---------------
 2 files changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index f174ce0ca361..f8ccb4beaeb5 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -65,8 +65,8 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 	return ret;
 }
 
-void __init gic_dist_config(void __iomem *base, int gic_irqs,
-			    void (*sync_access)(void))
+void gic_dist_config(void __iomem *base, int gic_irqs,
+		     void (*sync_access)(void))
 {
 	unsigned int i;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ebfbb2379320..db3a46e40142 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -717,7 +717,7 @@ static struct notifier_block gic_notifier_block = {
 	.notifier_call = gic_notifier,
 };
 
-static void __init gic_pm_init(struct gic_chip_data *gic)
+static void gic_pm_init(struct gic_chip_data *gic)
 {
 	gic->saved_ppi_enable = __alloc_percpu(DIV_ROUND_UP(32, 32) * 4,
 		sizeof(u32));
@@ -735,7 +735,7 @@ static void __init gic_pm_init(struct gic_chip_data *gic)
 		cpu_pm_register_notifier(&gic_notifier_block);
 }
 #else
-static void __init gic_pm_init(struct gic_chip_data *gic)
+static void gic_pm_init(struct gic_chip_data *gic)
 {
 }
 #endif
@@ -1010,13 +1010,13 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static int __init __gic_init_bases(unsigned int gic_nr, int irq_start,
-			   void __iomem *dist_base, void __iomem *cpu_base,
-			   u32 percpu_offset, struct fwnode_handle *handle)
+static int __gic_init_bases(unsigned int gic_nr, int irq_start,
+			    void __iomem *dist_base, void __iomem *cpu_base,
+			    u32 percpu_offset, struct fwnode_handle *handle)
 {
 	irq_hw_number_t hwirq_base;
 	struct gic_chip_data *gic;
-	int gic_irqs, irq_base, i, ret;
+	int gic_irqs, irq_base, ret;
 
 	BUG_ON(gic_nr >= MAX_GIC_NR);
 
@@ -1110,23 +1110,6 @@ static int __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 		goto err;
 	}
 
-	if (gic_nr == 0) {
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
 	gic_cpu_init(gic);
 	gic_pm_init(gic);
@@ -1144,6 +1127,38 @@ err:
 	return ret;
 }
 
+static int __init __gic_init_root(int irq_start, void __iomem *dist_base,
+				  void __iomem *cpu_base, u32 percpu_offset,
+				  struct fwnode_handle *handle)
+{
+	int i, ret;
+
+	/*
+	 * Initialize the CPU interface map to all CPUs.
+	 * It will be refined as each CPU probes its ID.
+	 * This is only necessary for the primary GIC.
+	 */
+	for (i = 0; i < NR_GIC_CPU_IF; i++)
+		gic_cpu_map[i] = 0xff;
+
+	ret = __gic_init_bases(0, irq_start, dist_base, cpu_base,
+			       percpu_offset, handle);
+	if (ret)
+		return ret;
+
+	if (IS_ENABLED(CONFIG_SMP)) {
+		set_smp_cross_call(gic_raise_softirq);
+		register_cpu_notifier(&gic_cpu_notifier);
+	}
+
+	set_handle_irq(gic_handle_irq);
+
+	if (static_key_true(&supports_deactivate))
+		pr_info("GIC: Using split EOI/Deactivate mode\n");
+
+	return 0;
+}
+
 void __init gic_init(unsigned int gic_nr, int irq_start,
 		     void __iomem *dist_base, void __iomem *cpu_base)
 {
@@ -1152,7 +1167,12 @@ void __init gic_init(unsigned int gic_nr, int irq_start,
 	 * bother with these...
 	 */
 	static_key_slow_dec(&supports_deactivate);
-	__gic_init_bases(gic_nr, irq_start, dist_base, cpu_base, 0, NULL);
+
+	if (!gic_nr)
+		__gic_init_root(irq_start, dist_base, cpu_base, 0, NULL);
+	else
+		__gic_init_bases(gic_nr, irq_start, dist_base, cpu_base, 0,
+				 NULL);
 }
 
 #ifdef CONFIG_OF
@@ -1217,18 +1237,24 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 		return -ENOMEM;
 	}
 
-	/*
-	 * Disable split EOI/Deactivate if either HYP is not available
-	 * or the CPU interface is too small.
-	 */
-	if (gic_cnt == 0 && !gic_check_eoimode(node, &cpu_base))
-		static_key_slow_dec(&supports_deactivate);
-
 	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
 		percpu_offset = 0;
 
-	ret = __gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset,
-			 &node->fwnode);
+	if (!gic_cnt) {
+		/*
+		 * Disable split EOI/Deactivate if either HYP is not available
+		 * or the CPU interface is too small.
+		 */
+		if (!gic_check_eoimode(node, &cpu_base))
+			static_key_slow_dec(&supports_deactivate);
+
+		ret = __gic_init_root(-1, dist_base, cpu_base, percpu_offset,
+				      &node->fwnode);
+	} else {
+		ret = __gic_init_bases(gic_cnt, -1, dist_base, cpu_base,
+				       percpu_offset, &node->fwnode);
+	}
+
 	if (ret) {
 		iounmap(dist_base);
 		iounmap(cpu_base);
@@ -1366,7 +1392,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 		return -ENOMEM;
 	}
 
-	ret = __gic_init_bases(0, -1, dist_base, cpu_base, 0, domain_handle);
+	ret = __gic_init_root(-1, dist_base, cpu_base, 0, domain_handle);
 	if (ret) {
 		pr_err("Failed to initialise GIC\n");
 		irq_domain_free_fwnode(domain_handle);
-- 
2.1.4
