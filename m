From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 6/8] ARM: tegra: USB_ULPI needs USB
Date: Thu, 1 Mar 2012 12:36:58 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861741@HQMAIL01.nvidia.com>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
 <1330630010-11241-7-git-send-email-alan@signal11.us>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE86172C@HQMAIL01.nvidia.com>
 <201203012025.53560.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201203012025.53560.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd Bergmann wrote at Thursday, March 01, 2012 1:26 PM:
> On Thursday 01 March 2012, Stephen Warren wrote:
> > Alan Ott wrote at Thursday, March 01, 2012 12:27 PM:
> > > From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > >
> > > The USB_ULPI driver is selected by tegra, but can only be
> > > built if at least one of USB or USB_GADGET is enabled.
> > > The kernel fails to link if both are off.
> >
> > > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> > ...
> > > @@ -10,6 +10,7 @@ config ARCH_TEGRA_2x_SOC
> > ...
> > > +	select USB_GADGET if USB_SUPPORT && !USB
> >
> > I don't believe the Tegra USB driver supports gadget mode at present.
> 
> ok.
> 
> > Would the above be better written as:
> >
> >     select USB if USB_SUPPORT
> 
> That does not look correct either. There is no reason why USB
> can't be disabled with USB_SUPPORT enabled on other platforms.
> 
> Maybe it's better to change the 'select USB_ULPI if USB_SUPPORT'
> into 'select USB_ULPI if USB' instead?

That sounds reasonable.

> Or maybe just don't select
> USB_ULPI to start with and put it into the defconfig instead.

Perhaps USB_EHCI_TEGRA should depend on USB, and select USB_EHCI?

-- 
nvpublic
