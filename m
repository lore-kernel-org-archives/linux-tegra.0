From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Use consistent naming for PM domains
Date: Tue, 8 Nov 2016 10:15:13 +0000
Message-ID: <02788d38-3236-d7f7-e4bb-197abe983f75@nvidia.com>
References: <20161108100807.5114-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108100807.5114-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 08/11/16 10:08, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The various error messages refer to the PM domains as "power domain",
> "genpd" and "PM domain". That's confusing, so convert all error messages
> to use the most prominent: "PM domain".
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 84d1623d8d79..933b06abe8a2 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -867,19 +867,19 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>  
>  	err = pm_genpd_init(&pg->genpd, NULL, off);
>  	if (err < 0) {
> -		pr_err("failed to initialise power domain %s: %d\n", np->name,
> +		pr_err("failed to initialise PM domain %s: %d\n", np->name,
>  		       err);
>  		goto remove_resets;
>  	}
>  
>  	err = of_genpd_add_provider_simple(np, &pg->genpd);
>  	if (err < 0) {
> -		pr_err("failed to add genpd provider for %s: %d\n", np->name,
> -		       err);
> +		pr_err("failed to add PM domain provider for %s: %d\n",
> +		       np->name, err);
>  		goto remove_genpd;
>  	}
>  
> -	pr_debug("added power domain %s\n", pg->genpd.name);
> +	pr_debug("added PM domain %s\n", pg->genpd.name);
>  
>  	return;

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
