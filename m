From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 01/11] genirq: Ensure IRQ descriptor is valid when setting-up the IRQ
Date: Tue, 10 May 2016 16:14:35 +0100
Message-ID: <1462893285-13515-2-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In the function, setup_irq(), we don't check that the descriptor
returned from irq_to_desc() is valid before we start using it. For
example chip_bus_lock() called from setup_irq(), assumes that the
descriptor pointer is valid and doesn't check before dereferencing it.

In many other functions including setup/free_percpu_irq() we do check
that the descriptor returned is not NULL and therefore add the same test
to setup_irq() to ensure the descriptor returned is valid.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 kernel/irq/manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index cc1cc641d653..ef0bc02c3a70 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1407,7 +1407,7 @@ int setup_irq(unsigned int irq, struct irqaction *act)
 	int retval;
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	if (WARN_ON(irq_settings_is_per_cpu_devid(desc)))
+	if (!desc || WARN_ON(irq_settings_is_per_cpu_devid(desc)))
 		return -EINVAL;
 	chip_bus_lock(desc);
 	retval = __setup_irq(irq, desc, act);
-- 
2.1.4
