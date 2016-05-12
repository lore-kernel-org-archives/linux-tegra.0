From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 9/9] irqchip/gic: Add platform driver for non-root GICs that require RPM
Date: Thu, 12 May 2016 16:19:32 +0100
Message-ID: <1463066372-13115-10-git-send-email-jonathanh@nvidia.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add a platform driver to support non-root GICs that require runtime
power-management. Currently, only non-root GICs are supported because
the functions, smp_cross_call() and set_handle_irq(), that need to
be called for a root controller are located in the __init section and
so cannot be called by the platform driver.

The GIC platform driver re-uses many functions from the existing GIC
driver including some functions to save and restore the GIC context
during power transitions. The functions for saving and restoring the
GIC context are currently only defined if CONFIG_CPU_PM is enabled and
to ensure that these functions are always defined when the platform
driver is enabled, a dependency on CONFIG_ARM_GIC_PM (which selects the
platform driver) has been added.

In order to re-use the private GIC initialisation code, a new public
function, of_gic_init(), has been added which calls various private
functions to initialise the GIC.

There is no specific suspend handling for GICs registered as platform
devices. Non-wakeup interrupts will be disabled by the kernel during
late suspend, however, this alone will not power down the GIC if
interrupts have been requested and not freed. Therefore, requestors of
non-wakeup interrupts will need to free them on entering suspend in
order to power-down the GIC.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/Kconfig      |   6 ++
 drivers/irqchip/Makefile     |   1 +
 drivers/irqchip/irq-gic-pm.c | 187 +++++++++++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic.c    |  34 +++++++-
 drivers/irqchip/irq-gic.h    |   2 +
 5 files changed, 227 insertions(+), 3 deletions(-)
 create mode 100644 drivers/irqchip/irq-gic-pm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 81f88ada3a61..68f65c84fdfd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -8,6 +8,12 @@ config ARM_GIC
 	select IRQ_DOMAIN_HIERARCHY
 	select MULTI_IRQ_HANDLER
 
+config ARM_GIC_PM
+	bool
+	depends on PM
+	select ARM_GIC
+	select PM_CLK
+
 config ARM_GIC_MAX_NR
 	int
 	default 2 if ARCH_REALVIEW
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index f828244b44c2..eab28e80cd8d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= irq-sun4i.o
 obj-$(CONFIG_ARCH_SUNXI)		+= irq-sunxi-nmi.o
 obj-$(CONFIG_ARCH_SPEAR3XX)		+= spear-shirq.o
 obj-$(CONFIG_ARM_GIC)			+= irq-gic.o irq-gic-common.o
+obj-$(CONFIG_ARM_GIC_PM)		+= irq-gic-pm.o
 obj-$(CONFIG_REALVIEW_DT)		+= irq-gic-realview.o
 obj-$(CONFIG_ARM_GIC_V2M)		+= irq-gic-v2m.o
 obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-common.o
