From: Colin Cross <ccross@android.com>
Subject: Re: [patch 47/75] arm: tegra: Remove unused function which fiddles
 with irq_desc
Date: Thu, 10 Feb 2011 15:48:50 -0800
Message-ID: <AANLkTi=fx5P=nqVT8napoAdpT8_i4m-n-Ua7LmYQ1JA-@mail.gmail.com>
References: <20110210222908.661199947@linutronix.de>
	<20110210223258.848294582@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110210223258.848294582@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 10, 2011 at 3:37 PM, Thomas Gleixner <tglx@linutronix.de> w=
rote:
> These functions are unused and in the way of cleanups in the core
> code. If you have special requirements vs. irqs and PM then please
> talk to me. Access to the generic core internals is going away.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Colin Cross <ccross@android.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> =A0arch/arm/mach-tegra/gpio.c | =A0 63 ------------------------------=
---------------
> =A0arch/arm/mach-tegra/irq.c =A0| =A0 58 ----------------------------=
-------------
> =A02 files changed, 121 deletions(-)
>
> Index: linux-2.6-tip/arch/arm/mach-tegra/gpio.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-tip.orig/arch/arm/mach-tegra/gpio.c
> +++ linux-2.6-tip/arch/arm/mach-tegra/gpio.c
> @@ -253,69 +253,6 @@ static void tegra_gpio_irq_handler(unsig
> =A0}
>
> =A0#ifdef CONFIG_PM
> -void tegra_gpio_resume(void)
> -{
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int b, p, i;
> -
> - =A0 =A0 =A0 local_irq_save(flags);
> -
> - =A0 =A0 =A0 for (b =3D 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct tegra_gpio_bank *bank =3D &tegra=
_gpio_banks[b];
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (p =3D 0; p < ARRAY_SIZE(bank->oe);=
 p++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int gpio =3D (=
b<<5) | (p<<3);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(bank->cnf[=
p], GPIO_CNF(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(bank->out[=
p], GPIO_OUT(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(bank->oe[p=
], GPIO_OE(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(bank->int_=
lvl[p], GPIO_INT_LVL(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(bank->int_=
enb[p], GPIO_INT_ENB(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 local_irq_restore(flags);
> -
> - =A0 =A0 =A0 for (i =3D INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR=
_GPIOS); i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!desc || (desc->status & IRQ_WAKEUP=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 enable_irq(i);
> - =A0 =A0 =A0 }
> -}
> -
> -void tegra_gpio_suspend(void)
> -{
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int b, p, i;
> -
> - =A0 =A0 =A0 for (i =3D INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR=
_GPIOS); i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!desc)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (desc->status & IRQ_WAKEUP) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int gpio =3D i - INT_GP=
IO_BASE;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("gpio %d.%d is=
 wakeup\n", gpio/8, gpio&7);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_irq(i);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 local_irq_save(flags);
> - =A0 =A0 =A0 for (b =3D 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct tegra_gpio_bank *bank =3D &tegra=
_gpio_banks[b];
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (p =3D 0; p < ARRAY_SIZE(bank->oe);=
 p++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int gpio =3D (=
b<<5) | (p<<3);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bank->cnf[p] =3D __raw_=
readl(GPIO_CNF(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bank->out[p] =3D __raw_=
readl(GPIO_OUT(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bank->oe[p] =3D __raw_r=
eadl(GPIO_OE(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bank->int_enb[p] =3D __=
raw_readl(GPIO_INT_ENB(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bank->int_lvl[p] =3D __=
raw_readl(GPIO_INT_LVL(gpio));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 local_irq_restore(flags);
> -}
> -
> =A0static int tegra_gpio_wake_enable(struct irq_data *d, unsigned int=
 enable)
> =A0{
> =A0 =A0 =A0 =A0struct tegra_gpio_bank *bank =3D irq_data_get_irq_chip=
_data(d);
> Index: linux-2.6-tip/arch/arm/mach-tegra/irq.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-tip.orig/arch/arm/mach-tegra/irq.c
> +++ linux-2.6-tip/arch/arm/mach-tegra/irq.c
> @@ -111,61 +111,3 @@ void __init tegra_init_irq(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_irq_flags(i, IRQF_VALID);
> =A0 =A0 =A0 =A0}
> =A0}
> -
> -#ifdef CONFIG_PM
> -static u32 cop_ier[PPI_NR];
> -static u32 cpu_ier[PPI_NR];
> -static u32 cpu_iep[PPI_NR];
> -
> -void tegra_irq_suspend(void)
> -{
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int i;
> -
> - =A0 =A0 =A0 for (i =3D INT_PRI_BASE; i < INT_GPIO_BASE; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!desc)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (desc->status & IRQ_WAKEUP) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("irq %d is wak=
eup\n", i);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 disable_irq(i);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 local_irq_save(flags);
> - =A0 =A0 =A0 for (i =3D 0; i < PPI_NR; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 void __iomem *ictlr =3D ictlr_to_virt(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_ier[i] =3D readl(ictlr + ICTLR_CPU_=
IER);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_iep[i] =3D readl(ictlr + ICTLR_CPU_=
IEP_CLASS);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cop_ier[i] =3D readl(ictlr + ICTLR_COP_=
IER);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(~0, ictlr + ICTLR_COP_IER_CLR);
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 local_irq_restore(flags);
> -}
> -
> -void tegra_irq_resume(void)
> -{
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int i;
> -
> - =A0 =A0 =A0 local_irq_save(flags);
> - =A0 =A0 =A0 for (i =3D 0; i < PPI_NR; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 void __iomem *ictlr =3D ictlr_to_virt(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(cpu_iep[i], ictlr + ICTLR_CPU_IE=
P_CLASS);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(~0ul, ictlr + ICTLR_CPU_IER_CLR)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(cpu_ier[i], ictlr + ICTLR_CPU_IE=
R_SET);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0, ictlr + ICTLR_COP_IEP_CLASS);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(~0ul, ictlr + ICTLR_COP_IER_CLR)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(cop_ier[i], ictlr + ICTLR_COP_IE=
R_SET);
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 local_irq_restore(flags);
> -
> - =A0 =A0 =A0 for (i =3D INT_PRI_BASE; i < INT_GPIO_BASE; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct irq_desc *desc =3D irq_to_desc(i=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!desc || (desc->status & IRQ_WAKEUP=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 enable_irq(i);
> - =A0 =A0 =A0 }
> -}
> -#endif
>
>
>

Acked-by: Colin Cross <ccross@android.com>

These functions are clearly incorrectly accessing IRQ internals.  I
have replacements that have been posted for review that properly track
the wakeup state using set_wake, but they are held up on some
unrelated PM changes.
