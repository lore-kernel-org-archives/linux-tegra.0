From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 3/4] clk: tegra20: Set correct parents for CDEV1/2
 clocks
Date: Mon, 30 Apr 2018 10:46:44 +0300
Message-ID: <20180430074644.GL6835@tbergstrom-lnx.Nvidia.com>
References: <20180426235818.10018-1-digetx@gmail.com>
 <20180426235818.10018-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426235818.10018-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 27, 2018 at 02:58:17AM +0300, Dmitry Osipenko wrote:
> Parents of CDEV1/2 clocks are determined by muxing of the corresponding
> pins. Pinctrl driver now provides the CDEV1/2 clock muxes and hence
> CDEV1/2 clocks could have correct parents. Set CDEV1/2 parents to the
> corresponding muxes to fix the parents.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-By:  Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index 16cf4108f2ff..7e8b6de86d89 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -844,14 +844,12 @@ static void __init tegra20_periph_clk_init(void)
>  			     CLK_DIVIDER_POWER_OF_TWO, NULL);
>  
>  	/* cdev1 */
> -	clk = clk_register_fixed_rate(NULL, "cdev1_fixed", NULL, 0, 26000000);
> -	clk = tegra_clk_register_periph_gate("cdev1", "cdev1_fixed", 0,
> +	clk = tegra_clk_register_periph_gate("cdev1", "cdev1_mux", 0,
>  				    clk_base, 0, 94, periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_CDEV1] = clk;
>  
>  	/* cdev2 */
> -	clk = clk_register_fixed_rate(NULL, "cdev2_fixed", NULL, 0, 26000000);
> -	clk = tegra_clk_register_periph_gate("cdev2", "cdev2_fixed", 0,
> +	clk = tegra_clk_register_periph_gate("cdev2", "cdev2_mux", 0,
>  				    clk_base, 0, 93, periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_CDEV2] = clk;
>  
> -- 
> 2.17.0
> 
