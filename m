From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] rtc: max77686: Make wakeup support configurable
Date: Mon, 20 Apr 2020 15:42:48 +0100
Message-ID: <03086f6b-012b-67ab-6a61-fbae1bf0c3c7@nvidia.com>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200417170825.2551367-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417170825.2551367-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/04/2020 18:08, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Use the standard "wakeup-source" device tree property to determine if
> the RTC can act as a wakeup source for the system. Note that the driver
> by default always assumes that the RTC can act as a wakeup source, but
> whether it can really do so or not always depends on how it is hooked
> up.
> 
> In order to preserve backwards compatibility with older device trees,
> only parse the "wakeup-source" property when a device tree node was
> associated with the RTC device. This doesn't typically happen because
> the top-level MFD driver doesn't list any compatible strings that can
> be used to map child nodes to child devices. As a fallback, check if a
> child node named "rtc" exists and use that instead.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Note that we could obviously add support to the MFD driver to match
> subdevices to their device tree nodes by compatible string, but there
> are side-effects, such as the driver core complaining about the lack
> of a DMA mask for these devices. That in turn could also be fixed but
> it ends up all being rather hacky, so just looking up a child node by
> name seems like a good compromise, especially since there are already
> such subnodes for some of the other subdevices of this PMIC.
> ---
>  drivers/rtc/rtc-max77686.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d5a0e27dd0a0..35fd74b83626 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -722,6 +722,8 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  {
>  	struct max77686_rtc_info *info;
>  	const struct platform_device_id *id = platform_get_device_id(pdev);
> +	struct device_node *np = of_node_get(pdev->dev.of_node);
> +	bool wakeup = true;
>  	int ret;
>  
>  	info = devm_kzalloc(&pdev->dev, sizeof(struct max77686_rtc_info),
> @@ -746,7 +748,21 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  		goto err_rtc;
>  	}
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	/*
> +	 * Only check for the wakeup-source property if there's an actual
> +	 * device tree node for the RTC. If no device tree node had been
> +	 * attached during device instantiation, try looking up the "rtc"
> +	 * child node of the parent's device tree node.
> +	 */
> +	if (!np && pdev->dev.parent->of_node)
> +		np = of_get_child_by_name(pdev->dev.parent->of_node, "rtc");
> +
> +	if (np) {
> +		wakeup = of_property_read_bool(np, "wakeup-source");
> +		of_node_put(np);
> +	}
> +
> +	device_init_wakeup(&pdev->dev, wakeup);
>  
>  	info->rtc_dev = devm_rtc_device_register(&pdev->dev, id->name,
>  					&max77686_rtc_ops, THIS_MODULE);
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
