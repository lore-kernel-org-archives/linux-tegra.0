From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] usb: move phy driver from mach-tegra to drivers/usb
Date: Wed, 5 Sep 2012 18:24:13 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6DDE77533D@BGMAIL02.nvidia.com>
References: <1346395526-18219-1-git-send-email-vbyravarasu@nvidia.com>
 <5046772F.6060908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5046772F.6060908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, September 05, 2012 3:19 AM
> To: balbi-l0cyMroinI0@public.gmane.org
> Cc: Venu Byravarasu; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org;
> linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v2] usb: move phy driver from mach-tegra to drivers/usb
> 
> On 08/31/2012 12:45 AM, Venu Byravarasu wrote:
> > As part of this patch:
> > 	1. Moved existing tegra phy driver to drivers/USB directory.
> > 	2. Added standard USB phy driver APIs to tegra phy driver.
> >
> > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Felipe, Would it be possible to apply this patch to a topic branch, so
> that I can merge it into the Tegra tree? The reason is that I'd like to
> remove Tegra's devices.[ch] in kernel 3.7, but to do that, I need to
> move a tiny chunk of code out of that file somewhere else, and doing
> that relies on adding a #include to usb_phy.h/tegra_usb_phy.h, which is
> renamed in this patch.
> 
> Alternatively, if you don't think it'll cause any merge conflicts with
> the USB PHY tree, I can just take this patch through the Tegra tree if
> you want. Venu, do you plan any other patches within the next couple
> weeks or so (i.e. before 3.6-rc6) that will depend on this patch? If so,
> taking it only through the Tegra tree might not work so well.

Thanks Stephen for verifying the changes.
I'm planning to push next patches, with tegra3 phy support added, very soon.  

> Thanks.
