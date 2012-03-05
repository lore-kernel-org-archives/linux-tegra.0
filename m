From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Mon, 05 Mar 2012 15:29:30 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1203051525490.31242@xanadu.home>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861683@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <74CDBE0F657A3D45AFBB94109FB122FF17BE861683-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 1 Mar 2012, Stephen Warren wrote:

> Stephen Warren wrote at Tuesday, February 28, 2012 5:03 PM:
> > uImage files typically encode a single absolute load and entry address.
> > This is inconvenient when attempting to share that uImage across multiple
> > SoCs with different physical RAM addresses. Recent versions of mkimage
> > implement a "kernel_noload" image type which encodes no absolute load
> > address, and a relative entry address. This works well for uImage-wrapped
> > ARM zImages, since they are relocatable.
> > 
> > This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
> > "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> 
> So Russell, are you NAKing this patch then?
> 
> If so, I guess I'll just go and add more cruft to my copy-a-kernel-to-
> an-sd-card script. Which is a pity since every other person will have
> to do the same, but oh well.

What about moving all the u-Boot bells and whistles to a generic 
top-level Kconfig+Makefile to be shared with all architectures?  Really, 
there is nothing very ARM specific here.


Nicolas
