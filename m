From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/4] usb: Add APIs to access host registers from
 Tegra PHY
Date: Fri, 18 Jan 2013 10:26:17 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1A6F1069@BGMAIL02.nvidia.com>
References: <1358411292-12288-1-git-send-email-vbyravarasu@nvidia.com>
 <Pine.LNX.4.44L0.1301171012500.1339-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1301171012500.1339-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Alan Stern [mailto:stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org]
> Sent: Thursday, January 17, 2013 8:45 PM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2 4/4] usb: Add APIs to access host registers from Tegra
> PHY
> 
> On Thu, 17 Jan 2013, Venu Byravarasu wrote:
> 
> > As Tegra PHY driver need to access one of the Host registers,
> > added few APIs to ehci tegra driver.
> >
> > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > delta from v1:
> > Taken care of RWC bits, while accessing PORTSC register.
> >
> >  drivers/usb/host/ehci-tegra.c     |   70
> ++++++++++++++++++++++++++++++++++++-
> >  drivers/usb/phy/tegra_usb_phy.c   |   51 +++++++--------------------
> >  include/linux/usb/tegra_usb_phy.h |    6 +++
> >  3 files changed, 88 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> > index 55a9cde..6bbf66a 100644
> > --- a/drivers/usb/host/ehci-tegra.c
> > +++ b/drivers/usb/host/ehci-tegra.c
> > @@ -2,7 +2,7 @@
> >   * EHCI-compliant USB host controller driver for NVIDIA Tegra SoCs
> >   *
> >   * Copyright (C) 2010 Google, Inc.
> > - * Copyright (C) 2009 NVIDIA Corporation
> > + * Copyright (C) 2009 - 2013 NVIDIA Corporation
> >   *
> >   * This program is free software; you can redistribute it and/or modify it
> >   * under the terms of the GNU General Public License as published by the
> > @@ -33,6 +33,16 @@
> >  #define TEGRA_USB2_BASE			0xC5004000
> >  #define TEGRA_USB3_BASE			0xC5008000
> >
> > +/* PORTSC registers */
> > +#define USB_PORTSC1			0x184
> > +#define USB_PORTSC1_PTS(x)	(((x) & 0x3) << 30)
> > +#define USB_PORTSC1_PHCD	(1 << 23)
> > +#define USB_PORTSC1_WKOC	(1 << 22)
> > +#define USB_PORTSC1_WKDS	(1 << 21)
> > +#define USB_PORTSC1_WKCN	(1 << 20)
> > +#define USB_PORTSC1_PEC		(1 << 3)
> > +#define USB_PORTSC1_CSC		(1 << 1)
> 
> Why redefine these values when they are already defined in
> include/linux/usb/ehci_defs.h?

Agreed. Will remove all above defines except PHCD & PTS, as these two
fields are added by tegra SOC to PORTSC.

> 
> > @@ -605,6 +615,53 @@ static const struct dev_pm_ops
> tegra_ehci_pm_ops = {
> >
> >  #endif
> >
> > +/* Bits of PORTSC1, which will get cleared by writing 1 into them */
> > +#define TEGRA_PORTSC_RWC_BITS (USB_PORTSC1_CSC |
> USB_PORTSC1_PEC)
> 
> Likewise for this.  Not to mention that you forgot to include the
> overcurrent-change bit.

As OCC bit is "not supported" by Tegra20 SOC, did not include it.
Should I still add this, to be compliant with EHCI spec?
Based on your comments, I can update the patch and send for review.

> 
> Alan Stern
