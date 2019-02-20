From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V19 5/7] i2c: tegra: Add DMA support
Date: Wed, 20 Feb 2019 21:05:18 +0300
Message-ID: <c3a2c691-c020-5c44-1b89-3fb31724b65f@gmail.com>
References: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
 <1549998408-9137-5-git-send-email-skomatineni@nvidia.com>
 <a98faf49-98f5-7b85-8acd-0fd6a4c8b426@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a98faf49-98f5-7b85-8acd-0fd6a4c8b426@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: wsa@the-dreams.de, peda@axentia.se, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

20.02.2019 21:02, Jon Hunter пишет:
> 
> On 12/02/2019 19:06, Sowjanya Komatineni wrote:
>> This patch adds DMA support for Tegra I2C.
>>
>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
>> transfer size of the max FIFO depth and DMA mode is used for
>> transfer size higher than max FIFO depth to save CPU overhead.
>>
>> PIO mode needs full intervention of CPU to fill or empty FIFO's
>> and also need to service multiple data requests interrupt for the
>> same transaction. This adds delay between data bytes of the same
>> transfer when CPU is fully loaded and some slave devices has
>> internal timeout for no bus activity and stops transaction to
>> avoid bus hang. DMA mode is helpful in such cases.
>>
>> DMA mode is also helpful for Large transfers during downloading or
>> uploading FW over I2C to some external devices.
>>
>> Tegra210 and prior Tegra chips use APBDMA driver which is replaced
>> with GPCDMA on Tegra186 and Tegra194.
>> This patch uses has_apb_dma flag in hw_feature to differentiate
>> DMA driver change between Tegra chipset.
>>
>> APBDMA driver is registered from module-init level and this patch
>> also has a change to register I2C driver at module-init level
>> rather than subsys-init to avoid deferring I2C probe till APBDMA
>> driver is registered.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> 
> ...
> 
>> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>> +{
>> +	struct dma_chan *chan;
>> +	u32 *dma_buf;
>> +	dma_addr_t dma_phys;
>> +	int err;
>> +
>> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA) ||
>> +	    !i2c_dev->hw->has_apb_dma) {
>> +		err = -ENODEV;
>> +		goto err_out;
>> +	}
>> +
>> +	chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
>> +	if (IS_ERR(chan)) {
>> +		err = PTR_ERR(chan);
>> +		goto err_out;
>> +	}
>> +
>> +	i2c_dev->rx_dma_chan = chan;
>> +
>> +	chan = dma_request_slave_channel_reason(i2c_dev->dev, "tx");
>> +	if (IS_ERR(chan)) {
>> +		err = PTR_ERR(chan);
>> +		goto err_out;
>> +	}
>> +
>> +	i2c_dev->tx_dma_chan = chan;
>> +
>> +	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
>> +				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>> +	if (!dma_buf) {
>> +		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
>> +		err = -ENOMEM;
>> +		goto err_out;
>> +	}
>> +
>> +	i2c_dev->dma_buf = dma_buf;
>> +	i2c_dev->dma_phys = dma_phys;
>> +	return 0;
>> +
>> +err_out:
>> +	tegra_i2c_release_dma(i2c_dev);
>> +	if (err != -EPROBE_DEFER) {
>> +		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
>> +		dev_err(i2c_dev->dev, "fallbacking to PIO\n");
>> +		return 0;
>> +	}
> I think that the above should be a dev_dbg print or re-worked in someway
> because now for Tegra194 which does not have an APB DMA I see ...
> 
> [       6.093234] ERR KERN tegra-i2c 31c0000.i2c: cannot use DMA: -19
> [       6.096847] ERR KERN tegra-i2c 31c0000.i2c: falling back to PIO
> 
> Given that the APB DMA is not supported for Tegra186/Tegra194, there is
> no point in printing these error messages. Now it looks like something
> is wrong but really it is not :-(

Jon, patches are welcome ;)
