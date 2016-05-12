From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 7/9] irqchip/gic: Prepare for adding platform driver
Date: Thu, 12 May 2016 16:19:30 +0100
Message-ID: <1463066372-13115-8-git-send-email-jonathanh@nvidia.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To support GICs that require runtime power management, it is necessary
to add a platform driver, so that the probing of the chip can be
deferred if resources, such as a power-domain, is not yet available.

To prepare for adding a platform driver:
 1. Drop the __init section from the gic_dist_config() so this can be
    re-used by the platform driver.
 2. Add prototypes for functions required by the platform driver to a
    local header file so they can be re-used.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic-common.c |  4 ++--
 drivers/irqchip/irq-gic.c        | 18 ++++++++++--------
 drivers/irqchip/irq-gic.h        | 28 ++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 10 deletions(-)
 create mode 100644 drivers/irqchip/irq-gic.h

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index 97c0028e8388..c510cbd264b1 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -77,8 +77,8 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 	return ret;
 }
 
-void __init gic_dist_config(void __iomem *base, int gic_irqs,
-			    void (*sync_access)(void))
+void gic_dist_config(void __iomem *base, int gic_irqs,
+		     void (*sync_access)(void))
 {
 	unsigned int i;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index e043a19631b1..9f8ab124898b 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -48,6 +48,7 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include "irq-gic.h"
 #include "irq-gic-common.h"
 
 #ifdef CONFIG_ARM64
@@ -363,7 +364,7 @@ static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 	} while (1);
 }
 
-static void gic_handle_cascade_irq(struct irq_desc *desc)
+void gic_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct gic_chip_data *chip_data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -447,7 +448,7 @@ static void gic_cpu_if_up(struct gic_chip_data *gic)
 }
 
 
-static void __init gic_dist_init(struct gic_chip_data *gic)
+static void gic_dist_init(struct gic_chip_data *gic)
 {
 	unsigned int i;
 	u32 cpumask;
@@ -532,7 +533,7 @@ int gic_cpu_if_down(unsigned int gic_nr)
  * this function, no interrupts will be delivered by the GIC, and another
  * platform-specific wakeup source must be enabled.
  */
-static void gic_dist_save(struct gic_chip_data *gic)
+void gic_dist_save(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	void __iomem *dist_base;
@@ -571,7 +572,7 @@ static void gic_dist_save(struct gic_chip_data *gic)
  * handled normally, but any edge interrupts that occured will not be seen by
  * the GIC and need to be handled by the platform-specific wakeup source.
  */
-static void gic_dist_restore(struct gic_chip_data *gic)
+void gic_dist_restore(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	unsigned int i;
@@ -617,7 +618,7 @@ static void gic_dist_restore(struct gic_chip_data *gic)
 	writel_relaxed(GICD_ENABLE, dist_base + GIC_DIST_CTRL);
 }
 
-static void gic_cpu_save(struct gic_chip_data *gic)
+void gic_cpu_save(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
@@ -647,7 +648,7 @@ static void gic_cpu_save(struct gic_chip_data *gic)
 
 }
 
-static void gic_cpu_restore(struct gic_chip_data *gic)
+void gic_cpu_restore(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
@@ -724,7 +725,7 @@ static struct notifier_block gic_notifier_block = {
 	.notifier_call = gic_notifier,
 };
 
-static int __init gic_pm_init(struct gic_chip_data *gic)
+static int gic_pm_init(struct gic_chip_data *gic)
 {
 	gic->saved_ppi_enable = __alloc_percpu(DIV_ROUND_UP(32, 32) * 4,
 		sizeof(u32));
@@ -754,7 +755,7 @@ free_ppi_enable:
 	return -ENOMEM;
 }
 #else
-static int __init gic_pm_init(struct gic_chip_data *gic)
+static int gic_pm_init(struct gic_chip_data *gic)
 {
 	return 0;
 }
@@ -1178,6 +1179,7 @@ static int __init __gic_init_bases(struct gic_chip_data *gic,
 		set_smp_cross_call(gic_raise_softirq);
 		register_cpu_notifier(&gic_cpu_notifier);
 #endif
+
 		set_handle_irq(gic_handle_irq);
 		if (static_key_true(&supports_deactivate))
 			pr_info("GIC: Using split EOI/Deactivate mode\n");
diff --git a/drivers/irqchip/irq-gic.h b/drivers/irqchip/irq-gic.h
new file mode 100644
index 000000000000..646e92614b2c
--- /dev/null
+++ b/drivers/irqchip/irq-gic.h
@@ -0,0 +1,28 @@
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
+
+#ifndef _IRQ_GIC_H
+#define _IRQ_GIC_H
+
+struct gic_chip_data;
+
+void gic_cpu_save(struct gic_chip_data *gic);
+void gic_cpu_restore(struct gic_chip_data *gic);
+void gic_dist_save(struct gic_chip_data *gic);
+void gic_dist_restore(struct gic_chip_data *gic);
+void gic_handle_cascade_irq(struct irq_desc *desc);
+
+#endif /* _IRQ_GIC_H */
-- 
2.1.4
