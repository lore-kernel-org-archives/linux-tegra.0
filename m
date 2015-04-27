From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 13/19] clk: tegra: pll: Add support for PLLMB for T210
Date: Mon, 27 Apr 2015 17:10:19 +0300
Message-ID: <20150427141019.GF3097@tbergstrom-lnx.Nvidia.com>
References: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
 <1429894079-25052-14-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429894079-25052-14-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 24, 2015 at 12:47:53PM -0400, Rhyland Klein wrote:
> Tegra210 SoC's have a backup PLL for memory usage, PLLMB. Add
> plumbing to register and handle it.
> 

I think this would be better rephrased as:

'Tegra210 SoC's have 2 PLLs for memory usage. Add plumbing to register and 
handle PLLMB.' 

The whole point of PLLMB is exactly that it allows switching between 2 PLLMs
without having to use an intermediate backup PLL, because the PLL has to have
locked before we can switch to it.

> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c |   46 +++++++++++++++++++++++++++++++++++++++----
>  drivers/clk/tegra/clk.h     |    9 +++++++++
>  2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index de9e035b59c9..4a248ee1861c 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -549,7 +549,7 @@ static void _update_pll_mnp(struct tegra_clk_pll *pll,
>  	struct tegra_clk_pll_params *params = pll->params;
>  	struct div_nmp *div_nmp = params->div_nmp;
>  
> -	if ((params->flags & TEGRA_PLLM) &&
> +	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
>  		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
>  			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
>  		val = pll_override_readl(params->pmc_divp_reg, pll);
> @@ -586,7 +586,7 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
>  	struct tegra_clk_pll_params *params = pll->params;
>  	struct div_nmp *div_nmp = params->div_nmp;
>  
> -	if ((params->flags & TEGRA_PLLM) &&
> +	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
>  		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
>  			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
>  		val = pll_override_readl(params->pmc_divp_reg, pll);
> @@ -732,8 +732,8 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	if (pll->params->flags & TEGRA_PLL_FIXED)
>  		return pll->params->fixed_rate;
>  
> -	/* PLLM is used for memory; we do not change rate */
> -	if (pll->params->flags & TEGRA_PLLM)
> +	/* PLLM/MB are used for memory; we do not change rate */
> +	if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
>  		return __clk_get_rate(hw->clk);
>  
>  	if (_get_table_rate(hw, &cfg, rate, *prate) &&
> @@ -2297,4 +2297,42 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
>  
>  	return clk;
>  }
> +
> +struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
> +			  void __iomem *clk_base, void __iomem *pmc,
> +			  unsigned long flags,
> +			  struct tegra_clk_pll_params *pll_params,
> +			  spinlock_t *lock)
> +{
> +	struct tegra_clk_pll *pll;
> +	struct clk *clk, *parent;
> +	unsigned long parent_rate;
> +
> +	if (!pll_params->pdiv_tohw)
> +		return ERR_PTR(-EINVAL);
> +
> +	parent = __clk_lookup(parent_name);
> +	if (!parent) {
> +		WARN(1, "parent clk %s of %s must be registered first\n",
> +			name, parent_name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	parent_rate = __clk_get_rate(parent);
> +
> +	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
> +
> +	pll_params->flags |= TEGRA_PLL_BYPASS;
> +	pll_params->flags |= TEGRA_PLLMB;
> +	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
> +	if (IS_ERR(pll))
> +		return ERR_CAST(pll);
> +
> +	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
> +				      &tegra_clk_pllm_ops);
> +	if (IS_ERR(clk))
> +		kfree(pll);
> +
> +	return clk;
> +}
>  #endif
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 26e31580dc9e..9e37defb063f 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -201,6 +201,8 @@ struct div_nmp {
>   * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
>   * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
>   *     it may be more accurate (especially if SDM present)
> + * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
> + *     flag indicated that it is PLLMB.
>   */
>  struct tegra_clk_pll_params {
>  	unsigned long	input_min;
> @@ -260,6 +262,7 @@ struct tegra_clk_pll_params {
>  #define TEGRA_PLL_BYPASS BIT(9)
>  #define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
>  #define TEGRA_MDIV_NEW BIT(11)
> +#define TEGRA_PLLMB BIT(12)
>  
>  /**
>   * struct tegra_clk_pll - Tegra PLL clock
> @@ -366,6 +369,12 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
>  			   struct tegra_clk_pll_params *pll_params,
>  			   spinlock_t *lock);
>  
> +struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
> +			   void __iomem *clk_base, void __iomem *pmc,
> +			   unsigned long flags,
> +			   struct tegra_clk_pll_params *pll_params,
> +			   spinlock_t *lock);
> +
>  /**
>   * struct tegra_clk_pll_out - PLL divider down clock
>   *
> -- 
> 1.7.9.5
> 
