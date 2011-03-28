From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 08/29] arm: tegra: Remove unused bogus irq enable/disable magic
Date: Mon, 28 Mar 2011 17:12:25 -0000
Message-ID: <20110328170651.575138721@linutronix.de>
References: <20110328170219.059141076@linutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=arm-tegra.patch
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The core code handles thees already.

Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 arch/arm/mach-tegra/gpio.c |   19 -------------------
 1 file changed, 19 deletions(-)

Index: linux-2.6-tip/arch/arm/mach-tegra/gpio.c
===================================================================
--- linux-2.6-tip.orig/arch/arm/mach-tegra/gpio.c
+++ linux-2.6-tip/arch/arm/mach-tegra/gpio.c
@@ -275,13 +275,6 @@ void tegra_gpio_resume(void)
 	}
 
 	local_irq_restore(flags);
-
-	for (i = INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR_GPIOS); i++) {
-		struct irq_desc *desc = irq_to_desc(i);
-		if (!desc || (desc->status & IRQ_WAKEUP))
-			continue;
-		enable_irq(i);
-	}
 }
 
 void tegra_gpio_suspend(void)
@@ -289,18 +282,6 @@ void tegra_gpio_suspend(void)
 	unsigned long flags;
 	int b, p, i;
 
-	for (i = INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR_GPIOS); i++) {
-		struct irq_desc *desc = irq_to_desc(i);
-		if (!desc)
-			continue;
-		if (desc->status & IRQ_WAKEUP) {
-			int gpio = i - INT_GPIO_BASE;
-			pr_debug("gpio %d.%d is wakeup\n", gpio/8, gpio&7);
-			continue;
-		}
-		disable_irq(i);
-	}
-
 	local_irq_save(flags);
 	for (b = 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
 		struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
