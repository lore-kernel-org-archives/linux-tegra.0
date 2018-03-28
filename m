From: Aniruddha Banerjee <aniruddha.nitd@gmail.com>
Subject: [PATCHv4] irqchip: arm-gic: take gic_lock when updating irq type
Date: Wed, 28 Mar 2018 19:12:00 +0530
Message-ID: <20180328134200.7435-1-aniruddha.nitd@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: marc.zyngier@arm.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: aniruddhab@nvidia.com, stable@vger.kernel.org, vipink@nvidia.com, strasi@nvidia.com, swarren@nvidia.com, jonathanh@nvidia.com, talho@nvidia.com, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org

From: Aniruddha Banerjee <aniruddhab@nvidia.com>

The kernel documentation states that the locking of the irq-chip
registers should be handled by the irq-chip driver. In the irq-gic,
the accesses to the irqchip are seemingly not protected and multiple
writes to SPIs from different irq descriptors do RMW requests without
taking the irq-chip lock. When multiple irqs call the request_irq at
the same time, there can be a simultaneous write at the gic
distributor, leading to a race. Acquire the gic_lock when the
irq_type is updated.

Cc: stable@vger.kernel.org

Signed-off-by: Aniruddha Banerjee <aniruddhab@nvidia.com>
---

Change from V1:
* Moved the spinlock from irq-gic to irq-gic common, so that the fix
is valid for GIC v1/v2/v3.

Change from V2:
* Fixup the Signed-off-by line.

Change from V3:
* Change raw_spin_lock to raw_spin_lock_irqsave and spin_unlock to
raw_spin_unlock_irqrestore to protect against a potential deadlock
when an interrupt handler changes the trigger type of any interrupt.

 drivers/irqchip/irq-gic-common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index 9ae71804b5dd..1c2ca8d51a70 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -21,6 +21,8 @@
 
 #include "irq-gic-common.h"
 
+static DEFINE_RAW_SPINLOCK(irq_controller_lock);
+
 static const struct gic_kvm_info *gic_kvm_info;
 
 const struct gic_kvm_info *gic_get_kvm_info(void)
@@ -52,11 +54,13 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 	u32 confoff = (irq / 16) * 4;
 	u32 val, oldval;
 	int ret = 0;
+	unsigned long flags;
 
 	/*
 	 * Read current configuration register, and insert the config
 	 * for "irq", depending on "type".
 	 */
+	raw_spin_lock_irqsave(&irq_controller_lock, flags);
 	val = oldval = readl_relaxed(base + GIC_DIST_CONFIG + confoff);
 	if (type & IRQ_TYPE_LEVEL_MASK)
 		val &= ~confmask;
@@ -64,8 +68,10 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 		val |= confmask;
 
 	/* If the current configuration is the same, then we are done */
-	if (val == oldval)
+	if (val == oldval) {
+		raw_spin_unlock_irqrestore(&irq_controller_lock, flags);
 		return 0;
+	}
 
 	/*
 	 * Write back the new configuration, and possibly re-enable
@@ -83,6 +89,7 @@ int gic_configure_irq(unsigned int irq, unsigned int type,
 			pr_warn("GIC: PPI%d is secure or misconfigured\n",
 				irq - 16);
 	}
+	raw_spin_unlock_irqrestore(&irq_controller_lock, flags);
 
 	if (sync_access)
 		sync_access();
-- 
2.16.2
