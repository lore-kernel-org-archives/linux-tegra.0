From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: rework fuse.c
Date: Thu, 2 Jan 2014 16:32:21 +0200
Message-ID: <20140102143221.GR26588@tbergstrom-lnx.Nvidia.com>
References: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
 <1387468474-26521-5-git-send-email-pdeschrijver@nvidia.com>
 <CACRpkdbXc_yH-=WgpQyVwHC_TSPfbfx=tHwziNhmB6t0HuSfRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbXc_yH-=WgpQyVwHC_TSPfbfx=tHwziNhmB6t0HuSfRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 02, 2014 at 01:37:43PM +0100, Linus Walleij wrote:
> On Thu, Dec 19, 2013 at 4:54 PM, Peter De Schrijver
> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > Reduce fuse.c to the minimum functionality required for the early bootstages.
> > Also export tegra_read_straps() for use by the fuse driver.
> >
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Aha, but why?
> 

The efuse driver in patch 2 of this series, adds the randomness, so we don't
need to add it here then?

> > -static void __init tegra20_fuse_init_randomness(void)
> > -{
> > -       u32 randomness[2];
> > -
> > -       randomness[0] = tegra_fuse_readl(FUSE_UID_LOW);
> > -       randomness[1] = tegra_fuse_readl(FUSE_UID_HIGH);
> > -
> > -       add_device_randomness(randomness, sizeof(randomness));
> > -}
> > -
> > -/* Applies to Tegra30 or later */
> > -static void __init tegra30_fuse_init_randomness(void)
> > -{
> > -       u32 randomness[7];
> > -
> > -       randomness[0] = tegra_fuse_readl(FUSE_VENDOR_CODE);
> > -       randomness[1] = tegra_fuse_readl(FUSE_FAB_CODE);
> > -       randomness[2] = tegra_fuse_readl(FUSE_LOT_CODE_0);
> > -       randomness[3] = tegra_fuse_readl(FUSE_LOT_CODE_1);
> > -       randomness[4] = tegra_fuse_readl(FUSE_WAFER_ID);
> > -       randomness[5] = tegra_fuse_readl(FUSE_X_COORDINATE);
> > -       randomness[6] = tegra_fuse_readl(FUSE_Y_COORDINATE);
> > -
> > -       add_device_randomness(randomness, sizeof(randomness));
> > -}
> 
> We still want to get this into the random pool right? Can it not simply
> be moved to a later initcall then?

Yes, it's done in the efuse driver now, do you think that's too late?

Cheers,

Peter.
