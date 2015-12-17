From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 8/8] irqchip/gic: Add support for tegra AGIC interrupt controller
Date: Thu, 17 Dec 2015 10:48:29 +0000
Message-ID: <1450349309-8107-9-git-send-email-jonathanh@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add a driver for the Tegra-AGIC interrupt controller which is compatible
with the ARM GIC-400 interrupt controller.

The Tegra AGIC (Audio GIC) is part of the Audio Processing Engine (APE) on
Tegra210 and can route interrupts to either the GIC for the CPU subsystem
or the Audio DSP (ADSP) within the APE. The AGIC uses CPU interface 0 to
route interrupts to the CPU GIC and CPU interface 1 to route interrupts to
the ADSP.

The APE is located within its own power domain on the chip and so the
AGIC needs to manage both the power domain and its clocks. Commit
afbbd2338176 ("irqchip/gic: Document optional Clock and Power Domain
properties") adding clock and power-domain properties to the GIC binding
and so the aim would be to make use of these to handle power management
(however, this is very much dependent upon adding support for generic
PM domains for Tegra which is still a work-in-progress).

With the AGIC being located in a different power domain to the main CPU
cluster this means that:
1. The interrupt controller cannot be registered via IRQCHIP_DECLARE()
   because it needs to be registered as a platform device so that the
   generic PM domain core will ensure that the power domain is available
   before probing.
2. The interrupt controller cannot be suspended/restored based upon
   changes in the CPU power state and needs to use runtime-pm instead.

This is very much a work-in-progress and there are still a few items that
need to be resolved. These items are:
1. Currently the GIC platform driver only supports non-root GICs. The
   platform driver performs a save and restore of PPI interrupts for
   non-root GICs, which is probably not necessary and so could be changed.
   At a minimum we need to re-enable the CPU interface during the device
   resume but we could skip the restoration of the PPIs. In general we
   could update the driver to only save and restore PPIs for the root
   controller, if that makes sense.
2. Currently routing of interrupts to the ADSP for Tegra210 is not
   supported by this driver. Although the ADSP on Tegra210 could also setup
   the AGIC distributor having two independent subsystems configure the
   distributor does not seem like a good idea. Given that the ADSP is a
   slave and would be under the control of the kernel via its own driver,
   it would seem best that only the kernel configures the distributors
   routing of the interrupts. This could be achieved by adding a new genirq
   API to migrate the interrupt. The GIC driver already has an API to
   migrate all interrupts from one CPU interface to another (which I
   understand is for a different reason), but having an generic API to
   migrate an interrupt to another device could be useful (unless something
   already exists that I have overlooked).

Please let me know if you have any thoughts/opinions on the above.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 330 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 253 insertions(+), 77 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index db3a46e40142..978edb74e7ad 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/list.h>
 #include <linux/smp.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/cpu_pm.h>
 #include <linux/cpumask.h>
@@ -37,6 +38,8 @@
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/percpu.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
@@ -70,9 +73,9 @@ union gic_base {
 
 struct gic_chip_data {
 	struct irq_chip chip;
+	struct clk *clk;
 	union gic_base dist_base;
 	union gic_base cpu_base;
-#ifdef CONFIG_CPU_PM
 	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
 	u32 saved_spi_active[DIV_ROUND_UP(1020, 32)];
 	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
@@ -80,7 +83,6 @@ struct gic_chip_data {
 	u32 __percpu *saved_ppi_enable;
 	u32 __percpu *saved_ppi_active;
 	u32 __percpu *saved_ppi_conf;
-#endif
 	struct irq_domain *domain;
 	unsigned int gic_irqs;
 #ifdef CONFIG_GIC_NON_BANKED
@@ -444,7 +446,7 @@ static void gic_cpu_if_up(struct gic_chip_data *gic)
 }
 
 
-static void __init gic_dist_init(struct gic_chip_data *gic)
+static void gic_dist_init(struct gic_chip_data *gic)
 {
 	unsigned int i;
 	u32 cpumask;
@@ -518,42 +520,41 @@ int gic_cpu_if_down(unsigned int gic_nr)
 	return 0;
 }
 
-#ifdef CONFIG_CPU_PM
 /*
  * Saves the GIC distributor registers during suspend or idle.  Must be called
  * with interrupts disabled but before powering down the GIC.  After calling
  * this function, no interrupts will be delivered by the GIC, and another
  * platform-specific wakeup source must be enabled.
  */
-static void gic_dist_save(unsigned int gic_nr)
+static void gic_dist_save(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	void __iomem *dist_base;
 	int i;
 
-	if (gic_nr >= MAX_GIC_NR)
-		BUG();
+	if (WARN_ON(!gic))
+		return;
 
-	gic_irqs = gic_data[gic_nr].gic_irqs;
-	dist_base = gic_data_dist_base(&gic_data[gic_nr]);
+	gic_irqs = gic->gic_irqs;
+	dist_base = gic_data_dist_base(gic);
 
 	if (!dist_base)
 		return;
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 16); i++)
-		gic_data[gic_nr].saved_spi_conf[i] =
+		gic->saved_spi_conf[i] =
 			readl_relaxed(dist_base + GIC_DIST_CONFIG + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
-		gic_data[gic_nr].saved_spi_target[i] =
+		gic->saved_spi_target[i] =
 			readl_relaxed(dist_base + GIC_DIST_TARGET + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++)
-		gic_data[gic_nr].saved_spi_enable[i] =
+		gic->saved_spi_enable[i] =
 			readl_relaxed(dist_base + GIC_DIST_ENABLE_SET + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++)
-		gic_data[gic_nr].saved_spi_active[i] =
+		gic->saved_spi_active[i] =
 			readl_relaxed(dist_base + GIC_DIST_ACTIVE_SET + i * 4);
 }
 
@@ -564,17 +565,17 @@ static void gic_dist_save(unsigned int gic_nr)
  * handled normally, but any edge interrupts that occured will not be seen by
  * the GIC and need to be handled by the platform-specific wakeup source.
  */
-static void gic_dist_restore(unsigned int gic_nr)
+static void gic_dist_restore(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	unsigned int i;
 	void __iomem *dist_base;
 
-	if (gic_nr >= MAX_GIC_NR)
-		BUG();
+	if (WARN_ON(!gic))
+		return;
 
-	gic_irqs = gic_data[gic_nr].gic_irqs;
-	dist_base = gic_data_dist_base(&gic_data[gic_nr]);
+	gic_irqs = gic->gic_irqs;
+	dist_base = gic_data_dist_base(gic);
 
 	if (!dist_base)
 		return;
@@ -582,7 +583,7 @@ static void gic_dist_restore(unsigned int gic_nr)
 	writel_relaxed(GICD_DISABLE, dist_base + GIC_DIST_CTRL);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 16); i++)
-		writel_relaxed(gic_data[gic_nr].saved_spi_conf[i],
+		writel_relaxed(gic->saved_spi_conf[i],
 			dist_base + GIC_DIST_CONFIG + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
@@ -590,87 +591,87 @@ static void gic_dist_restore(unsigned int gic_nr)
 			dist_base + GIC_DIST_PRI + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
-		writel_relaxed(gic_data[gic_nr].saved_spi_target[i],
+		writel_relaxed(gic->saved_spi_target[i],
 			dist_base + GIC_DIST_TARGET + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++) {
 		writel_relaxed(GICD_INT_EN_CLR_X32,
 			dist_base + GIC_DIST_ENABLE_CLEAR + i * 4);
-		writel_relaxed(gic_data[gic_nr].saved_spi_enable[i],
+		writel_relaxed(gic->saved_spi_enable[i],
 			dist_base + GIC_DIST_ENABLE_SET + i * 4);
 	}
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++) {
 		writel_relaxed(GICD_INT_EN_CLR_X32,
 			dist_base + GIC_DIST_ACTIVE_CLEAR + i * 4);
-		writel_relaxed(gic_data[gic_nr].saved_spi_active[i],
+		writel_relaxed(gic->saved_spi_active[i],
 			dist_base + GIC_DIST_ACTIVE_SET + i * 4);
 	}
 
 	writel_relaxed(GICD_ENABLE, dist_base + GIC_DIST_CTRL);
 }
 
-static void gic_cpu_save(unsigned int gic_nr)
+static void gic_cpu_save(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
 	void __iomem *dist_base;
 	void __iomem *cpu_base;
 
-	if (gic_nr >= MAX_GIC_NR)
-		BUG();
+	if (WARN_ON(!gic))
+		return;
 
-	dist_base = gic_data_dist_base(&gic_data[gic_nr]);
-	cpu_base = gic_data_cpu_base(&gic_data[gic_nr]);
+	dist_base = gic_data_dist_base(gic);
+	cpu_base = gic_data_cpu_base(gic);
 
 	if (!dist_base || !cpu_base)
 		return;
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_enable);
+	ptr = raw_cpu_ptr(gic->saved_ppi_enable);
 	for (i = 0; i < DIV_ROUND_UP(32, 32); i++)
 		ptr[i] = readl_relaxed(dist_base + GIC_DIST_ENABLE_SET + i * 4);
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_active);
+	ptr = raw_cpu_ptr(gic->saved_ppi_active);
 	for (i = 0; i < DIV_ROUND_UP(32, 32); i++)
 		ptr[i] = readl_relaxed(dist_base + GIC_DIST_ACTIVE_SET + i * 4);
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_conf);
+	ptr = raw_cpu_ptr(gic->saved_ppi_conf);
 	for (i = 0; i < DIV_ROUND_UP(32, 16); i++)
 		ptr[i] = readl_relaxed(dist_base + GIC_DIST_CONFIG + i * 4);
 
 }
 
-static void gic_cpu_restore(unsigned int gic_nr)
+static void gic_cpu_restore(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
 	void __iomem *dist_base;
 	void __iomem *cpu_base;
 
-	if (gic_nr >= MAX_GIC_NR)
-		BUG();
+	if (WARN_ON(!gic))
+		return;
 
-	dist_base = gic_data_dist_base(&gic_data[gic_nr]);
-	cpu_base = gic_data_cpu_base(&gic_data[gic_nr]);
+	dist_base = gic_data_dist_base(gic);
+	cpu_base = gic_data_cpu_base(gic);
 
 	if (!dist_base || !cpu_base)
 		return;
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_enable);
+	ptr = raw_cpu_ptr(gic->saved_ppi_enable);
 	for (i = 0; i < DIV_ROUND_UP(32, 32); i++) {
 		writel_relaxed(GICD_INT_EN_CLR_X32,
 			       dist_base + GIC_DIST_ENABLE_CLEAR + i * 4);
 		writel_relaxed(ptr[i], dist_base + GIC_DIST_ENABLE_SET + i * 4);
 	}
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_active);
+	ptr = raw_cpu_ptr(gic->saved_ppi_active);
 	for (i = 0; i < DIV_ROUND_UP(32, 32); i++) {
 		writel_relaxed(GICD_INT_EN_CLR_X32,
 			       dist_base + GIC_DIST_ACTIVE_CLEAR + i * 4);
 		writel_relaxed(ptr[i], dist_base + GIC_DIST_ACTIVE_SET + i * 4);
 	}
 
