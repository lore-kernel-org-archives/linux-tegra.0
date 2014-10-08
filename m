From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Wed, 8 Oct 2014 18:11:55 +0300
Message-ID: <20141008151155.GC4809@tbergstrom-lnx.Nvidia.com>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
 <1411376456.2599.1.camel@pengutronix.de>
 <20140922101153.GN1470@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140922101153.GN1470@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 22, 2014 at 12:11:54PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Sep 22, 2014 at 11:00:56AM +0200, Lucas Stach wrote:
> > Am Freitag, den 19.09.2014, 15:53 -0400 schrieb Sean Paul:
> > > Per NVidia, this clock rate should be around 70MHz in
> > > order to properly sample reads on data lane 0. In order
> > > to achieve this rate, we need to reparent the clock from
> > > clk_m which can only achieve 12MHz. Add parent_lp to the
> > > dts bindings and set the parent & rate on init.
> > > 
> > > Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > 
> > NACK
> > 
> > You are pushing SoC integration details into the binding of the device.
> > 
> > You have two reasonable routes to go here: either the clock driver needs
> > to be made smarter to reparent the clock in case the required clock rate
> > could not be achieved with the current parent or you go the easy route
> > and reparent the clock as part of the initial configuration.
> 
> Agreed. There doesn't seem to be a case where it would make sense to
> have this configurable per-board. Can you achieve the same effect by
> adding this to the clock initialization table?
> 
> Oh, I just see that we have this in the Tegra124 clock initialization
> table:
> 
> 	{TEGRA114_CLK_DSIALP, TEGRA114_CLK_PLL_P, 68000000, 0},
> 	{TEGRA114_CLK_DSIBLP, TEGRA114_CLK_PLL_P, 68000000, 0},
> 
> Doesn't that work for you already? If not that'd be a bug that should be
> fixed in the clock driver.

This seems the better approach indeed. Unless the rate would differ based
on board or other external factors.

Cheers,

Peter.
