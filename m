From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] cloclsource: tegra: cosmetic: Fix error message
Date: Mon, 17 Dec 2012 11:32:30 +0200
Message-ID: <20121217093230.GE19258@tbergstrom-lnx.Nvidia.com>
References: <1355726004-16137-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1355726004-16137-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 17, 2012 at 07:33:24AM +0100, Hiroshi Doyu wrote:
> Add missing \n.

Maybe also fix the typo in the subject? :)

> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Based on Stephen's arm_timer_rework tree
> ---
>  drivers/clocksource/tegra20_timer.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
> index 3b2f947..5bc1429 100644
> --- a/drivers/clocksource/tegra20_timer.c
> +++ b/drivers/clocksource/tegra20_timer.c
> @@ -179,7 +179,7 @@ static void __init tegra20_init_timer(void)
>  
>  	timer_reg_base = of_iomap(np, 0);
>  	if (!timer_reg_base) {
> -		pr_err("Can't map timer registers");
> +		pr_err("Can't map timer registers\n");
>  		BUG();
>  	}

Cheers,

Peter.