-	ptr = raw_cpu_ptr(gic_data[gic_nr].saved_ppi_conf);
+	ptr = raw_cpu_ptr(gic->saved_ppi_conf);
 	for (i = 0; i < DIV_ROUND_UP(32, 16); i++)
 		writel_relaxed(ptr[i], dist_base + GIC_DIST_CONFIG + i * 4);
 
@@ -679,7 +680,7 @@ static void gic_cpu_restore(unsigned int gic_nr)
 					dist_base + GIC_DIST_PRI + i * 4);
 
 	writel_relaxed(GICC_INT_PRI_THRESHOLD, cpu_base + GIC_CPU_PRIMASK);
-	gic_cpu_if_up(&gic_data[gic_nr]);
+	gic_cpu_if_up(gic);
 }
 
 static int gic_notifier(struct notifier_block *self, unsigned long cmd,	void *v)
@@ -694,18 +695,18 @@ static int gic_notifier(struct notifier_block *self, unsigned long cmd,	void *v)
 #endif
 		switch (cmd) {
 		case CPU_PM_ENTER:
-			gic_cpu_save(i);
+			gic_cpu_save(&gic_data[i]);
 			break;
 		case CPU_PM_ENTER_FAILED:
 		case CPU_PM_EXIT:
-			gic_cpu_restore(i);
+			gic_cpu_restore(&gic_data[i]);
 			break;
 		case CPU_CLUSTER_PM_ENTER:
-			gic_dist_save(i);
+			gic_dist_save(&gic_data[i]);
 			break;
 		case CPU_CLUSTER_PM_ENTER_FAILED:
 		case CPU_CLUSTER_PM_EXIT:
-			gic_dist_restore(i);
+			gic_dist_restore(&gic_data[i]);
 			break;
 		}
 	}
