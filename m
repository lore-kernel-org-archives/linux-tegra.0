From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] clk: tegra: read correct iddq register in PLL_SS
 registration
Date: Wed, 20 May 2015 13:15:46 -0400
Message-ID: <555CC142.3010707@nvidia.com>
References: <1431946983-29554-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431946983-29554-1-git-send-email-bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/18/2015 7:03 AM, Bill Huang wrote:
> This fixes bug in tegra_clk_register_pllss() which mistakenly assume the
> iddq register is the PLL base address.
> 
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 05c6d08..f225325 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1826,7 +1826,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
>  	struct clk *clk, *parent;
>  	struct tegra_clk_pll_freq_table cfg;
>  	unsigned long parent_rate;
> -	u32 val;
> +	u32 val, val_iddq;
>  	int i;
>  
>  	if (!pll_params->div_nmp)
> @@ -1874,14 +1874,17 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
>  	pll_writel(PLLSS_CTRL1_DEFAULT, pll_params->ext_misc_reg[2], pll);
>  
>  	val = pll_readl_base(pll);
> +	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);

You could/should likely use pll_readl(pll_params->iddq_reg, pll) here.

>  	if (val & PLL_BASE_ENABLE) {
> -		if (val & BIT(pll_params->iddq_bit_idx)) {
> +		if (val_iddq & BIT(pll_params->iddq_bit_idx)) {
>  			WARN(1, "%s is on but IDDQ set\n", name);
>  			kfree(pll);
>  			return ERR_PTR(-EINVAL);
>  		}
> -	} else
> -		val |= BIT(pll_params->iddq_bit_idx);
> +	} else {
> +		val_iddq |= BIT(pll_params->iddq_bit_idx);
> +		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);

likewise you can use pll_writel(val_iddq, pll_params->iddq_reg, pll) here.

-rhyland


-- 
nvpublic
