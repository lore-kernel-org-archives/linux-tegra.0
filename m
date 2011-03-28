From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [patch 08/29] arm: tegra: Remove unused bogus irq enable/disable magic
Date: Mon, 28 Mar 2011 12:00:43 -0700
Message-ID: <BANLkTinjYq3F0CwfqRQVzG53ecPm=QyV5A@mail.gmail.com>
References: <20110328170219.059141076@linutronix.de>
	<20110328170651.575138721@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110328170651.575138721-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 28, 2011 at 10:12 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> =
wrote:
> The core code handles thees already.
thees -> these

> Signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
> =A0arch/arm/mach-tegra/gpio.c | =A0 19 -------------------
> =A01 file changed, 19 deletions(-)
>
> Index: linux-2.6-tip/arch/arm/mach-tegra/gpio.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-tip.orig/arch/arm/mach-tegra/gpio.c
> +++ linux-2.6-tip/arch/arm/mach-tegra/gpio.c
> @@ -275,13 +275,6 @@ void tegra_gpio_resume(void)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0local_irq_restore(flags);
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
> =A0}
>
> =A0void tegra_gpio_suspend(void)
> @@ -289,18 +282,6 @@ void tegra_gpio_suspend(void)
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0int b, p, i;
>
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
> =A0 =A0 =A0 =A0local_irq_save(flags);
> =A0 =A0 =A0 =A0for (b =3D 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct tegra_gpio_bank *bank =3D &tegr=
a_gpio_banks[b];
>
>
>
This will cause warnings in both the suspend and resume functions as i
is now unused.

Other than that:
Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

Do you want me to take this through the Tegra tree for 2.6.39-rc1?
