From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 1/2] clk: tegra: Fix pllre Tegra210 and add pll_re_out1
Date: Fri, 8 Apr 2016 11:19:24 -0400
Message-ID: <5707CBFC.8070203@nvidia.com>
References: <1458590333-8898-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1458590333-8898-1-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 3/21/2016 3:58 PM, Rhyland Klein wrote:
> Use a new Tegra210 version of the pll_register_pllre function to
> allow setting the proper settings for the m and n div fields.
> 
> Additionally define PLL_RE_OUT1 on Tegra210.
> 
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---

Ping.

>  drivers/clk/tegra/clk-pll.c              | 46 ++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-tegra210.c         | 15 +++++++++--
>  drivers/clk/tegra/clk.h                  |  6 +++++
>  include/dt-bindings/clock/tegra210-car.h |  2 +-
>  4 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 6ac3f843e7ca..4e194ecc8d5e 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -2013,6 +2013,52 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
>  #endif
>  
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> +struct clk *tegra_clk_register_pllre_tegra210(const char *name,
> +			  const char *parent_name, void __iomem *clk_base,
> +			  void __iomem *pmc, unsigned long flags,
> +			  struct tegra_clk_pll_params *pll_params,
> +			  spinlock_t *lock, unsigned long parent_rate)
> +{
> +	u32 val;
> +	struct tegra_clk_pll *pll;
> +	struct clk *clk;
> +
> +	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
> +
> +	if (pll_params->adjust_vco)
> +		pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +							     parent_rate);
> +
> +	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
> +	if (IS_ERR(pll))
> +		return ERR_CAST(pll);
> +
> +	/* program minimum rate by default */
> +
> +	val = pll_readl_base(pll);
> +	if (val & PLL_BASE_ENABLE)
> +		WARN_ON(readl_relaxed(clk_base + pll_params->iddq_reg) &
> +				BIT(pll_params->iddq_bit_idx));
> +	else {
> +		val = 0x4 << divm_shift(pll);
> +		val |= 0x41 << divn_shift(pll);
> +		pll_writel_base(val, pll);
> +	}
> +
> +	/* disable lock override */
> +
> +	val = pll_readl_misc(pll);
> +	val &= ~BIT(29);
> +	pll_writel_misc(val, pll);
> +
> +	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
> +				      &tegra_clk_pllre_ops);
> +	if (IS_ERR(clk))
> +		kfree(pll);
> +
> +	return clk;
> +}
> +
>  static int clk_plle_tegra210_enable(struct clk_hw *hw)
>  {
>  	struct tegra_clk_pll *pll = to_clk_pll(hw);
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 637041fd53ad..ce262582547c 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2582,8 +2582,10 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>  	clks[TEGRA210_CLK_PLL_D_OUT0] = clk;
>  
>  	/* PLLRE */
> -	clk = tegra_clk_register_pllre("pll_re_vco", "pll_ref", clk_base, pmc,
> -			     0, &pll_re_vco_params, &pll_re_lock, pll_ref_freq);
> +	clk = tegra_clk_register_pllre_tegra210("pll_re_vco", "pll_ref",
> +						clk_base, pmc, 0,
> +						&pll_re_vco_params,
> +						&pll_re_lock, pll_ref_freq);
>  	clk_register_clkdev(clk, "pll_re_vco", NULL);
>  	clks[TEGRA210_CLK_PLL_RE_VCO] = clk;
>  
> @@ -2593,6 +2595,15 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>  	clk_register_clkdev(clk, "pll_re_out", NULL);
>  	clks[TEGRA210_CLK_PLL_RE_OUT] = clk;
>  
> +	clk = tegra_clk_register_divider("pll_re_out1_div", "pll_re_vco",
> +					 clk_base + PLLRE_OUT1, 0,
> +					 TEGRA_DIVIDER_ROUND_UP,
> +					 8, 8, 1, NULL);
> +	clk = tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
> +					 clk_base + PLLRE_OUT1, 1, 0,
> +					 CLK_SET_RATE_PARENT, 0, NULL);
> +	clks[TEGRA210_CLK_PLL_RE_OUT1] = clk;
> +
>  	/* PLLE */
>  	clk = tegra_clk_register_plle_tegra210("pll_e", "pll_ref",
>  				      clk_base, 0, &pll_e_params, NULL);
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 4dbcfaec576a..9f26c1ba1e5b 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -386,6 +386,12 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
>  			   struct tegra_clk_pll_params *pll_params,
>  			   spinlock_t *lock, unsigned long parent_rate);
>  
> +struct clk *tegra_clk_register_pllre_tegra210(const char *name,
> +			   const char *parent_name, void __iomem *clk_base,
> +			   void __iomem *pmc, unsigned long flags,
> +			   struct tegra_clk_pll_params *pll_params,
> +			   spinlock_t *lock, unsigned long parent_rate);
> +
>  struct clk *tegra_clk_register_plle_tegra114(const char *name,
>  				const char *parent_name,
>  				void __iomem *clk_base, unsigned long flags,
> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
> index 0a05b0d36ae7..bd3530e56d46 100644
> --- a/include/dt-bindings/clock/tegra210-car.h
> +++ b/include/dt-bindings/clock/tegra210-car.h
> @@ -346,7 +346,7 @@
>  #define TEGRA210_CLK_PLL_P_OUT_HSIO 316
>  #define TEGRA210_CLK_PLL_P_OUT_XUSB 317
>  #define TEGRA210_CLK_XUSB_SSP_SRC 318
> -/* 319 */
> +#define TEGRA210_CLK_PLL_RE_OUT1 319
>  /* 320 */
>  /* 321 */
>  /* 322 */
> 


-- 
nvpublic
