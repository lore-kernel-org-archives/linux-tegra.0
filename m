From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
 kernel_noload
Date: Wed, 29 Feb 2012 19:14:30 +0100
Message-ID: <20120229181430.GI3318@game.jcrosoft.org>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
 <20120229122942.GF3318@game.jcrosoft.org>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08:58 Wed 29 Feb     , Stephen Warren wrote:
> Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February 29, 2012 5:30 AM:
> > On 17:03 Tue 28 Feb     , Stephen Warren wrote:
> > > uImage files typically encode a single absolute load and entry address.
> > > This is inconvenient when attempting to share that uImage across multiple
> > > SoCs with different physical RAM addresses. Recent versions of mkimage
> > > implement a "kernel_noload" image type which encodes no absolute load
> > > address, and a relative entry address. This works well for uImage-wrapped
> > > ARM zImages, since they are relocatable.
> > >
> > > This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
> > > "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> > >
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > I assume I should put this into the ARM patch tracker if it's OK?
> >
> > Again a new option for uImage no why not just boot the zImage
> > 
> > in this case the uImage is useless
> 
> U-Boot doesn't support zImage at present.
> 
> A patch was posted to support it at least for ARM, but needed a little
> work before it could be committed.
Sorry I see no advantage to have the uImage build by the kernel anymore as
we have a relocatable zImage

I'll even drop its support

Best Regards,
J.
