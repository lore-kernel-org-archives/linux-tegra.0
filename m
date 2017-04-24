From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: Fix wrong pointer passed to PTR_ERR()
Date: Mon, 24 Apr 2017 15:49:34 +0100
Message-ID: <8071529f-069b-774f-04ed-3cea345b0aa9@nvidia.com>
References: <20170416040810.10476-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170416040810.10476-1-weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/04/17 05:08, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: b386c6b73ac6 ("gpu: host1x: Support module reset")
> Signed-off-by: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index f05ebb1..ac65f52 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -172,7 +172,7 @@ static int host1x_probe(struct platform_device *pdev)
>  
>  	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
>  	if (IS_ERR(host->rst)) {
> -		err = PTR_ERR(host->clk);
> +		err = PTR_ERR(host->rst);
>  		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
>  		return err;
>  	}

Thanks. However, we have already received a fix for this [0].

Cheers
Jon

[0] https://patchwork.kernel.org/patch/9674417/

-- 
nvpublic
