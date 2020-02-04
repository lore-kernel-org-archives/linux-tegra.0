From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 10/19] dmaengine: tegra-apb: Remove assumptions about
 unavailable runtime PM
Date: Tue, 4 Feb 2020 14:51:18 +0000
Message-ID: <9671058d-6fe1-2d1b-9aca-3d943dafeb04@nvidia.com>
References: <20200202222854.18409-1-digetx@gmail.com>
 <20200202222854.18409-11-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200202222854.18409-11-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/02/2020 22:28, Dmitry Osipenko wrote:
> The runtime PM is always available on all Tegra SoCs since the commit
> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"), so there is no
> need to handle the case of unavailable RPM in the code anymore.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 7158bd3145c4..22b88ccff05d 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1429,11 +1429,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  	spin_lock_init(&tdma->global_lock);
>  
>  	pm_runtime_enable(&pdev->dev);
> -	if (!pm_runtime_enabled(&pdev->dev))
> -		ret = tegra_dma_runtime_resume(&pdev->dev);
> -	else
> -		ret = pm_runtime_get_sync(&pdev->dev);
>  
> +	ret = pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0)
>  		goto err_pm_disable;
>  
> @@ -1546,8 +1543,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  
>  err_pm_disable:
>  	pm_runtime_disable(&pdev->dev);
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		tegra_dma_runtime_suspend(&pdev->dev);
>  
>  	return ret;
>  }
> @@ -1557,10 +1552,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
>  	struct tegra_dma *tdma = platform_get_drvdata(pdev);
>  
>  	dma_async_device_unregister(&tdma->dma_dev);
> -
>  	pm_runtime_disable(&pdev->dev);
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		tegra_dma_runtime_suspend(&pdev->dev);
>  
>  	return 0;
>  }
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
