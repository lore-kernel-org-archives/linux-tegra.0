From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 4/9] genirq: Add runtime power management support for IRQ chips
Date: Tue, 7 Jun 2016 16:12:29 +0100
Message-ID: <1465312354-27778-5-git-send-email-jonathanh@nvidia.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465312354-27778-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some IRQ chips may be located in a power domain outside of the CPU
subsystem and hence will require device specific runtime power
management. In order to support such IRQ chips, add a pointer for a
device structure to the irq_chip structure, and if this pointer is
populated by the IRQ chip driver and CONFIG_PM is selected in the kernel
configuration, then the pm_runtime_get/put APIs for this chip will be
called when an IRQ is requested/freed, respectively.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/irq.h    |  4 ++++
 kernel/irq/chip.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 kernel/irq/internals.h |  1 +
 kernel/irq/manage.c    | 31 ++++++++++++++++++++++++++++++-
 4 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 4d758a7c604a..6c92a847394d 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -315,6 +315,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
 /**
  * struct irq_chip - hardware interrupt chip descriptor
  *
+ * @parent_device:	pointer to parent device for irqchip
  * @name:		name for /proc/interrupts
  * @irq_startup:	start up the interrupt (defaults to ->enable if NULL)
  * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)
@@ -354,6 +355,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @flags:		chip specific flags
  */
 struct irq_chip {
+	struct device	*parent_device;
 	const char	*name;
 	unsigned int	(*irq_startup)(struct irq_data *data);
 	void		(*irq_shutdown)(struct irq_data *data);
@@ -488,6 +490,8 @@ extern void handle_bad_irq(struct irq_desc *desc);
 extern void handle_nested_irq(unsigned int irq);
 
 extern int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg);
+extern int irq_chip_pm_get(struct irq_data *data);
+extern int irq_chip_pm_put(struct irq_data *data);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 extern void irq_chip_enable_parent(struct irq_data *data);
 extern void irq_chip_disable_parent(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 2f9f2b0e79f2..ad8131473774 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1093,3 +1093,43 @@ int irq_chip_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 
 	return 0;
 }
+
+/**
+ * irq_chip_pm_get - Enable power for an IRQ chip
+ * @data:	Pointer to interrupt specific data
+ *
+ * Enable the power to the IRQ chip referenced by the interrupt data
+ * structure.
+ */
+int irq_chip_pm_get(struct irq_data *data)
+{
+	int retval;
+
+	if (IS_ENABLED(CONFIG_PM) && data->chip->parent_device) {
+		retval = pm_runtime_get_sync(data->chip->parent_device);
+		if (retval < 0) {
+			pm_runtime_put_noidle(data->chip->parent_device);
+			return retval;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * irq_chip_pm_put - Disable power for an IRQ chip
+ * @data:	Pointer to interrupt specific data
+ *
+ * Disable the power to the IRQ chip referenced by the interrupt data
+ * structure, belongs. Note that power will only be disabled, once this
+ * function has been called for all IRQs that have called irq_chip_pm_get().
+ */
+int irq_chip_pm_put(struct irq_data *data)
+{
+	int retval = 0;
+
+	if (IS_ENABLED(CONFIG_PM) && data->chip->parent_device)
+		retval = pm_runtime_put(data->chip->parent_device);
+
+	return (retval < 0) ? retval : 0;
+}
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 09be2c903c6d..d5edcdc9382a 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -7,6 +7,7 @@
  */
 #include <linux/irqdesc.h>
 #include <linux/kernel_stat.h>
+#include <linux/pm_runtime.h>
 
 #ifdef CONFIG_SPARSE_IRQ
 # define IRQ_BITMAP_BITS	(NR_IRQS + 8196)
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index eaedeb74b49d..f8fd1fbc02ea 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1416,10 +1416,18 @@ int setup_irq(unsigned int irq, struct irqaction *act)
 
 	if (!desc || WARN_ON(irq_settings_is_per_cpu_devid(desc)))
 		return -EINVAL;
+
+	retval = irq_chip_pm_get(&desc->irq_data);
+	if (retval < 0)
+		return retval;
+
 	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, act);
 	chip_bus_sync_unlock(desc);
 
+	if (retval)
+		irq_chip_pm_put(&desc->irq_data);
+
 	return retval;
 }
 EXPORT_SYMBOL_GPL(setup_irq);
@@ -1513,6 +1521,7 @@ static struct irqaction *__free_irq(unsigned int irq, void *dev_id)
 		}
 	}
 
+	irq_chip_pm_put(&desc->irq_data);
 	module_put(desc->owner);
 	kfree(action->secondary);
 	return action;
@@ -1655,11 +1664,16 @@ int request_threaded_irq(unsigned int irq, irq_handler_t handler,
 	action->name = devname;
 	action->dev_id = dev_id;
 
+	retval = irq_chip_pm_get(&desc->irq_data);
+	if (retval < 0)
+		return retval;
+
 	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, action);
 	chip_bus_sync_unlock(desc);
 
 	if (retval) {
+		irq_chip_pm_put(&desc->irq_data);
 		kfree(action->secondary);
 		kfree(action);
 	}
@@ -1829,6 +1843,7 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
 
 	unregister_handler_proc(irq, action);
 
+	irq_chip_pm_put(&desc->irq_data);
 	module_put(desc->owner);
 	return action;
 
@@ -1891,10 +1906,18 @@ int setup_percpu_irq(unsigned int irq, struct irqaction *act)
 
 	if (!desc || !irq_settings_is_per_cpu_devid(desc))
 		return -EINVAL;
+
+	retval = irq_chip_pm_get(&desc->irq_data);
+	if (retval < 0)
+		return retval;
+
 	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, act);
 	chip_bus_sync_unlock(desc);
 
+	if (retval)
+		irq_chip_pm_put(&desc->irq_data);
+
 	return retval;
 }
 
@@ -1938,12 +1961,18 @@ int request_percpu_irq(unsigned int irq, irq_handler_t handler,
 	action->name = devname;
 	action->percpu_dev_id = dev_id;
 
+	retval = irq_chip_pm_get(&desc->irq_data);
+	if (retval < 0)
+		return retval;
+
 	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, action);
 	chip_bus_sync_unlock(desc);
 
-	if (retval)
+	if (retval) {
+		irq_chip_pm_put(&desc->irq_data);
 		kfree(action);
+	}
 
 	return retval;
 }
-- 
2.1.4
