From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Tue, 1 Jul 2014 10:51:44 +0300
Message-ID: <20140701075144.GX3679@tbergstrom-lnx.Nvidia.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com> <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel> <20140630192121.GA32594@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630192121.GA32594@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 30, 2014 at 09:21:22PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Jun 30, 2014 at 09:20:30AM +0200, Arnd Bergmann wrote:
> > On Saturday 28 June 2014 22:40:26 Thierry Reding wrote:
> > > > > pmc.c implements various routines to access the power management
> > > > > controller, some of which is needed by suspend/resume, some of it is
> > > > > needed by SMP. powergate.c implements a subset of the PMC that needs to
> > > > > be exported to drivers to enable power partitions on the SoC. I'm not
> > > > > aware of subsystems that deal with this kind of driver.
> > > > >
> > > > Please see above.
> > > 
> > > Like I said, I don't see what business suspend/resume related code has
> > > in drivers/power. What we're talking about here really is functionality
> > > very specific to Tegra. Also some of that code needs to be run at very
> > > early points in the boot process, so we can't reasonably turn it into a
> > > proper driver anyway.
> > 
> > I believe the powergate.c stuff can be changed into pm_domain code, but
> > we don't have a good subsystem with generic DT bindings yet, so that
> > may need some more groundwork first. drivers/power or a subdirectory
> > of that may end up being the right place though.
> 
> So I ended up implementing the powergates as generic_pm_domain, but that
> breaks existing drivers currently. The reason is that generic_pm_domains
> are automatically turned off on suspend and turned back on on resume. On
> Tegra if a partition is powered off then the whole module looses state
> and would need to be completely reinitialized. None of the drivers
> currently support that and I'm also not sure if it's really what we want
> since it means for example redetecting links and reenumerating devices
> on PCI, or probing display outputs in DRM. That's going to take a lot of
> time and may not be appropriate for suspend-to-RAM.
> 
> Unfortunately I haven't found a way to force a domain to remain powered
> during suspend/resume.

If we make power off a NOP until LP0 gets implemented? Then device state
will have to be saved/restored.

Cheers,

Peter.
