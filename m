From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Fri, 20 Nov 2015 11:43:45 -0500
Message-ID: <564F4DC1.4090604@nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/20/2015 10:11 AM, Jon Hunter wrote:
> The _clk_disable_pll() function will attempt to place a PLL into bypass
> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
> by clearing the enable bit. To place the PLL into bypass, the bypass bit
> needs to be set and not cleared. Fix this by setting the bypass bit and
> not clearing it.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index d6d4ecb88e94..e5aa9c87df4c 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -312,7 +312,7 @@ static void _clk_pll_disable(struct clk_hw *hw)
>  
>  	val = pll_readl_base(pll);
>  	if (pll->params->flags & TEGRA_PLL_BYPASS)
> -		val &= ~PLL_BASE_BYPASS;
> +		val |= PLL_BASE_BYPASS;
>  	val &= ~PLL_BASE_ENABLE;
>  	pll_writel_base(val, pll);
>  
> 


Good catch.

Acked-by: Rhyland Klein <rklein@nvidia.com>


-- 
nvpublic
