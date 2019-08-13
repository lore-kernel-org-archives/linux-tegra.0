From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] irqchip/tegra: Clean up coding style
Date: Tue, 13 Aug 2019 18:40:27 +0300
Message-ID: <4fbc5a90-e110-b020-15d3-c4bbe81b15cc@gmail.com>
References: <20190811183044.13925-1-digetx@gmail.com>
 <20190811183044.13925-2-digetx@gmail.com> <86a7cdnmpx.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86a7cdnmpx.wl-maz@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.08.2019 17:50, Marc Zyngier пишет:
> On Sun, 11 Aug 2019 19:30:44 +0100,
> Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Make coding style to conform to the kernel's standard by fixing checkpatch
>> warnings about "line over 80 characters".
> 
> The last time I used a VT100 was about 30 years ago. I still think
> this was one of the most brilliant piece of equipment DEC ever
> produced, but I replaced it at the time with a Wyse 50 that had a 132
> column mode. But even then, I could make my XTerm as wide as I wanted,
> and things haven't regressed much since.
> 
> More seriously, I don't consider the 80 column limit a hard one, and
> I'm pretty happy with code that spans more that 80 columns if that
> allows to read an expression without messing with the flow.

Usually I have multiple source files opened side-by-side and the view sizes are tuned for 80
chars, it messes at least my flow when something goes over 80 chars.

>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/irqchip/irq-tegra.c | 15 +++++----------
>>  1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
>> index 14dcacc2ad38..f829a5990dae 100644
>> --- a/drivers/irqchip/irq-tegra.c
>> +++ b/drivers/irqchip/irq-tegra.c
>> @@ -74,7 +74,7 @@ static struct tegra_ictlr_info *lic;
>>  
>>  static inline void tegra_ictlr_write_mask(struct irq_data *d, unsigned long reg)
>>  {
>> -	void __iomem *base = (void __iomem __force *)d->chip_data;
>> +	void __iomem *base = lic->base[d->hwirq / 32];
> 
> (1) This is an undocumented change

In my opinion this is a very trivial change and then the end result is absolutely the same,
hence nothing to document here. Just read the code, I'd say.

> (2) Why do you think that moving from a per-interrupt base that is
>     known at setup time to something that has to be recomputed on each
>     and every access is a good thing?

I think that there is no practical difference and the new variant is a bit more obvious and
readable.

> 
>>  	u32 mask;
>>  
>>  	mask = BIT(d->hwirq % 32);
>> @@ -142,7 +142,8 @@ static int tegra_ictlr_suspend(void)
>>  		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
>>  
>>  		/* Enable the wakeup sources of ictlr */
>> -		writel_relaxed(lic->ictlr_wake_mask[i], ictlr + ICTLR_CPU_IER_SET);
>> +		writel_relaxed(lic->ictlr_wake_mask[i],
>> +			       ictlr + ICTLR_CPU_IER_SET);
>>  	}
>>  	local_irq_restore(flags);
>>  
>> @@ -222,7 +223,6 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
>>  {
>>  	struct irq_fwspec *fwspec = data;
>>  	struct irq_fwspec parent_fwspec;
>> -	struct tegra_ictlr_info *info = domain->host_data;
>>  	irq_hw_number_t hwirq;
>>  	unsigned int i;
>>  
>> @@ -235,13 +235,9 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
>>  	if (hwirq >= (num_ictlrs * 32))
>>  		return -EINVAL;
>>  
>> -	for (i = 0; i < nr_irqs; i++) {
>> -		int ictlr = (hwirq + i) / 32;
>> -
>> +	for (i = 0; i < nr_irqs; i++)
>>  		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
>> -					      &tegra_ictlr_chip,
>> -					      (void __force *)info->base[ictlr]);
>> -	}
>> +					      &tegra_ictlr_chip, NULL);
>>  
>>  	parent_fwspec = *fwspec;
>>  	parent_fwspec.fwnode = domain->parent->fwnode;
>> @@ -312,7 +308,6 @@ static int __init tegra_ictlr_init(struct device_node *node,
>>  	     "%pOF: Found %u interrupt controllers in DT; expected %u.\n",
>>  	     node, num_ictlrs, soc->num_ictlrs);
>>  
>> -
>>  	domain = irq_domain_add_hierarchy(parent_domain, 0, num_ictlrs * 32,
>>  					  node, &tegra_ictlr_domain_ops,
>>  					  lic);
>> -- 
>> 2.22.0
>>
> 
