From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: tegra: fix pll_a1 iddq register, add pll_a1
Date: Wed, 22 Feb 2017 18:38:52 +0200
Message-ID: <67a5d147-b6ed-256b-a269-29456043a20c@kapsi.fi>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
 <1487776444-4701-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487776444-4701-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 02/22/2017 05:13 PM, Peter De Schrijver wrote:
> pll_a1 was using CLK_RST_CONTROLLER_PLLA1_MISC_0 for IDDQ control rather
> than the correct register CLK_RST_CONTROLLER_PLLA1_MISC_1. Also add pll_a1
> to the set of clocks defined for Tegra210.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 2896d2e..2ef8d49 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -1772,7 +1772,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
>  	.misc_reg = PLLA1_MISC0,
>  	.lock_mask = PLLCX_BASE_LOCK,
>  	.lock_delay = 300,
> -	.iddq_reg = PLLA1_MISC0,
> +	.iddq_reg = PLLA1_MISC1,
>  	.iddq_bit_idx = PLLCX_IDDQ_BIT,
>  	.reset_reg = PLLA1_MISC0,
>  	.reset_bit_idx = PLLCX_RESET_BIT,
> @@ -2209,6 +2209,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
>  	[tegra_clk_pll_c4_out2] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT2, .present = true },
>  	[tegra_clk_pll_c4_out3] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT3, .present = true },
>  	[tegra_clk_apb2ape] = { .dt_id = TEGRA210_CLK_APB2APE, .present = true },
> +	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
>  };
>
>  static struct tegra_devclk devclks[] __initdata = {
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
