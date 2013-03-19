From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/3] ARM: tegra: get PMC clock source from DT
Date: Tue, 19 Mar 2013 10:40:51 -0600
Message-ID: <51489513.1020107@wwwdotorg.org>
References: <1363594199-10974-1-git-send-email-josephl@nvidia.com> <1363594199-10974-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594199-10974-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:09 AM, Joseph Lo wrote:
> The clock source of PMC should be PCLK and gotten from DT.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * new in this change

s/change/series/ ???

> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c

>  void __init tegra_dt_init_irq(void)
>  {
>  	tegra_clocks_init();
> +	tegra_pmc_init();
>  	tegra_init_irq();
>  	irqchip_init();
>  }
> @@ -100,7 +101,6 @@ void __init tegra_init_early(void)
>  	tegra_apb_io_init();
>  	tegra_init_fuse();
>  	tegra_init_cache();
> -	tegra_pmc_init();

This change isn't mentioned in the commit description.

Why is this change needed? We should minimize the amount of code in
tegra_dt_init_irq(), not add more code there.

> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c

> @@ -151,6 +153,8 @@ static void tegra_pmc_parse_dt(void)
>  
>  	tegra_pmc_invert_interrupt = of_property_read_bool(np,
>  				     "nvidia,invert-interrupt");
> +	tegra_pclk = of_clk_get(np, 0);
> +	WARN_ON_ONCE(IS_ERR(tegra_pclk));

Why WARN_ON_ONCE(); is tegra_pmc_parse_dt() called more than once?

Can the code continue if IS_ERR(tegra_pclk), or is that fatal?
