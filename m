From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 6/7] usb: phy: tegra: Add error handling & clean up.
Date: Thu, 4 Apr 2013 17:59:24 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E50BE489E@BGMAIL02.nvidia.com>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
 <1364978502-22887-7-git-send-email-vbyravarasu@nvidia.com>
 <515C8484.507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515C8484.507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Thursday, April 04, 2013 1:06 AM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org;
> stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2 6/7] usb: phy: tegra: Add error handling & clean up.
> 
> On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> > Check return values from all GPIO APIs and handle errors accordingly.
> > Remove clk_disable_unprepare which is no more needed.
> 
> checkpatch fails:

As these are checkpatch warnings only, did not pay much attention on that.
Any how will fix it in next update.

> 
> > WARNING: line over 80 characters
> > #27: FILE: drivers/usb/phy/phy-tegra-usb.c:547:
> > +		dev_err(phy->dev, "gpio %d direction not set\n", phy-
> >reset_gpio);
> >
> > WARNING: line over 80 characters
> > #34: FILE: drivers/usb/phy/phy-tegra-usb.c:553:
> > +		dev_err(phy->dev, "gpio %d direction not set\n", phy-
> >reset_gpio);
> >
> > total: 0 errors, 2 warnings, 72 lines checked
> >
> > 0006-usb-phy-tegra-Add-error-handling-clean-up.patch has style problems,
> please review.
