From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Thu, 12 Nov 2015 10:59:25 +0000
Message-ID: <5644710D.7080108@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos> <56421421.8070807@nvidia.com>
 <56421FA5.4020801@ti.com> <56423245.1040602@metafoo.de>
 <564314D9.9040502@nvidia.com> <564361AE.4070303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564361AE.4070303-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 11/11/15 15:41, Grygorii Strashko wrote:
> On 11/11/2015 12:13 PM, Jon Hunter wrote:
>>
>> On 10/11/15 18:07, Lars-Peter Clausen wrote:
>>> On 11/10/2015 05:47 PM, Grygorii Strashko wrote:
>>> [...]
>>>>> I was trying to simplify matters by placing the resume call in
>>>>> __setup_irq() as opposed to requested_threaded_irq(). However, the would
>>>>> mean the resume is inside the bus_lock and may be I should not assume
>>>>> that I can sleep here.
>>>>>
>>>>>> Can you folks please agree on something which is correct and complete?
>>>>>
>>>>> Soren I am happy to defer to your patch and drop this. My only comment
>>>>> would be what about the request_percpu_irq() path in your patch?
>>>>>
>>>>
>>>> I have the same comment here as I asked Soren:
>>>> 1) There are no restrictions to call irq set_irq_type() whenever,
>>>> as result HW can be accessed before request_x_irq()/__setup_irq().
>>>> And this is used quite widely now :(
>>>>
>>>
>>> Changing the configuration of a resource that is not owned seems to be
>>> fairly broken. In the worst case this will overwrite the configuration that
>>> was set by owner of the resource.
>>>
>>> Especially those that call irq_set_irq_type() directly before request_irq(),
>>> given that you supply the trigger type to request_irq() which will make sure
>>> that there are no conflicts and the configure.
>>>
>>> This is a bit like calling gpio_set_direction() before you call
>>> gpio_request(), which will also have PM issues.
>>
>> Yes, I agree that this does sound a bit odd, but ...
>>
>>>> For example, during OF boot:
>>>>
>>>> [a]  irq_create_of_mapping()
>>>>     - irq_create_fwspec_mapping()
>>>>       - irq_set_irq_type()
>>
>> The above means that if someone calls of_irq_get() (or
>> platform_get_irq()), before request_irq(), then this will call
>> irq_create_of_mapping() and hence, call irq_set_irq_type. So should
>> irq_create_fwspec_mapping() be setting the type in the first place? I
>> can see it is convenient to do it here.
> 
> In general there is another option - save OF-flags and pass them to
> __setup_irq() where they can be processed.

Right, we could look at doing something like this.

>>>> or
> [b]
>>>> 	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
>>>> 	irq_set_chained_handler(irq, mx31ads_expio_irq_handler);
> 
> option: add "flag" parameter to irq_set_chained_handler
> 
>>>>
>>>> or
> [c]
>>>> 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
>>>> 	err = devm_request_irq(&pdev->dev, alarm_irq, fan_alarm_irq_handler,
>>>> (there are ~200 occurrences of irq set_irq_type in Kernel)
>>>>
>>>> 2) if i'm not wrong, the same is valid for irq_set_irq_wake() and irq_set_affinity()
>>>>
>>>> I'm not saying all these code is correct, but that what's now in kernel :(
>>>> I've tried to test Soren's patch with omap-gpio and immediately hit case [a] :.(
>>>
>>> All functions for which are part of the public API and for which it is legal
>>> to call them without calling request_irq() (or similar) first will need to
>>> have pm_get()/pm_put().
>>
>> Right. May be we can look at the various entry points to the chip
>> operators to get a feel for which public APIs need to be handled.
> 
> 
> Seems yes. But we need to be very careful with this, some of functions could be
> called recursively (nested), like:
> [d]
> static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
> {
> 	...
> 	error = irq_set_irq_wake(gpio->irq_parent, on);
> 
> 
> Personally, I have nothing against irq_pm_(get|put) :) and thought about similar things
> when tried to solve the same problem for omap-gpio driver.
> But :(, I have to fall back to irq_bus_lock/sync_unlock, because of [a,b,c] - all above
> APIs surrounded by chip_bus_lock/chip_bus_sync_unlock. ([d] - I've not hit it just because
> I was lucky).

I had a quick peek at the omap-gpio driver and I see that internally you
are using the gpio ref-count to manage RPM and use the bus-lock hooks to
invoke RPM.

This can definitely be complex when considering all the potential paths,
but I think that we need to a look at this from a chip-ops perspective
because only the chip knows if it is accessible or not. That said, what
we need to assess is:

1. Which chip-ops should ONLY be called after an IRQ has been allocated
   (eg, enable/disable, mask/unmask, type, etc). These chip-ops should
   not try to control the chip PM, but should possibly WARN if called
   when  the chip is not accessible.
2. For chip-ops that may be called without allocating an IRQ (eg.
   bus_lock, irq_suspend, etc), can these be called from an atomic
   context? If they might be called from an atomic context then these
   are the chip-ops which will cause problems as we cannot guarantee
   that all IRQ chips can support irq-safe RPM.

AFAICT, looking at the chip-ops, it appears to me that ones that should
be called without allocating a IRQ are:

@irq_cpu_online
@irq_cpu_offline
@irq_bus_lock
@irq_bus_sync_unlock
@irq_suspend
@irq_resume
@irq_pm_shutdown
@irq_calc_mask (not used by any chips?)
@irq_print_chip
@irq_get_irqchip_state? (not sure about this one)

Of the above the only one I can see that would be called in an atomic
context would be irq_get_irqchip_state() and I am not sure if that
should be called without allocating the IRQ first?

Bottom line is that think that the chip can protect itself from an
unexpected access. Yes setting the type needs to be sorted out, but
hopefully this is do-able.

Cheers
Jon
