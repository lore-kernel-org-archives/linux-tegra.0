From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH] irqchip: tegra: fix wrong data being passed as the irqdomain chip data
Date: Sat,  9 May 2015 22:06:54 +0200
Message-ID: <1431202014-3136-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The irq chip functions use the irq chipdata directly as the base register
address of the controller, so this should be passed in instead of a pointer
to the array address holding the base address.

This fixes Tegra20 CPUidle as now the un-/masking of IRQs at the LIC level
works again, but more importantly it fixes the resulting memory corruption.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
This is an important fix and should go into 4.1.
---
 drivers/irqchip/irq-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 51c485d..f67bbd8 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -264,7 +264,7 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
 					      &tegra_ictlr_chip,
-					      &info->base[ictlr]);
+					      info->base[ictlr]);
 	}
 
 	parent_args = *args;
-- 
2.1.0
