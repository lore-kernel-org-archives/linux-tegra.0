From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V6 2/9] genirq: Look-up trigger type if not specified by
 caller
Date: Mon, 13 Jun 2016 13:24:35 +0100
Message-ID: <575EA603.7090002@nvidia.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-3-git-send-email-jonathanh@nvidia.com>
 <575E8E29.3090808@arm.com> <575E9457.8010100@nvidia.com>
 <575EA03D.5070706@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <575EA03D.5070706@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/16 12:59, Marc Zyngier wrote:
> On 13/06/16 12:09, Jon Hunter wrote:
>>
>> On 13/06/16 11:42, Marc Zyngier wrote:
>>> On 07/06/16 16:12, Jon Hunter wrote:
>>>> For some devices the IRQ trigger type for a device is read from
>>>> firmware, such as device-tree. The IRQ trigger type is typically read
>>>> when the mapping for IRQ is created, which is before the IRQ is
>>>> requested. Hence, the IRQ trigger type is programmed when mapping the
>>>> IRQ and not when requesting the IRQ.
>>>>
>>>> Although this works for most cases, in order to support IRQ chips which
>>>> require runtime power management, which may not be accessible prior
>>>> to requesting the IRQ, it is desirable to look-up the IRQ trigger type
>>>> when it is requested. Therefore, if the IRQ trigger type is not
>>>> specified when __setup_irq() is called, look-up the saved IRQ trigger
>>>> type. This will allow us to defer the programming of the trigger type
>>>> from when the IRQ is mapped to when it is actually requested.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
>>>> ---
>>>>  kernel/irq/manage.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>>>> index ef0bc02c3a70..eaedeb74b49d 100644
>>>> --- a/kernel/irq/manage.c
>>>> +++ b/kernel/irq/manage.c
>>>> @@ -1117,6 +1117,13 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
>>>>  	new->irq = irq;
>>>>  
>>>>  	/*
>>>> +	 * If the trigger type is not specified by the caller,
>>>> +	 * then use the default for this interrupt.
>>>> +	 */
>>>> +	if (!(new->flags & IRQF_TRIGGER_MASK))
>>>> +		new->flags |= irqd_get_trigger_type(&desc->irq_data);
>>>> +
>>>> +	/*
>>>>  	 * Check whether the interrupt nests into another interrupt
>>>>  	 * thread.
>>>>  	 */
>>>>
>>>
>>> I've added the following patch to the queue, in order to deal with
>>> percpu interrupts that were not handled by this patch:
>>>
>>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>>> index f8fd1fb..00cfc85 100644
>>> --- a/kernel/irq/manage.c
>>> +++ b/kernel/irq/manage.c
>>> @@ -1751,7 +1751,14 @@ void enable_percpu_irq(unsigned int irq, unsigned int type)
>>>  	if (!desc)
>>>  		return;
>>>  
>>> +	/*
>>> +	 * If the trigger type is not specified by the caller, then
>>> +	 * use the default for this interrupt.
>>> +	 */
>>>  	type &= IRQ_TYPE_SENSE_MASK;
>>> +	if (type == IRQ_TYPE_NONE)
>>> +		type = irqd_get_trigger_type(&desc->irq_data);
>>> +
>>
>> I am wondering if you need this here because now __setup_irq(), called
>> by request_percpu_irq(), will actually look-up the saved type even for a
>> percpu-irq. So shouldn't this already be handled? Or am I missing something?
> 
> You are overlooking the fact that the configuration registers are
> themselves per-CPU, which means that __setup_irq() will only configure
> the interrupt on the CPU it runs on. And you can't even tell which one,
> since you are in a preemptible context.
> 
> Does it make more sense?

Yes it does thanks. I am guessing we don't need to worry about there
being different type configurations for the different CPUs for a given
interrupt?

Cheers
Jon

-- 
nvpublic
