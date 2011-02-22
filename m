From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Tue, 22 Feb 2011 11:18:08 -0800
Message-ID: <AANLkTik9_t0mq07mysO2CcK4ppKAmuPAujownfeWEGL5@mail.gmail.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
	<1298354117-19097-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298354117-19097-2-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Can you split the boardfile changes into their own patch?  Also see
the below whitespace only change.  Other than that, looks good.

On Mon, Feb 21, 2011 at 9:55 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
snip
> diff --git a/arch/arm/mach-tegra/gpio.c b/arch/arm/mach-tegra/gpio.c
> index 132dcd6..ffc146d 100644
> --- a/arch/arm/mach-tegra/gpio.c
> +++ b/arch/arm/mach-tegra/gpio.c
> @@ -378,9 +378,22 @@ static int __init tegra_gpio_init(void)
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> -
> =A0postcore_initcall(tegra_gpio_init);

whitespace only change

>
> +void __init tegra_gpio_config(struct tegra_gpio_table *table, int nu=
m)
> +{
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < num; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int gpio =3D table[i].gpio;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (table[i].enable)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_gpio_enable(gpio)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tegra_gpio_disable(gpio=
);
> + =A0 =A0 =A0 }
> +}
> +
> =A0#ifdef CONFIG_DEBUG_FS
>
> =A0#include <linux/debugfs.h>
> diff --git a/arch/arm/mach-tegra/include/mach/gpio.h b/arch/arm/mach-=
tegra/include/mach/gpio.h
> index e31f486..2369fba 100644
> --- a/arch/arm/mach-tegra/include/mach/gpio.h
> +++ b/arch/arm/mach-tegra/include/mach/gpio.h
> @@ -20,6 +20,7 @@
> =A0#ifndef __MACH_TEGRA_GPIO_H
> =A0#define __MACH_TEGRA_GPIO_H
>
> +#include <linux/init.h>
> =A0#include <mach/irqs.h>
>
> =A0#define TEGRA_NR_GPIOS =A0 =A0 =A0 =A0 INT_GPIO_NR
> @@ -47,6 +48,12 @@ static inline int irq_to_gpio(unsigned int irq)
> =A0 =A0 =A0 =A0return -EINVAL;
> =A0}
>
> +struct tegra_gpio_table {
> + =A0 =A0 =A0 int =A0 =A0 gpio; =A0 /* GPIO number */
> + =A0 =A0 =A0 bool =A0 =A0enable; /* Enable for GPIO at init? */
> +};
> +
> +void __init tegra_gpio_config(struct tegra_gpio_table *table, int nu=
m);
> =A0void tegra_gpio_enable(int gpio);
> =A0void tegra_gpio_disable(int gpio);
>
> --
> 1.7.0.4
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
