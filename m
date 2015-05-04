From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 08/20] clk: tegra: pll: Add logic for handling SDM data
Date: Mon, 4 May 2015 16:01:29 -0700
Message-ID: <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-9-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-9-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> @@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>         return 0;
>  }
>
> +static void clk_pll_set_sdm_data(struct clk_hw *hw,
> +                                struct tegra_clk_pll_freq_table *cfg)
> +{
> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
> +       u32 val;
> +
> +       if (!pll->params->sdm_din_reg)
> +               return;
> +
> +       if (cfg->sdm_data) {
> +               val = pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
> +               val |= sdin_data_to_din(cfg->sdm_data) & sdm_din_mask(pll);
> +               pll_writel_sdm_din(val, pll);
> +       }
> +
> +       val = pll_readl_sdm_ctrl(pll);
> +       if (!cfg->sdm_data != !(val & pll->params->sdm_ctrl_en_mask)) {

You can use sdm_en_mask(pll) here.

I'm not super clear about what you're trying to accomplish here with
!cfg->sdm_data != !(val & mask).
Are you just checking if the masked value is different from sdm_data,
but accounting for the integer widths being different (u16 vs u32)?

> +               val ^= pll->params->sdm_ctrl_en_mask;

You can use sdm_en_mask(pll) here.

> +               pll_writel_sdm_ctrl(val, pll);
> +       }
> +}
> +

> @@ -552,6 +586,14 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
>                 cfg->m = (val >> div_nmp->divm_shift) & divm_mask(pll);
>                 cfg->n = (val >> div_nmp->divn_shift) & divn_mask(pll);
>                 cfg->p = (val >> div_nmp->divp_shift) & divp_mask(pll);
> +
> +               if (pll->params->sdm_din_reg) {
> +                       if (sdm_en_mask(pll) & pll_readl_sdm_ctrl(pll)) {
> +                               val = pll_readl_sdm_din(pll);
> +                               cfg->sdm_data = val & sdm_din_mask(pll);
> +                               cfg->sdm_data = sdin_din_to_data(cfg->sdm_data);

Maybe this is tighter?

val = pll_readl_sdm_din(pll);
val &= sdm_din_mask(pll);
cfg->sdm_data = sdin_din_to_data(val);

> @@ -697,6 +740,9 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
>                 pdiv = 1;
>         }
>
> +       if (pll->params->set_gain)
> +               pll->params->set_gain(&cfg);
> +

It's not really clear from this commit alone how set_gain relates to
the sdm stuff.

> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 8e7361886cf9..eb8103ec335e 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
>  /**
> @@ -213,6 +215,10 @@ struct tegra_clk_pll_params {
>         u32             lock_enable_bit_idx;
>         u32             iddq_reg;
>         u32             iddq_bit_idx;
> +       u32             sdm_din_reg;
> +       u32             sdm_din_mask;
> +       u32             sdm_ctrl_reg;
> +       u32             sdm_ctrl_en_mask;

Please add kerneldoc for these members as well.

>         u32             aux_reg;
>         u32             dyn_ramp_reg;
>         u32             ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
> @@ -227,6 +233,7 @@ struct tegra_clk_pll_params {
>         struct div_nmp  *div_nmp;
>         struct tegra_clk_pll_freq_table *freq_table;
>         unsigned long   fixed_rate;
> +       void    (*set_gain)(struct tegra_clk_pll_freq_table *cfg);

This one too.

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
