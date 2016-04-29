From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: Implement gpio_get_direction callback
Date: Fri, 29 Apr 2016 10:17:23 -0600
Message-ID: <57238913.4080905@wwwdotorg.org>
References: <1461933078-20366-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461933078-20366-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/29/2016 06:31 AM, Laxman Dewangan wrote:
> Implement gpio_get_direction() callback for Tegra GPIO.
> The direction is only valid if the pin is configured as
> GPIO. If pin is not configured in GPIO mode then this
> function return error.
>
> This makes debugfs and initial reading of the state of
> the lines more accurate.

> +static int tegra_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
> +{
> +	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +	u32 pin_mask = BIT(GPIO_BIT(offset));
> +	u32 cnf, oe;
> +
> +	cnf = tegra_gpio_readl(tgi, GPIO_CNF(tgi, offset));
> +	oe = tegra_gpio_readl(tgi, GPIO_OE(tgi, offset));
> +	if (cnf & pin_mask) {
> +		if (oe & pin_mask)
> +			return GPIOF_DIR_OUT;
> +
> +		return GPIOF_DIR_IN;
> +	}
> +
> +	return -EINVAL;
> +}

Conceptually looks fine, but I have similar comments to Jon; whenever 
there's an error condition, just fail immediately. That way you avoid 
the entire rest of the function being indented:

cnf = ...
if (!(cnf ...)
     return -EINVAL;
oe = ...
return ...

The only indented code there is the error handling. At least to me, this 
makes the code a lot more readable since there are far fewer 
combinations of conditionals.
