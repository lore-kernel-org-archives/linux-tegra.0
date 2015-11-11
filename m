From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Wed, 11 Nov 2015 10:13:45 +0000
Message-ID: <564314D9.9040502@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos> <56421421.8070807@nvidia.com>
 <56421FA5.4020801@ti.com> <56423245.1040602@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56423245.1040602-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 10/11/15 18:07, Lars-Peter Clausen wrote:
> On 11/10/2015 05:47 PM, Grygorii Strashko wrote:
> [...]
>>> I was trying to simplify matters by placing the resume call in
>>> __setup_irq() as opposed to requested_threaded_irq(). However, the would
>>> mean the resume is inside the bus_lock and may be I should not assume
>>> that I can sleep here.
>>>
>>>> Can you folks please agree on something which is correct and complete?
>>>
>>> Soren I am happy to defer to your patch and drop this. My only comment
>>> would be what about the request_percpu_irq() path in your patch?
>>>
>>
>> I have the same comment here as I asked Soren:
>> 1) There are no restrictions to call irq set_irq_type() whenever,
>> as result HW can be accessed before request_x_irq()/__setup_irq().
>> And this is used quite widely now :(
>>
> 
> Changing the configuration of a resource that is not owned seems to be
> fairly broken. In the worst case this will overwrite the configuration that
> was set by owner of the resource.
> 
> Especially those that call irq_set_irq_type() directly before request_irq(),
> given that you supply the trigger type to request_irq() which will make sure
> that there are no conflicts and the configure.
> 
> This is a bit like calling gpio_set_direction() before you call
> gpio_request(), which will also have PM issues.

Yes, I agree that this does sound a bit odd, but ...

>> For example, during OF boot:
>>
>> [a]  irq_create_of_mapping()
>>    - irq_create_fwspec_mapping()
>>      - irq_set_irq_type()

The above means that if someone calls of_irq_get() (or
platform_get_irq()), before request_irq(), then this will call
irq_create_of_mapping() and hence, call irq_set_irq_type. So should
irq_create_fwspec_mapping() be setting the type in the first place? I
can see it is convenient to do it here.

>> or 
>> 	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
>> 	irq_set_chained_handler(irq, mx31ads_expio_irq_handler);
>>
>> or
>> 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
>> 	err = devm_request_irq(&pdev->dev, alarm_irq, fan_alarm_irq_handler,
>> (there are ~200 occurrences of irq set_irq_type in Kernel)
>>
>> 2) if i'm not wrong, the same is valid for irq_set_irq_wake() and irq_set_affinity()
>>
>> I'm not saying all these code is correct, but that what's now in kernel :(
>> I've tried to test Soren's patch with omap-gpio and immediately hit case [a] :.( 
> 
> All functions for which are part of the public API and for which it is legal
> to call them without calling request_irq() (or similar) first will need to
> have pm_get()/pm_put().

Right. May be we can look at the various entry points to the chip
operators to get a feel for which public APIs need to be handled.

Cheers
Jon
