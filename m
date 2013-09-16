From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] of/irq: Introduce of_irq_get()
Date: Mon, 16 Sep 2013 16:24:47 -0500
Message-ID: <5237771F.1060908@gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com> <1379320326-13241-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379320326-13241-5-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/16/2013 03:32 AM, Thierry Reding wrote:
> This is a version of irq_of_parse_and_map() that propagates the precise
> error code instead of returning 0 for all errors. It will be used in
> subsequent patches to allow further propagation of error codes.
> 
> To avoid code duplication, implement irq_of_parse_and_map() as a wrapper
> around the new of_irq_get().

*_get typically also implies some reference counting which I don't
believe this does. I don't think having 2 functions with completely
different names doing the same thing with only a different calling
convention is good either. So I would keep the old name and the names
aligned.

> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/irq.c       | 21 +++++++++++++++++----
>  include/linux/of_irq.h |  3 +++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 5f44388..8225289 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -26,6 +26,20 @@
>  #include <linux/string.h>
>  #include <linux/slab.h>
>  
> +int of_irq_get(struct device_node *dev, unsigned int index, unsigned int *virqp)
> +{
> +	struct of_irq oirq;
> +	int ret;
> +
> +	ret = of_irq_map_one(dev, index, &oirq);
> +	if (ret)
> +		return ret;
> +
> +	return __irq_create_of_mapping(oirq.controller, oirq.specifier,
> +				       oirq.size, virqp);
> +}
> +EXPORT_SYMBOL_GPL(of_irq_get);
> +
>  /**
>   * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
>   * @dev: Device node of the device whose interrupt is to be mapped
> @@ -36,13 +50,12 @@
>   */
>  unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
>  {
> -	struct of_irq oirq;
> +	unsigned int virq;
>  
> -	if (of_irq_map_one(dev, index, &oirq))
> +	if (of_irq_get(dev, index, &virq))
>  		return 0;
>  
> -	return irq_create_of_mapping(oirq.controller, oirq.specifier,
> -				     oirq.size);
> +	return virq;

This can be an inline and written more concisely:

{
	unsigned int virq;
	return (of_irq_get(dev, index, &virq) < 0) ? 0 : virq;
}

Rob
