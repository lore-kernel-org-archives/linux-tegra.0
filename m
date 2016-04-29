From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2] gpio: tegra: Implement gpio_get_direction callback
Date: Fri, 29 Apr 2016 18:15:04 +0100
Message-ID: <57239698.80901@nvidia.com>
References: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 29/04/16 17:25, Laxman Dewangan wrote:
> Implement gpio_get_direction() callback for Tegra GPIO.
> The direction is only valid if the pin is configured as
> GPIO. If pin is not configured in GPIO mode then this
> function return error.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> This patch is based on discussion on series
> Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
> From Linus W:
> It would be nice if you also implement .get_direction() which makes
> debugfs and initial reading of the state of the lines more accurate.
> 
> V1->V2:
> - Rearrange the calls to optimise the register access and avoid
>  much indenting based on Stephen's and Jon review.
> 
>  drivers/gpio/gpio-tegra.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index b3ddd92..ec891a27 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -191,6 +191,21 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  	return 0;
>  }
>  
> +static int tegra_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
> +{
> +	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +	u32 pin_mask = BIT(GPIO_BIT(offset));
> +	u32 cnf, oe;
> +
> +	cnf = tegra_gpio_readl(tgi, GPIO_CNF(tgi, offset));
> +	if (!(cnf & pin_mask))
> +		return -EINVAL;
> +
> +	oe = tegra_gpio_readl(tgi, GPIO_OE(tgi, offset));
> +
> +	return (oe & pin_mask) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
> +}
> +
>  static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
>  				   unsigned int debounce)
>  {
> @@ -575,6 +590,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>  	tgi->gc.get			= tegra_gpio_get;
>  	tgi->gc.direction_output	= tegra_gpio_direction_output;
>  	tgi->gc.set			= tegra_gpio_set;
> +	tgi->gc.get_direction		= tegra_gpio_get_direction;
>  	tgi->gc.to_irq			= tegra_gpio_to_irq;
>  	tgi->gc.base			= 0;
>  	tgi->gc.ngpio			= tgi->bank_count * 32;

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

