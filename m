From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra30: make tegra_clk_pll_params __ro_after_init
Date: Tue, 3 Oct 2017 11:32:31 +0300
Message-ID: <20171003083231.GS6290@tbergstrom-lnx.Nvidia.com>
References: <1506975128-16514-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506975128-16514-1-git-send-email-bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I would assume this also applies to many PLL structs for other Tegra SoCs?

Peter.

On Tue, Oct 03, 2017 at 01:42:08AM +0530, Bhumika Goyal wrote:
> These structures are only passed to the functions tegra_clk_register_pll,
> tegra_clk_register_pll{e/u} or tegra_periph_clk_init during the init
> phase. These functions modify the structures only during the init phase
> and after that the structures are never modified. Therefore, make them
> __ro_after_init.
> 
> Signed-off-by: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index a2d163f..1ce7d76 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -359,7 +359,7 @@
>  };
>  
>  /* PLL parameters */
> -static struct tegra_clk_pll_params pll_c_params = {
> +static struct tegra_clk_pll_params pll_c_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 31000000,
>  	.cf_min = 1000000,
> @@ -388,7 +388,7 @@
>  	.override_divp_shift = 15,
>  };
>  
> -static struct tegra_clk_pll_params pll_m_params = {
> +static struct tegra_clk_pll_params pll_m_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 31000000,
>  	.cf_min = 1000000,
> @@ -409,7 +409,7 @@
>  		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_FIXED,
>  };
>  
> -static struct tegra_clk_pll_params pll_p_params = {
> +static struct tegra_clk_pll_params pll_p_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 31000000,
>  	.cf_min = 1000000,
> @@ -444,7 +444,7 @@
>  		 TEGRA_PLL_HAS_LOCK_ENABLE,
>  };
>  
> -static struct tegra_clk_pll_params pll_d_params = {
> +static struct tegra_clk_pll_params pll_d_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 40000000,
>  	.cf_min = 1000000,
> @@ -461,7 +461,7 @@
>  		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
>  };
>  
> -static struct tegra_clk_pll_params pll_d2_params = {
> +static struct tegra_clk_pll_params pll_d2_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 40000000,
>  	.cf_min = 1000000,
> @@ -478,7 +478,7 @@
>  		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
>  };
>  
> -static struct tegra_clk_pll_params pll_u_params = {
> +static struct tegra_clk_pll_params pll_u_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 40000000,
>  	.cf_min = 1000000,
> @@ -496,7 +496,7 @@
>  		 TEGRA_PLL_HAS_LOCK_ENABLE,
>  };
>  
> -static struct tegra_clk_pll_params pll_x_params = {
> +static struct tegra_clk_pll_params pll_x_params __ro_after_init = {
>  	.input_min = 2000000,
>  	.input_max = 31000000,
>  	.cf_min = 1000000,
> @@ -513,7 +513,7 @@
>  		 TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
>  };
>  
> -static struct tegra_clk_pll_params pll_e_params = {
> +static struct tegra_clk_pll_params pll_e_params __ro_after_init = {
>  	.input_min = 12000000,
>  	.input_max = 216000000,
>  	.cf_min = 12000000,
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
