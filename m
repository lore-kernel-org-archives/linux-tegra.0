From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 9/9] irq: spear-shirq: fix race in installing chained IRQ
 handler
Date: Tue, 16 Jun 2015 23:07:01 +0100
Message-ID: <E1Z4z0X-0002T1-6U@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Jason Cooper <jason@lakedaemon.net>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Fix a race where a pending interrupt could be received and the handler
called before the handler's data has been setup, by converting to
irq_set_chained_handler_and_data().

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
Depends on patch 1.

 drivers/irqchip/spear-shirq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/spear-shirq.c b/drivers/irqchip/spear-shirq.c
index 9c145a7cb056..a45121546caf 100644
--- a/drivers/irqchip/spear-shirq.c
+++ b/drivers/irqchip/spear-shirq.c
@@ -207,8 +207,7 @@ static void __init spear_shirq_register(struct spear_shirq *shirq,
 	if (!shirq->irq_chip)
 		return;
 
-	irq_set_chained_handler(parent_irq, shirq_handler);
-	irq_set_handler_data(parent_irq, shirq);
+	irq_set_chained_handler_and_data(parent_irq, shirq_handler, shirq);
 
 	for (i = 0; i < shirq->nr_irqs; i++) {
 		irq_set_chip_and_handler(shirq->virq_base + i,
-- 
2.1.0

