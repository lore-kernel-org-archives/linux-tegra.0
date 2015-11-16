From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] genirq: Add runtime resume/suspend support for
 IRQ chips
Date: Mon, 16 Nov 2015 09:46:43 +0000
Message-ID: <5649A603.6020308@nvidia.com>
References: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
 <1447166377-19707-2-git-send-email-jonathanh@nvidia.com>
 <7hio56dctz.fsf@deeprootsystems.com> <5645A6F6.6020202@nvidia.com>
 <alpine.DEB.2.11.1511131456440.3987@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1511131456440.3987@nanos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/11/15 20:01, Thomas Gleixner wrote:
> On Fri, 13 Nov 2015, Jon Hunter wrote:
>> On 12/11/15 23:20, Kevin Hilman wrote:
>>> If all the RPM devices in the domain go idle, it will be powered off
>>> independently of the status of the irqchip because the irqchip isn't
>>> using RPM. 
>>
>> That's dependent on how the irqchip uses these helpers. If these helpers
>> invoke RPM then that will not be the case.
> 
> You need a very proper description of how that domain is working. If
> all devices are idle, it's not necessary correct to power down the
> irqchip as is might serve other devices as well.

Agreed. The irqchip should only be powered down if there are no
interrupts in-use/requested. Runtime-pm will keep a reference count for
all requested IRQs.

> OTOH, if it can be powered down then all idle devices need to release
> the irq they requested because request_irq() would hold a ref on the
> power domain.

Yes.

> I have no idea how you can describe that proper.

Do you mean properly describe the interaction between runtime-pm and the
irqchip?

>>> Is there a longer-term plan to handle the irqchips as a "normal" device
>>> and use RPM?  IMO, that approach would be helpful even for irqchips that
>>> share power domains with CPUs, since there are efforts working towards
>>> using genpd/RPM to manage CPUs/clusters.
>>
>> That would ideal. However, the majority of irqchips today
>> create/register them with IRQCHIP_DECLARE() and not as "normal" devices.
>> Therefore, I was reluctant to add "struct device" to the irqchip
>> structure. However, if this is what you would prefer and Thomas is ok
>> with it, then that would be fine with me.
> 
> I have no objections against that, but how is the 'struct device'
> going to be initialized?

It would be initialised by the irqchip driver. However, it would be
optional. The genirq core could simply check to see if the chip->dev
member is initialised and if so enable runtime-pm.

Cheers
Jon
