From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk/tegra: Delete an error message for a failed memory
 allocation in three functions
Date: Fri, 29 Sep 2017 12:19:16 +0300
Message-ID: <20170929091915.GL6290@tbergstrom-lnx.Nvidia.com>
References: <9cc51853-c393-91e6-45d8-6516dde90366@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9cc51853-c393-91e6-45d8-6516dde90366-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On Wed, Sep 27, 2017 at 06:53:10PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Wed, 27 Sep 2017 18:40:34 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-audio-sync.c  | 4 +---
>  drivers/clk/tegra/clk-divider.c     | 5 +----
>  drivers/clk/tegra/clk-periph-gate.c | 4 +---
>  3 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
> index 92d04ce2dee6..62a84c883dd4 100644
> --- a/drivers/clk/tegra/clk-audio-sync.c
> +++ b/drivers/clk/tegra/clk-audio-sync.c
> @@ -62,10 +62,8 @@ struct clk *tegra_clk_register_sync_source(const char *name,
>  	struct clk *clk;
>  
>  	sync = kzalloc(sizeof(*sync), GFP_KERNEL);
> -	if (!sync) {
> -		pr_err("%s: could not allocate sync source clk\n", __func__);
> +	if (!sync)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	sync->rate = rate;
>  	sync->max_rate = max_rate;
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index 16e0aee14773..5ee9423ccac2 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -156,11 +156,8 @@ struct clk *tegra_clk_register_divider(const char *name,
>  	struct clk_init_data init;
>  
>  	divider = kzalloc(sizeof(*divider), GFP_KERNEL);
> -	if (!divider) {
> -		pr_err("%s: could not allocate fractional divider clk\n",
> -		       __func__);
> +	if (!divider)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	init.name = name;
>  	init.ops = &tegra_clk_frac_div_ops;
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 303ef32ee3f1..276cc4c59204 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -141,10 +141,8 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
>  		return ERR_PTR(-EINVAL);
>  
>  	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> -	if (!gate) {
> -		pr_err("%s: could not allocate periph gate clk\n", __func__);
> +	if (!gate)
>  		return ERR_PTR(-ENOMEM);
> -	}
>  
>  	init.name = name;
>  	init.flags = flags;
> -- 
> 2.14.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
