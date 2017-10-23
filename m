From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Mon, 23 Oct 2017 14:57:03 +0300
Message-ID: <20171023115703.GR27164@tbergstrom-lnx.Nvidia.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508757172-13030-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 23, 2017 at 12:12:52PM +0100, Jon Hunter wrote:
> Commit a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
> fixed the parent clock for APBDMA, but the consequence of this that
> after probing the APBDMA device, the APB Clock (or PCLK) is now
> disabled. Disabling the APB clock causes accesses to any other device
> on the APB to hang and prevent Tegra from booting.
> 
> Currently, the APB clock is registered with the flag "CLK_IGNORE_UNUSED"
> to prevent the clock being disabled if unused on boot. However, even
> if it is used, it still needs to be always kept enabled and so update
> the flag for the APB clock to be "CLK_IS_CRITICAL".
> 
> Fixes: a140614373ae ("clk: tegra: Correct parent of the APBDMA clock")
> 
> Suggested-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index 4f6fd307cb70..10047107c1dc 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -166,7 +166,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>  				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
>  				   &sysrate_lock);
>  	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
> -				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
> +				CLK_IS_CRITICAL, clk_base + SYSTEM_CLK_RATE,
>  				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
>  	*dt_clk = clk;
>  }
> -- 
> 2.7.4
> 
