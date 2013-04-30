From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement suspend/resume callbacks
Date: Tue, 30 Apr 2013 16:00:46 +0530
Message-ID: <20130430103046.GD1960@intel.com>
References: <1366797267-29567-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366797267-29567-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: djbw-b10kYP2dOMg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 24, 2013 at 03:24:27PM +0530, Laxman Dewangan wrote:
> Implement suspend/resume callbacks to store APB DMA channel's
> register on suspend and restore APB DMA channel's register on
> resume.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c |   65 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 65 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 5a0b66c..ce19340 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -30,6 +30,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/clk/tegra.h>
> @@ -199,6 +200,7 @@ struct tegra_dma_channel {
>  
>  	/* Channel-slave specific configuration */
>  	struct dma_slave_config dma_sconfig;
> +	struct tegra_dma_channel_regs	channel_reg;
>  };
>  
>  /* tegra_dma: Tegra DMA specific information */
> @@ -1440,11 +1442,74 @@ static int tegra_dma_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_dma_pm_suspend(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	/* Enable clock before accessing register */
> +	ret = tegra_dma_runtime_resume(dev);
> +	if (ret < 0)
> +		return ret;
You dont seem to handle suspend when DMA is active? Otherwise looks fine.
Stephen, you okay with this patch?

--
~Vinod
> +
> +	tdma->reg_gen = tdma_read(tdma, TEGRA_APBDMA_GENERAL);
> +	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
> +		struct tegra_dma_channel *tdc = &tdma->channels[i];
> +		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
> +
> +		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
> +		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
> +		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
> +		ch_reg->ahb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBSEQ);
> +		ch_reg->apb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBSEQ);
> +	}
> +
> +	/* Disable clock */
> +	tegra_dma_runtime_suspend(dev);
> +	return 0;
> +}
> +
> +static int tegra_dma_pm_resume(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	int i;
> +	int ret;
> +
> +	/* Enable clock before accessing register */
> +	ret = tegra_dma_runtime_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	tdma_write(tdma, TEGRA_APBDMA_GENERAL, tdma->reg_gen);
> +	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> +	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
> +
> +	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
> +		struct tegra_dma_channel *tdc = &tdma->channels[i];
> +		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
> +
> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_reg->apb_seq);
> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_reg->apb_ptr);
> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBSEQ, ch_reg->ahb_seq);
> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, ch_reg->ahb_ptr);
> +		tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
> +			(ch_reg->csr & ~TEGRA_APBDMA_CSR_ENB));
> +	}
> +
> +	/* Disable clock */
> +	tegra_dma_runtime_suspend(dev);
> +	return 0;
> +}
> +#endif
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>  #ifdef CONFIG_PM_RUNTIME
>  	.runtime_suspend = tegra_dma_runtime_suspend,
>  	.runtime_resume = tegra_dma_runtime_resume,
>  #endif
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_pm_suspend, tegra_dma_pm_resume)
>  };
>  
>  static struct platform_driver tegra_dmac_driver = {
> -- 
> 1.7.1.1
> 
