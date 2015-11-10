From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for IRQ chips
Date: Tue, 10 Nov 2015 14:39:36 +0000
Message-ID: <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some IRQ chips may be located in a power domain outside of the CPU subsystem
and hence will require device specific runtime power management. Ideally,
rather than adding more functions to the irq_chip_ops function table, using
existing chip functions such as irq_startup/shutdown or
irq_request/release_resources() would be best. However, these existing chip
functions are called in the context of a spinlock which is not ideal for
power management operations that may take some time to power up a domain.

Two possible solutions are:
1. Move existing chip operators such as irq_request/release_resources()
   outside of the spinlock and use these helpers.
2. Add new chip operators that are called outside of any spinlocks while
   setting up and freeing an IRQ.

Not knowing whether we can safely move irq_request/release_resources() to
outside the spinlock (but hopefully this will solicit some feedback), add
new chip operators for runtime resuming and suspending of an IRQ chip.

With this change the irqchip clocks will be enabled/disabled on allocating
and freeing interrupts.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/linux/irq.h    |  4 ++++
 kernel/irq/internals.h | 17 +++++++++++++++++
 kernel/irq/manage.c    |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 3c1c96786248..a29050cfb5f6 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -329,6 +329,8 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  *			chip, when one or more interrupts are installed
  * @irq_resume:		function called from core code on resume once per chip,
  *			when one ore more interrupts are installed
+ * @irq_runtime_suspend:function called to runtime suspend a chip
+ * @irq_runtime_resume:	function called to runtime resume a chip
  * @irq_pm_shutdown:	function called from core code on shutdown once per chip
  * @irq_calc_mask:	Optional function to set irq_data.mask for special cases
  * @irq_print_chip:	optional to print special chip info in show_interrupts
@@ -369,6 +371,8 @@ struct irq_chip {
 
 	void		(*irq_suspend)(struct irq_data *data);
 	void		(*irq_resume)(struct irq_data *data);
+	int		(*irq_runtime_suspend)(struct irq_data *data);
+	int		(*irq_runtime_resume)(struct irq_data *data);
 	void		(*irq_pm_shutdown)(struct irq_data *data);
 
 	void		(*irq_calc_mask)(struct irq_data *data);
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 05c2188271b8..187e49369c16 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -125,6 +125,23 @@ static inline void chip_bus_sync_unlock(struct irq_desc *desc)
 		desc->irq_data.chip->irq_bus_sync_unlock(&desc->irq_data);
 }
 
+/* Inline functions for support of irq chips that require runtime pm */
+static inline int chip_runtime_resume(struct irq_desc *desc)
+{
+	if (!desc->irq_data.chip->irq_runtime_resume)
+		return 0;
+
+	return desc->irq_data.chip->irq_runtime_resume(&desc->irq_data);
+}
+
+static inline int chip_runtime_suspend(struct irq_desc *desc)
+{
+	if (!desc->irq_data.chip->irq_runtime_suspend)
+		return 0;
+
+	return desc->irq_data.chip->irq_runtime_suspend(&desc->irq_data);
+}
+
 #define _IRQ_DESC_CHECK		(1 << 0)
 #define _IRQ_DESC_PERCPU	(1 << 1)
 
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 0eebaeef317b..66e33df73140 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1116,6 +1116,10 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	if (!try_module_get(desc->owner))
 		return -ENODEV;
 
+	ret = chip_runtime_resume(desc);
+	if (ret < 0)
+		return ret;
+
 	new->irq = irq;
 
 	/*
@@ -1393,6 +1397,7 @@ out_thread:
 		put_task_struct(t);
 	}
 out_mput:
+	chip_runtime_suspend(desc);
 	module_put(desc->owner);
 	return ret;
 }
@@ -1506,6 +1511,7 @@ static struct irqaction *__free_irq(unsigned int irq, void *dev_id)
 		}
 	}
 
+	chip_runtime_suspend(desc);
 	module_put(desc->owner);
 	kfree(action->secondary);
 	return action;
@@ -1792,6 +1798,7 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
 
 	unregister_handler_proc(irq, action);
 
+	chip_runtime_suspend(desc);
 	module_put(desc->owner);
 	return action;
 
-- 
2.1.4
