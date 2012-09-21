From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] USB: PHY: Re-organize Tegra USB PHY driver
Date: Fri, 21 Sep 2012 15:20:46 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6DDF6013ED@BGMAIL02.nvidia.com>
References: <1347519738-24162-1-git-send-email-vbyravarasu@nvidia.com>
 <5052157F.8040201@wwwdotorg.org>
 <D958900912E20642BCBC71664EFECE3E6DDF601145@BGMAIL02.nvidia.com>
 <20120920120004.GD3523@kroah.com>
 <D958900912E20642BCBC71664EFECE3E6DDF601261@BGMAIL02.nvidia.com>
 <20120921093710.GC15626@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120921093710.GC15626-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Friday, September 21, 2012 3:07 PM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org; Stephen Warren; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Stephen Warren; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
> Subject: Re: [PATCH v2] USB: PHY: Re-organize Tegra USB PHY driver
> 
> * PGP Signed by an unknown key
> 
> Hi,
> 
> On Thu, Sep 20, 2012 at 05:32:36PM +0530, Venu Byravarasu wrote:
> > Thanks Greg, for quick response.
> 
> I'm waiting for a newer version fixing Kishon's comments. 

As I mentioned in reply to his comments,  most of the patch is
dealing with re-organizing the code. Hence kept the cleaning
part aside for next patch.

> BTW, his comment about pdata usage is 100% valid. You should fix that.
> 

Are you referring to below comments:

It's better you have the below code under *if (np)*, since both device
node and pdata co-exist for you.
> +       phy_type = of_property_match_string(np, "phy_type", "utmi");
> +       if (phy_type >= 0)
 
If so, I can address it and push an updated patch with that.

> --
> balbi
> 
> * Unknown Key
> * 0x35CAA444
