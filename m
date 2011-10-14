From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 16:26:46 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1110141617380.17040@xanadu.home>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
 <201110141729.41515.arnd@arndb.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A283@HQMAIL01.nvidia.com>
 <201110141827.53906.arnd@arndb.de>
 <CAOesGMgDwMeVmwo1WJ3tU+ZdjCSJ6F8mY42e_KwTmzAkGQsqmg@mail.gmail.com>
 <20111014192011.GS21648@n2100.arm.linux.org.uk>
 <alpine.LFD.2.02.1110141549160.17040@xanadu.home>
 <20111014201223.GV21648@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20111014201223.GV21648-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 14 Oct 2011, Russell King - ARM Linux wrote:

> On Fri, Oct 14, 2011 at 04:06:21PM -0400, Nicolas Pitre wrote:
> > Currently, U-Boot insists on having a uImage with a fixed absolute load 
> > address.  This is currently provided by the zreladdr value, whether or 
> > not AUTO_ZRELADDR is set.  I consider this as a persisting uImage 
> > limitation.
> > 
> > Either u-Boot gets fixed so it can work with plain zImage (and this 
> > certainly will happen once the pressure from people wanting a single 
> > kernel to work on targets with different load addresses increase.  
> > Tegra is one such example.
> > 
> > Or we create a u-Boot specific Kconfig menu for uImage options that 
> > would be common to all architectures and kick it out from the ARM 
> > specific makefile.  This is not solving the u-Boot limitation though.
> > 
> > In either cases this is a u-Boot problem that needs fixing on the u-Boot 
> > side in the end.
> 
> I don't think that's so with the various flavours of platform specific
> uboot which float around.  For instance, on the OMAP4430 SDP, the
> following commands were used as supplied to load a uImage off the SD
> card into RAM at a different address to which it was built for, and
> execute it at that address:
> 
> mmcinit 0
> fatload mmc 0 0x80300000 uImage
> bootm 80300000
> 
> Whether the 'bootm' command then copied the image and called it there,
> or whether it executed it at 0x80300000 I've no idea - but why then
> load the image at a different address in the first place?

Maybe because the lower memory is already in use by other u-Boot related 
things, or more likely for no specific reasons at all.  But u-Boot 
_will_ relocate the image if it is not lot loaded at the address being 
recorded in its header as specified by the -a argument of mkimage.  And 
currently we use zreladdr for that when "make uImage" is used, meaning 
that by default no one is currently benefiting from the kernel 
decompressor relocation avoidance optimization on u-Boot.

Of course the u-Boot people are also claiming that u-Boot should take 
care of the kernel decompression not zImage, which I personally disagree 
with.


Nicolas
