From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/9] ARM: sa1100: convert SA11x0 related code to use new
 chained handler helper
Date: Tue, 16 Jun 2015 23:06:25 +0100
Message-ID: <E1Z4yzx-0002S6-7p@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Convert SA11x0 (Neponset, SA1111, and UCB1x00 code) to use the new
irq_set_chained_handler_and_data() helper.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
Depends on patch 1.

 arch/arm/common/sa1111.c        | 7 +++----
 arch/arm/mach-sa1100/neponset.c | 3 +--
 drivers/mfd/ucb1x00-core.c      | 3 +--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 5cc779c8e9c6..93ee70dbbdd3 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -501,8 +501,8 @@ static int sa1111_setup_irq(struct sa1111 *sachip, unsigned irq_base)
 	 * Register SA1111 interrupt
 	 */
 	irq_set_irq_type(sachip->irq, IRQ_TYPE_EDGE_RISING);
-	irq_set_handler_data(sachip->irq, sachip);
-	irq_set_chained_handler(sachip->irq, sa1111_irq_handler);
+	irq_set_chained_handler_and_data(sachip->irq, sa1111_irq_handler,
+					 sachip);
 
 	dev_info(sachip->dev, "Providing IRQ%u-%u\n",
 		sachip->irq_base, sachip->irq_base + SA1111_IRQ_NR - 1);
@@ -836,8 +836,7 @@ static void __sa1111_remove(struct sa1111 *sachip)
 	clk_unprepare(sachip->clk);
 
 	if (sachip->irq != NO_IRQ) {
-		irq_set_chained_handler(sachip->irq, NULL);
-		irq_set_handler_data(sachip->irq, NULL);
+		irq_set_chained_handler_and_data(sachip->irq, NULL, NULL);
 		irq_free_descs(sachip->irq_base, SA1111_IRQ_NR);
 
 		release_mem_region(sachip->phys + SA1111_INTC, 512);
diff --git a/arch/arm/mach-sa1100/neponset.c b/arch/arm/mach-sa1100/neponset.c
index af868d258e66..99d9a3b1bf34 100644
--- a/arch/arm/mach-sa1100/neponset.c
+++ b/arch/arm/mach-sa1100/neponset.c
@@ -327,8 +327,7 @@ static int neponset_probe(struct platform_device *dev)
 	irq_set_chip(d->irq_base + NEP_IRQ_SA1111, &nochip);
 
 	irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
-	irq_set_handler_data(irq, d);
-	irq_set_chained_handler(irq, neponset_irq_handler);
+	irq_set_chained_handler_and_data(irq, neponset_irq_handler, d);
 
 	/*
 	 * We would set IRQ_GPIO25 to be a wake-up IRQ, but unfortunately
diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index 58ea9fdd3a15..3591550598ad 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -566,8 +566,7 @@ static int ucb1x00_probe(struct mcp *mcp)
 	}
 
 	irq_set_irq_type(ucb->irq, IRQ_TYPE_EDGE_RISING);
-	irq_set_handler_data(ucb->irq, ucb);
-	irq_set_chained_handler(ucb->irq, ucb1x00_irq);
+	irq_set_chained_handler_and_data(ucb->irq, ucb1x00_irq, ucb);
 
 	if (pdata && pdata->gpio_base) {
 		ucb->gpio.label = dev_name(&ucb->dev);
-- 
2.1.0
