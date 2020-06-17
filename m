From: Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] [v2] dmaengine: tegra210-adma: Fix runtime PM imbalance
 on error
Date: Wed, 17 Jun 2020 19:50:34 +0530
Message-ID: <20200617142034.GW2324254@vkoul-mobl>
References: <20200522114824.8554-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200522114824.8554-1-dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 22-05-20, 19:48, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
> ---
> 
> Changelog:
> 
> v2: - Merge two patches that fix runtime PM imbalance in
>       tegra_adma_probe() and tegra_adma_alloc_chan_resources()
>       respectively.
> ---
>  drivers/dma/tegra210-adma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index c4ce5dfb149b..2d6e419b6eac 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -658,6 +658,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
>  
>  	ret = pm_runtime_get_sync(tdc2dev(tdc));
>  	if (ret < 0) {
> +		pm_runtime_put_sync(tdc2dev(tdc));

Pls dont use _sync() here

>  		free_irq(tdc->irq, tdc);
>  		return ret;
>  	}
> @@ -870,7 +871,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
>  
>  	ret = pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0)
> -		goto rpm_disable;
> +		goto rpm_put;
>  
>  	ret = tegra_adma_init(tdma);
>  	if (ret)
> @@ -921,7 +922,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
>  	dma_async_device_unregister(&tdma->dma_dev);
>  rpm_put:
>  	pm_runtime_put_sync(&pdev->dev);
> -rpm_disable:
>  	pm_runtime_disable(&pdev->dev);
>  irq_dispose:
>  	while (--i >= 0)
> -- 
> 2.17.1

-- 
~Vinod
