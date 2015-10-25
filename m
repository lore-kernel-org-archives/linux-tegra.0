From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH] irqchip: tegra: propagate IRQ type setting to parent
Date: Sun, 25 Oct 2015 16:39:12 +0100
Message-ID: <1445787552-13062-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The LIC doesn't deal with the different types of interrupts itself
but needs to forward calls to set the appropriate type to its parent
IRQ controller.

Without this fix all IRQs routed through the LIC will stay at the
initial EDGE type, while most of them should actually be level triggered.

Cc: <stable@vger.kernel.org> # 4.1
Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/irqchip/irq-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 2fd89eb..fd88e68 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -214,6 +214,7 @@ static struct irq_chip tegra_ictlr_chip = {
 	.irq_unmask		= tegra_unmask,
 	.irq_retrigger		= tegra_retrigger,
 	.irq_set_wake		= tegra_set_wake,
+	.irq_set_type		= irq_chip_set_type_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
-- 
2.4.3
