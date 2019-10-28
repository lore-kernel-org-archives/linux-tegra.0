From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 1/2] clk: tegra: divider: Add missing check for
 enable-bit on rate's recalculation
Date: Mon, 28 Oct 2019 16:27:53 +0200
Message-ID: <20191028142753.GC27141@pdeschrijver-desktop.Nvidia.com>
References: <20190723025245.27754-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723025245.27754-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 23, 2019 at 05:52:44AM +0300, Dmitry Osipenko wrote:
> Unset "enable" bit means that divider is in bypass mode, hence it doesn't
> have any effect in that case. Please note that there are no known bugs
> caused by the missing check.
> 

Technically this is not quite true, but for the purposes of CCF you can
treat it that way. This bits defines if the value in the lower 16 bits
of the divider register is used to configure the divider or if the
contents of the UART DLM/DLL registers is used. So the divider isn't
actually bypassed, it's just configured differently.
In practice this bit is only set when the divider is non-zero when doing
set rate. So the extra test isn't strictly needed as long as the sw
running before the kernel also ensures the bit is only set when the
divider is non-zero.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v2: Changed the commit's description from 'Fix' to 'Add' in response to the
>     Stephen's Boyd question about the need to backport the patch into stable
>     kernels. The backporting is not really needed.
> 
>  drivers/clk/tegra/clk-divider.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index e76731fb7d69..f33c19045386 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -40,8 +40,13 @@ static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
>  	int div, mul;
>  	u64 rate = parent_rate;
>  
> -	reg = readl_relaxed(divider->reg) >> divider->shift;
> -	div = reg & div_mask(divider);
> +	reg = readl_relaxed(divider->reg);
> +
> +	if ((divider->flags & TEGRA_DIVIDER_UART) &&
> +	    !(reg & PERIPH_CLK_UART_DIV_ENB))
> +		return rate;
> +
> +	div = (reg >> divider->shift) & div_mask(divider);
>  
>  	mul = get_mul(divider);
>  	div += mul;
> -- 
> 2.22.0
> 
