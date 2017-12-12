From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 2/2] clk: tegra20: Correct PLL_C_OUT1 setup
Date: Tue, 12 Dec 2017 12:15:36 +0200
Message-ID: <20171212101536.GY32106@tbergstrom-lnx.Nvidia.com>
References: <09480d74d240d8e77b3989cfe85e6e624eaee866.1513018140.git.digetx@gmail.com>
 <4c15ac578fd847bc4047384ae2f8cadd6b9e9fe4.1513018140.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4c15ac578fd847bc4047384ae2f8cadd6b9e9fe4.1513018140.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 11, 2017 at 09:50:12PM +0300, Dmitry Osipenko wrote:
> PLL_C_OUT_1 can't produce 216 MHz defined in the init_table. Let's
> set it to 240 MHz and explicitly specify HCLK rate for consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index 32763dfbfaba..c39e7e2446d8 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1026,9 +1026,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 0 },
>  	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 0 },
>  	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
> -	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 216000000, 0 },
> -	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 0, 0 },
> -	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 0 },
> +	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
> +	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 240000000, 0 },
> +	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
>  	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
>  	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
> -- 
> 2.15.1
> 
