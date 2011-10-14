From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 16:06:21 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1110141549160.17040@xanadu.home>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
 <201110141729.41515.arnd@arndb.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A283@HQMAIL01.nvidia.com>
 <201110141827.53906.arnd@arndb.de>
 <CAOesGMgDwMeVmwo1WJ3tU+ZdjCSJ6F8mY42e_KwTmzAkGQsqmg@mail.gmail.com>
 <20111014192011.GS21648@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20111014192011.GS21648-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 14 Oct 2011, Russell King - ARM Linux wrote:

> But... one thing to note is that it _is_ common to load the decompressor
> at a _different_ address to that where the kernel ultimately ends up
> residing to avoid the additional copy in the decompressor.  My experience
> shows that this is quite common on the platforms I had supplied.  This
> means that if we default to AUTO_ZRELADDR for !ZBOOT_ROM, we end up
> having to have developers change their uboot setups to avoid unexpected
> results.

Currently, U-Boot insists on having a uImage with a fixed absolute load 
address.  This is currently provided by the zreladdr value, whether or 
not AUTO_ZRELADDR is set.  I consider this as a persisting uImage 
limitation.

Either u-Boot gets fixed so it can work with plain zImage (and this 
certainly will happen once the pressure from people wanting a single 
kernel to work on targets with different load addresses increase.  
Tegra is one such example.

Or we create a u-Boot specific Kconfig menu for uImage options that 
would be common to all architectures and kick it out from the ARM 
specific makefile.  This is not solving the u-Boot limitation though.

In either cases this is a u-Boot problem that needs fixing on the u-Boot 
side in the end.


Nicolas
