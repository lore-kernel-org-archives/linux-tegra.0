From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [V6,3/9] irqdomain: Don't set type when mapping an IRQ
Date: Thu, 17 Aug 2017 20:46:12 +0800
Message-ID: <59959014.9040603@rock-chips.com>
References: <1465312354-27778-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465312354-27778-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi guys,

I hit an problem when testing a level triggered irq with:

irq = platform_get_irq_byname(pdev, "wake");
...<-- irq trigger type is correct
irq_set_status_flags(irq, IRQ_NOAUTOEN);
...<-- irq trigger type become zero
request_threaded_irq(irq, ...)

the trigger type lost(irqd_get_trigger_type returns zero) after 
irq_set_status_flags.


it looks like irq_set_status_flags would try to use 
irq_settings_is_level to get level trigger type, which would get zero 
since we removed set type here...could you help to check this, thanks :)



more details in https://patchwork.kernel.org/patch/9903205/

On 06/07/2016 11:12 PM, Jon Hunter wrote:
> Some IRQ chips, such as GPIO controllers or secondary level
> interrupt controllers, may require require additional runtime power
> management control to ensure they are accessible. For such IRQ chips,
> it makes sense to enable the IRQ chip when interrupts are requested
> and disabled them again once all interrupts have been freed.
>
> When mapping an IRQ, the IRQ type settings are read and then
> programmed. The mapping of the IRQ happens before the IRQ is
> requested and so the programming of the type settings occurs before
> the IRQ is requested. This is a problem for IRQ chips that require
> additional power management control because they may not be
> accessible yet. Therefore, when mapping the IRQ, don't program the
> type settings, just save them and then program these saved settings
> when the IRQ is requested (so long as if they are not overridden via
>  the call to request the IRQ).
>
> Add a stub function for irq_domain_free_irqs() to avoid any
> compilation errors when CONFIG_IRQ_DOMAIN_HIERARCHY is not selected.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> Reviewed-by: Marc
> Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> --- include/linux/irqdomain.h |  3
> +++ kernel/irq/irqdomain.c    | 23 ++++++++++++++++++----- 2 files
> changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index f1f36e04d885..317503763314 100644 ---
> a/include/linux/irqdomain.h +++ b/include/linux/irqdomain.h @@ -452,6
> +452,9 @@ static inline int irq_domain_alloc_irqs(struct irq_domain
> *domain, return -1; }
>
> +static inline void irq_domain_free_irqs(unsigned int virq, +
> unsigned int nr_irqs) { } + static inline bool
> irq_domain_is_hierarchy(struct irq_domain *domain) { return false;
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c index
> f3ff1eb8dd09..caa6a63d26f0 100644 --- a/kernel/irq/irqdomain.c +++
> b/kernel/irq/irqdomain.c @@ -567,6 +567,7 @@ static void
> of_phandle_args_to_fwspec(struct of_phandle_args *irq_data, unsigned
>  int irq_create_fwspec_mapping(struct irq_fwspec *fwspec) { struct
> irq_domain *domain; +	struct irq_data *irq_data; irq_hw_number_t
> hwirq; unsigned int type = IRQ_TYPE_NONE; int virq; @@ -614,7 +615,11
> @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
> * it now and return the interrupt number. */ if
> (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) { -
> irq_set_irq_type(virq, type); +			irq_data = irq_get_irq_data(virq);
> +			if (!irq_data) +				return 0; + + irqd_set_trigger_type(irq_data,
> type); return virq; }
>
> @@ -634,10 +639,18 @@ unsigned int irq_create_fwspec_mapping(struct
> irq_fwspec *fwspec) return virq; }
>
> -	/* Set type if specified and different than the current one */ - if
> (type != IRQ_TYPE_NONE && -	    type != irq_get_trigger_type(virq)) -
> irq_set_irq_type(virq, type); + irq_data = irq_get_irq_data(virq); +
> if (!irq_data) { +		if (irq_domain_is_hierarchy(domain)) +
> irq_domain_free_irqs(virq, 1); + else + irq_dispose_mapping(virq); +
> return 0; +	} + +	/* Store trigger type */ +
> irqd_set_trigger_type(irq_data, type); + return virq; }
> EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);
>
