From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: error: implicit declaration of function 'machine_is_ventana'
Date: Tue, 23 Aug 2011 01:01:35 +0100
Message-ID: <20110823000135.GD3895@n2100.arm.linux.org.uk>
References: <74CDBE0F657A3D45AFBB94109FB122FF04B24A376A@HQMAIL01.nvidia.com> <20110822234008.GC3895@n2100.arm.linux.org.uk> <74CDBE0F657A3D45AFBB94109FB122FF04B24A377F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B24A377F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 22, 2011 at 04:49:06PM -0700, Stephen Warren wrote:
> Russell King wrote at Monday, August 22, 2011 5:40 PM:
> > On Mon, Aug 22, 2011 at 04:11:50PM -0700, Stephen Warren wrote:
> > > Russell,
> > >
> > > Commit 46dcfc806a9f6834e6007449eac175f781058c49 "ARM: Update mach-types"
> > > removed the entry for Ventana (2927). In turn, this broke compilation of
> > > sound/soc/tegra/tegra_wm8903.c, since that calls machine_is_ventana().
> > > It looks like the machine is still registered at
> > > http://www.arm.linux.org.uk/developer/machines/. Can you explain what the
> > > removal policy is for arch/arm/tools/mach-types?
> > 
> > The policy has always been that the machine_is_xxx() matches the other
> > constants.  Rather than having to edit those out by hand, the script
> > now does this for me automatically.
> 
> I'm very sorry for being so dense, but what "other constants" must the
> entry match?
> 
> For reference, here's the entry I'm referring to:
> 
> -ventana                        MACH_VENTANA            VENTANA                 2927
> 
> ... which seems to use the name "ventana" consistently, if that's what
> you mean.
> 
> ...
> > Please submit a patch to fix your use in the kernel, including updating
> > the mach-types file to conform.  I'll then fix the machine registry by
> > hand.
> 
> I will happily submit the patch, once I understand exactly what needs to
> change. Thanks for any enlightenment!

Ah, sorry, I thought you were talking about a platform which was merged
into mainline.  This platform is not present in mainline, so accordingly
it isn't marked as such in the machine database.

Any entry not marked as being present in mainline will be removed after
12 months after it was last touched - which apparantly was 18th June
2010.

So, the questions are:
1. why do we have driver code merged for a platform which shows no sign
   of being merged.
2. why do we have drivers depending on their platform anyway.
