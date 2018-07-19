From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] gpio: tegra: Fix tegra_gpio_irq_set_type()
Date: Thu, 19 Jul 2018 15:41:44 +0100
Message-ID: <2384dc28-52ba-a415-9787-6ba985f767c2@nvidia.com>
References: <20180717161038.21500-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717161038.21500-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry

On 17/07/18 17:10, Dmitry Osipenko wrote:
> Commit 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
> broke tegra_gpio_irq_set_type() because requesting of GPIO direction must
> be done after enabling GPIO function for a pin.
> 
> This patch fixes drivers probe failure like this:
> 
>  gpio gpiochip0: (tegra-gpio): gpiochip_lock_as_irq: cannot get GPIO direction
>  tegra-gpio 6000d000.gpio: unable to lock Tegra GPIO 144 as IRQ
> 
> Fixes: 36b312792b97 ("gpiolib: Respect error code of ->get_direction()")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 94396caaca75..22e7c99ed69e 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -323,13 +323,6 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		return -EINVAL;
>  	}
>  
> -	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
> -	if (ret) {
> -		dev_err(tgi->dev,
> -			"unable to lock Tegra GPIO %u as IRQ\n", gpio);
> -		return ret;
> -	}
> -
>  	spin_lock_irqsave(&bank->lvl_lock[port], flags);
>  
>  	val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
> @@ -342,6 +335,14 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
>  	tegra_gpio_enable(tgi, gpio);
>  
> +	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
> +	if (ret) {
> +		dev_err(tgi->dev,
> +			"unable to lock Tegra GPIO %u as IRQ\n", gpio);
> +		tegra_gpio_disable(tgi, gpio);
> +		return ret;
> +	}
> +
>  	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
>  		irq_set_handler_locked(d, handle_level_irq);
>  	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))

Thanks for reporting this. I am seeing this as well on Tegra20 Ventana
and Tegra30 Cardhu looking at the boot log. Given that gpiochip_lock_as_irq
is checking the direction, the above fix looks good to me. So ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
