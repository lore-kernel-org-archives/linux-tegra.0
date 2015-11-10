From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Tue, 10 Nov 2015 18:47:33 +0200
Message-ID: <56421FA5.4020801@ti.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos> <56421421.8070807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56421421.8070807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,
On 11/10/2015 05:58 PM, Jon Hunter wrote:
> Hi Thomas,
> 
> On 10/11/15 15:26, Thomas Gleixner wrote:
>> Jon,
>>
>> On Tue, 10 Nov 2015, Jon Hunter wrote:
>>>   	void		(*irq_suspend)(struct irq_data *data);
>>>   	void		(*irq_resume)(struct irq_data *data);
>>> +	int		(*irq_runtime_suspend)(struct irq_data *data);
>>> +	int		(*irq_runtime_resume)(struct irq_data *data);
>>>   	void		(*irq_pm_shutdown)(struct irq_data *data);
>>
>> So this is the second patch within a few days which adds that just
>> with different names:
>>
>> http://lkml.kernel.org/r/1446668160-17522-2-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
>>
>> Can you folks please tell me which of the names is the correct one?
> 
> Sorry. I was unaware of that patch.
> 
>>> +/* Inline functions for support of irq chips that require runtime pm */
>>> +static inline int chip_runtime_resume(struct irq_desc *desc)
>>> +{
>>> +	if (!desc->irq_data.chip->irq_runtime_resume)
>>> +		return 0;
>>> +
>>> +	return desc->irq_data.chip->irq_runtime_resume(&desc->irq_data);
>>> +}
>>> +
>>> +static inline int chip_runtime_suspend(struct irq_desc *desc)
>>> +{
>>> +	if (!desc->irq_data.chip->irq_runtime_suspend)
>>> +		return 0;
>>> +
>>> +	return desc->irq_data.chip->irq_runtime_suspend(&desc->irq_data);
>>
>> We really don't need a return value for that one.
> 
> Ok.
> 
>>> +}
>>> +
>>>   #define _IRQ_DESC_CHECK		(1 << 0)
>>>   #define _IRQ_DESC_PERCPU	(1 << 1)
>>>   
>>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>>> index 0eebaeef317b..66e33df73140 100644
>>> --- a/kernel/irq/manage.c
>>> +++ b/kernel/irq/manage.c
>>> @@ -1116,6 +1116,10 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>>>   	if (!try_module_get(desc->owner))
>>>   		return -ENODEV;
>>>   
>>> +	ret = chip_runtime_resume(desc);
>>> +	if (ret < 0)
>>> +		return ret;
>>
>> Leaks module ref count.
> 
> Ok.
> 
>>> +
>>>   	new->irq = irq;
>>>   
>>>   	/*
>>> @@ -1393,6 +1397,7 @@ out_thread:
>>>   		put_task_struct(t);
>>>   	}
>>>   out_mput:
>>> +	chip_runtime_suspend(desc);
>>>   	module_put(desc->owner);
>>>   	return ret;
>>>   }
>>> @@ -1506,6 +1511,7 @@ static struct irqaction *__free_irq(unsigned int irq, void *dev_id)
>>>   		}
>>>   	}
>>>   
>>> +	chip_runtime_suspend(desc);
>>>   	module_put(desc->owner);
>>>   	kfree(action->secondary);
>>>   	return action;
>>> @@ -1792,6 +1798,7 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
>>>   
>>>   	unregister_handler_proc(irq, action);
>>>   
>>> +	chip_runtime_suspend(desc);
>>
>> Where is the corresponding call in request_percpu_irq() ?
> 
> I was trying to simplify matters by placing the resume call in
> __setup_irq() as opposed to requested_threaded_irq(). However, the would
> mean the resume is inside the bus_lock and may be I should not assume
> that I can sleep here.
> 
>> Can you folks please agree on something which is correct and complete?
> 
> Soren I am happy to defer to your patch and drop this. My only comment
> would be what about the request_percpu_irq() path in your patch?
> 

I have the same comment here as I asked Soren:
1) There are no restrictions to call irq set_irq_type() whenever,
as result HW can be accessed before request_x_irq()/__setup_irq().
And this is used quite widely now :(

For example, during OF boot:

[a]  irq_create_of_mapping()
   - irq_create_fwspec_mapping()
     - irq_set_irq_type()

or 
	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
	irq_set_chained_handler(irq, mx31ads_expio_irq_handler);

or
	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
	err = devm_request_irq(&pdev->dev, alarm_irq, fan_alarm_irq_handler,
(there are ~200 occurrences of irq set_irq_type in Kernel)

2) if i'm not wrong, the same is valid for irq_set_irq_wake() and irq_set_affinity()

I'm not saying all these code is correct, but that what's now in kernel :(
I've tried to test Soren's patch with omap-gpio and immediately hit case [a] :.( 


-- 
regards,
-grygorii
