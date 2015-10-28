From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] dmaengine: tegra-apb: Correct runtime-pm usage
Date: Wed, 28 Oct 2015 16:03:47 +0900
Message-ID: <20151028070345.GF3041@vkoul-mobl.iind.intel.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
 <1444983957-18691-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444983957-18691-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2015 at 09:25:52AM +0100, Jon Hunter wrote:
> @@ -1182,14 +1182,11 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
>  {
>  	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
>  	struct tegra_dma *tdma = tdc->tdma;
> -	int ret;
>  
>  	dma_cookie_init(&tdc->dma_chan);
>  	tdc->config_init = false;
> -	ret = clk_prepare_enable(tdma->dma_clk);
> -	if (ret < 0)
> -		dev_err(tdc2dev(tdc), "clk_prepare_enable failed: %d\n", ret);
> -	return ret;
> +
> +	return pm_runtime_get_sync(tdma->dev);

Alloc channel is supposed to return number of descriptors allocated and if
pm_runtime_get_sync() returns postive values we get wrong return!

>  	pm_runtime_enable(&pdev->dev);
> -	if (!pm_runtime_enabled(&pdev->dev)) {
> +	if (!pm_runtime_enabled(&pdev->dev))
>  		ret = tegra_dma_runtime_resume(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "dma_runtime_resume failed %d\n",
> -				ret);
> -			goto err_pm_disable;
> -		}
> -	}
> +	else
> +		ret = pm_runtime_get_sync(&pdev->dev);

do we need pm_runtime_get() here, should we use pm_request_resume() ?

>  static int tegra_dma_pm_suspend(struct device *dev)
>  {
>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -	int i;
> -	int ret;
> +	int i, ret;
>  
>  	/* Enable clock before accessing register */
> -	ret = tegra_dma_runtime_resume(dev);
> +	ret = pm_runtime_get_sync(dev);

If you are runtime suspended then core will runtime resume you before
invoking suspend, so why do we need this

-- 
~Vinod
