From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 02/23] arm: tegra: Remove unused function which fiddles with
	irq_desc
Date: Fri, 25 Mar 2011 13:21:52 -0000
Message-ID: <20110325132047.552074703@linutronix.de>
References: <20110325131617.258789658@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline; filename=arm-tegra.patch
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Lennert Buytenhek <buytenh@wantstofly.org>, LAK <linux-arm-kernel@lists.infradead.org>, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

These functions are unused and in the way of cleanups in the core
code. If you have special requirements vs. irqs and PM then please
talk to me. Access to the generic core internals is going away.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/mach-tegra/gpio.c                 |   63 -----------------------------
 arch/arm/mach-tegra/include/mach/suspend.h |    2 
 2 files changed, 65 deletions(-)

Index: linux-2.6/arch/arm/mach-tegra/gpio.c
===================================================================
--- linux-2.6.orig/arch/arm/mach-tegra/gpio.c
+++ linux-2.6/arch/arm/mach-tegra/gpio.c
@@ -254,69 +254,6 @@ static void tegra_gpio_irq_handler(unsig
 }
 
 #ifdef CONFIG_PM
-void tegra_gpio_resume(void)
-{
-	unsigned long flags;
-	int b, p, i;
-
-	local_irq_save(flags);
-
-	for (b = 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
-		struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
-
-		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
-			unsigned int gpio = (b<<5) | (p<<3);
-			__raw_writel(bank->cnf[p], GPIO_CNF(gpio));
-			__raw_writel(bank->out[p], GPIO_OUT(gpio));
-			__raw_writel(bank->oe[p], GPIO_OE(gpio));
-			__raw_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
-			__raw_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
-		}
-	}
-
-	local_irq_restore(flags);
-
-	for (i = INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR_GPIOS); i++) {
-		struct irq_desc *desc = irq_to_desc(i);
-		if (!desc || (desc->status & IRQ_WAKEUP))
-			continue;
-		enable_irq(i);
-	}
-}
-
-void tegra_gpio_suspend(void)
-{
-	unsigned long flags;
-	int b, p, i;
-
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
-	local_irq_save(flags);
-	for (b = 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
-		struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
-
-		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
-			unsigned int gpio = (b<<5) | (p<<3);
-			bank->cnf[p] = __raw_readl(GPIO_CNF(gpio));
-			bank->out[p] = __raw_readl(GPIO_OUT(gpio));
-			bank->oe[p] = __raw_readl(GPIO_OE(gpio));
-			bank->int_enb[p] = __raw_readl(GPIO_INT_ENB(gpio));
-			bank->int_lvl[p] = __raw_readl(GPIO_INT_LVL(gpio));
-		}
-	}
-	local_irq_restore(flags);
-}
-
 static int tegra_gpio_wake_enable(struct irq_data *d, unsigned int enable)
 {
 	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
Index: linux-2.6/arch/arm/mach-tegra/include/mach/suspend.h
===================================================================
--- linux-2.6.orig/arch/arm/mach-tegra/include/mach/suspend.h
+++ linux-2.6/arch/arm/mach-tegra/include/mach/suspend.h
@@ -23,14 +23,12 @@
 
 void tegra_pinmux_suspend(void);
 void tegra_irq_suspend(void);
-void tegra_gpio_suspend(void);
 void tegra_clk_suspend(void);
 void tegra_dma_suspend(void);
 void tegra_timer_suspend(void);
 
 void tegra_pinmux_resume(void);
 void tegra_irq_resume(void);
-void tegra_gpio_resume(void);
 void tegra_clk_resume(void);
 void tegra_dma_resume(void);
 void tegra_timer_resume(void);
