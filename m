From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: Add support for PLLSS
Date: Mon, 14 Oct 2013 18:03:17 +0300
Message-ID: <20131014150317.GA19540@tbergstrom-lnx.Nvidia.com>
References: <1380878014-22088-1-git-send-email-pdeschrijver@nvidia.com>
 <1380878014-22088-2-git-send-email-pdeschrijver@nvidia.com>
 <20131010103915.GA6735@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131010103915.GA6735-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 10, 2013 at 12:39:16PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Oct 04, 2013 at 12:12:40PM +0300, Peter De Schrijver wrote:
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is missing a commit description.
> 
> > diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> [...]
> > +const struct clk_ops tegra_clk_pllss_ops = {
> 
> static?
> 
> > +struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
> > +				void __iomem *clk_base, unsigned long flags,
> > +				unsigned long fixed_rate,
> > +				struct tegra_clk_pll_params *pll_params,
> > +				struct tegra_clk_pll_freq_table *freq_table,
> > +				spinlock_t *lock)
> > +{
> [...]
> > +	pll = _tegra_init_pll(clk_base, NULL, fixed_rate, pll_params,
> > +				pll_flags, freq_table, lock);
> > +
> > +	if (IS_ERR(pll))
> 
> I'd leave out the blank line separating the assignment of pll and the
> check for validity. Grouping them together like that makes it
> immediately clear that they belong together.
> 
> > +		return ERR_CAST(pll);
> > +
> > +	val = pll_readl_base(pll);
> > +
> > +	if (val & (3 << 25)) {
> 
> Same here. Also 3 << 25 could probably be a symbolic constant, something
> like PLLSS_REF_SRC_SEL_MASK perhaps?
> 
> > +		WARN(1, "Unknown parent selected for %s: %d\n", name,
> > +			val >> 25);
> 
> Similarly, this should be something like:
> 
> 		(val & PLLSS_REF_SRC_SEL_MASK) >> PLLSS_REF_SRC_SEL_SHIFT
> 
> > +		kfree(pll);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +	_get_pll_mnp(pll, &cfg);
> 
> Nit: I'd put a blank line before this, to separate the block and the
> function call. That is:
> 
> 	}
> 
> 	_get_pll_mnp(...);
> 
> > +
> > +	if (cfg.n > 1) {
> > +		WARN(1, "%s should not be initialized\n", name);
> > +		kfree(pll);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> 
> Is this really fatal? Can't we just configure the PLL from scratch?
> 
> > +	parent_rate = __clk_get_rate(parent);
> > +
> > +	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
> > +
> > +	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
> > +	cfg.n = cfg.m * pll_params->vco_min / parent_rate;
> > +
> > +	for (i = 0; pll_params->pdiv_tohw[i].pdiv; i++)
> > +		;
> > +	cfg.p = pll_params->pdiv_tohw[i-1].hw_val;
> 
> Could use a blank line to separate them. Also what if .pdiv of the first
> entry is 0? The loop will terminate on the first run and i will be 0, so
> this would try to access pdiv_tohw[-1]. Can that ever happen?
> 

That would be an error. This PLL type always has a post divider table.
I will add a check.

Cheers,

Peter.
