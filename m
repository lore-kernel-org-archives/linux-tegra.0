From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] soc/tegra: Fix wrong pointer passed to PTR_ERR()
Date: Mon, 24 Apr 2017 15:47:39 +0100
Message-ID: <119b4516-5daa-6827-5f5b-270332c218f3@nvidia.com>
References: <20170416040655.10237-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170416040655.10237-1-weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/04/17 05:06, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: 841fd94c43a4 ("soc/tegra: flowctrl: Add basic platform driver")
> Signed-off-by: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/flowctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
> index 0e345c0..5433cc7 100644
> --- a/drivers/soc/tegra/flowctrl.c
> +++ b/drivers/soc/tegra/flowctrl.c
> @@ -157,7 +157,7 @@ static int tegra_flowctrl_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	tegra_flowctrl_base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tegra_flowctrl_base))
> -		return PTR_ERR(base);
> +		return PTR_ERR(tegra_flowctrl_base);
>  
>  	iounmap(base);

Thanks. However, we have already received a fix for this here [0].

Jon

[0] https://patchwork.ozlabs.org/patch/749329/

-- 
nvpublic
