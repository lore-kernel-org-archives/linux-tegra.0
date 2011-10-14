From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] ARM: mutually exclude ZBOOT_ROM and AUTO_ZRELADDR
Date: Fri, 14 Oct 2011 14:07:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1110141405520.17040@xanadu.home>
References: <20111014071500.GP21648@n2100.arm.linux.org.uk>
 <1318607945-6807-1-git-send-email-olof@lixom.net>
 <201110141829.48634.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <201110141829.48634.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 14 Oct 2011, Arnd Bergmann wrote:

> On Friday 14 October 2011, Olof Johansson wrote:
> > This way platforms that want it can select AUTO_ZRELADDR without issues caused by
> > someone manually also enabling ZBOOT_ROM.
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 82973b2..2ad58e8 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1814,6 +1814,7 @@ config ZBOOT_ROM_BSS
> >  config ZBOOT_ROM
> >  	bool "Compressed boot loader in ROM/flash"
> >  	depends on ZBOOT_ROM_TEXT != ZBOOT_ROM_BSS
> > +	depends on !AUTO_ZRELADDR
> >  	help
> >  	  Say Y here if you intend to execute your compressed kernel image
> >  	  (zImage) directly from ROM or flash.  If unsure, say N.
> 
> Unfortunately, you cannot have it both ways:
> 
> arnd@ocdc-kvm:~/linux-arm$ make O=obj-tmp CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm  -sj20  menuconfig
> arch/arm/Kconfig:1761:error: recursive dependency detected!
> arch/arm/Kconfig:1761:  symbol ZBOOT_ROM depends on AUTO_ZRELADDR

Ah, right.

OK, like I said I'm reworking the whole thing, so the cheapest fix for 
the time being  is "select AUTO_ZRELADDR if !ZBOOT_ROM".


Nicolas