diff --git a/drivers/irqchip/irq-gic-pm.c b/drivers/irqchip/irq-gic-pm.c
new file mode 100644
index 000000000000..a14331007bcf
--- /dev/null
+++ b/drivers/irqchip/irq-gic-pm.c
@@ -0,0 +1,187 @@
+/*
+ * Copyright (C) 2016 NVIDIA CORPORATION, All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "irq-gic.h"
+
+struct gic_clk_data {
+	unsigned int num_clocks;
+	const char *const *clocks;
+};
+
+static int gic_runtime_resume(struct device *dev)
+{
+	struct gic_chip_data *gic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * On the very first resume, the pointer to the driver data
+	 * will be NULL and this is intentional, because we do not
+	 * want to restore the GIC on the very first resume. So if
+	 * the pointer is not valid just return.
+	 */
+	if (!gic)
+		return 0;
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
+	return pm_clk_suspend(dev);
+}
+
+static int gic_get_clocks(struct device *dev, const struct gic_clk_data *data)
+{
+	struct clk *clk;
+	unsigned int i;
+	int ret;
+
+	if (!dev || !data)
+		return -EINVAL;
+
+	ret = pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < data->num_clocks; i++) {
+		clk = of_clk_get_by_name(dev->of_node, data->clocks[i]);
+		if (IS_ERR(clk)) {
+			dev_err(dev, "failed to get clock %s\n",
+				data->clocks[i]);
+			ret = PTR_ERR(clk);
+			goto error;
+		}
+
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret) {
+			dev_err(dev, "failed to add clock at index %d\n", i);
+			clk_put(clk);
+			goto error;
+		}
+	}
+
+	return 0;
+
+error:
+	pm_clk_destroy(dev);
+
+	return ret;
+}
+
+static int gic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct gic_clk_data *data;
+	struct gic_chip_data *gic;
+	int ret, irq;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
+		dev_err(&pdev->dev, "no device match found\n");
+		return -ENODEV;
+	}
+
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq) {
+		dev_err(dev, "no parent interrupt found!\n");
+		return -EINVAL;
+	}
+
+	ret = gic_get_clocks(dev, data);
+	if (ret)
+		goto irq_dispose;
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		goto rpm_disable;
+
+	ret = of_gic_init(dev, &gic);
+	if (ret)
+		goto rpm_put;
+
+	irq_set_chained_handler_and_data(irq, gic_handle_cascade_irq, gic);
+
+	platform_set_drvdata(pdev, gic);
+
+	pm_runtime_put(dev);
+
+	dev_info(dev, "GIC IRQ controller registered\n");
+
+	return 0;
+
+rpm_put:
+	pm_runtime_put_sync(dev);
+rpm_disable:
+	pm_runtime_disable(dev);
+	pm_clk_destroy(dev);
+irq_dispose:
+	irq_dispose_mapping(irq);
+
+	return ret;
+}
+
+static const struct dev_pm_ops gic_pm_ops = {
+	SET_RUNTIME_PM_OPS(gic_runtime_suspend,
+			   gic_runtime_resume, NULL)
+};
+
+static const char * const gic400_clocks[] = {
+	"clk",
+};
+
+static const struct gic_clk_data gic400_data = {
+	.num_clocks = ARRAY_SIZE(gic400_clocks),
+	.clocks = gic400_clocks,
+};
+
+static const struct of_device_id gic_match[] = {
+	{ .compatible = "nvidia,tegra210-agic",	.data = &gic400_data },
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
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 9f8ab124898b..e65090f7afa4 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -76,7 +76,7 @@ struct gic_chip_data {
 	void __iomem *raw_dist_base;
 	void __iomem *raw_cpu_base;
 	u32 percpu_offset;
-#ifdef CONFIG_CPU_PM
+#if defined(CONFIG_CPU_PM) || defined(ARM_GIC_PM)
 	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
 	u32 saved_spi_active[DIV_ROUND_UP(1020, 32)];
 	u32 saved_spi_conf[DIV_ROUND_UP(1020, 16)];
@@ -526,7 +526,7 @@ int gic_cpu_if_down(unsigned int gic_nr)
 	return 0;
 }
 
-#ifdef CONFIG_CPU_PM
+#if defined(CONFIG_CPU_PM) || defined(ARM_GIC_PM)
 /*
  * Saves the GIC distributor registers during suspend or idle.  Must be called
  * with interrupts disabled but before powering down the GIC.  After calling
@@ -1297,6 +1297,30 @@ error:
 	return -ENOMEM;
 }
 
+int of_gic_init(struct device *dev, struct gic_chip_data **gic)
+{
+	int ret;
+
+	if (!dev || !dev->of_node || !gic)
+		return -EINVAL;
+
+	*gic = devm_kzalloc(dev, sizeof(**gic), GFP_KERNEL);
+	if (!*gic)
+		return -ENOMEM;
+
+	gic_init_chip(*gic, dev, dev->of_node->name, false);
+
+	ret = gic_of_setup(*gic, dev->of_node);
+	if (ret)
+		return ret;
+
+	ret = gic_init_bases(*gic, -1, &dev->of_node->fwnode);
+	if (ret)
+		gic_teardown(*gic);
+
+	return ret;
+}
+
 int __init
 gic_of_init(struct device_node *node, struct device_node *parent)
 {
@@ -1351,7 +1375,11 @@ IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
 IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
 IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
 IRQCHIP_DECLARE(pl390, "arm,pl390", gic_of_init);
-
+#else
+int of_gic_init(struct device *dev, struct gic_chip_data **gic)
+{
+	return -ENOTSUPP;
+}
 #endif
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/irqchip/irq-gic.h b/drivers/irqchip/irq-gic.h
index 646e92614b2c..b03ec4bac795 100644
--- a/drivers/irqchip/irq-gic.h
+++ b/drivers/irqchip/irq-gic.h
@@ -25,4 +25,6 @@ void gic_dist_save(struct gic_chip_data *gic);
 void gic_dist_restore(struct gic_chip_data *gic);
 void gic_handle_cascade_irq(struct irq_desc *desc);
 
+int of_gic_init(struct device *dev, struct gic_chip_data **gic);
+
 #endif /* _IRQ_GIC_H */
-- 
2.1.4
