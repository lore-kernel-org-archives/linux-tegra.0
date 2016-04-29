From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] gpio: tegra: Implement gpio_get_direction callback
Date: Fri, 29 Apr 2016 16:30:41 +0100
Message-ID: <57237E21.4090906@nvidia.com>
References: <1461933078-20366-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461933078-20366-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 29/04/16 13:31, Laxman Dewangan wrote:
> Implement gpio_get_direction() callback for Tegra GPIO.
> The direction is only valid if the pin is configured as
> GPIO. If pin is not configured in GPIO mode then this
> function return error.
> 
> This makes debugfs and initial reading of the state of
> the lines more accurate.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> This patch is based on discussion on series 
> Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
> From Linus W:
> It would be nice if you also implement .get_direction() which makes
> debugfs and initial reading of the state of the lines more accurate.
> 
>  drivers/gpio/gpio-tegra.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index b3ddd92..6f2292b 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -191,6 +191,24 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
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
> +	oe = tegra_gpio_readl(tgi, GPIO_OE(tgi, offset));
> +	if (cnf & pin_mask) {

Nit ... does not look like there is any point in reading GPIO_OE if cnf
& pin_mask == 0, so you could move the test before reading GPIO_OE and
then ...

> +		if (oe & pin_mask)
> +			return GPIOF_DIR_OUT;
> +
> +		return GPIOF_DIR_IN;

You could ...

	return (oe & mask) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;

Cheers
Jon
