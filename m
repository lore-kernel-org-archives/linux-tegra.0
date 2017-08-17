From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [V6,3/9] irqdomain: Don't set type when mapping an IRQ
Date: Thu, 17 Aug 2017 22:42:13 +0800
Message-ID: <5995AB45.6010706@rock-chips.com>
References: <1465312354-27778-4-git-send-email-jonathanh@nvidia.com> <59959014.9040603@rock-chips.com> <feb4e020-b738-9165-c044-b0e246ee4bd5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <feb4e020-b738-9165-c044-b0e246ee4bd5-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Marc,

Thanks for your reply.

On 08/17/2017 09:34 PM, Marc Zyngier wrote:
> On 17/08/17 13:46, jeffy wrote:
>> Hi guys,
>>
>> I hit an problem when testing a level triggered irq with:
>>
>> irq = platform_get_irq_byname(pdev, "wake");
>> ...<-- irq trigger type is correct
>> irq_set_status_flags(irq, IRQ_NOAUTOEN);
>> ...<-- irq trigger type become zero
>> request_threaded_irq(irq, ...)
>>
>> the trigger type lost(irqd_get_trigger_type returns zero) after
>> irq_set_status_flags.
>>
>>
>> it looks like irq_set_status_flags would try to use
>> irq_settings_is_level to get level trigger type, which would get zero
>> since we removed set type here...could you help to check this, thanks :)
>
> Hmm. That's quite unexpected. Can you please try this?
>
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index a3cc37c0c85e..3675c6004f2a 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1000,7 +1000,7 @@ EXPORT_SYMBOL_GPL(irq_set_chip_and_handler_name);
>
>   void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
>   {
> -	unsigned long flags;
> +	unsigned long flags, trigger, tmp;
>   	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
>
>   	if (!desc)
> @@ -1014,6 +1014,8 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
>
>   	irq_settings_clr_and_set(desc, clr, set);
>
> +	trigger = irqd_get_trigger_type(&desc->irq_data);
> +
>   	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
>   		   IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
>   	if (irq_settings_has_no_balance_set(desc))
> @@ -1025,7 +1027,11 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
>   	if (irq_settings_is_level(desc))
>   		irqd_set(&desc->irq_data, IRQD_LEVEL);
>
> -	irqd_set(&desc->irq_data, irq_settings_get_trigger_mask(desc));
> +	tmp = irq_settings_get_trigger_mask(desc);
> +	if (tmp != IRQ_TYPE_NONE)
> +		trigger = tmp;
> +
> +	irqd_set(&desc->irq_data, trigger);
>
>   	irq_put_desc_unlock(desc, flags);
>   }
>
> Basically, save the trigger info before clearing it. If the interrupt
> has already been configured, use that. Otherwise restore the previous
> trigger settings. But I'm slightly confused as to which field is used
> for what...

Thanks:), this patch works well, so

Tested-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

>
> 	M.
>
