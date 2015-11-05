From: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Thu, 05 Nov 2015 03:15:18 +0100
Message-ID: <1564097.buIA8Wdn8f@vostro.rjw.lan>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com> <20151104083438.GJ12910@localhost> <7hvb9hr98g.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hvb9hr98g.fsf-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday, November 04, 2015 08:59:43 AM Kevin Hilman wrote:
> Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> 
> > On Tue, Nov 03, 2015 at 01:25:09PM -0800, Kevin Hilman wrote:
> >> >>>>>  	/* Enable clock before accessing register */
> >> >>>>> -	ret = tegra_dma_runtime_resume(dev);
> >> >>>>> +	ret = pm_runtime_get_sync(dev);
> >> >>>>
> >> >>>> If you are runtime suspended then core will runtime resume you before
> >> >>>> invoking suspend, so why do we need this
> >> >>>
> >> >>> Is this change now in the mainline? Do you have commit ID for that?
> >> >>>
> >> >>> I recall the last time we discussed this that Rafael said that they were
> >> >>> going to do that, but he said as a rule of thumb if you need to resume
> >> >>> it, resume it [0].
> >> >> 
> >> >> IIRC this has been always the behaviour, at least I see this when I test the
> >> >> devices
> >> >
> >> > I have been doing some testing today and if the DMA is runtime
> >> > suspended, then I don't see it runtime resumed before suspend is called.
> >> >
> >> > Can you elborate on "at least I see this when I test the devices"? What
> >> > are you looking at? Are you using kernel function tracers in some way?
> >> 
> >> The PM core does a _get_noresume()[1] which tries to prevent runtime
> >> suspends *during* a system suspend.  However, the PM core should not be
> >> doing an actual runtime resume of the device, so if the device is
> >> already runtime suspended, it will not be runtime resumed by the core,
> >> so if the driver needs it to be runtime resumed, it needs to do it
> >> itself.
> >
> > + Rafael
> >
> > This is contrariry to what I see, If my driver is runtime suspended and on
> > suspend, it gets runtime resumed and then suspended
> 
> Since I was late to the thread, can you explain what kind of driver and
> on what bus type you're seeing this behavior?
> 
> It could be that your bus-type is doing something, but I don't think it
> should be the PM core.

Right.

Bus types do that, the core doesn't.  The ACPI PM domain does that too
for some devices.

So Vinod, more details, please.

Thanks,
Rafael
