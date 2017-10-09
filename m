From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 15/16] gpio: tegra: Use banked GPIO infrastructure
Date: Mon, 9 Oct 2017 16:22:29 -0500
Message-ID: <dfeb33cf-34b5-259d-cf83-f065d75444f3@ti.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-16-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-16-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 09/28/2017 04:56 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the Tegra GPIO driver to use the banked GPIO infrastructure,
> which simplifies some parts of the driver.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/Kconfig      |   1 +
>   drivers/gpio/gpio-tegra.c | 203 ++++++++++++++++++++++------------------------
>   2 files changed, 98 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index db3e446ad9b3..458157d6d491 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -439,6 +439,7 @@ config GPIO_TEGRA
>   	default ARCH_TEGRA
>   	depends on ARCH_TEGRA || COMPILE_TEST

... 

> @@ -616,76 +617,66 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>   	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
>   #endif
>   
> +	irq = &tgi->gc.irq;
> +	irq->chip = &tgi->ic;
> +	irq->handler = handle_simple_irq;
> +	irq->lock_key = &tegra_gpio_lock_class;

As per current gpiolib design lockdep lock_class_key is assigned 
automatically and hidden from gpiolib users. 
Why do you need to do the same manually?

> +	irq->default_type = IRQ_TYPE_NONE;
> +	irq->parent_handler = gpio_irq_chip_banked_chained_handler;
> +	irq->update_bank = tegra_gpio_update_bank;
> +
> +	irq->parents = devm_kcalloc(&pdev->dev, tgi->gc.num_banks,
> +				    sizeof(unsigned int), GFP_KERNEL);
> +	if (!irq->parents)
> +		return -ENOMEM;
> +

...

>   
>   	tegra_gpio_debuginit(tgi);
>   
> 

-- 
regards,
-grygorii
