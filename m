From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Fri, 1 Feb 2019 23:30:55 +0300
Message-ID: <f0c4cc1b-4e3d-3956-7ac4-de35073fbf94@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <951cf1f5-ba3a-94ef-0399-2259effebc99@gmail.com>
 <BYAPR12MB339865C0876E1BF7278DC7C8C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339865C0876E1BF7278DC7C8C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.02.2019 23:21, Sowjanya Komatineni пишет:
> 
>> 	rx_chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
>> 	if (IS_ERR(rx_chan))
>> 		return PTR_ERR(rx_chan);
>>
>>
>>> +
>>> +	dma_chan = dma_request_slave_channel_reason(i2c_dev->dev, "tx");
>>> +	if (IS_ERR(dma_chan)) {
>>> +		err = PTR_ERR(dma_chan);
>>> +		goto error;
>>
>> It's a good practice to release resources in opposite order to the allocation. Hence better to write this as:
>>
>> 		goto err_release_rx;
>>
>>> +	}
>>> +
>>> +	i2c_dev->tx_dma_chan = dma_chan;
>>> +
>>> +	dma_buf = dma_alloc_coherent(i2c_dev->dev,
>>> +				     i2c_dev->dma_buf_size, &dma_phys,
>>> +				     GFP_KERNEL | __GFP_NOWARN);
>>> +
>>> +	if (!dma_buf) {
>>> +		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
>>> +		err = -ENOMEM;
>>> +		goto error;
>>
>> 		goto err_release_tx;
>>
>>> +	}
>>> +
>>> +	i2c_dev->dma_buf = dma_buf;
>>> +	i2c_dev->dma_phys = dma_phys;	

	i2c_dev->rx_dma_chan = rx_chan;
>> 	i2c_dev->tx_dma_chan = tx_chan;
>>
>>> +	return 0;
>>> +
>>> +error:
>>> +	if (i2c_dev->tx_dma_chan)
>>> +		dma_release_channel(i2c_dev->tx_dma_chan);
>>> +
>>> +	if (i2c_dev->rx_dma_chan)
>>> +		dma_release_channel(i2c_dev->rx_dma_chan);
>>
>> error_release_tx:
>> 	dma_release_channel(tx_chan);
>> error_release_rx:
>> 	dma_release_channel(rx_chan);
>>
>>> +
>>> +	return err;
> 
> I am releasing resources in reverse order to allocation.
> Trying for rx allocation followed by tx allocation
> During release releasing tx and then rx.
> In case if tx allocation fails, doesn’t go thru release. If rx or buf allocation fails, releases tx first and then rx
> 


Okay. Anyway it's a good-n-common practice to write it in the way I'm suggesting.

And please set rx_chan and tx_chan after dma_buf allocation as I'm suggesting because you current variant will crash kernel since if dma_buf allocation fails, both rx and tx channels will be released and you're not setting them to NULL in that case.
