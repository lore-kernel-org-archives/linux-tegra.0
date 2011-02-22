From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Tue, 22 Feb 2011 16:13:05 +0300
Message-ID: <4D63B661.6000407@ru.mvista.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net> <1298354117-19097-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298354117-19097-2-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 22-02-2011 8:55, Olof Johansson wrote:

> To give one place to setup the pins that are used as GPIOs instead
> of as their pinmuxed functions. Specifying enabled as false explicitly
> disables the gpio mode of that pin (if left on by firmware).

> This should remove the need for calling these from specific drivers and
> thus reduce tegra-specific code from them.

> Signed-off-by: Olof Johansson<olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
[...]

> diff --git a/arch/arm/mach-tegra/include/mach/gpio.h b/arch/arm/mach-tegra/include/mach/gpio.h
> index e31f486..2369fba 100644
> --- a/arch/arm/mach-tegra/include/mach/gpio.h
> +++ b/arch/arm/mach-tegra/include/mach/gpio.h
> @@ -20,6 +20,7 @@
>   #ifndef __MACH_TEGRA_GPIO_H
>   #define __MACH_TEGRA_GPIO_H
>
> +#include<linux/init.h>
>   #include<mach/irqs.h>
>
>   #define TEGRA_NR_GPIOS		INT_GPIO_NR
> @@ -47,6 +48,12 @@ static inline int irq_to_gpio(unsigned int irq)
>   	return -EINVAL;
>   }
>
> +struct tegra_gpio_table {
> +	int	gpio;	/* GPIO number */
> +	bool	enable;	/* Enable for GPIO at init? */
> +};
> +
> +void __init tegra_gpio_config(struct tegra_gpio_table *table, int num);

    You don't need to annotate the declaration as __init.

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
