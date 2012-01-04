From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] regulator: Rail is said to be enable only if this and
 supply rails are enabled.
Date: Wed, 4 Jan 2012 11:49:14 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9C2E@BGMAIL01.nvidia.com>
References: <1325570983-3700-1-git-send-email-ldewangan@nvidia.com>
 <20120103201624.GC2843@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120103201624.GC2843-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> From: Mark Brown [mailto:broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org]
> Sent: Wednesday, January 04, 2012 1:46 AM +0530
> >
> > The given rail is said to be enabled only if this rail is eanbled
> > along with supply rail.
> > Adding check for the supply rail whether it is enabled or not when
> > query about rail enabled.
> 
> This feels wrong - the code in general assumes that the parents will all
> be enabled for an enabled child (and does the required stuff on enable
> and disable).  Doing the check isn't unreasonable but if it fails we
> really ought to be complaining loudly as we're probably confused and
> things might be going wrong elsewhere.
>
Yes, in general checking of the parent rail is not really required but it is
good to have on safer side because it directly checks at the interface of
regulator level rather than the ref count and give the more correct results.

I came to this issue when I set the supply regulator for a rail and set the rail
is always on but the supply regulator was not always on. And so this function
returns true but actually the rail is not enabled because supply rail was not enabled.
Although it is fixed in other patch but such checks help more.

> We should also look at the bootstrapping code, we're not really making
> much effort to verify that the hardware configuration on boot is sane
> (though realistically it's unlikely that it won't be).
> 
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > When consumer of any rails query about whether rail is enabled
> > or not, the function regulator_is_enabled() should return enabled
> > only if this rail and supply rail (both) are enabled.
> > if any one of rail, whether the given rail or supply rail, is enabled
> > then function should return as not enabled.
> 
> Please just put things in the changelog if they're useful.

I already send the 2nd patch for putting this info on changelog.

Thanks,
Laxman
