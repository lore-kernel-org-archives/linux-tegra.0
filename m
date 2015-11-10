From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Tue, 10 Nov 2015 10:26:27 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1511101017190.3915@nanos>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com> <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447166377-19707-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jon,

On Tue, 10 Nov 2015, Jon Hunter wrote:
>  	void		(*irq_suspend)(struct irq_data *data);
>  	void		(*irq_resume)(struct irq_data *data);
> +	int		(*irq_runtime_suspend)(struct irq_data *data);
> +	int		(*irq_runtime_resume)(struct irq_data *data);
>  	void		(*irq_pm_shutdown)(struct irq_data *data);

So this is the second patch within a few days which adds that just
with different names:

http://lkml.kernel.org/r/1446668160-17522-2-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org

Can you folks please tell me which of the names is the correct one?
  
> +/* Inline functions for support of irq chips that require runtime pm */
> +static inline int chip_runtime_resume(struct irq_desc *desc)
> +{
> +	if (!desc->irq_data.chip->irq_runtime_resume)
> +		return 0;
> +
> +	return desc->irq_data.chip->irq_runtime_resume(&desc->irq_data);
> +}
> +
> +static inline int chip_runtime_suspend(struct irq_desc *desc)
> +{
> +	if (!desc->irq_data.chip->irq_runtime_suspend)
> +		return 0;
> +
> +	return desc->irq_data.chip->irq_runtime_suspend(&desc->irq_data);

We really don't need a return value for that one.

> +}
> +
>  #define _IRQ_DESC_CHECK		(1 << 0)
>  #define _IRQ_DESC_PERCPU	(1 << 1)
>  
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 0eebaeef317b..66e33df73140 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1116,6 +1116,10 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>  	if (!try_module_get(desc->owner))
>  		return -ENODEV;
>  
> +	ret = chip_runtime_resume(desc);
> +	if (ret < 0)
> +		return ret;

Leaks module ref count.

> +
>  	new->irq = irq;
>  
>  	/*
> @@ -1393,6 +1397,7 @@ out_thread:
>  		put_task_struct(t);
>  	}
>  out_mput:
> +	chip_runtime_suspend(desc);
>  	module_put(desc->owner);
>  	return ret;
>  }
> @@ -1506,6 +1511,7 @@ static struct irqaction *__free_irq(unsigned int irq, void *dev_id)
>  		}
>  	}
>  
> +	chip_runtime_suspend(desc);
>  	module_put(desc->owner);
>  	kfree(action->secondary);
>  	return action;
> @@ -1792,6 +1798,7 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
>  
>  	unregister_handler_proc(irq, action);
>  
> +	chip_runtime_suspend(desc);

Where is the corresponding call in request_percpu_irq() ?

Can you folks please agree on something which is correct and complete?

Thanks,

	tglx
