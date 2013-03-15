From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Allow PLLE training to succeed
Date: Fri, 15 Mar 2013 11:28:05 +0200
Message-ID: <20130315092805.GU18519@tbergstrom-lnx.Nvidia.com>
References: <1363274825-2439-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363274825-2439-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 14, 2013 at 04:27:05PM +0100, Thierry Reding wrote:
> Under some circumstances the PLLE needs to be retrained, in which case
> access to the PMC registers is required. Fix this by passing a pointer
> to the PMC registers instead of NULL when registering the PLLE clock.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index b92d48b..bf19400 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -703,7 +703,7 @@ static void tegra20_pll_init(void)
>  	clks[pll_a_out0] = clk;
>  
>  	/* PLLE */
> -	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base, NULL,
> +	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base, pmc_base,
>  			     0, 100000000, &pll_e_params,
>  			     0, pll_e_freq_table, NULL);
>  	clk_register_clkdev(clk, "pll_e", NULL);

Cheers,

Peter.
