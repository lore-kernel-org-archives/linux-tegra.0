From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 09/20] clk: tegra: pll: Add logic for SS
Date: Mon, 4 May 2015 16:11:55 -0700
Message-ID: <CANLzEkvqniogx9AUzK-Vx0TYg-=qQB_JwPEU+DbHDcNRx3c4xA@mail.gmail.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-10-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-10-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add some logic for Spread Spectrum control. It is used in conjuncture
> with SDM fractional dividers. SSC has to be disabled when we configure
> the divider settings.
>
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
>  drivers/clk/tegra/clk.h     |    2 ++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index c64b75185d6b..2a559408cee1 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -621,6 +621,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
>         pll_writel_misc(val, pll);
>  }
>
> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {

defaults_set looks like it's introduced later (patch 16/20). Can you
remove references to that, or reorder the patches if that makes more
sense?

> +               u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
> +
> +               val |= pll->params->ssc_ctrl_en_mask;
> +               pll_writel(val, pll->params->ssc_ctrl_reg, pll);
> +       }
> +}
> +
> +static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {

Ditto here for defaults_set.

> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index eb8103ec335e..3f92f1ad3961 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -219,6 +219,8 @@ struct tegra_clk_pll_params {
>         u32             sdm_din_mask;
>         u32             sdm_ctrl_reg;
>         u32             sdm_ctrl_en_mask;
> +       u32             ssc_ctrl_reg;
> +       u32             ssc_ctrl_en_mask;

Please add kerneldoc for these.





-- 
Benson Leung
Software Engineer, Chrom* OS
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
