From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/9] of/irq: Introduce __of_irq_to_resource()
Date: Mon, 16 Sep 2013 16:29:15 -0500
Message-ID: <5237782B.3030804@gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com> <1379320326-13241-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379320326-13241-6-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/16/2013 03:32 AM, Thierry Reding wrote:
> This is a version of of_irq_to_resource() that propagates the precise
> error code instead of returning 0 for all errors. It will be used in
> subsequent patches to allow further propagation of error codes.
> 
> To avoid code duplication, implement of_irq_to_resource() as a wrapper
> around the new __of_irq_to_resource().

I think the callers in this case are manageable to update as well.
Several cases could simply use irq_of_parse_and_map instead as they just
pass in a NULL resource.

Rob

> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/irq.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 8225289..57396fd 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -343,15 +343,15 @@ int of_irq_map_one(struct device_node *device, int index, struct of_irq *out_irq
>  }
>  EXPORT_SYMBOL_GPL(of_irq_map_one);
>  
> -/**
> - * of_irq_to_resource - Decode a node's IRQ and return it as a resource
> - * @dev: pointer to device tree node
> - * @index: zero-based index of the irq
> - * @r: pointer to resource structure to return result into.
> - */
> -int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
> +static int __of_irq_to_resource(struct device_node *dev, unsigned int index,
> +				struct resource *r)
>  {
> -	int irq = irq_of_parse_and_map(dev, index);
> +	unsigned int irq;
> +	int ret;
> +
> +	ret = of_irq_get(dev, index, &irq);
> +	if (ret)
> +		return ret;
>  
>  	/* Only dereference the resource if both the
>  	 * resource and the irq are valid. */
> @@ -373,6 +373,23 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>  
>  	return irq;
>  }
> +
> +/**
> + * of_irq_to_resource - Decode a node's IRQ and return it as a resource
> + * @dev: pointer to device tree node
> + * @index: zero-based index of the irq
> + * @r: pointer to resource structure to return result into.
> + */
> +int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
> +{
> +	int ret;
> +
> +	ret = __of_irq_to_resource(dev, index, r);
> +	if (ret < 0)
> +		return 0;
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(of_irq_to_resource);
>  
>  /**
> 
