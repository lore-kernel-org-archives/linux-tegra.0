From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] gpio: tegra: Add support for gpio debounce
Date: Mon, 18 Apr 2016 10:38:36 -0600
Message-ID: <57150D8C.7020100@wwwdotorg.org>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
 <1460969178-20914-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460969178-20914-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra210 support the HW debounce in the GPIO
> controller for all its GPIO pins.
>
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.

> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c

> +static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
> +				   unsigned int debounce)
> +{
> +	unsigned int max_dbc;
> +	unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
> +
> +	if (!debounce_ms) {
> +		tegra_gpio_mask_write(GPIO_MSK_DBC_EN(offset), offset, 0);
> +		return 0;
> +	}
> +
> +	debounce_ms = min(debounce_ms, 255U);
> +
> +	/* There is only one debounce count register per port and hence
> +	 * set the maximum of current and requested debounce time.
> +	 */
> +	max_dbc = tegra_gpio_readl(GPIO_DBC_CNT(offset));

What if the system boots with random values in that register, or some 
code that runs before the kernel programs large values into the 
register? That would (incorrectly) impose a lower bound on the possible 
values the kernel driver can impose. Perhaps the kernel should clear the 
DBC_CNT registers at probe(), or should store a shadow copy of the 
DBC_CNT register, use that value here rather than re-reading the 
registers, and clear that SW shadow at probe().

> +	max_dbc = max(max_dbc, debounce_ms);

I wonder if there should be more discussion of how to honor conflicting 
requests. Perhaps we should only allow exactly equal values (someone 
might strictly care about latency, and increasing the latency of GPIO X1 
just because GPIO X5 wanted a longer debounce period might not be 
acceptable). Does the GPIO subsystem define explicit semantics for this 
case?

> +	tegra_gpio_mask_write(GPIO_MSK_DBC_EN(offset), offset, 1);
> +	tegra_gpio_writel(max_dbc, GPIO_DBC_CNT(offset));

I think DBC_CNT should be written first; the debounce process uses that 
data to configure itself. The process shouldn't be enabled before it's 
configured.

> @@ -327,6 +358,9 @@ static int tegra_gpio_resume(struct device *dev)
>   			tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
>   			tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
>   			tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
> +			tegra_gpio_writel(bank->dbc_enb[p],
> +					  GPIO_MSK_DBC_EN(gpio));
> +			tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));

dbg_cnt should be restored before dbc_en, for the same reason as above.
