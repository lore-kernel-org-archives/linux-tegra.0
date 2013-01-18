From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/4] usb: Add APIs to access host registers from
 Tegra PHY
Date: Fri, 18 Jan 2013 11:09:22 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1A6F108A@BGMAIL02.nvidia.com>
References: <20130117153229.GA21904@arwen.pp.htv.fi>
 <Pine.LNX.4.44L0.1301171054220.1339-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1301171054220.1339-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Alan Stern [mailto:stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org]
> Sent: Thursday, January 17, 2013 9:34 PM
> To: Felipe Balbi
> Cc: Venu Byravarasu; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2 4/4] usb: Add APIs to access host registers from Tegra
> PHY
> 
> On Thu, 17 Jan 2013, Felipe Balbi wrote:
> 
> > On Thu, Jan 17, 2013 at 10:21:53AM -0500, Alan Stern wrote:
> > > On Thu, 17 Jan 2013, Felipe Balbi wrote:
> > >
> > > > > Bits 31 & 30 from PORTSC register were allocated by our SOC
> designers
> > > > > to inform the host controller about the PHY type to be used.
> > > >
> > > > Wow, that's something you should never do. PORTSC register belongs
> to
> > > > the EHCI controller and those bits are reserved for future use and they
> > > > *MUST* return zero. I wouldn't be surprised if current EHCI driver
> > > > assumes those bits will be zero and/or makes sure they're set to zero
> > > > when writing to PORTSC register.
> > >
> > > In fact, those bits _have_ been assigned an official purpose in the
> > > EHCI-1.1 addendum.  Presumably the Tegra hardware only supports
> > > EHCI-1.0.
> >
> > I see, they're used for device addresses now.
> >
> > How can we make sure on Tegra systems we won't use those top two bits ?
> 
> ehci-hcd doesn't use those device address bits at all.  They are meant
> for the LPM (Link Power Management) extension, which ehci-hcd doesn't
> support.  Even if support gets added in the future, we'll know that the
> LPM capability isn't present unless bit 17 in the HCCPARAMS register is
> set.
> 
> On the other hand, what I wrote earlier about not overwriting those
> bits wasn't quite correct.  ehci-hcd _does_ overwrite them with 0's
> during shutdown or removal.  I don't know if this will matter for the
> Tegra platform.

This should not cause any issue to Tegra platform, as these bits are set
during PHY power on.

> 
> Alan Stern
