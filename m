From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Tue, 10 Nov 2015 15:58:25 +0000
Message-ID: <56421421.8070807@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1511101017190.3915@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thomas,

On 10/11/15 15:26, Thomas Gleixner wrote:
> Jon,
> 
> On Tue, 10 Nov 2015, Jon Hunter wrote:
>>  	void		(*irq_suspend)(struct irq_data *data);
>>  	void		(*irq_resume)(struct irq_data *data);
>> +	int		(*irq_runtime_suspend)(struct irq_data *data);
>> +	int		(*irq_runtime_resume)(struct irq_data *data);
>>  	void		(*irq_pm_shutdown)(struct irq_data *data);
> 
> So this is the second patch within a few days which adds that just
> with different names:
> 
> http://lkml.kernel.org/r/1446668160-17522-2-git-send-email-soren.brinkmann@xilinx.com
> 
> Can you folks please tell me which of the names is the correct one?

Sorry. I was unaware of that patch.

>> +/* Inline functions for support of irq chips that require runtime pm */
>> +static inline int chip_runtime_resume(struct irq_desc *desc)
>> +{
>> +	if (!desc->irq_data.chip->irq_runtime_resume)
>> +		return 0;
>> +
>> +	return desc->irq_data.chip->irq_runtime_resume(&desc->irq_data);
>> +}
>> +
>> +static inline int chip_runtime_suspend(struct irq_desc *desc)
>> +{
>> +	if (!desc->irq_data.chip->irq_runtime_suspend)
>> +		return 0;
>> +
>> +	return desc->irq_data.chip->irq_runtime_suspend(&desc->irq_data);
> 
> We really don't need a return value for that one.

Ok.

>> +}
>> +
>>  #define _IRQ_DESC_CHECK		(1 << 0)
>>  #define _IRQ_DESC_PERCPU	(1 << 1)
>>  
>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>> index 0eebaeef317b..66e33df73140 100644
>> --- a/kernel/irq/manage.c
>> +++ b/kernel/irq/manage.c
>> @@ -1116,6 +1116,10 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>>  	if (!try_module_get(desc->owner))
>>  		return -ENODEV;
>>  
>> +	ret = chip_runtime_resume(desc);
>> +	if (ret < 0)
>> +		return ret;
> 
> Leaks module ref count.

Ok.

>> +
>>  	new->irq = irq;
>>  
>>  	/*
>> @@ -1393,6 +1397,7 @@ out_thread:
>>  		put_task_struct(t);
>>  	}
>>  out_mput:
>> +	chip_runtime_suspend(desc);
>>  	module_put(desc->owner);
>>  	return ret;
>>  }
>> @@ -1506,6 +1511,7 @@ static struct irqaction *__free_irq(unsigned int irq, void *dev_id)
>>  		}
>>  	}
>>  
>> +	chip_runtime_suspend(desc);
>>  	module_put(desc->owner);
>>  	kfree(action->secondary);
>>  	return action;
>> @@ -1792,6 +1798,7 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
>>  
>>  	unregister_handler_proc(irq, action);
>>  
>> +	chip_runtime_suspend(desc);
> 
> Where is the corresponding call in request_percpu_irq() ?

I was trying to simplify matters by placing the resume call in
__setup_irq() as opposed to requested_threaded_irq(). However, the would
mean the resume is inside the bus_lock and may be I should not assume
that I can sleep here.

> Can you folks please agree on something which is correct and complete?

Soren I am happy to defer to your patch and drop this. My only comment
would be what about the request_percpu_irq() path in your patch?

Cheers
Jon
