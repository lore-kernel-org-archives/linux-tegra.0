From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 14/21] clk: tegra: pll: Adjust vco_min if SDM present
Date: Wed, 13 May 2015 15:11:59 -0700
Message-ID: <CANLzEkuv5317FmT9SAsE89P9SqU=aeggo2UzcBbu8zjz_o3WDw@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-16-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-16-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This code makes use of the SDM fractional divider if present to
> contrain the allowable programming range of the PLL divider register

s/contrain/constrain

> bitfields to take advantage of higher frequency granularity that can
> be induced by the SDM divider.
>
> Based on original work by Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v5:
>   - Removed whitespace change
>
>  drivers/clk/tegra/clk-pll.c |   28 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h     |    2 ++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1dfa1433375d..626466665dde 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1653,6 +1653,10 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
>         if (err)
>                 return ERR_PTR(err);
> @@ -1691,6 +1695,10 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>         if (IS_ERR(pll))
>                 return ERR_CAST(pll);
> @@ -1747,6 +1755,10 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         pll_params->flags |= TEGRA_PLL_BYPASS;
>         pll_params->flags |= TEGRA_PLLM;
>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
> @@ -2177,6 +2189,10 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         pll_params->flags |= TEGRA_PLL_BYPASS;
>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>         if (IS_ERR(pll))
> @@ -2214,6 +2230,10 @@ struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>         if (IS_ERR(pll))
>                 return ERR_CAST(pll);
> @@ -2261,6 +2281,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         /* initialize PLL to minimum rate */
>
>         cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
> @@ -2325,6 +2349,10 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
>
>         pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
>
> +       if (pll_params->adjust_vco)
> +               pll_params->vco_min = pll_params->adjust_vco(pll_params,
> +                                                            parent_rate);
> +
>         pll_params->flags |= TEGRA_PLL_BYPASS;
>         pll_params->flags |= TEGRA_PLLMB;
>         pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 7ee764e583f9..330729a822cf 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -269,6 +269,8 @@ struct tegra_clk_pll_params {
>         int     (*calc_rate)(struct clk_hw *hw,
>                         struct tegra_clk_pll_freq_table *cfg,
>                         unsigned long rate, unsigned long parent_rate);
> +       unsigned long   (*adjust_vco)(struct tegra_clk_pll_params *pll_params,
> +                               unsigned long parent_rate);

Please add kerneldoc for this new member above.



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
