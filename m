From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] clk: tegra: Add la clock for Tegra210
Date: Wed, 24 Jan 2018 10:03:31 +0000
Message-ID: <31118e4b-80bd-1db2-0a82-9359b99deccf@nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516699369-3513-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 23/01/18 09:22, Peter De Schrijver wrote:
> This clock is needed by the memory built-in self test work around.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 14 ++++++++++++++
>  include/dt-bindings/clock/tegra210-car.h |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 9e62608..f790c2d 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -41,6 +41,7 @@
>  #define CLK_SOURCE_CSITE 0x1d4
>  #define CLK_SOURCE_EMC 0x19c
>  #define CLK_SOURCE_SOR1 0x410
> +#define CLK_SOURCE_LA 0x1f8
>  
>  #define PLLC_BASE 0x80
>  #define PLLC_OUT 0x84
> @@ -2654,6 +2655,13 @@ static int tegra210_init_pllu(void)
>  			      sor1_parents_idx, 0, &sor1_lock),
>  };
>  
> +static const char * const la_parents[] = {
> +	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
> +};
> +

I was comparing this with downstream and it appears that the parents are
listed as "pll_p", "pll_c", "pll_m", "clk_m". Can you double check the
above is correct?

Otherwise ...

> +static struct tegra_clk_periph tegra210_la =
> +	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
> +
>  static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  					    void __iomem *pmc_base)
>  {
> @@ -2700,6 +2708,12 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  					     periph_clk_enb_refcnt);
>  	clks[TEGRA210_CLK_DSIB] = clk;
>  
> +	/* la */
> +	clk = tegra_clk_register_periph("la", la_parents,
> +			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
> +			CLK_SOURCE_LA, 0);
> +	clks[TEGRA210_CLK_LA] = clk;
> +
>  	/* emc mux */
>  	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
>  			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
> index 6422314..6b77e72 100644
> --- a/include/dt-bindings/clock/tegra210-car.h
> +++ b/include/dt-bindings/clock/tegra210-car.h
> @@ -95,7 +95,7 @@
>  #define TEGRA210_CLK_CSITE 73
>  /* 74 */
>  /* 75 */
> -/* 76 */
> +#define TEGRA210_CLK_LA 76
>  /* 77 */
>  #define TEGRA210_CLK_SOC_THERM 78
>  #define TEGRA210_CLK_DTV 79

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
