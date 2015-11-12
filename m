From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Thu, 12 Nov 2015 14:47:23 +0100
Message-ID: <5644986B.5030901@metafoo.de>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com> <1447166377-19707-2-git-send-email-jonathanh@nvidia.com> <alpine.DEB.2.11.1511101017190.3915@nanos> <56421421.8070807@nvidia.com> <56421FA5.4020801@ti.com> <56423245.1040602@metafoo.de> <564314D9.9040502@nvidia.com> <564361AE.4070303@ti.com> <5644710D.7080108@nvidia.com> <5644920C.8080007@metafoo.de> <5644959D.2020207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5644959D.2020207@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 11/12/2015 02:35 PM, Jon Hunter wrote:
> 
> On 12/11/15 13:20, Lars-Peter Clausen wrote:
>> On 11/12/2015 11:59 AM, Jon Hunter wrote:
>>>
>>> On 11/11/15 15:41, Grygorii Strashko wrote:
>>>> On 11/11/2015 12:13 PM, Jon Hunter wrote:
>>>>>
>>>>> On 10/11/15 18:07, Lars-Peter Clausen wrote:
>>>>>> On 11/10/2015 05:47 PM, Grygorii Strashko wrote:
>>>>>> [...]
>>>>>>>> I was trying to simplify matters by placing the resume call in
>>>>>>>> __setup_irq() as opposed to requested_threaded_irq(). However, the would
>>>>>>>> mean the resume is inside the bus_lock and may be I should not assume
>>>>>>>> that I can sleep here.
>>>>>>>>
>>>>>>>>> Can you folks please agree on something which is correct and complete?
>>>>>>>>
>>>>>>>> Soren I am happy to defer to your patch and drop this. My only comment
>>>>>>>> would be what about the request_percpu_irq() path in your patch?
>>>>>>>>
>>>>>>>
>>>>>>> I have the same comment here as I asked Soren:
>>>>>>> 1) There are no restrictions to call irq set_irq_type() whenever,
>>>>>>> as result HW can be accessed before request_x_irq()/__setup_irq().
>>>>>>> And this is used quite widely now :(
>>>>>>>
>>>>>>
>>>>>> Changing the configuration of a resource that is not owned seems to be
>>>>>> fairly broken. In the worst case this will overwrite the configuration that
>>>>>> was set by owner of the resource.
>>>>>>
>>>>>> Especially those that call irq_set_irq_type() directly before request_irq(),
>>>>>> given that you supply the trigger type to request_irq() which will make sure
>>>>>> that there are no conflicts and the configure.
>>>>>>
>>>>>> This is a bit like calling gpio_set_direction() before you call
>>>>>> gpio_request(), which will also have PM issues.
>>>>>
>>>>> Yes, I agree that this does sound a bit odd, but ...
>>>>>
>>>>>>> For example, during OF boot:
>>>>>>>
>>>>>>> [a]  irq_create_of_mapping()
>>>>>>>     - irq_create_fwspec_mapping()
>>>>>>>       - irq_set_irq_type()
>>>>>
>>>>> The above means that if someone calls of_irq_get() (or
>>>>> platform_get_irq()), before request_irq(), then this will call
>>>>> irq_create_of_mapping() and hence, call irq_set_irq_type. So should
>>>>> irq_create_fwspec_mapping() be setting the type in the first place? I
>>>>> can see it is convenient to do it here.
>>>>
>>>> In general there is another option - save OF-flags and pass them to
>>>> __setup_irq() where they can be processed.
>>>
>>> Right, we could look at doing something like this.
>>>
>>>>>>> or
>>>> [b]
>>>>>>> 	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
>>>>>>> 	irq_set_chained_handler(irq, mx31ads_expio_irq_handler);
>>>>
>>>> option: add "flag" parameter to irq_set_chained_handler
>>>>
>>>>>>>
>>>>>>> or
>>>> [c]
>>>>>>> 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
>>>>>>> 	err = devm_request_irq(&pdev->dev, alarm_irq, fan_alarm_irq_handler,
>>>>>>> (there are ~200 occurrences of irq set_irq_type in Kernel)
>>>>>>>
>>>>>>> 2) if i'm not wrong, the same is valid for irq_set_irq_wake() and irq_set_affinity()
>>>>>>>
>>>>>>> I'm not saying all these code is correct, but that what's now in kernel :(
>>>>>>> I've tried to test Soren's patch with omap-gpio and immediately hit case [a] :.(
>>>>>>
>>>>>> All functions for which are part of the public API and for which it is legal
>>>>>> to call them without calling request_irq() (or similar) first will need to
>>>>>> have pm_get()/pm_put().
>>>>>
>>>>> Right. May be we can look at the various entry points to the chip
>>>>> operators to get a feel for which public APIs need to be handled.
>>>>
>>>>
>>>> Seems yes. But we need to be very careful with this, some of functions could be
>>>> called recursively (nested), like:
>>>> [d]
>>>> static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
>>>> {
>>>> 	...
>>>> 	error = irq_set_irq_wake(gpio->irq_parent, on);
>>>>
>>>>
>>>> Personally, I have nothing against irq_pm_(get|put) :) and thought about similar things
>>>> when tried to solve the same problem for omap-gpio driver.
>>>> But :(, I have to fall back to irq_bus_lock/sync_unlock, because of [a,b,c] - all above
>>>> APIs surrounded by chip_bus_lock/chip_bus_sync_unlock. ([d] - I've not hit it just because
>>>> I was lucky).
>>>
>>> I had a quick peek at the omap-gpio driver and I see that internally you
>>> are using the gpio ref-count to manage RPM and use the bus-lock hooks to
>>> invoke RPM.
>>>
>>> This can definitely be complex when considering all the potential paths,
>>> but I think that we need to a look at this from a chip-ops perspective
>>> because only the chip knows if it is accessible or not. That said, what
>>> we need to assess is:
>>>
>>> 1. Which chip-ops should ONLY be called after an IRQ has been allocated
>>>    (eg, enable/disable, mask/unmask, type, etc). These chip-ops should
>>>    not try to control the chip PM, but should possibly WARN if called
>>>    when  the chip is not accessible.
>>> 2. For chip-ops that may be called without allocating an IRQ (eg.
>>>    bus_lock, irq_suspend, etc), can these be called from an atomic
>>>    context? If they might be called from an atomic context then these
>>>    are the chip-ops which will cause problems as we cannot guarantee
>>>    that all IRQ chips can support irq-safe RPM.
>>
>> They can't. chip_bus_lock() can sleep, so anything that locks the bus can't
>> be called from atomic context.
> 
> Sorry, what can't? Yes I understand that we cannot call anything that
> locks the bus from an atomic context.

They can't be called from atomic context. The chip_bus_lock() function may
sleep and you can't access the device without previously locking the bus.
Since the device only needs to be powered up when it is accessed its safe to
assume that the places where you need pm_get()/pm_put() are only called from
non-atomic context.

> 
>> One easy way out might be to always call pm_get/pm_but from
>> bus_lock,/bus_unlock. This way the chip is guaranteed to be powered up when
>> accessed happens. In addition pm_get is called when the IRQ is request and
>> pm_put is called when the IRQ is release, this is to ensure the chip stays
>> powered when it is actively monitoring the IRQ lines.
> 
> Yes I had thought about that, but it is not quite that easy, because in
> the case of request_irq() you don't want to pm_put() after the
> bus_unlock(). However, the bus_lock/unlock() are good indicators of
> different paths.

You'd call pm_get() twice in request_irq() once from bus_lock() and once
independently, that way you still have a reference even after the bus_unlock().
