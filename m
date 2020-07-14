From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] clk: tegra: pll: Improve PLLM enable-state detection
Date: Tue, 14 Jul 2020 09:20:31 +0100
Message-ID: <93106a4c-b0fb-3bbf-49cb-bfe348b1ffc7@nvidia.com>
References: <20200709172057.13951-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200709172057.13951-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/07/2020 18:20, Dmitry Osipenko wrote:
> Power Management Controller (PMC) can override the PLLM clock settings,
> including the enable-state. Although PMC could only act as a second level
> gate, meaning that PLLM needs to be enabled by the Clock and Reset
> Controller (CaR) anyways if we want it to be enabled. Hence, when PLLM is
> overridden by PMC, it needs to be enabled by CaR and ungated by PMC in
> order to be functional. Please note that this patch doesn't fix any known
> problem, and thus, it's merely a minor improvement.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20191210120909.GA2703785@ulmo/T/
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Changelog:
> 
> v4: - Renamed pllm_pmc_clk_enabled() to pllm_clk_is_gated_by_pmc() as
>       it was suggested by Jon Hunter in the review comment to v3.
> 
> v3: - Dropped unintended code change that was accidentally added to v2.
> 
> v2: - Added clarifying comment to the code.
> 
>     - Prettified the code.
> 
>  drivers/clk/tegra/clk-pll.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index b2d39a66f0fa..ff13b371e176 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -327,16 +327,26 @@ int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
>  	return clk_pll_wait_for_lock(pll);
>  }
>  
> +static bool pllm_clk_is_gated_by_pmc(struct tegra_clk_pll *pll)
> +{
> +	u32 val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
> +
> +	return (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE) &&
> +	      !(val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE);
> +}
> +
>  static int clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct tegra_clk_pll *pll = to_clk_pll(hw);
>  	u32 val;
>  
> -	if (pll->params->flags & TEGRA_PLLM) {
> -		val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
> -		if (val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)
> -			return val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE ? 1 : 0;
> -	}
> +	/*
> +	 * Power Management Controller (PMC) can override the PLLM clock
> +	 * settings, including the enable-state. The PLLM is enabled when
> +	 * PLLM's CaR state is ON and when PLLM isn't gated by PMC.
> +	 */
> +	if ((pll->params->flags & TEGRA_PLLM) && pllm_clk_is_gated_by_pmc(pll))
> +		return 0;
>  
>  	val = pll_readl_base(pll);


Thanks! This looks good to me. However, I just want to do a bit of
testing on Tegra124 (hopefully this week).

Jon

-- 
nvpublic
