From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Do not print errors for clk_round_rate()
Date: Wed, 27 Nov 2013 10:17:53 -0800
Message-ID: <20131127181753.16819.57846@quantum>
References: <1385569563-25408-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385569563-25408-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2013-11-27 08:26:03)
> clk_round_rate() can be used by drivers to determine whether or not a
> frequency is supported by the clock. The current Tegra clock driver
> outputs an error message and a stacktrace when the requested rate isn't
> supported. That's fine for clk_set_rate(), but it's confusing when all
> the driver does is query whether or not a frequency is supported.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  drivers/clk/tegra/clk-pll.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 7aec773a5ca6..55ece6726108 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -435,9 +435,6 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>         if (cfg->m > divm_max(pll) || cfg->n > divn_max(pll) ||
>             (1 << p_div) > divp_max(pll)
>             || cfg->output_rate > pll->params->vco_max) {
> -               pr_err("%s: Failed to set %s rate %lu\n",
> -                      __func__, __clk_get_name(hw->clk), rate);
> -               WARN_ON(1);
>                 return -EINVAL;
>         }
>  
> @@ -584,6 +581,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>         if (_get_table_rate(hw, &cfg, rate, parent_rate) &&
>             _calc_rate(hw, &cfg, rate, parent_rate)) {
> +               pr_err("%s: Failed to set %s rate %lu\n", __func__,
> +                      __clk_get_name(hw->clk), rate);
>                 WARN_ON(1);
>                 return -EINVAL;
>         }
> @@ -615,10 +614,8 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>                 return __clk_get_rate(hw->clk);
>  
>         if (_get_table_rate(hw, &cfg, rate, *prate) &&
> -           _calc_rate(hw, &cfg, rate, *prate)) {
> -               WARN_ON(1);
> +           _calc_rate(hw, &cfg, rate, *prate))
>                 return -EINVAL;
> -       }
>  
>         return cfg.output_rate;
>  }
> -- 
> 1.8.4.2
