From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Tue, 29 Nov 2011 15:22:53 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFC84@HQMAIL01.nvidia.com>
References: <1322528052-6516-1-git-send-email-swarren@nvidia.com>
 <4ED4D78A.6000400@ti.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFADC@HQMAIL01.nvidia.com>
 <4ED51AC4.50303@ti.com> <4ED537FB.1010307@gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFBEA@HQMAIL01.nvidia.com>
 <4ED55BBB.4040805@gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFC64@HQMAIL01.nvidia.com>
 <4ED567DA.6030601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ED567DA.6030601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Rob Herring wrote at Tuesday, November 29, 2011 4:17 PM:
> On 11/29/2011 04:58 PM, Stephen Warren wrote:
...
> > I've been looking at hooking up the Tegra GPIO controller's IRQ support
> > through device tree. It looks like I need to call irq_domain_add_simple()
> > for the GPIO node to make this work, and I think this needs to be triggered
> > by of_irq_init()'s match table, and hence I need a single of_irq_init()
> > call in Tegra's board-dt.c, which includes both the GIC and GPIO controller
> > entries.
> >
> > Is my understanding here all correct? If so, I will just follow your
> > initial suggestion and have tegra_init_irq() do just:
> 
> Yes, you should have 1 of_irq_init call. Really the irqdomain code
> should go into the gpio code.

It sounds like you're saying:

* The of_irq_init() call doesn't have to include all the IRQ controllers
  in the system.
* So, it's fine for the Tegra GPIO controller's probe() function to
  simply call irq_domain_add_simple() for itself.

Is that correct? If so, I'll gladly add the call to the GPIO controller
and leave just the GIC to be handled via of_irq_init().

The only issue here is the usual device ordering issue; if the Tegra GPIO
controller doesn't probe before devices that use it, then the IRQ domain
won't exist. But, this is true for the interrupts themselves, so nothing
new there.

> Do you use generic irqchip for gpio?

No, it's custom code. Some of the code could probably use the generic
code, but there is some additional functionality beyond that.

> If
> so, I'm working on a patch adding irqdomain to generic irqchip. I still
> need to debug a problem with it and have been too busy to get back to it.

-- 
nvpublic
