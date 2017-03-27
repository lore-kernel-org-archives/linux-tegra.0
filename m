From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/7] clk: tegra: don't warn for PLL defaults
 unnecessarily
Date: Mon, 27 Mar 2017 12:02:28 +0100
Message-ID: <b26752ac-5375-86af-8ce8-0be97b99c734@nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
 <1487846686-6388-6-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487846686-6388-6-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On 23/02/17 10:44, Peter De Schrijver wrote:
> If the PLL is on, only warn if the defaults are not yet set. Otherwise be
> silent.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index b7ef8a7..fe698d2 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -502,7 +502,7 @@ static void tegra210_pllcx_set_defaults(const char *name,
>  	pllcx->params->defaults_set = true;
>  
>  	if (readl_relaxed(clk_base + pllcx->params->base_reg) &
> -			PLL_ENABLE) {
> +			PLL_ENABLE && !pllcx->params->defaults_set) {
>  		/* PLL is ON: only check if defaults already set */
>  		pllcx_check_defaults(pllcx->params);
>  		pr_warn("%s already enabled. Postponing set full defaults\n",

The above hunk is causing the Tegra210 Smaug boot to fail. Looking more
at the code, I believe that the above hunk is not correct, because
'defaults_set' is always true and this is now causing us to always reset
the PLL if in-use or not. I will send a patch to correct this.

Cheers
Jon

-- 
nvpublic
