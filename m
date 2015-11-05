From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Thu, 5 Nov 2015 17:47:30 +0530
Message-ID: <20151105121730.GY12910@localhost>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <20151104083438.GJ12910@localhost>
 <7hvb9hr98g.fsf@deeprootsystems.com>
 <1564097.buIA8Wdn8f@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1564097.buIA8Wdn8f-sKB8Sp2ER+y1GS7QM15AGw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 05, 2015 at 03:15:18AM +0100, Rafael J. Wysocki wrote:

> > > + Rafael
> > >
> > > This is contrariry to what I see, If my driver is runtime suspended and on
> > > suspend, it gets runtime resumed and then suspended
> > 
> > Since I was late to the thread, can you explain what kind of driver and
> > on what bus type you're seeing this behavior?
> > 
> > It could be that your bus-type is doing something, but I don't think it
> > should be the PM core.
> 
> Right.
> 
> Bus types do that, the core doesn't.  The ACPI PM domain does that too
> for some devices.
> 
> So Vinod, more details, please.

Okay relooking at core I do think that runtime resume should not be invoked
while suspending, as core seems to call pm_runtime_get_noresume() but I am
still missing something here..

I do see this behaviour (runtime resume on suspend) on Intel audio drivers
which are PCI devices, is PCI or ACPI doing some magic here.

I have seen this as consistent behavior and actually an irritant, as we used
to download firmware in resume patch, but then we end up thrashing the
controller while going to suspend!

-- 
~Vinod
