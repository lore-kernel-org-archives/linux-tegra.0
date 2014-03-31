From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix PLLE programming
Date: Mon, 31 Mar 2014 10:51:38 -0600
Message-ID: <53399D1A.4070301@wwwdotorg.org>
References: <1396277142-18292-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396277142-18292-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/31/2014 08:45 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> PLLE has M, N and P divider shift and width parameters that differ from
> the defaults. Furthermore, when clearing the M, N and P divider fields
> the corresponding masks were never shifted, thereby clearing only the
> lowest bits of the register. This lead to a situation where the PLLE
> programming would only work if the register hadn't been touched before.

> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c

> @@ -730,8 +730,10 @@ static int clk_plle_enable(struct clk_hw *hw)
>  	if (pll->params->flags & TEGRA_PLLE_CONFIGURE) {
>  		/* configure dividers */
>  		val = pll_readl_base(pll);
> -		val &= ~(divm_mask(pll) | divn_mask(pll) | divp_mask(pll));
> -		val &= ~(PLLE_BASE_DIVCML_WIDTH << PLLE_BASE_DIVCML_SHIFT);
> +		val &= ~(divp_mask(pll) << PLLE_BASE_DIVP_SHIFT |
> +			 divn_mask(pll) << PLLE_BASE_DIVN_SHIFT |
> +			 divm_mask(pll) << PLLE_BASE_DIVM_SHIFT);

Shouldn't those shift values also be a macro/inline like
divm_shift(pll), since ...

> +static struct div_nmp pll_e_nmp = {
> +	.divn_shift = PLLE_BASE_DIVN_SHIFT,
> +	.divn_width = PLLE_BASE_DIVN_WIDTH,
> +	.divm_shift = PLLE_BASE_DIVM_SHIFT,
> +	.divm_width = PLLE_BASE_DIVM_WIDTH,
> +	.divp_shift = PLLE_BASE_DIVP_SHIFT,
> +	.divp_width = PLLE_BASE_DIVP_WIDTH,
> +};

... that table contains parameters for both width and shift values, not
just width values?
