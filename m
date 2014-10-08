From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk/tegra: Fix mux typo, s/pll_m/clk_m/
Date: Wed, 8 Oct 2014 18:13:19 +0300
Message-ID: <20141008151319.GE4809@tbergstrom-lnx.Nvidia.com>
References: <1410361925-19739-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410361925-19739-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 10, 2014 at 08:12:05AM -0700, Sean Paul wrote:
> Fixes a typo in the mux_pllp_pllc_clkm table which had
> pll_m instead of clk_m.
> 

Looks fine. I will take this for the next merge.

> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> index 37f32c4..d3d208d 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -303,7 +303,7 @@ static const char *mux_pllm_pllc_pllp_plla[] = {
>  #define mux_pllm_pllc_pllp_plla_idx mux_pllp_pllc_pllm_clkm_idx
>  
>  static const char *mux_pllp_pllc_clkm[] = {
> -	"pll_p", "pll_c", "pll_m"
> +	"pll_p", "pll_c", "clk_m"
>  };
>  static u32 mux_pllp_pllc_clkm_idx[] = {
>  	[0] = 0, [1] = 1, [2] = 3,

Thanks!

Peter.
