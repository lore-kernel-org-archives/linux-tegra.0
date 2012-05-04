From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add Tegra Memory Controller(MC) driver
Date: Fri, 4 May 2012 08:34:24 +0300
Message-ID: <20120504083424.0f394a6db8e95763e59ae2a0@nvidia.com>
References: <1336063897-12083-1-git-send-email-hdoyu@nvidia.com>
	<4FA2D0C4.4020608@wwwdotorg.org>
	<CAOesGMivxdDhkEoZh=LuvtKRPfgXi=8X4chEL-cJazjgeo_ONA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMivxdDhkEoZh=LuvtKRPfgXi=8X4chEL-cJazjgeo_ONA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 3 May 2012 22:13:23 +0200
Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:

> Hi,
> 
> On Thu, May 3, 2012 at 11:39 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> > On 05/03/2012 10:51 AM, Hiroshi DOYU wrote:
> >> Tegra Memory Controller(MC) driver for Tegra20/30.
> >> Added to support MC General interrupts, mainly for IOMMU.
> >
> >> The location of a file may not be suitable because of xxx_driver under arch/arm/mach-*.
> >> ---
> >> diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
> >
> > Russell, Olof, Arnd,
> >
> > Where should this driver be placed? It's a completely Tegra-specific
> > module, and I don't believe there's any drivers/ directory or other
> > subsystem that's appropriate to house it right now. Should we go ahead
> > and create a drivers/arm/ for this? Perhaps drivers/misc/?
> 
> TI just added their memory driver in drivers/memory, and it was merged
> through Greg K-H's driver tree. That would be a good location for this
> one as well.
> 
> > Honestly, to me it seems best to keep purely platform-specific drivers
> > like this in arch/arm/mach-tegra, since that's the most closely
> > Tegra-related directory.
> 
> Since tegra has a custom memory controller it's not as obvious that it
> needs to go in a shared location, indeed. But it's easier to use the
> same practices across platforms, and if there are other vendors that
> end up sharing IP blocks for memory down the road, having them in a
> common location makes sense.

I think that the above TI's patch is:

  Add TI EMIF SDRAM controller driver
    http://lwn.net/Articles/494922/

I'm moving this Tegra MC driver under drivers/memory, "tegra{20,30}-mc.c".
