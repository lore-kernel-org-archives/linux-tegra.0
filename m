From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 11:43:25 +0100
Message-ID: <57160BCD.4080005@nvidia.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
 <1461059020-25373-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461059020-25373-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/04/16 10:43, Laxman Dewangan wrote:
> NVIDIA's Tegra210 support the HW debounce in the GPIO
> controller for all its GPIO pins.
> 
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
> - Write debounce count before enable.
> - Make sure the debounce count do not have any boot residuals.
> ---
>  drivers/gpio/gpio-tegra.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

[snip]

> @@ -327,6 +360,9 @@ static int tegra_gpio_resume(struct device *dev)
>  			tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
>  			tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
>  			tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
> +			tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));
> +			tegra_gpio_writel(bank->dbc_enb[p],
> +					  GPIO_MSK_DBC_EN(gpio));

If these registers are not valid on Tegra devices prior to Tegra210, I
don't think we should write to these locations on those devices (even if
we are writing back the values read).

> @@ -351,6 +387,10 @@ static int tegra_gpio_suspend(struct device *dev)
>  			bank->oe[p] = tegra_gpio_readl(GPIO_OE(gpio));
>  			bank->int_enb[p] = tegra_gpio_readl(GPIO_INT_ENB(gpio));
>  			bank->int_lvl[p] = tegra_gpio_readl(GPIO_INT_LVL(gpio));
> +			bank->dbc_enb[p] = tegra_gpio_readl(
> +							GPIO_MSK_DBC_EN(gpio));
> +			bank->dbc_enb[p] = (bank->dbc_enb[p] << 8) ||
> +						bank->dbc_enb[p];

Same here, not sure we should even bother reading these for Tegra's
before Tegra210.

Cheers
Jon
