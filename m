From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/11] irqdomain: Warn if we fail to set the IRQ type
Date: Tue, 10 May 2016 19:06:38 +0100
Message-ID: <5732232E.4020105@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
 <1462893285-13515-3-git-send-email-jonathanh@nvidia.com>
 <57321998.2060008@arm.com> <573221CC.2080102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573221CC.2080102-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 10/05/16 19:00, Jon Hunter wrote:
> 
> On 10/05/16 18:25, Marc Zyngier wrote:
>> On 10/05/16 16:14, Jon Hunter wrote:
>>> When setting the IRQ type we don't check the return value to see if it
>>> is set correctly. Due to this, failures to set the IRQ type have gone
>>> unnoticed and because these failures were not catastrophic have not had
>>> an impact on the system.
>>>
>>> Ideally, we should return an error if we fail to set the type, however,
>>> this could cause non-catastrophic failures to prevent devices from
>>> working. Therefore, for now add a warning so that any bad interrupt
>>> configurations can be corrected.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  kernel/irq/irqdomain.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>>> index 8798b6c9e945..09060072cc28 100644
>>> --- a/kernel/irq/irqdomain.c
>>> +++ b/kernel/irq/irqdomain.c
>>> @@ -610,7 +610,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>>>  	/* Set type if specified and different than the current one */
>>>  	if (type != IRQ_TYPE_NONE &&
>>>  	    type != irq_get_trigger_type(virq))
>>> -		irq_set_irq_type(virq, type);
>>> +		if (irq_set_irq_type(virq, type))
>>> +			pr_warn("failed to set type for irq %d\n", virq);
>>
>> This warning triggers on all per-cpu interrupts, because
>> irq_set_irq_type() uses IRQ_GET_DESC_CHECK_GLOBAL and not
>> IRQ_GET_DESC_CHECK_PERCPU. Which sort of makes sense because the trigger
>> is per-cpu and not global. We'd need some similar check in
>> enable_percpu_irq, but at that stage, we've already lost the context
>> coming from the firmware.
>>
>> Which only proves one thing: per-cpu interrupts have never been
>> configured on the allocation path, and we've been living pretty
>> dangerously so far. They do work (at least on ARM) because of the
>> following reasons:
>>
>> 1) the triggers are already configured (firmware, read-only...)
>> 2) the handle_percpu_devid_irq handler doesn't distinguish between flows
>>
>> It is probably broken on all other architectures, which kind of sucks.
>> At this point, I'm really tempted to drop this patch and to aim towards
>> something similar to what you had in patches 5 and 6 in your previous
>> series. I'll have a think tonight.
> 
> OK. I will hold off on posting the other patches for the minute.

By the way, it is fine if you want to drop this one for now and just
include the other 10 in your pull request.

Cheers
Jon
