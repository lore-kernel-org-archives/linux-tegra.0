From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] irqdomain: Introduce __irq_create_of_mapping()
Date: Mon, 16 Sep 2013 16:17:28 -0500
Message-ID: <52377568.6010204@gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com> <1379320326-13241-4-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379320326-13241-4-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/16/2013 03:32 AM, Thierry Reding wrote:
> This is a version of irq_create_of_mapping() that propagates the precise
> error code instead of returning 0 for all errors. It will be used in
> subsequent patches to allow further propagation of error codes.
> 
> To avoid code duplication, implement irq_create_of_mapping() as a
> wrapper around the new __irq_create_of_mapping().

This function is a manageable number of callers that the callers should
just be updated and avoid the wrapper.

Rob

> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/linux/of_irq.h |  3 +++
>  kernel/irq/irqdomain.c | 39 +++++++++++++++++++++++++++++----------
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 535cecf..c383dd1 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -63,6 +63,9 @@ extern int of_irq_map_raw(struct device_node *parent, const __be32 *intspec,
>  			  struct of_irq *out_irq);
>  extern int of_irq_map_one(struct device_node *device, int index,
>  			  struct of_irq *out_irq);
> +extern int __irq_create_of_mapping(struct device_node *controller,
> +				   const u32 *intspec, unsigned int intsize,
> +				   unsigned int *virqp);
>  extern unsigned int irq_create_of_mapping(struct device_node *controller,
>  					  const u32 *intspec,
>  					  unsigned int intsize);
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index d2a3b01..9867616 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -484,39 +484,58 @@ int irq_create_strict_mappings(struct irq_domain *domain, unsigned int irq_base,
>  }
>  EXPORT_SYMBOL_GPL(irq_create_strict_mappings);
>  
> -unsigned int irq_create_of_mapping(struct device_node *controller,
> -				   const u32 *intspec, unsigned int intsize)
> +int __irq_create_of_mapping(struct device_node *controller, const u32 *intspec,
> +			    unsigned int intsize, unsigned int *virqp)
>  {
> +	unsigned int type = IRQ_TYPE_NONE;
>  	struct irq_domain *domain;
>  	irq_hw_number_t hwirq;
> -	unsigned int type = IRQ_TYPE_NONE;
>  	unsigned int virq;
> +	int ret;
>  
>  	domain = controller ? irq_find_host(controller) : irq_default_domain;
>  	if (!domain) {
>  		pr_warn("no irq domain found for %s !\n",
>  			of_node_full_name(controller));
> -		return 0;
> +		return -EPROBE_DEFER;
>  	}
>  
>  	/* If domain has no translation, then we assume interrupt line */
>  	if (domain->ops->xlate == NULL)
>  		hwirq = intspec[0];
>  	else {
> -		if (domain->ops->xlate(domain, controller, intspec, intsize,
> -				     &hwirq, &type))
> -			return 0;
> +		ret = domain->ops->xlate(domain, controller, intspec, intsize,
> +					 &hwirq, &type);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	/* Create mapping */
> -	virq = irq_create_mapping(domain, hwirq);
> -	if (!virq)
> -		return virq;
> +	ret = __irq_create_mapping(domain, hwirq, &virq);
> +	if (ret)
> +		return ret;
>  
>  	/* Set type if specified and different than the current one */
>  	if (type != IRQ_TYPE_NONE &&
>  	    type != irq_get_trigger_type(virq))
>  		irq_set_irq_type(virq, type);
> +
> +	if (virqp)
> +		*virqp = virq;
> +
> +	return 0;
> +}
> +
> +unsigned int irq_create_of_mapping(struct device_node *controller,
> +				   const u32 *intspec, unsigned int intsize)
> +{
> +	unsigned int virq;
> +	int ret;
> +
> +	ret = __irq_create_of_mapping(controller, intspec, intsize, &virq);
> +	if (ret)
> +		return 0;
> +
>  	return virq;
>  }
>  EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
