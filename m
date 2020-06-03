From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Date: Wed, 3 Jun 2020 17:04:12 +0300
Message-ID: <0433a4b9-f5a4-e92f-7101-cbc4e1e6ef8d@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
 <20200603111923.3545261-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200603111923.3545261-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

03.06.2020 14:19, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
> Reported-by: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
> 

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
