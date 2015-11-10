From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 2/2] irqchip/gic: Add support for tegra AGIC interrupt controller
Date: Tue, 10 Nov 2015 14:39:37 +0000
Message-ID: <1447166377-19707-3-git-send-email-jonathanh@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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
1. Currently the GIC platform driver assumes that the device is a non-root
   GIC and hence has a parent interrupt. It also assumes that for non-root
   GICs PPIs are not used and hence gic_cpu_save/restore is not used. This
   can be changed.
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
3. Once Linus W's patch, "irqchip/gic: assign irqchip dynamically" is
   merged then the runtime resume/suspend function could be populated at
   runtime for the chips that need it.

Please let me know if you have any thoughts/opinions on the above.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 341 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 291 insertions(+), 50 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 515c823c1c95..4e34ac453e30 100644
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
@@ -69,15 +72,17 @@ union gic_base {
 };
 
 struct gic_chip_data {
+	struct device *dev;
+	struct clk *clk;
 	union gic_base dist_base;
 	union gic_base cpu_base;
 #ifdef CONFIG_CPU_PM
-	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
-	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
-	u32 saved_spi_target[DIV_ROUND_UP(1020, 4)];
 	u32 __percpu *saved_ppi_enable;
 	u32 __percpu *saved_ppi_conf;
 #endif
+	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
+	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
+	u32 saved_spi_target[DIV_ROUND_UP(1020, 4)];
 	struct irq_domain *domain;
 	unsigned int gic_irqs;
 #ifdef CONFIG_GIC_NON_BANKED
@@ -380,6 +385,36 @@ static void gic_handle_cascade_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int gic_runtime_resume(struct irq_data *d)
+{
+	struct gic_chip_data *gic = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	if (!gic->dev)
+		return 0;
+
+	ret = pm_runtime_get_sync(gic->dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int gic_runtime_suspend(struct irq_data *d)
+{
+	struct gic_chip_data *gic = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	if (!gic->dev)
+		return 0;
+
+	ret = pm_runtime_put(gic->dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static struct irq_chip gic_chip = {
 	.name			= "GIC",
 	.irq_mask		= gic_mask_irq,
@@ -391,6 +426,8 @@ static struct irq_chip gic_chip = {
 #endif
 	.irq_get_irqchip_state	= gic_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gic_irq_set_irqchip_state,
+	.irq_runtime_resume	= gic_runtime_resume,
+	.irq_runtime_suspend	= gic_runtime_suspend,
 	.flags			= IRQCHIP_SET_TYPE_MASKED |
 				  IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -408,6 +445,8 @@ static struct irq_chip gic_eoimode1_chip = {
 	.irq_get_irqchip_state	= gic_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gic_irq_set_irqchip_state,
 	.irq_set_vcpu_affinity	= gic_irq_set_vcpu_affinity,
+	.irq_runtime_resume	= gic_runtime_resume,
+	.irq_runtime_suspend	= gic_runtime_suspend,
 	.flags			= IRQCHIP_SET_TYPE_MASKED |
 				  IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -459,7 +498,7 @@ static void gic_cpu_if_up(struct gic_chip_data *gic)
 }
 
 
-static void __init gic_dist_init(struct gic_chip_data *gic)
+static void gic_dist_init(struct gic_chip_data *gic)
 {
 	unsigned int i;
 	u32 cpumask;
@@ -533,38 +572,36 @@ int gic_cpu_if_down(unsigned int gic_nr)
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
+	BUG_ON(!gic);
 
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
 }
 
@@ -575,17 +612,16 @@ static void gic_dist_save(unsigned int gic_nr)
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
+	BUG_ON(!gic);
 
-	gic_irqs = gic_data[gic_nr].gic_irqs;
-	dist_base = gic_data_dist_base(&gic_data[gic_nr]);
+	gic_irqs = gic->gic_irqs;
+	dist_base = gic_data_dist_base(gic);
 
 	if (!dist_base)
 		return;
@@ -593,7 +629,7 @@ static void gic_dist_restore(unsigned int gic_nr)
 	writel_relaxed(GICD_DISABLE, dist_base + GIC_DIST_CTRL);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 16); i++)
-		writel_relaxed(gic_data[gic_nr].saved_spi_conf[i],
+		writel_relaxed(gic->saved_spi_conf[i],
 			dist_base + GIC_DIST_CONFIG + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
@@ -601,16 +637,17 @@ static void gic_dist_restore(unsigned int gic_nr)
 			dist_base + GIC_DIST_PRI + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
-		writel_relaxed(gic_data[gic_nr].saved_spi_target[i],
+		writel_relaxed(gic->saved_spi_target[i],
 			dist_base + GIC_DIST_TARGET + i * 4);
 
 	for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++)
-		writel_relaxed(gic_data[gic_nr].saved_spi_enable[i],
+		writel_relaxed(gic->saved_spi_enable[i],
 			dist_base + GIC_DIST_ENABLE_SET + i * 4);
 
 	writel_relaxed(GICD_ENABLE, dist_base + GIC_DIST_CTRL);
 }
 
+#ifdef CONFIG_CPU_PM
 static void gic_cpu_save(unsigned int gic_nr)
 {
 	int i;
@@ -688,11 +725,11 @@ static int gic_notifier(struct notifier_block *self, unsigned long cmd,	void *v)
 			gic_cpu_restore(i);
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
@@ -998,19 +1035,15 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.unmap = gic_irq_domain_unmap,
 };
 
-static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
-			   void __iomem *dist_base, void __iomem *cpu_base,
-			   u32 percpu_offset, struct fwnode_handle *handle)
+static int __gic_init_bases(struct gic_chip_data *gic, int irq_start,
+			    void __iomem *dist_base, void __iomem *cpu_base,
+			    u32 percpu_offset, struct fwnode_handle *handle)
 {
 	irq_hw_number_t hwirq_base;
-	struct gic_chip_data *gic;
 	int gic_irqs, irq_base, i;
 
-	BUG_ON(gic_nr >= MAX_GIC_NR);
-
 	gic_check_cpu_features();
 
-	gic = &gic_data[gic_nr];
 #ifdef CONFIG_GIC_NON_BANKED
 	if (percpu_offset) { /* Frankein-GIC without banked registers... */
 		unsigned int cpu;
@@ -1021,7 +1054,7 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 			    !gic->cpu_base.percpu_base)) {
 			free_percpu(gic->dist_base.percpu_base);
 			free_percpu(gic->cpu_base.percpu_base);
-			return;
+			return -ENOMEM;
 		}
 
 		for_each_possible_cpu(cpu) {
@@ -1063,7 +1096,7 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 		 * For primary GICs, skip over SGIs.
 		 * For secondary GICs, skip over PPIs, too.
 		 */
-		if (gic_nr == 0 && (irq_start & 31) > 0) {
+		if (gic == &gic_data[0] && (irq_start & 31) > 0) {
 			hwirq_base = 16;
 			if (irq_start != -1)
 				irq_start = (irq_start & ~31) + 16;
@@ -1086,9 +1119,9 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 	}
 
 	if (WARN_ON(!gic->domain))
-		return;
+		return -ENODEV;
 
-	if (gic_nr == 0) {
+	if (gic == &gic_data[0]) {
 		/*
 		 * Initialize the CPU interface map to all CPUs.
 		 * It will be refined as each CPU probes its ID.
@@ -1107,18 +1140,29 @@ static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
 
 	gic_dist_init(gic);
 	gic_cpu_init(gic);
-	gic_pm_init(gic);
+
+	return 0;
 }
 
 void __init gic_init(unsigned int gic_nr, int irq_start,
 		     void __iomem *dist_base, void __iomem *cpu_base)
 {
+	struct gic_chip_data *gic;
+
+	BUG_ON(gic_nr >= MAX_GIC_NR);
+
+	gic = &gic_data[gic_nr];
+
 	/*
 	 * Non-DT/ACPI systems won't run a hypervisor, so let's not
 	 * bother with these...
 	 */
 	static_key_slow_dec(&supports_deactivate);
-	__gic_init_bases(gic_nr, irq_start, dist_base, cpu_base, 0, NULL);
+
+	if (__gic_init_bases(gic, irq_start, dist_base, cpu_base, 0, NULL))
+		return;
+
+	gic_pm_init(gic);
 }
 
 #ifdef CONFIG_OF
@@ -1162,21 +1206,30 @@ static bool gic_check_eoimode(struct device_node *node, void __iomem **base)
 	return true;
 }
 
-static int __init
-gic_of_init(struct device_node *node, struct device_node *parent)
+static int gic_of_add(struct gic_chip_data *gic, struct device_node *node,
+		      int irq)
 {
 	void __iomem *cpu_base;
 	void __iomem *dist_base;
 	u32 percpu_offset;
-	int irq;
+	int ret;
 
-	if (WARN_ON(!node))
+	if (WARN_ON(!gic || !node))
 		return -ENODEV;
 
 	dist_base = of_iomap(node, 0);
-	WARN(!dist_base, "unable to map gic dist registers\n");
+	if (!dist_base) {
+		WARN(1, "unable to map gic dist registers\n");
+		return -ENOMEM;
+	}
 
 	cpu_base = of_iomap(node, 1);
+	if (!cpu_base) {
+		WARN(1, "unable to map gic cpu registers\n");
+		ret = -ENOMEM;
+		goto err_map;
+	}
+
 	WARN(!cpu_base, "unable to map gic cpu registers\n");
 
 	/*
@@ -1189,20 +1242,51 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
 		percpu_offset = 0;
 
-	__gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset,
-			 &node->fwnode);
-	if (!gic_cnt)
+	ret = __gic_init_bases(gic, -1, dist_base, cpu_base, percpu_offset,
+			       &node->fwnode);
+	if (ret)
+		goto err_gic;
+
+	if (gic == &gic_data[0])
 		gic_init_physaddr(node);
 
-	if (parent) {
-		irq = irq_of_parse_and_map(node, 0);
-		gic_cascade_irq(gic_cnt, irq);
-	}
+	if (irq)
+		irq_set_chained_handler_and_data(irq, gic_handle_cascade_irq,
+						 gic);
 
 	if (IS_ENABLED(CONFIG_ARM_GIC_V2M))
 		gicv2m_of_init(node, gic_data[gic_cnt].domain);
 
+	return 0;
+
+err_gic:
+	iounmap(dist_base);
+err_map:
+	iounmap(cpu_base);
+
+	return ret;
+}
+
+static int __init
+gic_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct gic_chip_data *gic;
+	int ret, irq = 0;
+
+	BUG_ON(gic_cnt >= MAX_GIC_NR);
+
+	gic = &gic_data[gic_cnt];
+
+	if (parent)
+		irq = irq_of_parse_and_map(node, 0);
+
+	ret = gic_of_add(gic, node, irq);
+	if (ret)
+		return ret;
+
+	gic_pm_init(gic);
 	gic_cnt++;
+
 	return 0;
 }
 IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
@@ -1215,6 +1299,153 @@ IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
 IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
 IRQCHIP_DECLARE(pl390, "arm,pl390", gic_of_init);
 
+static int gic_runtime_resume_cb(struct device *dev)
+{
+	struct gic_chip_data *gic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(gic->clk);
+	if (ret)
+		return ret;
+
+	gic_dist_restore(gic);
+
+	return 0;
+}
+
+static int gic_runtime_suspend_cb(struct device *dev)
+{
+	struct gic_chip_data *gic = dev_get_drvdata(dev);
+
+	gic_dist_save(gic);
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
+	gic->dev = dev;
+	platform_set_drvdata(pdev, gic);
+
+	pm_runtime_enable(dev);
+	if (pm_runtime_enabled(dev))
+		ret = pm_runtime_get_sync(dev);
+	else
+		ret = gic_runtime_resume_cb(dev);
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
+	ret = gic_of_add(gic, dev->of_node, irq);
+	if (ret)
+		goto err_gic;
+
+	pm_runtime_put(dev);
+
+	dev_info(dev, "GIC IRQ controller registered\n");
+
+	return 0;
+
+err_gic:
+	irq_dispose_mapping(irq);
+err_irq:
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		gic_runtime_suspend_cb(dev);
+err_rpm:
+	clk_put(gic->clk);
+
+	return ret;
+}
+
+static int gic_remove(struct platform_device *pdev)
+{
+	struct gic_chip_data *gic = platform_get_drvdata(pdev);
+	irq_hw_number_t hwirq;
+	void __iomem *base;
+
+	for (hwirq = 0; hwirq < gic->gic_irqs; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(gic->domain, hwirq));
+
+	irq_domain_remove(gic->domain);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		gic_runtime_suspend_cb(&pdev->dev);
+
+	base = gic_data_cpu_base(gic);
+	if (base)
+		iounmap(base);
+
+	base = gic_data_dist_base(gic);
+	if (base)
+		iounmap(base);
+
+	clk_put(gic->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int gic_suspend(struct device *dev)
+{
+	return pm_runtime_suspended(dev) == false;
+}
+#endif
+
+static const struct dev_pm_ops gic_pm_ops = {
+	SET_RUNTIME_PM_OPS(gic_runtime_suspend_cb,
+			   gic_runtime_resume_cb, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(gic_suspend, NULL)
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
+	.remove		= gic_remove,
+	.driver		= {
+		.name	= "gic",
+		.of_match_table	= gic_match,
+		.pm	= &gic_pm_ops,
+	}
+};
+
+module_platform_driver(gic_driver);
+
+MODULE_DESCRIPTION("ARM GIC IRQ Controller");
+MODULE_LICENSE("GPL v2");
 #endif
 
 #ifdef CONFIG_ACPI
@@ -1279,7 +1510,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 	struct acpi_madt_generic_distributor *dist;
 	void __iomem *cpu_base, *dist_base;
 	struct fwnode_handle *domain_handle;
-	int count;
+	int count, ret;
 
 	/* Collect CPU base addresses */
 	count = acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
@@ -1322,7 +1553,17 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 		return -ENOMEM;
 	}
 
-	__gic_init_bases(0, -1, dist_base, cpu_base, 0, domain_handle);
+	ret = __gic_init_bases(&gic_data[0], -1, dist_base, cpu_base, 0,
+			       domain_handle);
+	if (ret) {
+		pr_err("Failed to initialise GIC\n");
+		irq_domain_free_fwnode(domain_handle);
+		iounmap(cpu_base);
+		iounmap(dist_base);
+		return ret;
+	}
+
+	gic_pm_init(&gic_data[0]);
 
 	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, domain_handle);
 	return 0;
-- 
2.1.4
