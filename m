From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH V2 1/8] irqdomain: Ensure type settings match for an
 existing mapping
Date: Fri, 18 Dec 2015 10:10:15 +0000
Message-ID: <5673DB87.6040106@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
 <1450349309-8107-2-git-send-email-jonathanh@nvidia.com>
 <CACRpkdYPvMfqou7t9K_5=Ojx3U_sc8B2Zkxgeu=1JXxCUU_E2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYPvMfqou7t9K_5=Ojx3U_sc8B2Zkxgeu=1JXxCUU_E2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 17/12/15 13:16, Linus Walleij wrote:
> On Thu, Dec 17, 2015 at 11:48 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> When mapping an IRQ, if a mapping already exists, then we simply return
>> the virual IRQ number. However, we do not check that the type settings for
> 
> ^virtual
> 
> Just that it isn't virtual, it's a Linux IRQ number, we actually use
> hwirq for the non-virtual IRQ number/offse in this function.
> 
> But I know I may be fighting weathermills here.

Ok, will re-word this.

>>  unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>>  {
>> +       struct device_node *of_node;
>>         struct irq_domain *domain;
>>         irq_hw_number_t hwirq;
>> +       unsigned int cur_type = IRQ_TYPE_NONE;
>>         unsigned int type = IRQ_TYPE_NONE;
>>         int virq;
>>
>> @@ -587,23 +589,49 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>>         if (irq_domain_translate(domain, fwspec, &hwirq, &type))
>>                 return 0;
>>
>> -       if (irq_domain_is_hierarchy(domain)) {
>> -               /*
>> -                * If we've already configured this interrupt,
>> -                * don't do it again, or hell will break loose.
>> -                */
>> -               virq = irq_find_mapping(domain, hwirq);
>> -               if (virq)
>> -                       return virq;
>> +       of_node = irq_domain_get_of_node(domain);
> 
> Marc's patches went to great lengths to do this fwspec-neutral,
> i.e. it doesn't matter if it's done by DT or ACPI (or whatever).
> 
> This just drives a truck through all of that by making
> the whole function OF-specific again.

Yes, was not sure if this would be popular. I was on the fence, but I
saw the following ...

	if (!domain) {
 		pr_warn("no irq domain found for %s !\n",
			of_node_full_name(to_of_node(fwspec->fwnode)));
			return 0;
	}

... and thought we are not completely agnostic. However, if you prefer I
park my mini else where, I can definitely drop this, no big deal ;-)

>>
>> -               virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, fwspec);
>> -               if (virq <= 0)
>> -                       return 0;
>> +       /*
>> +        * If we've already configured this interrupt,
>> +        * don't do it again, or hell will break loose.
>> +        */
>> +       virq = irq_find_mapping(domain, hwirq);
>> +       if (!virq) {
>> +               if (irq_domain_is_hierarchy(domain)) {
>> +                       virq = irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE,
>> +                                                    fwspec);
>> +                       if (virq <= 0)
>> +                               return 0;
>> +               } else {
>> +                       virq = irq_domain_alloc_descs(-1, 1, hwirq,
>> +                                                     of_node_to_nid(of_node));
> 
> What is this all of a sudden? Not even mentioned in the
> commit. Plus I bet ACPI need something else than OF nid
> passed here.

Do you mean the else part of all of the above?

So in the current code, the else part calls irq_create_mapping() and
this function internally, calls irq_find_mapping(). Given that I am now
calling irq_find_mapping() before the if, I don't really need to call
irq_create_mapping() again, I just need to call the functions in
irq_create_mapping() that allocate and setup the IRQ number. Sorry, I
did not really explain this. However, if it is simpler, I can call
irq_create_mapping() instead and may be this makes the change easier to
read.

Cheers
Jon
