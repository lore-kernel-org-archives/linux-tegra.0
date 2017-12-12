From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] clk: tegra: Mark HCLK, SCLK, EMC, MC and PLL_P
 outputs as critical
Date: Tue, 12 Dec 2017 12:06:59 +0200
Message-ID: <20171212100659.GX32106@tbergstrom-lnx.Nvidia.com>
References: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
 <09480d74d240d8e77b3989cfe85e6e624eaee866.1513018140.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <09480d74d240d8e77b3989cfe85e6e624eaee866.1513018140.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 11, 2017 at 09:50:10PM +0300, Dmitry Osipenko wrote:
> Machine dies if HCLK, SCLK or EMC is disabled, hence mark these clocks
> as critical. Currently some of drivers do not manage clocks properly,
> expecting those clocks to be 'always enabled', these clocks are MC and
> PLL_P outputs. Let's mark MC or PLL_P outputs as critical for now and
> revert this change once drivers would be corrected.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-By:  Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/clk/tegra/clk-divider.c          |  3 ++-
>  drivers/clk/tegra/clk-tegra-periph.c     | 27 ++++++++++++++++++------
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  8 ++++---
>  drivers/clk/tegra/clk-tegra114.c         |  5 ++---
>  drivers/clk/tegra/clk-tegra124.c         | 10 ++++-----
>  drivers/clk/tegra/clk-tegra20.c          | 36 ++++++++++++++++----------------
>  drivers/clk/tegra/clk-tegra210.c         |  6 +++---
>  drivers/clk/tegra/clk-tegra30.c          | 13 +++++-------
>  drivers/clk/tegra/clk.h                  |  2 +-
>  9 files changed, 62 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index 16e0aee14773..ffae26a7c823 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -194,6 +194,7 @@ static const struct clk_div_table mc_div_table[] = {
>  struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
>  				  void __iomem *reg, spinlock_t *lock)
>  {
> -	return clk_register_divider_table(NULL, name, parent_name, 0, reg,
> +	return clk_register_divider_table(NULL, name, parent_name,
> +					  CLK_IS_CRITICAL, reg,
>  					  16, 1, 0, mc_div_table, lock);
>  }
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index c02711927d79..97bc7b43f40a 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -830,7 +830,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>  	GATE("xusb_host", "xusb_host_src", 89, 0, tegra_clk_xusb_host, 0),
>  	GATE("xusb_ss", "xusb_ss_src", 156, 0, tegra_clk_xusb_ss, 0),
>  	GATE("xusb_dev", "xusb_dev_src", 95, 0, tegra_clk_xusb_dev, 0),
> -	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IGNORE_UNUSED),
> +	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IS_CRITICAL),
>  	GATE("sata_cold", "clk_m", 129, TEGRA_PERIPH_ON_APB, tegra_clk_sata_cold, 0),
>  	GATE("ispa", "isp", 23, 0, tegra_clk_ispa, 0),
>  	GATE("ispb", "isp", 3, 0, tegra_clk_ispb, 0),
> @@ -971,7 +971,8 @@ static void __init div_clk_init(void __iomem *clk_base,
>  
>  static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
>  				struct tegra_clk *tegra_clks,
> -				struct tegra_clk_pll_params *pll_params)
> +				struct tegra_clk_pll_params *pll_params,
> +				bool tegra30)
>  {
>  	struct clk *clk;
>  	struct clk **dt_clk;
> @@ -987,6 +988,7 @@ static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(pllp_out_clks); i++) {
> +		unsigned long flags = CLK_SET_RATE_PARENT;
>  		struct pll_out_data *data;
>  
>  		data = pllp_out_clks + i;
> @@ -995,14 +997,27 @@ static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
>  		if (!dt_clk)
>  			continue;
>  
> +		/*
> +		 * On all Tegra generations pll_p_out3 is used as an auxiliary
> +		 * clock source by multiple peripherals.
> +		 */
> +		if (strcmp(data->pll_out_name, "pll_p_out3") == 0)
> +			flags |= CLK_IS_CRITICAL;
> +
> +		/*
> +		 * Only on Tegra30 pll_p_out4 is used as an auxiliary clock
> +		 * source by HDMI hardware block.
> +		 */
> +		if (tegra30 && strcmp(data->pll_out_name, "pll_p_out4") == 0)
> +			flags |= CLK_IS_CRITICAL;
> +
>  		clk = tegra_clk_register_divider(data->div_name, "pll_p",
>  				clk_base + data->offset, 0, data->div_flags,
>  				data->div_shift, 8, 1, data->lock);
>  		clk = tegra_clk_register_pll_out(data->pll_out_name,
>  				data->div_name, clk_base + data->offset,
>  				data->rst_shift + 1, data->rst_shift,
> -				CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0,
> -				data->lock);
> +				flags, 0, data->lock);
>  		*dt_clk = clk;
>  	}
>  
> @@ -1054,9 +1069,9 @@ static void __init init_pllp(void __iomem *clk_base, void __iomem *pmc_base,
>  
>  void __init tegra_periph_clk_init(void __iomem *clk_base,
>  			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
> -			struct tegra_clk_pll_params *pll_params)
> +			struct tegra_clk_pll_params *pll_params, bool tegra30)
>  {
> -	init_pllp(clk_base, pmc_base, tegra_clks, pll_params);
> +	init_pllp(clk_base, pmc_base, tegra_clks, pll_params, tegra30);
>  	periph_clk_init(clk_base, tegra_clks);
>  	gate_clk_init(clk_base, tegra_clks);
>  	div_clk_init(clk_base, tegra_clks);
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index 10047107c1dc..89d6b47a27a8 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -125,7 +125,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>  		/* SCLK */
>  		dt_clk = tegra_lookup_dt_id(tegra_clk_sclk, tegra_clks);
>  		if (dt_clk) {
> -			clk = clk_register_divider(NULL, "sclk", "sclk_mux", 0,
> +			clk = clk_register_divider(NULL, "sclk", "sclk_mux",
> +						CLK_IS_CRITICAL,
>  						clk_base + SCLK_DIVIDER, 0, 8,
>  						0, &sysrate_lock);
>  			*dt_clk = clk;
> @@ -137,7 +138,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>  			clk = tegra_clk_register_super_mux("sclk",
>  						gen_info->sclk_parents,
>  						gen_info->num_sclk_parents,
> -						CLK_SET_RATE_PARENT,
> +						CLK_SET_RATE_PARENT |
> +						CLK_IS_CRITICAL,
>  						clk_base + SCLK_BURST_POLICY,
>  						0, 4, 0, 0, NULL);
>  			*dt_clk = clk;
> @@ -151,7 +153,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>  				   clk_base + SYSTEM_CLK_RATE, 4, 2, 0,
>  				   &sysrate_lock);
>  		clk = clk_register_gate(NULL, "hclk", "hclk_div",
> -				CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +				CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  				clk_base + SYSTEM_CLK_RATE,
>  				7, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
>  		*dt_clk = clk;
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index 63087d17c3e2..f39e09d1bdba 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -955,8 +955,7 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
>  
>  	/* PLLM */
>  	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base, pmc,
> -			     CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
> -			     &pll_m_params, NULL);
> +			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
>  	clks[TEGRA114_CLK_PLL_M] = clk;
>  
>  	/* PLLM_OUT1 */
> @@ -1097,7 +1096,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  	}
>  
>  	tegra_periph_clk_init(clk_base, pmc_base, tegra114_clks,
> -				&pll_p_params);
> +				&pll_p_params, false);
>  }
>  
>  /* Tegra114 CPU clock and reset control functions */
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> index e81ea5b11577..c802fbcbc5fa 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1045,7 +1045,8 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
>  	clk_register_clkdev(clk, "cml1", NULL);
>  	clks[TEGRA124_CLK_CML1] = clk;
>  
> -	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params,
> +			      false);
>  }
>  
>  static void __init tegra124_pll_init(void __iomem *clk_base,
> @@ -1089,8 +1090,7 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
>  
>  	/* PLLM */
>  	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base, pmc,
> -			     CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
> -			     &pll_m_params, NULL);
> +			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
>  	clk_register_clkdev(clk, "pll_m", NULL);
>  	clks[TEGRA124_CLK_PLL_M] = clk;
>  
> @@ -1099,7 +1099,7 @@ static void __init tegra124_pll_init(void __iomem *clk_base,
>  				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
>  				8, 8, 1, NULL);
>  	clk = tegra_clk_register_pll_out("pll_m_out1", "pll_m_out1_div",
> -				clk_base + PLLM_OUT, 1, 0, CLK_IGNORE_UNUSED |
> +				clk_base + PLLM_OUT, 1, 0,
>  				CLK_SET_RATE_PARENT, 0, NULL);
>  	clk_register_clkdev(clk, "pll_m_out1", NULL);
>  	clks[TEGRA124_CLK_PLL_M_OUT1] = clk;
> @@ -1272,7 +1272,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
>  	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
>  	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
>  	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
> -	{ TEGRA124_CLK_SCLK, TEGRA124_CLK_PLL_P_OUT2, 102000000, 1 },
> +	{ TEGRA124_CLK_SCLK, TEGRA124_CLK_PLL_P_OUT2, 102000000, 0 },
>  	{ TEGRA124_CLK_DFLL_SOC, TEGRA124_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA124_CLK_DFLL_REF, TEGRA124_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA124_CLK_PLL_C, TEGRA124_CLK_CLK_MAX, 768000000, 0 },
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index e33d7548a4e9..32763dfbfaba 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -656,8 +656,7 @@ static void tegra20_pll_init(void)
>  
>  	/* PLLM */
>  	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, NULL,
> -			    CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
> -			    &pll_m_params, NULL);
> +			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
>  	clks[TEGRA20_CLK_PLL_M] = clk;
>  
>  	/* PLLM_OUT1 */
> @@ -665,7 +664,7 @@ static void tegra20_pll_init(void)
>  				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
>  				8, 8, 1, NULL);
>  	clk = tegra_clk_register_pll_out("pll_m_out1", "pll_m_out1_div",
> -				clk_base + PLLM_OUT, 1, 0, CLK_IGNORE_UNUSED |
> +				clk_base + PLLM_OUT, 1, 0,
>  				CLK_SET_RATE_PARENT, 0, NULL);
>  	clks[TEGRA20_CLK_PLL_M_OUT1] = clk;
>  
> @@ -728,7 +727,8 @@ static void tegra20_super_clk_init(void)
>  
>  	/* SCLK */
>  	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
> -			      ARRAY_SIZE(sclk_parents), CLK_SET_RATE_PARENT,
> +			      ARRAY_SIZE(sclk_parents),
> +			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
>  	clks[TEGRA20_CLK_SCLK] = clk;
>  
> @@ -819,8 +819,8 @@ static void __init tegra20_periph_clk_init(void)
>  			       CLK_SET_RATE_NO_REPARENT,
>  			       clk_base + CLK_SOURCE_EMC,
>  			       30, 2, 0, &emc_lock);
> -	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base, 0,
> -				    57, periph_clk_enb_refcnt);
> +	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base,
> +				CLK_IS_CRITICAL, 57, periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_EMC] = clk;
>  
>  	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
> @@ -865,7 +865,8 @@ static void __init tegra20_periph_clk_init(void)
>  		clks[data->clk_id] = clk;
>  	}
>  
> -	tegra_periph_clk_init(clk_base, pmc_base, tegra20_clks, &pll_p_params);
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra20_clks, &pll_p_params,
> +			      false);
>  }
>  
>  static void __init tegra20_osc_clk_init(void)
> @@ -1019,18 +1020,17 @@ static struct tegra_cpu_car_ops tegra20_cpu_car_ops = {
>  };
>  
>  static struct tegra_clk_init_table init_table[] __initdata = {
> -	{ TEGRA20_CLK_PLL_P, TEGRA20_CLK_CLK_MAX, 216000000, 1 },
> -	{ TEGRA20_CLK_PLL_P_OUT1, TEGRA20_CLK_CLK_MAX, 28800000, 1 },
> -	{ TEGRA20_CLK_PLL_P_OUT2, TEGRA20_CLK_CLK_MAX, 48000000, 1 },
> -	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
> -	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
> -	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 1 },
> -	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 1 },
> -	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 1 },
> -	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
> -	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 1 },
> +	{ TEGRA20_CLK_PLL_P, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
> +	{ TEGRA20_CLK_PLL_P_OUT1, TEGRA20_CLK_CLK_MAX, 28800000, 0 },
> +	{ TEGRA20_CLK_PLL_P_OUT2, TEGRA20_CLK_CLK_MAX, 48000000, 0 },
> +	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 0 },
> +	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 0 },
> +	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
> +	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
> +	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 0 },
> +	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 0 },
> +	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
>  	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
> -	{ TEGRA20_CLK_EMC, TEGRA20_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA20_CLK_UARTA, TEGRA20_CLK_PLL_P, 0, 0 },
>  	{ TEGRA20_CLK_UARTB, TEGRA20_CLK_PLL_P, 0, 0 },
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 9e6260869eb9..0502eba363d7 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2741,7 +2741,8 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  		*clkp = clk;
>  	}
>  
> -	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params,
> +			      false);
>  }
>  
>  static void __init tegra210_pll_init(void __iomem *clk_base,
> @@ -3025,7 +3026,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1 },
>  	{ TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1 },
> -	{ TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 1 },
> +	{ TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 0 },
>  	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
> @@ -3040,7 +3041,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA210_CLK_XUSB_DEV_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 102000000, 0 },
>  	{ TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0 },
>  	{ TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0 },
> -	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
>  	/* TODO find a way to enable this on-demand */
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index bee84c554932..54d2c3436a31 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -843,8 +843,7 @@ static void __init tegra30_pll_init(void)
>  
>  	/* PLLM */
>  	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
> -			    CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
> -			    &pll_m_params, NULL);
> +			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
>  	clks[TEGRA30_CLK_PLL_M] = clk;
>  
>  	/* PLLM_OUT1 */
> @@ -852,7 +851,7 @@ static void __init tegra30_pll_init(void)
>  				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
>  				8, 8, 1, NULL);
>  	clk = tegra_clk_register_pll_out("pll_m_out1", "pll_m_out1_div",
> -				clk_base + PLLM_OUT, 1, 0, CLK_IGNORE_UNUSED |
> +				clk_base + PLLM_OUT, 1, 0,
>  				CLK_SET_RATE_PARENT, 0, NULL);
>  	clks[TEGRA30_CLK_PLL_M_OUT1] = clk;
>  
> @@ -990,7 +989,7 @@ static void __init tegra30_super_clk_init(void)
>  	/* SCLK */
>  	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
>  				  ARRAY_SIZE(sclk_parents),
> -				  CLK_SET_RATE_PARENT,
> +				  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>  				  clk_base + SCLK_BURST_POLICY,
>  				  0, 4, 0, 0, NULL);
>  	clks[TEGRA30_CLK_SCLK] = clk;
> @@ -1093,7 +1092,8 @@ static void __init tegra30_periph_clk_init(void)
>  		clks[data->clk_id] = clk;
>  	}
>  
> -	tegra_periph_clk_init(clk_base, pmc_base, tegra30_clks, &pll_p_params);
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra30_clks, &pll_p_params,
> +			      true);
>  }
>  
>  /* Tegra30 CPU clock and reset control functions */
> @@ -1252,10 +1252,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA30_CLK_SDMMC1, TEGRA30_CLK_PLL_P, 48000000, 0 },
>  	{ TEGRA30_CLK_SDMMC2, TEGRA30_CLK_PLL_P, 48000000, 0 },
>  	{ TEGRA30_CLK_SDMMC3, TEGRA30_CLK_PLL_P, 48000000, 0 },
> -	{ TEGRA30_CLK_PLL_M, TEGRA30_CLK_CLK_MAX, 0, 1 },
> -	{ TEGRA30_CLK_PCLK, TEGRA30_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA30_CLK_CSITE, TEGRA30_CLK_CLK_MAX, 0, 1 },
> -	{ TEGRA30_CLK_EMC, TEGRA30_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA30_CLK_MSELECT, TEGRA30_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA30_CLK_SBC1, TEGRA30_CLK_PLL_P, 100000000, 0 },
>  	{ TEGRA30_CLK_SBC2, TEGRA30_CLK_PLL_P, 100000000, 0 },
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 3b2763df51c2..df1cdff58c27 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -773,7 +773,7 @@ void tegra_audio_clk_init(void __iomem *clk_base,
>  
>  void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
>  			struct tegra_clk *tegra_clks,
> -			struct tegra_clk_pll_params *pll_params);
> +			struct tegra_clk_pll_params *pll_params, bool tegra30);
>  
>  void tegra_pmc_clk_init(void __iomem *pmc_base, struct tegra_clk *tegra_clks);
>  void tegra_fixed_clk_init(struct tegra_clk *tegra_clks);
> -- 
> 2.15.1
> 
