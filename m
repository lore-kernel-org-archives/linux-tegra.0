From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 16/19] clk: tegra: pll: Add Set_default logic
Date: Mon, 27 Apr 2015 17:19:33 +0300
Message-ID: <20150427141932.GG3097@tbergstrom-lnx.Nvidia.com>
References: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
 <1429894079-25052-17-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429894079-25052-17-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 24, 2015 at 12:47:56PM -0400, Rhyland Klein wrote:
> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add logic which (if specified for a pll) can verify that a PLL is set
> to the proper default value and if not can set it. This can be
> specified per PLL as each will have different default values.
> 

Why can't we just set the default values at init time?

> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c |   46 ++++++++++++++++++++++++++++++++-----------
>  drivers/clk/tegra/clk.h     |   15 ++++++++++++++
>  2 files changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 9acd858e0c5b..68b42be060c7 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -660,15 +660,28 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>  			unsigned long rate)
>  {
>  	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	struct tegra_clk_pll_freq_table old_cfg;
>  	int state, ret = 0;
>  
>  	state = clk_pll_is_enabled(hw);
>  
> +	_get_pll_mnp(pll, &old_cfg);
> +
> +	if (state && pll->params->defaults_set && pll->params->dyn_ramp &&
> +			(cfg->m == old_cfg.m) && (cfg->p == old_cfg.p)) {
> +		ret = pll->params->dyn_ramp(pll, cfg);
> +		if (!ret)
> +			return 0;
> +	}
> +
>  	if (state) {
>  		pll_clk_stop_ss(pll);
>  		_clk_pll_disable(hw);
>  	}
>  
> +	if (!pll->params->defaults_set && pll->params->set_defaults)
> +		pll->params->set_defaults(pll);
> +
>  	_update_pll_mnp(pll, cfg);
>  
>  	if (pll->params->flags & TEGRA_PLL_HAS_CPCON)
> @@ -1528,6 +1541,9 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
>  	if (!pll->params->calc_rate)
>  		pll->params->calc_rate = _calc_rate;
>  
> +	if (pll->params->set_defaults)
> +		pll->params->set_defaults(pll);
> +
>  	/* Data in .init is copied by clk_register(), so stack variable OK */
>  	pll->hw.init = &init;
>  
> @@ -1646,7 +1662,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>  	struct tegra_clk_pll *pll;
>  	struct clk *clk, *parent;
>  	unsigned long parent_rate;
> -	int err;
>  	u32 val, val_iddq;
>  
>  	parent = __clk_lookup(parent_name);
> @@ -1667,18 +1682,27 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>  		pll_params->vco_min = pll_params->adjust_vco(pll_params,
>  							     parent_rate);
>  
> -	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
> -	if (err)
> -		return ERR_PTR(err);
> +	/*
> +	 * If the pll has a set_defaults callback, it will take care of
> +	 * configuring dynamic ramping and setting IDDQ in that path.
> +	 */
> +	if (!pll_params->set_defaults) {
> +		int err;
>  
> -	val = readl_relaxed(clk_base + pll_params->base_reg);
> -	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
> +		err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
> +		if (err)
> +			return ERR_PTR(err);
>  
> -	if (val & PLL_BASE_ENABLE)
> -		WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
> -	else {
> -		val_iddq |= BIT(pll_params->iddq_bit_idx);
> -		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
> +		val = readl_relaxed(clk_base + pll_params->base_reg);
> +		val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
> +
> +		if (val & PLL_BASE_ENABLE)
> +			WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
> +		else {
> +			val_iddq |= BIT(pll_params->iddq_bit_idx);
> +			writel_relaxed(val_iddq,
> +				       clk_base + pll_params->iddq_reg);
> +		}
>  	}
>  
>  	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 850521d42be6..6454c1732dbd 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -239,6 +239,7 @@ struct tegra_clk_pll_params {
>  	int		stepb_shift;
>  	int		lock_delay;
>  	int		max_p;
> +	bool		defaults_set;
>  	struct pdiv_map *pdiv_tohw;
>  	struct div_nmp	*div_nmp;
>  	struct tegra_clk_pll_freq_table	*freq_table;
> @@ -254,6 +255,7 @@ struct tegra_clk_pll_params {
>  				unsigned long parent_rate);
>  	int	(*dyn_ramp)(struct tegra_clk_pll *pll,
>  			struct tegra_clk_pll_freq_table *cfg);
> +	void	(*set_defaults)(struct tegra_clk_pll *pll);
>  };
>  
>  #define TEGRA_PLL_USE_LOCK BIT(0)
> @@ -588,6 +590,19 @@ struct tegra_periph_init_data {
>  			_clk_num, _gate_flags, _clk_id,\
>  			NULL, 0, NULL)
>  
> +#define PLL_MISC_CHK_DEFAULT(base, params, misc_num, default_val, mask)        \
> +do {									       \
> +	u32 boot_val = readl_relaxed(base + (params)->ext_misc_reg[misc_num]); \
> +	boot_val &= (mask);						       \
> +	default_val &= (mask);						       \
> +	if (boot_val != (default_val)) {				       \
> +		pr_warn("boot misc" #misc_num " 0x%x : expected 0x%x\n",       \
> +			boot_val, (default_val));			       \
> +		pr_warn(" (comparison mask = 0x%x)\n", mask);		       \
> +			(params)->defaults_set = false;			       \
> +	}								       \
> +} while (0)
> +
>  /**
>   * struct clk_super_mux - super clock
>   *
> -- 
> 1.7.9.5
> 
