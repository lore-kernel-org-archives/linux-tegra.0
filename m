From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Thu, 19 Mar 2015 16:17:08 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1503191601520.9480@utopia.booyaka.com>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline> <20150317103806.GU8656@n2100.arm.linux.org.uk> <alpine.DEB.2.02.1503191525450.9480@utopia.booyaka.com> <550AEE6B.5080301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550AEE6B.5080301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 19 Mar 2015, Stephen Warren wrote:

> On 03/19/2015 09:26 AM, Paul Walmsley wrote:
> > On Tue, 17 Mar 2015, Russell King - ARM Linux wrote:
> > 
> > > On Tue, Mar 17, 2015 at 01:32:21AM -0700, Paul Walmsley wrote:
> > > >   Required properties:
> > > >   - compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
> > > > -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
> > > > -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
> > > > -  tegra132, or tegra210.
> > > > -- reg : Should contain 1 register ranges(address and length)
> > > > +  Tegra30, must contain "nvidia,tegra30-ahb".  For Tegra114 and
> > > > Tegra124, must
> > > > +  contain '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is
> > > > tegra114
> > > > +  or tegra124.  For Tegra132, the compatible string must contain
> > > > +  "nvidia,tegra132-ahb".
> > > > +
> > > > +- reg : Should contain 1 register ranges(address and length).  On
> > > > Tegra20,
> > > > +  Tegra30, Tegra114, and Tegra124 chips, the low byte of the physical
> > > > base
> > > > +  address of the IP block must end in 0x04.  On DT files for later
> > > > chips, the
> > > > +  actual hardware base address of the IP block should be used.
> > > 
> > > You could check that in the driver.  If you can check it in the driver,
> > > you can also decide to ignore it if it were offset by 0x04 (possibly
> > > printing a warning.)  That opens up the ability to fix the older Tegra
> > > DT files going forward while still remaining compatible with existing
> > > DT files, and avoiding the need for a complex note about this.
> > 
> > That's fine, I'll do that and drop this patch.
> 
> Don't we still want to update the DT binding documentation to state what the
> preferred base address (or at least set of legal base addresses) is/are?

As far as I know, the DT binding documents are intended to be a 
reference for IP block integration data like base addresses.  At least, 
that is not how they've been used in the past, in the cases that I'm 
familiar with.  

I can see some marginal utility in changing the base address in the 
example.  But since the worst possible outcome of using the old address is 
a warning message at boot, that margin seems quite small indeed.  Anyone 
who would blindly use the base address from the example to create a DT 
file for a new Tegra SoC isn't doing it correctly.


- Paul
