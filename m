From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RESEND] stable request: 4.4.y: 797097301860 ("clk: tegra: Fix
 PLL_U post divider and initial rate on Tegra30")
Date: Mon, 23 Jul 2018 11:02:27 +0100
Message-ID: <05a79508-f7f7-f949-c71f-efb747bb3ec0@nvidia.com>
References: <1532339946-12250-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1532339946-12250-1-git-send-email-jonathanh@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-tegra@vger.kernel.org, Lucas Stach <dev@lynxeye.de>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Correcting the stable ML address ...

On 23/07/18 10:59, Jon Hunter wrote:
> Please include the following fix for stable v4.4.y. If the PLL_U is not
> configured by the bootloader, then without this change it will not be
> configured by the kernel and this will cause USB host support to fail
> which uses the PLL_U for its clock.
> 
> Please note that this patch did not apply cleanly to v4.4.y, so I have
> back-ported, but the resulting change is the same as the original.
> 
>>From 797097301860c64b63346d068ba4fe4992bd5021 Mon Sep 17 00:00:00 2001
> From: Lucas Stach <dev@lynxeye.de>
> Date: Mon, 29 Feb 2016 21:46:07 +0100
> Subject: [PATCH] clk: tegra: Fix PLL_U post divider and initial rate on
>  Tegra30
> 
> commit 797097301860c64b63346d068ba4fe4992bd5021 upstream
> 
> The post divider value in the frequency table is wrong as it would lead
> to the PLL producing an output rate of 960 MHz instead of the desired
> 480 MHz. This wasn't a problem as nothing used the table to actually
> initialize the PLL rate, but the bootloader configuration was used
> unaltered.
> 
> If the bootloader does not set up the PLL it will fail to come when used
> under Linux. To fix this don't rely on the bootloader, but set the
> correct rate in the clock driver.
> 
> Change-Id: I9375c24ef0d48b1b98be10378e8d593299b0453b
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> [jonathanh@nvidia.com: Back-ported to stable v4.4.y]
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index 8c41c6fcb9ee..acf83569f86f 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -333,11 +333,11 @@ static struct pdiv_map pllu_p[] = {
>  };
>  
>  static struct tegra_clk_pll_freq_table pll_u_freq_table[] = {
> -	{ 12000000, 480000000, 960, 12, 0, 12},
> -	{ 13000000, 480000000, 960, 13, 0, 12},
> -	{ 16800000, 480000000, 400, 7,  0, 5},
> -	{ 19200000, 480000000, 200, 4,  0, 3},
> -	{ 26000000, 480000000, 960, 26, 0, 12},
> +	{ 12000000, 480000000, 960, 12, 2, 12 },
> +	{ 13000000, 480000000, 960, 13, 2, 12 },
> +	{ 16800000, 480000000, 400,  7, 2,  5 },
> +	{ 19200000, 480000000, 200,  4, 2,  3 },
> +	{ 26000000, 480000000, 960, 26, 2, 12 },
>  	{ 0, 0, 0, 0, 0, 0 },
>  };
>  
> @@ -1372,6 +1372,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{TEGRA30_CLK_GR2D, TEGRA30_CLK_PLL_C, 300000000, 0},
>  	{TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0},
>  	{TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0},
> +	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
>  	{TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0}, /* This MUST be the last entry. */
>  };
>  
> 

-- 
nvpublic
