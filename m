From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Thu, 12 Nov 2015 15:38:23 +0000
Message-ID: <5644B26F.5060508@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <alpine.DEB.2.11.1511101017190.3915@nanos> <56421421.8070807@nvidia.com>
 <56421FA5.4020801@ti.com> <56423245.1040602@metafoo.de>
 <564314D9.9040502@nvidia.com> <564361AE.4070303@ti.com>
 <5644710D.7080108@nvidia.com> <5644920C.8080007@metafoo.de>
 <5644959D.2020207@nvidia.com> <5644986B.5030901@metafoo.de>
 <56449BF0.9090408@nvidia.com> <5644A418.2020906@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5644A418.2020906-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 12/11/15 14:37, Lars-Peter Clausen wrote:
> On 11/12/2015 03:02 PM, Jon Hunter wrote:
> [...]
>>>>> One easy way out might be to always call pm_get/pm_but from
>>>>> bus_lock,/bus_unlock. This way the chip is guaranteed to be powered up when
>>>>> accessed happens. In addition pm_get is called when the IRQ is request and
>>>>> pm_put is called when the IRQ is release, this is to ensure the chip stays
>>>>> powered when it is actively monitoring the IRQ lines.
>>>>
>>>> Yes I had thought about that, but it is not quite that easy, because in
>>>> the case of request_irq() you don't want to pm_put() after the
>>>> bus_unlock(). However, the bus_lock/unlock() are good indicators of
>>>> different paths.
>>>
>>> You'd call pm_get() twice in request_irq() once from bus_lock() and once
>>> independently, that way you still have a reference even after the bus_unlock().
>>
>> Yes that is a possibility. However, there are places such as
>> show_interrupts() (kernel/irq/proc.c) and irq_gc_suspend() that do not
>> call bus_lock/unlock() which would need to be handled for PM. May be
>> these should also call bus_lock() as well?
> 
> show_interrupts() only accesses software state, not hardware state, or does it?

Good point. Today there only appears to be one user:

arch/powerpc/sysdev/fsl_msi.c:	.irq_print_chip = fsl_msi_print_chip,

This one is purely software. However, it would be easy to handle the
show_interrupts case if needed.

> suspend/resume is a bit tricky. It's kind of driver specific if it needs to
> actually access the hardware or whether the state is already shadowed in
> software. Maybe we can make this an exception for now and let drivers handle
> this on their own.

Yes I would agree with you on that.

Cheers
Jon
