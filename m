From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra-apb: Really fix runtime-pm usage
Date: Tue, 6 Jun 2017 12:51:55 +0300
Message-ID: <a98d0284-8778-6f0d-e4cb-268ac7e90248@kapsi.fi>
References: <1496739573-26565-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496739573-26565-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.06.2017 11:59, Jon Hunter wrote:
> Commit edd3bdbe9db1 ("dmaengine: tegra-apb: Correct runtime-pm usage")
> added pm_runtime_get/put() calls to the tegra-apb DMA system suspend
> callbacks. Runtime PM is disabled during system suspend and so these
> APIs cannot be used. Fix the suspend handling for the tegra-apb DMA by
> moving the save and restore of the DMA register context into the
> runtime PM suspend and resume callbacks, and then use the
> pm_runtime_force_suspend/resume() APIs to invoke the runtime PM
> callbacks during system suspend.
>
> Fixes: edd3bdbe9db1 ("dmaengine: tegra-apb: Correct runtime-pm usage")
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 57 +++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3722b9d8d9fe..5c3ddd61dc3b 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1494,35 +1494,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
>  static int tegra_dma_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -
> -	clk_disable_unprepare(tdma->dma_clk);
> -	return 0;
> -}
> -
> -static int tegra_dma_runtime_resume(struct device *dev)
> -{
> -	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret = clk_prepare_enable(tdma->dma_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "clk_enable failed: %d\n", ret);
> -		return ret;
> -	}
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int tegra_dma_pm_suspend(struct device *dev)
> -{
> -	struct tegra_dma *tdma = dev_get_drvdata(dev);
>  	int i;
> -	int ret;
> -
> -	/* Enable clock before accessing register */
> -	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> -		return ret;
>
>  	tdma->reg_gen = tdma_read(tdma, TEGRA_APBDMA_GENERAL);
>  	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
> @@ -1543,21 +1515,21 @@ static int tegra_dma_pm_suspend(struct device *dev)
>  						  TEGRA_APBDMA_CHAN_WCOUNT);
>  	}
>
> -	/* Disable clock */
> -	pm_runtime_put(dev);
> +	clk_disable_unprepare(tdma->dma_clk);
> +
>  	return 0;
>  }
>
> -static int tegra_dma_pm_resume(struct device *dev)
> +static int tegra_dma_runtime_resume(struct device *dev)
>  {
>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -	int i;
> -	int ret;
> +	int i, ret;
>
> -	/* Enable clock before accessing register */
> -	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	ret = clk_prepare_enable(tdma->dma_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "clk_enable failed: %d\n", ret);
>  		return ret;
> +	}
>
>  	tdma_write(tdma, TEGRA_APBDMA_GENERAL, tdma->reg_gen);
>  	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> @@ -1582,10 +1554,19 @@ static int tegra_dma_pm_resume(struct device *dev)
>  			(ch_reg->csr & ~TEGRA_APBDMA_CSR_ENB));
>  	}
>
> -	/* Disable clock */
> -	pm_runtime_put(dev);
>  	return 0;
>  }
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_dma_pm_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int tegra_dma_pm_resume(struct device *dev)
> +{
> +	return pm_runtime_force_resume(dev);
> +}
>  #endif

You could just have SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, 
pm_runtime_force_resume)

>
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>

Cheers,
Mikko
