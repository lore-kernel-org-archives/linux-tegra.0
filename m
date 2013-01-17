From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/4] usb: Add APIs to access host registers from
 Tegra PHY
Date: Thu, 17 Jan 2013 18:07:56 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1A6F0F97@BGMAIL02.nvidia.com>
References: <1358411292-12288-1-git-send-email-vbyravarasu@nvidia.com>
 <20130117090255.GD10814@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130117090255.GD10814-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Thursday, January 17, 2013 2:33 PM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2 4/4] usb: Add APIs to access host registers from Tegra
> PHY
> 
> * PGP Signed by an unknown key
> 
> Hi,
> 
> On Thu, Jan 17, 2013 at 01:58:12PM +0530, Venu Byravarasu wrote:
> > As Tegra PHY driver need to access one of the Host registers,
> > added few APIs to ehci tegra driver.
> >
> > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Stephen is this another of those patches you're gonna take care of
> yourself ?
> 
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
> please prepend this with TEGRA_ just as other defines.

Sure, will add it. 

> 
> > +
> >  #define TEGRA_USB_DMA_ALIGN 32
> >
> >  struct tegra_ehci_hcd {
> > @@ -605,6 +615,53 @@ static const struct dev_pm_ops
> tegra_ehci_pm_ops = {
> >
> >  #endif
> >
> > +/* Bits of PORTSC1, which will get cleared by writing 1 into them */
> > +#define TEGRA_PORTSC_RWC_BITS (USB_PORTSC1_CSC |
> USB_PORTSC1_PEC)
> > +
> > +void tegra_ehci_set_wakeon_events(struct usb_phy *x, bool enable)
> > +{
> > +	unsigned long val;
> > +	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
> > +	void __iomem *base = hcd->regs;
> > +	u32 wake = USB_PORTSC1_WKOC | USB_PORTSC1_WKDS |
> USB_PORTSC1_WKCN;
> > +
> > +	val = readl(base + USB_PORTSC1) & ~TEGRA_PORTSC_RWC_BITS;
> > +	if (enable)
> > +		val |= wake;
> > +	else
> > +		val &= ~wake;
> > +	writel(val, base + USB_PORTSC1);
> > +}
> > +EXPORT_SYMBOL_GPL(tegra_ehci_set_wakeon_events);
> > +
> > +void tegra_ehci_set_pts(struct usb_phy *x, u8 pts_val)
> > +{
> > +	unsigned long val;
> > +	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
> > +	void __iomem *base = hcd->regs;
> > +
> > +	val = readl(base + USB_PORTSC1) & ~TEGRA_PORTSC_RWC_BITS;
> > +	val &= ~USB_PORTSC1_PTS(3);
> > +	val |= USB_PORTSC1_PTS(pts_val & 3);
> > +	writel(val, base + USB_PORTSC1);
> > +}
> > +EXPORT_SYMBOL_GPL(tegra_ehci_set_pts);
> > +
> > +void tegra_ehci_set_phcd(struct usb_phy *x, bool enable)
> > +{
> > +	unsigned long val;
> > +	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
> > +	void __iomem *base = hcd->regs;
> > +
> > +	val = readl(base + USB_PORTSC1) & ~TEGRA_PORTSC_RWC_BITS;
> > +	if (enable)
> > +		val |= USB_PORTSC1_PHCD;
> > +	else
> > +		val &= ~USB_PORTSC1_PHCD;
> > +	writel(val, base + USB_PORTSC1);
> > +}
> > +EXPORT_SYMBOL_GPL(tegra_ehci_set_phcd);
> 
> NAK to these three functions, you need to use whatever the PHY API
> provides you, if it misses something, let's see how we can add those as
> generic calls.
> 
> In fact, I wonder why do you want PHY driver to access Host address
> space. Why don't you let your host driver handle the above ?

Tegra20 SOC contains 3 instances of USB controllers.
Some of these controllers can be configured to use different varieties
of PHYs e.g. instance 3 can be configured to use either UTMI or ICUSB PHYs.
Bits 31 & 30 from PORTSC register were allocated by our SOC designers
to inform the host controller about the PHY type to be used. 

As type of PHY is a property related to PHY DT nodes, PHY driver will get this info.
(Will remove phy_type from controller DT node soon, after all patches get merged.)
However as PORTSC register is in controller domain, added tegra_ehci_set_pts() API
 to serve the purpose.

As per Tegra USB PHY design, need to wait for PHY clock to stabilize once we
set/clear PHCD bit. Hence this is being accessed from PHY driver. To serve this
purpose added tegra_ehci_set_phcd().

On further analysis, seems tegra_ehci_set_wakeon_events() can be removed.

If you are okay with above explanation, I can send updated patch for review.

> 
> --
> balbi
> 
> * Unknown Key
> * 0x35CAA444
