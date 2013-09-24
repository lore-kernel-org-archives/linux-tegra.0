From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 10/12] clk: tegra: move fixed clocks to common file
Date: Tue, 24 Sep 2013 11:32:31 +0300
Message-ID: <20130924083231.GK30013@tbergstrom-lnx.Nvidia.com>
References: <1379515331-19427-1-git-send-email-pdeschrijver@nvidia.com>
 <1379515331-19427-11-git-send-email-pdeschrijver@nvidia.com>
 <524089C8.4010108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <524089C8.4010108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 23, 2013 at 08:34:48PM +0200, Stephen Warren wrote:
> On 09/18/2013 08:41 AM, Peter De Schrijver wrote:
> > Introduce a new file for fixed clocks common between several Tegra
> > SoCs and move Tegra114 to this new infrastructure.
> 
> > diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
> 
> > +void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
> 
> > +	/* clk_m_div2 */
> > +	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div2, tegra_clks);
> > +	if (dt_clk) {
> > +		clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
> > +					CLK_SET_RATE_PARENT, 1, 2);
> > +		clk_register_clkdev(clk, "clk_m_div2", NULL);
> > +		*dt_clk = clk;
> > +	}
> 
> I guess "fixed" means "fixed at run-time", not "identical rate in all
> systems"? Since this is the crystal rate, it can vary between boards,
> but I supposed if "fixed" means "fixed at run-time", considering this as
> a fixed clock is fine.
> 

Fixed means "fixed at run-time" indeed. Although clk_32k is 32768Hz on all
boards as well.

> But, isn't clk_m also a fixed clock then? I would expect one or two more

I guess the code from clk-tegra-osc.c could be moved here if you think that's
better?

> clocks in this file. What about clk_s, or is that known as clk_32k here?

I don't think we ever had clk_s in upstream?

Cheers,

Peter.
