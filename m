From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 11/14] dmaengine: tegra-apb: Clean up suspend-resume
Date: Tue, 28 Jan 2020 17:53:05 +0300
Message-ID: <e245618c-6ae9-18d9-5671-1d6c0cf47a39@gmail.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-12-digetx@gmail.com>
 <7e0d2cfa-5570-93e6-e3dc-7d3f6902a528@gmail.com>
 <831d5e28-72df-3175-bfb6-b33985d93a52@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <831d5e28-72df-3175-bfb6-b33985d93a52-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.01.2020 17:10, Jon Hunter пишет:
> 
> On 21/01/2020 21:23, Dmitry Osipenko wrote:
>> 12.01.2020 20:30, Dmitry Osipenko пишет:
>>> It is enough to check whether hardware is busy on suspend and to reset
>>> it across of suspend-resume because channel's configuration is fully
>>> re-programmed on each DMA transaction anyways and because save-restore
>>> of an active channel won't end up well without pausing transfer prior to
>>> saving of the state (note that all channels shall be idling at the time of
>>> suspend, so save-restore is not needed at all).
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/dma/tegra20-apb-dma.c | 131 +++++++++++++++++-----------------
>>>  1 file changed, 67 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>> index b9d8e57eaf54..398a0e1d6506 100644
>>> --- a/drivers/dma/tegra20-apb-dma.c
>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>> @@ -1392,6 +1392,36 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
>>>  	.support_separate_wcount_reg = true,
>>>  };
>>>  
>>> +static int tegra_dma_init_hw(struct tegra_dma *tdma)
>>> +{
>>> +	int err;
>>> +
>>> +	err = reset_control_assert(tdma->rst);
>>> +	if (err) {
>>> +		dev_err(tdma->dev, "failed to assert reset: %d\n", err);
>>> +		return err;
>>> +	}
>>> +
>>> +	err = clk_enable(tdma->dma_clk);
>>> +	if (err) {
>>> +		dev_err(tdma->dev, "failed to enable clk: %d\n", err);
>>> +		return err;
>>> +	}
>>> +
>>> +	/* reset DMA controller */
>>> +	udelay(2);
>>> +	reset_control_deassert(tdma->rst);
>>> +
>>> +	/* enable global DMA registers */
>>> +	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
>>> +	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
>>> +	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFF);
>>> +
>>> +	clk_disable(tdma->dma_clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int tegra_dma_probe(struct platform_device *pdev)
>>>  {
>>>  	const struct tegra_dma_chip_data *cdata;
>>> @@ -1433,30 +1463,18 @@ static int tegra_dma_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> +	ret = tegra_dma_init_hw(tdma);
>>> +	if (ret)
>>> +		goto err_clk_unprepare;
>>> +
>>>  	pm_runtime_irq_safe(&pdev->dev);
>>>  	pm_runtime_enable(&pdev->dev);
>>>  	if (!pm_runtime_enabled(&pdev->dev)) {
>>>  		ret = tegra_dma_runtime_resume(&pdev->dev);
>>>  		if (ret)
>>>  			goto err_clk_unprepare;
>>
>> Jon, but isn't the RPM mandatory for all Tegra SoCs now and thus
>> guaranteed to be enabled? Maybe we should start to remove handling the
>> case of unavailable RPM from all Tegra drivers?
> 
> Yes that's true, even ARCH_TEGRA selects PM now

I already sent out v5 with the !RPM handling removed from the code,
please take a look at it.
