From: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Date: Wed, 3 Jun 2020 15:13:35 +0200
Message-ID: <20200603131335.GA3597@Red>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
 <20200603111923.3545261-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 03, 2020 at 01:19:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
> 
> This can cause SATA to fail like this:
> 
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> 
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
> 
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 583d2ac61e9e..b2d39a66f0fa 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1601,9 +1601,6 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
>  	unsigned long flags = 0;
>  	unsigned long input_rate;
>  
> -	if (clk_pll_is_enabled(hw))
> -		return 0;
> -
>  	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
>  
>  	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
> -- 
> 2.24.1
> 

Tested-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
