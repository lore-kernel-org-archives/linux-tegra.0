From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V1] gpio: tps65910: Use correct offset for gpio
 initialization
Date: Wed, 18 Jan 2012 13:49:59 -0700
Message-ID: <20120118204959.GK4223@ponder.secretlab.ca>
References: <1326897455-8298-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326897455-8298-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 18, 2012 at 08:07:35PM +0530, Laxman Dewangan wrote:
> Using the correct gpio offset for setting the initial value
> of gpio when setting output direction.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/gpio/gpio-tps65910.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
> index b9c1c29..91f45b9 100644
> --- a/drivers/gpio/gpio-tps65910.c
> +++ b/drivers/gpio/gpio-tps65910.c
> @@ -52,7 +52,7 @@ static int tps65910_gpio_output(struct gpio_chip *gc, unsigned offset,
>  	struct tps65910 *tps65910 = container_of(gc, struct tps65910, gpio);
>  
>  	/* Set the initial value */
> -	tps65910_gpio_set(gc, 0, value);
> +	tps65910_gpio_set(gc, offset, value);
>  
>  	return tps65910_set_bits(tps65910, TPS65910_GPIO0 + offset,
>  						GPIO_CFG_MASK);
> -- 
> 1.7.1.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
