From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/7] clk: tegra124: Add support for Tegra124 clocks
Date: Wed, 16 Oct 2013 19:13:13 +0300
Message-ID: <20131016161313.GO5643@tbergstrom-lnx.Nvidia.com>
References: <1381850098-12357-1-git-send-email-pdeschrijver@nvidia.com>
 <1381850098-12357-6-git-send-email-pdeschrijver@nvidia.com>
 <525DA5C3.5070903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525DA5C3.5070903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 15, 2013 at 10:29:55PM +0200, Stephen Warren wrote:
> On 10/15/2013 09:14 AM, Peter De Schrijver wrote:
> > Implement clock support for Tegra124.
> 
> > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> 
> > +static struct pdiv_map pll12g_ssd_esd_p[] = {
> > +	{ .pdiv = 1, .hw_val = 0 },
> > +	{ .pdiv = 2, .hw_val = 1 },
> ...
> > +	{ .pdiv = 24, .hw_val = 13 },
> > +	{ .pdiv = 32, .hw_val = 14 },
> > +	{ .pdiv = 0, .hw_val = 15 },
> > +};
> 
> I'm curious why that last entry doesn't have .hw_val = 0, since I think
> it's a sentinel value. For example, the last entry in pllxc_p[] does
> have .hw_val = 0.
> 
> > diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
> 
> I think you also need to create
> Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt in this
> patch. All the other SoCs have their own binding file. That said, given
> all the clock IDs have moved into <dt-bindings/clock/tegraNNN-car.h>,
> perhaps we should just have a separate patch that removes the separate
> bindings for Tegra30 and Tegra114, and simply add their compatible
> values into the existing nvidia,tegra20-car.txt (and also make the
> header file reference in that file more generic so it applies to any
> Tegra SoC)?

Maybe yes...
> 
> > @@ -0,0 +1,341 @@
> > +/*
> > + * This header provides constants for binding nvidia,tegra124-car.
> > + *
> > + * The first 185 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
> > + * registers.
> 
> Shouldn't that be 192 (== 185 * 32)? Perhaps some bits aren't allocated,

I guess you mean 6 * 32?

> but in previous SoCs, I rounded the ID space for peripheral clocks up to
> whole registers. I see that as far as the clock IDs, this is already
> fine; it's just this description that says 185 not 192.

Ok.

Cheers,

Peter.
