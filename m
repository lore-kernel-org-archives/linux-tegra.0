From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 11/14] dmaengine: tegra-apb: Clean up suspend-resume
Date: Wed, 22 Jan 2020 00:23:06 +0300
Message-ID: <7e0d2cfa-5570-93e6-e3dc-7d3f6902a528@gmail.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112173006.29863-12-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.01.2020 20:30, Dmitry Osipenko пишет:
> It is enough to check whether hardware is busy on suspend and to reset
> it across of suspend-resume because channel's configuration is fully
> re-programmed on each DMA transaction anyways and because save-restore
> of an active channel won't end up well without pausing transfer prior to
> saving of the state (note that all channels shall be idling at the time of
> suspend, so save-restore is not needed at all).
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/dma/tegra20-apb-dma.c | 131 +++++++++++++++++-----------------
>  1 file changed, 67 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index b9d8e57eaf54..398a0e1d6506 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1392,6 +1392,36 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
>  	.support_separate_wcount_reg = true,
>  };
>  
> +static int tegra_dma_init_hw(struct tegra_dma *tdma)
> +{
> +	int err;
> +
> +	err = reset_control_assert(tdma->rst);
> +	if (err) {
> +		dev_err(tdma->dev, "failed to assert reset: %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_enable(tdma->dma_clk);
> +	if (err) {
> +		dev_err(tdma->dev, "failed to enable clk: %d\n", err);
> +		return err;
> +	}
> +
> +	/* reset DMA controller */
> +	udelay(2);
> +	reset_control_deassert(tdma->rst);
> +
> +	/* enable global DMA registers */
> +	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
> +	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> +	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFF);
> +
> +	clk_disable(tdma->dma_clk);
> +
> +	return 0;
> +}
> +
>  static int tegra_dma_probe(struct platform_device *pdev)
>  {
>  	const struct tegra_dma_chip_data *cdata;
> @@ -1433,30 +1463,18 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = tegra_dma_init_hw(tdma);
> +	if (ret)
> +		goto err_clk_unprepare;
> +
>  	pm_runtime_irq_safe(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  	if (!pm_runtime_enabled(&pdev->dev)) {
>  		ret = tegra_dma_runtime_resume(&pdev->dev);
>  		if (ret)
>  			goto err_clk_unprepare;

Jon, but isn't the RPM mandatory for all Tegra SoCs now and thus
guaranteed to be enabled? Maybe we should start to remove handling the
case of unavailable RPM from all Tegra drivers?

> -	} else {
> -		ret = pm_runtime_get_sync(&pdev->dev);
> -		if (ret < 0)
> -			goto err_pm_disable;
>  	}
>  
> -	/* Reset DMA controller */
> -	reset_control_assert(tdma->rst);
> -	udelay(2);
> -	reset_control_deassert(tdma->rst);
> -
> -	/* Enable global DMA registers */
> -	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
> -	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> -	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
> -
> -	pm_runtime_put(&pdev->dev);
> -
>  	INIT_LIST_HEAD(&tdma->dma_dev.channels);
>  	for (i = 0; i < cdata->nr_channels; i++) {
>  		struct tegra_dma_channel *tdc = &tdma->channels[i];
> @@ -1583,26 +1601,6 @@ static int tegra_dma_remove(struct platform_device *pdev)
>  static int tegra_dma_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -	unsigned int i;
> -
> -	tdma->reg_gen = tdma_read(tdma, TEGRA_APBDMA_GENERAL);
> -	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
> -		struct tegra_dma_channel *tdc = &tdma->channels[i];
> -		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
> -
> -		/* Only save the state of DMA channels that are in use */
> -		if (!tdc->config_init)
> -			continue;
> -
> -		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
> -		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
> -		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
> -		ch_reg->ahb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBSEQ);
> -		ch_reg->apb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBSEQ);
> -		if (tdma->chip_data->support_separate_wcount_reg)
> -			ch_reg->wcount = tdc_read(tdc,
> -						  TEGRA_APBDMA_CHAN_WCOUNT);
> -	}
>  
>  	clk_disable(tdma->dma_clk);
>  
> @@ -1612,46 +1610,51 @@ static int tegra_dma_runtime_suspend(struct device *dev)
>  static int tegra_dma_runtime_resume(struct device *dev)
>  {
>  	struct tegra_dma *tdma = dev_get_drvdata(dev);
> -	unsigned int i;
> -	int ret;
>  
> -	ret = clk_enable(tdma->dma_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "clk_enable failed: %d\n", ret);
> -		return ret;
> -	}
> +	return clk_enable(tdma->dma_clk);
> +}
>  
> -	tdma_write(tdma, TEGRA_APBDMA_GENERAL, tdma->reg_gen);
> -	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
> -	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFFul);
> +static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	unsigned long flags;
> +	unsigned int i;
> +	bool busy;
>  
>  	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
>  		struct tegra_dma_channel *tdc = &tdma->channels[i];
> -		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
> -
> -		/* Only restore the state of DMA channels that are in use */
> -		if (!tdc->config_init)
> -			continue;
> -
> -		if (tdma->chip_data->support_separate_wcount_reg)
> -			tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
> -				  ch_reg->wcount);
> -		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_reg->apb_seq);
> -		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_reg->apb_ptr);
> -		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBSEQ, ch_reg->ahb_seq);
> -		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, ch_reg->ahb_ptr);
> -		tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
> -			  ch_reg->csr & ~TEGRA_APBDMA_CSR_ENB);
> +
> +		spin_lock_irqsave(&tdc->lock, flags);
> +		busy = tdc->busy;
> +		spin_unlock_irqrestore(&tdc->lock, flags);
> +
> +		if (busy) {
> +			dev_err(tdma->dev, "channel %u busy\n", i);
> +			return -EBUSY;
> +		}
> +
> +		tasklet_kill(&tdc->tasklet);

I realized that it will be more robust to kill the tasklet before
checking the busy state because technically tasklet could issue new DMA
transfer, will correct it in v5.

>  	}
>  
> -	return 0;
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int __maybe_unused tegra_dma_dev_resume(struct device *dev)
> +{
> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = tegra_dma_init_hw(tdma);
> +	if (err)
> +		return err;
> +
> +	return pm_runtime_force_resume(dev);
>  }
>  
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
>  			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>  };
>  
>  static const struct of_device_id tegra_dma_of_match[] = {
> 
