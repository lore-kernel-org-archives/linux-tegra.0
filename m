From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: add missing clk_disable_unprepare()
 on error in host1x_probe()
Date: Mon, 28 Oct 2013 10:24:51 +0200
Message-ID: <526E1F53.2070900@nvidia.com>
References: <CAPgLHd_Tw1Os0mT1NgcipJ+fhhbsS+s-Ba-tksUXqFV2cY_ZjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPgLHd_Tw1Os0mT1NgcipJ+fhhbsS+s-Ba-tksUXqFV2cY_ZjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: "yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org" <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.10.2013 08:37, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> 
> Add the missing clk_disable_unprepare() before return
> from host1x_probe() in the error handling case.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 12d6333..646a333 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -154,7 +154,7 @@ static int host1x_probe(struct platform_device *pdev)
>  	err = host1x_syncpt_init(host);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to initialize syncpts\n");
> -		return err;
> +		goto fail_unprepare_disable;
>  	}
>  
>  	err = host1x_intr_init(host, syncpt_irq);
> @@ -175,6 +175,8 @@ fail_deinit_intr:
>  	host1x_intr_deinit(host);
>  fail_deinit_syncpt:
>  	host1x_syncpt_deinit(host);
> +fail_unprepare_disable:
> +	clk_disable_unprepare(host->clk);
>  	return err;
>  }

Looks good.

Reviewed-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Terje
