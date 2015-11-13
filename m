From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Fri, 13 Nov 2015 09:01:42 +0000
Message-ID: <5645A6F6.6020202@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <7hio56dctz.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hio56dctz.fsf-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/11/15 23:20, Kevin Hilman wrote:
> Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:
> 
>> Some IRQ chips may be located in a power domain outside of the CPU subsystem
>> and hence will require device specific runtime power management. Ideally,
>> rather than adding more functions to the irq_chip_ops function table, using
>> existing chip functions such as irq_startup/shutdown or
>> irq_request/release_resources() would be best. However, these existing chip
>> functions are called in the context of a spinlock which is not ideal for
>> power management operations that may take some time to power up a domain.
>>
>> Two possible solutions are:
>> 1. Move existing chip operators such as irq_request/release_resources()
>>    outside of the spinlock and use these helpers.
>> 2. Add new chip operators that are called outside of any spinlocks while
>>    setting up and freeing an IRQ.
> 
>> Not knowing whether we can safely move irq_request/release_resources() to
>> outside the spinlock (but hopefully this will solicit some feedback), add
>> new chip operators for runtime resuming and suspending of an IRQ chip.
> 
> I'm not quite seeing how this would connect to the actual hardware
> power domain (presumabaly managed by genpd) and any other devices in
> that domain (presumably managed by runtime PM.)

So this patch is just providing some hooks that an irqchip can use to
perform any PM related operations. If you look at the 2nd patch in the
series you will see for the GIC that these helpers are used to call
pm_runtime_get/put() which would handle the power-domain.

> If all the RPM devices in the domain go idle, it will be powered off
> independently of the status of the irqchip because the irqchip isn't
> using RPM. 

That's dependent on how the irqchip uses these helpers. If these helpers
invoke RPM then that will not be the case.

> Is there a longer-term plan to handle the irqchips as a "normal" device
> and use RPM?  IMO, that approach would be helpful even for irqchips that
> share power domains with CPUs, since there are efforts working towards
> using genpd/RPM to manage CPUs/clusters.

That would ideal. However, the majority of irqchips today
create/register them with IRQCHIP_DECLARE() and not as "normal" devices.
Therefore, I was reluctant to add "struct device" to the irqchip
structure. However, if this is what you would prefer and Thomas is ok
with it, then that would be fine with me.

Cheers
Jon
