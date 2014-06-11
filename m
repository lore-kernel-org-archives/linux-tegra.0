From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 3/5] misc: fuse: Add efuse driver for Tegra
Date: Wed, 11 Jun 2014 18:25:51 +0300
Message-ID: <20140611152551.GH5961@tbergstrom-lnx.Nvidia.com>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com>
 <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com>
 <53984FE3.6010509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53984FE3.6010509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 11, 2014 at 02:47:31PM +0200, Mikko Perttunen wrote:
> On 05/06/14 16:09, Peter De Schrijver wrote:
> ...
> > +int tegra_fuse_readl(u32 offset, u32 *val)
> > +{
> > +       if (!fuse_readl)
> > +               return -ENXIO;
> > +
> > +       *val = fuse_readl(offset);
> > +
> > +       return 0;
> > +}
> > +
> 
> -EPROBE_DEFER would be a better error value, so that drivers can work 

Ok.

> even if they are initially probed before the fuse driver. Of course, if 
> the fuse initialization is moved into machine init then this is a non-issue.

The exported function will always be initialized later because on Tegra20 it
requires APB DMA to be available. If you read the fuses directly, the system
sometimes hangs.

Cheers,

Peter.
