From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 7/9] irqchip/gic: Prepare for adding platform driver
Date: Mon, 6 Jun 2016 12:53:41 +0100
Message-ID: <1465214023-8299-8-git-send-email-jonathanh@nvidia.com>
References: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To support GICs that require runtime power management, it is necessary
to add a platform driver, so that the probing of the chip can be
deferred if resources, such as a power-domain, is not yet available.

To prepare for adding a platform driver:
 1. Drop the __init section from the gic_dist_config() so this can be
    re-used by the platform driver.
 2. Add prototypes for functions required by the platform driver to the
    GIC header file so they can be re-used.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic-common.c |  4 ++--
 drivers/irqchip/irq-gic.c        | 15 ++++++++-------
 include/linux/irqchip/arm-gic.h  |  5 +++++
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index 89e7423f0ebb..9ae71804b5dd 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -90,8 +90,8 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 	return ret;
 }
 
-void __init gic_dist_config(void __iomem *base, int gic_irqs,
-			    void (*sync_access)(void))
+void gic_dist_config(void __iomem *base, int gic_irqs,
+		     void (*sync_access)(void))
 {
 	unsigned int i;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 94eab6e23124..3d3ab9045244 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -449,7 +449,7 @@ static void gic_cpu_if_up(struct gic_chip_data *gic)
 }
 
 
-static void __init gic_dist_init(struct gic_chip_data *gic)
+static void gic_dist_init(struct gic_chip_data *gic)
 {
 	unsigned int i;
 	u32 cpumask;
@@ -535,7 +535,7 @@ int gic_cpu_if_down(unsigned int gic_nr)
  * this function, no interrupts will be delivered by the GIC, and another
  * platform-specific wakeup source must be enabled.
  */
-static void gic_dist_save(struct gic_chip_data *gic)
+void gic_dist_save(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	void __iomem *dist_base;
@@ -574,7 +574,7 @@ static void gic_dist_save(struct gic_chip_data *gic)
  * handled normally, but any edge interrupts that occured will not be seen by
  * the GIC and need to be handled by the platform-specific wakeup source.
  */
-static void gic_dist_restore(struct gic_chip_data *gic)
+void gic_dist_restore(struct gic_chip_data *gic)
 {
 	unsigned int gic_irqs;
 	unsigned int i;
@@ -620,7 +620,7 @@ static void gic_dist_restore(struct gic_chip_data *gic)
 	writel_relaxed(GICD_ENABLE, dist_base + GIC_DIST_CTRL);
 }
 
-static void gic_cpu_save(struct gic_chip_data *gic)
+void gic_cpu_save(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
@@ -650,7 +650,7 @@ static void gic_cpu_save(struct gic_chip_data *gic)
 
 }
 
-static void gic_cpu_restore(struct gic_chip_data *gic)
+void gic_cpu_restore(struct gic_chip_data *gic)
 {
 	int i;
 	u32 *ptr;
@@ -727,7 +727,7 @@ static struct notifier_block gic_notifier_block = {
 	.notifier_call = gic_notifier,
 };
 
-static int __init gic_pm_init(struct gic_chip_data *gic)
+static int gic_pm_init(struct gic_chip_data *gic)
 {
 	gic->saved_ppi_enable = __alloc_percpu(DIV_ROUND_UP(32, 32) * 4,
 		sizeof(u32));
@@ -757,7 +757,7 @@ free_ppi_enable:
 	return -ENOMEM;
 }
 #else
-static int __init gic_pm_init(struct gic_chip_data *gic)
+static int gic_pm_init(struct gic_chip_data *gic)
 {
 	return 0;
 }
@@ -1179,6 +1179,7 @@ static int __init __gic_init_bases(struct gic_chip_data *gic,
 		set_smp_cross_call(gic_raise_softirq);
 		register_cpu_notifier(&gic_cpu_notifier);
 #endif
+
 		set_handle_irq(gic_handle_irq);
 		if (static_key_true(&supports_deactivate))
 			pr_info("GIC: Using split EOI/Deactivate mode\n");
diff --git a/include/linux/irqchip/arm-gic.h b/include/linux/irqchip/arm-gic.h
index fd051855539b..ffcbd8b9a4ff 100644
--- a/include/linux/irqchip/arm-gic.h
+++ b/include/linux/irqchip/arm-gic.h
@@ -101,9 +101,14 @@
 #include <linux/irqdomain.h>
 
 struct device_node;
+struct gic_chip_data;
 
 void gic_cascade_irq(unsigned int gic_nr, unsigned int irq);
 int gic_cpu_if_down(unsigned int gic_nr);
+void gic_cpu_save(struct gic_chip_data *gic);
+void gic_cpu_restore(struct gic_chip_data *gic);
+void gic_dist_save(struct gic_chip_data *gic);
+void gic_dist_restore(struct gic_chip_data *gic);
 
 /*
  * Subdrivers that need some preparatory work can initialize their
-- 
2.1.4