@@ -734,11 +735,6 @@ static void gic_pm_init(struct gic_chip_data *gic)
 	if (gic == &gic_data[0])
 		cpu_pm_register_notifier(&gic_notifier_block);
 }
-#else
-static void gic_pm_init(struct gic_chip_data *gic)
-{
-}
-#endif
 
 #ifdef CONFIG_SMP
 static void gic_raise_softirq(const struct cpumask *mask, unsigned int irq)
@@ -1010,24 +1006,23 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static int __gic_init_bases(unsigned int gic_nr, int irq_start,
+static int __gic_init_bases(struct gic_chip_data *gic, int irq_start,
 			    void __iomem *dist_base, void __iomem *cpu_base,
-			    u32 percpu_offset, struct fwnode_handle *handle)
+			    u32 percpu_offset, struct fwnode_handle *handle,
+			    const char *name)
 {
 	irq_hw_number_t hwirq_base;
-	struct gic_chip_data *gic;
 	int gic_irqs, irq_base, ret;
 
-	BUG_ON(gic_nr >= MAX_GIC_NR);
+	if (WARN_ON(!gic || gic->domain))
+		return -EINVAL;
 
 	gic_check_cpu_features();
 
-	gic = &gic_data[gic_nr];
-
 	gic->chip = gic_chip;
-	gic->chip.name = kasprintf(GFP_KERNEL, "GIC%d", gic_nr);
+	gic->chip.name = name;
 
-	if (gic_nr == 0 && static_key_true(&supports_deactivate)) {
+	if (gic == &gic_data[0] && static_key_true(&supports_deactivate)) {
 		gic->chip.irq_mask = gic_eoimode1_mask_irq;
 		gic->chip.irq_eoi = gic_eoimode1_eoi_irq;
 		gic->chip.irq_set_vcpu_affinity = gic_irq_set_vcpu_affinity;
@@ -1083,7 +1078,7 @@ static int __gic_init_bases(unsigned int gic_nr, int irq_start,
 		 * For primary GICs, skip over SGIs.
 		 * For secondary GICs, skip over PPIs, too.
 		 */
-		if (gic_nr == 0 && (irq_start & 31) > 0) {
+		if (gic == &gic_data[0] && (irq_start & 31) > 0) {
 			hwirq_base = 16;
 			if (irq_start != -1)
 				irq_start = (irq_start & ~31) + 16;
@@ -1132,6 +1127,9 @@ static int __init __gic_init_root(int irq_start, void __iomem *dist_base,
 				  struct fwnode_handle *handle)
 {
 	int i, ret;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "GIC0");
 
 	/*
 	 * Initialize the CPU interface map to all CPUs.
@@ -1141,10 +1139,12 @@ static int __init __gic_init_root(int irq_start, void __iomem *dist_base,
 	for (i = 0; i < NR_GIC_CPU_IF; i++)
 		gic_cpu_map[i] = 0xff;
 
-	ret = __gic_init_bases(0, irq_start, dist_base, cpu_base,
-			       percpu_offset, handle);
-	if (ret)
+	ret = __gic_init_bases(&gic_data[0], irq_start, dist_base, cpu_base,
+			       percpu_offset, handle, name);
+	if (ret) {
+		kfree(name);
 		return ret;
+	}
 
 	if (IS_ENABLED(CONFIG_SMP)) {
 		set_smp_cross_call(gic_raise_softirq);
@@ -1162,17 +1162,26 @@ static int __init __gic_init_root(int irq_start, void __iomem *dist_base,
 void __init gic_init(unsigned int gic_nr, int irq_start,
 		     void __iomem *dist_base, void __iomem *cpu_base)
 {
+	char *name;
+
+	if (WARN_ON(gic_nr >= MAX_GIC_NR))
+		return;
+
 	/*
 	 * Non-DT/ACPI systems won't run a hypervisor, so let's not
 	 * bother with these...
 	 */
 	static_key_slow_dec(&supports_deactivate);
 
-	if (!gic_nr)
+	if (!gic_nr) {
 		__gic_init_root(irq_start, dist_base, cpu_base, 0, NULL);
-	else
-		__gic_init_bases(gic_nr, irq_start, dist_base, cpu_base, 0,
-				 NULL);
+	} else {
+		name = kasprintf(GFP_KERNEL, "GIC%d", gic_nr);
+
+		if (__gic_init_bases(&gic_data[gic_nr], irq_start, dist_base,
+				     cpu_base, 0, NULL, name))
+			kfree(name);
+	}
 }
 
 #ifdef CONFIG_OF
@@ -1216,6 +1225,28 @@ static bool gic_check_eoimode(struct device_node *node, void __iomem **base)
 	return true;
 }
 
+static int gic_of_setup(struct device_node *node, void __iomem **dist_base,
+			void __iomem **cpu_base, u32 *percpu_offset)
+{
+	if (!node)
+		return -EINVAL;
+
+	*dist_base = of_iomap(node, 0);
+	if (WARN(!*dist_base, "unable to map gic dist registers\n"))
+		return -ENOMEM;
+
+	*cpu_base = of_iomap(node, 1);
+	if (WARN(!*cpu_base, "unable to map gic cpu registers\n")) {
+		iounmap(*dist_base);
+		return -ENOMEM;
+	}
+
+	if (of_property_read_u32(node, "cpu-offset", percpu_offset))
+		*percpu_offset = 0;
+
+	return 0;
+}
+
 static int __init
 gic_of_init(struct device_node *node, struct device_node *parent)
 {
@@ -1227,18 +1258,12 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	if (WARN_ON(!node))
 		return -ENODEV;
 
-	dist_base = of_iomap(node, 0);
-	if (WARN(!dist_base, "unable to map gic dist registers\n"))
-		return -ENOMEM;
-
-	cpu_base = of_iomap(node, 1);
-	if (WARN(!cpu_base, "unable to map gic cpu registers\n")) {
-		iounmap(dist_base);
-		return -ENOMEM;
-	}
+	if (WARN_ON(gic_cnt >= MAX_GIC_NR))
+		return -EINVAL;
 
-	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
-		percpu_offset = 0;
+	ret = gic_of_setup(node, &dist_base, &cpu_base, &percpu_offset);
+	if (ret)
+		return ret;
 
 	if (!gic_cnt) {
 		/*
@@ -1251,8 +1276,9 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 		ret = __gic_init_root(-1, dist_base, cpu_base, percpu_offset,
 				      &node->fwnode);
 	} else {
-		ret = __gic_init_bases(gic_cnt, -1, dist_base, cpu_base,
-				       percpu_offset, &node->fwnode);
+		ret = __gic_init_bases(&gic_data[gic_cnt], -1, dist_base,
+				       cpu_base, percpu_offset, &node->fwnode,
+				       node->name);
 	}
 
 	if (ret) {
@@ -1285,6 +1311,156 @@ IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
 IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
 IRQCHIP_DECLARE(pl390, "arm,pl390", gic_of_init);
 
+static int gic_runtime_resume(struct device *dev)
+{
+	struct gic_chip_data *gic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(gic->clk);
+	if (ret)
+		return ret;
+
+	gic_dist_restore(gic);
+	gic_cpu_restore(gic);
+
+	return 0;
+}
+
+static int gic_runtime_suspend(struct device *dev)
+{
+	struct gic_chip_data *gic = dev_get_drvdata(dev);
+
+	gic_dist_save(gic);
+	gic_cpu_save(gic);
+
+	clk_disable_unprepare(gic->clk);
+
+	return 0;
+}
+
+static int gic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gic_chip_data *gic;
+	void __iomem *dist_base;
+	void __iomem *cpu_base;
+	u32 percpu_offset;
+	int ret, irq;
+
+	if (dev->of_node == NULL)
+		return -EINVAL;
+
+	gic = devm_kzalloc(dev, sizeof(*gic), GFP_KERNEL);
+	if (!gic)
+		return -ENOMEM;
+
+	gic->clk = of_clk_get(dev->of_node, 0);
+	if (IS_ERR(gic->clk)) {
+		dev_err(dev, "clock not found\n");
+		return PTR_ERR(gic->clk);
+	}
+
+	platform_set_drvdata(pdev, gic);
+
+	pm_runtime_enable(dev);
+	if (pm_runtime_enabled(dev))
+		ret = pm_runtime_get_sync(dev);
+	else
+		ret = gic_runtime_resume(dev);
+
+	if (ret < 0) {
+		pm_runtime_disable(dev);
+		goto err_rpm;
+	}
+
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq) {
+		ret = -EINVAL;
+		goto err_irq;
+	}
+
+	ret = gic_of_setup(dev->of_node, &dist_base, &cpu_base, &percpu_offset);
+	if (ret)
+		goto err_map;
+
+	ret = __gic_init_bases(gic, -1, dist_base, cpu_base,
+			       percpu_offset, &dev->of_node->fwnode,
+			       dev->of_node->name);
+	if (ret)
+		goto err_gic;
+
+	gic->chip.dev = dev;
+	gic->chip.flags |= IRQCHIP_HAS_RPM;
+
+	irq_set_chained_handler_and_data(irq, gic_handle_cascade_irq, gic);
+
+	pm_runtime_put(dev);
+
+	dev_info(dev, "GIC IRQ controller registered\n");
+
+	return 0;
+
+err_gic:
+	iounmap(dist_base);
+	iounmap(cpu_base);
+err_map:
+	irq_dispose_mapping(irq);
+err_irq:
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		gic_runtime_suspend(dev);
+err_rpm:
+	clk_put(gic->clk);
+
+	return ret;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int gic_resume(struct device *dev)
+{
+	int ret;
+
+	ret = gic_runtime_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int gic_suspend(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		return gic_runtime_suspend(dev);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops gic_pm_ops = {
+	SET_RUNTIME_PM_OPS(gic_runtime_suspend,
+			   gic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(gic_suspend, gic_resume)
+};
+
+static const struct of_device_id gic_match[] = {
+	{ .compatible = "nvidia,tegra210-agic", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gic_match);
+
+static struct platform_driver gic_driver = {
+	.probe		= gic_probe,
+	.driver		= {
+		.name	= "gic",
+		.of_match_table	= gic_match,
+		.pm	= &gic_pm_ops,
+	}
+};
+
+builtin_platform_driver(gic_driver);
 #endif
 
 #ifdef CONFIG_ACPI
-- 
2.1.4
