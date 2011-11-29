From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Tue, 29 Nov 2011 17:16:42 -0600
Message-ID: <4ED567DA.6030601@gmail.com>
References: <1322528052-6516-1-git-send-email-swarren@nvidia.com> <4ED4D78A.6000400@ti.com> <74CDBE0F657A3D45AFBB94109FB122FF174FDAFADC@HQMAIL01.nvidia.com> <4ED51AC4.50303@ti.com> <4ED537FB.1010307@gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF174FDAFBEA@HQMAIL01.nvidia.com> <4ED55BBB.4040805@gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF174FDAFC64@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFC64-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/29/2011 04:58 PM, Stephen Warren wrote:
> Rob Herring wrote at Tuesday, November 29, 2011 3:25 PM:
>> On 11/29/2011 03:08 PM, Stephen Warren wrote:

snip

>> My brain is rotting... I think it was gic_of_init that I was thinking of
>> but still can't find the email.
>>
>> Will your code even link currently with !CONFIG_OF. I would think it
>> cannot resolve gic_of_init in that case.
>>
>> I have a lot of concerns that supporting both CONFIG_OF and !CONFIG_OF
>> is going to be a pain as it's yet another variable to compile against.
>> In order to actually start reducing reducing the size of the ARM
>> platform code (that is the goal, right?), platforms need to be always OF
>> enabled and start removing the !CONFIG_OF code. So why not always turn
>> on CONFIG_OF for Tegra and not worry about this? Eventually, CONFIG_OF
>> will always be enabled anyway.
> 
> I've been looking at hooking up the Tegra GPIO controller's IRQ support
> through device tree. It looks like I need to call irq_domain_add_simple()
> for the GPIO node to make this work, and I think this needs to be triggered
> by of_irq_init()'s match table, and hence I need a single of_irq_init()
> call in Tegra's board-dt.c, which includes both the GIC and GPIO controller
> entries.
>
> Is my understanding here all correct? If so, I will just follow your
> initial suggestion and have tegra_init_irq() do just:

Yes, you should have 1 of_irq_init call. Really the irqdomain code
should go into the gpio code. Do you use generic irqchip for gpio? If
so, I'm working on a patch adding irqdomain to generic irqchip. I still
need to debug a problem with it and have been too busy to get back to it.

Rob

> if (!of_have_populated_dt())
>         gic_init_bases(...);
> 
> ... and move the of_irq_init call into board-dt.c.
> 
> Thanks.
> 
