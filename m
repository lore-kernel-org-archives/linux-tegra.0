From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] gpio: tegra: Prefer kcalloc() over kzalloc() with
 multiplies
Date: Tue, 25 Jul 2017 09:27:19 +0100
Message-ID: <c89d51ec-18dc-f5ee-f899-09a0480b56e6@nvidia.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
 <20170724145508.7388-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724145508.7388-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 24/07/17 15:55, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Rather than manually compute the size of an array, pass the number and
> element size to kcalloc().
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 63ee221f9be9..1d4df290d7ab 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -621,10 +621,10 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>  	if (tgi->soc->debounce_supported)
>  		tgi->gc.set_config = tegra_gpio_set_config;
>  
> -	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
> +	tgi->bank_info = devm_kcalloc(&pdev->dev, tgi->bank_count,
>  				      sizeof(*tgi->bank_info), GFP_KERNEL);
>  	if (!tgi->bank_info)
> -		return -ENODEV;
> +		return -ENOMEM;
>  
>  	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
>  						tgi->gc.ngpio,
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
