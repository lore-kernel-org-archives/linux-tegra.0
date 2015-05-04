From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 10/20] clk: tegra: pll: Add logic for out-of-table
 rates for T210
Date: Mon, 4 May 2015 16:34:03 -0700
Message-ID: <CANLzEktX3tiBXvxKgToUr5S7xZ+YibpeG6tDvW1R=qkW6_T5WQ@mail.gmail.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-11-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-11-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> For Tegra210, the logic to calculate out-of-table rates is different
> from previous generations. Add callbacks that can be overridden to
> allow for different ways of calculating rates. Default to
> _cal_rate when not specified.

You should mention that you're adding a new flag and new members that
may override mdiv as well.

>
> Based on original work by Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 3f92f1ad3961..b63ef31a2d7a 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -199,6 +199,8 @@ struct div_nmp {
>   *     base register.
>   * TEGRA_PLL_BYPASS - PLL has bypass bit
>   * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
> + * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
> + *     it may be more accurate (especially if SDM present)
>   */
>  struct tegra_clk_pll_params {
>         unsigned long   input_min;
> @@ -235,7 +237,13 @@ struct tegra_clk_pll_params {
>         struct div_nmp  *div_nmp;
>         struct tegra_clk_pll_freq_table *freq_table;
>         unsigned long   fixed_rate;
> +       bool            vco_out;

vco_out is unused and unrelated to this change?

> +       u16             mdiv_default;
> +       u32     (*round_p_to_pdiv)(u32 p, u32 *pdiv);
>         void    (*set_gain)(struct tegra_clk_pll_freq_table *cfg);
> +       int     (*calc_rate)(struct clk_hw *hw,
> +                       struct tegra_clk_pll_freq_table *cfg,
> +                       unsigned long rate, unsigned long parent_rate);

Add kerneldoc for new members.


-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
