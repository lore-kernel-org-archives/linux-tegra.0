From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 02/11] irqdomain: Warn if we fail to set the IRQ type
Date: Tue, 10 May 2016 16:14:36 +0100
Message-ID: <1462893285-13515-3-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When setting the IRQ type we don't check the return value to see if it
is set correctly. Due to this, failures to set the IRQ type have gone
unnoticed and because these failures were not catastrophic have not had
an impact on the system.

Ideally, we should return an error if we fail to set the type, however,
this could cause non-catastrophic failures to prevent devices from
working. Therefore, for now add a warning so that any bad interrupt
configurations can be corrected.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 kernel/irq/irqdomain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 8798b6c9e945..09060072cc28 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -610,7 +610,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	/* Set type if specified and different than the current one */
 	if (type != IRQ_TYPE_NONE &&
 	    type != irq_get_trigger_type(virq))
-		irq_set_irq_type(virq, type);
+		if (irq_set_irq_type(virq, type))
+			pr_warn("failed to set type for irq %d\n", virq);
 	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);
-- 
2.1.4
