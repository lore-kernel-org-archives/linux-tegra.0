From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 15/21] clk: tegra: pll: Add dyn_ramp callback
Date: Wed, 13 May 2015 15:20:31 -0700
Message-ID: <CANLzEks_bEnpyKuVHJEn8XZbdMDaqj9bQ+SjpgrM-uQo0W28Ug@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-17-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-17-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:23 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add a callback to the pll_params for custom dynamic ramping
> functions which can be specified per PLL.
>
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Modulo kerneldoc addition,
Reviewed-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
>  drivers/clk/tegra/clk.h |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 330729a822cf..a61d388364b3 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -160,6 +160,8 @@ struct div_nmp {
>
>  #define MAX_PLL_MISC_REG_COUNT 6
>
> +struct tegra_clk_pll;
> +
>  /**
>   * struct tegra_clk_pll_params - PLL parameters
>   *
> @@ -271,6 +273,8 @@ struct tegra_clk_pll_params {
>                         unsigned long rate, unsigned long parent_rate);
>         unsigned long   (*adjust_vco)(struct tegra_clk_pll_params *pll_params,
>                                 unsigned long parent_rate);
> +       int     (*dyn_ramp)(struct tegra_clk_pll *pll,
> +                       struct tegra_clk_pll_freq_table *cfg);

Please add kerneldoc for dyn_ramp member above.

>  };
>
>  #define TEGRA_PLL_USE_LOCK BIT(0)
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
