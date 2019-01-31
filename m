From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 05:13:03 +0300
Message-ID: <f3282ada-56a8-b5c7-c400-38483eab2d06@gmail.com>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-3-git-send-email-skomatineni@nvidia.com>
 <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
 <BYAPR12MB3398B845E97674BE93CCD7D9C2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398B845E97674BE93CCD7D9C2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

31.01.2019 4:19, Sowjanya Komatineni пишет:
>>> +			dma_sync_single_for_device(i2c_dev->dev,
>>> +						   i2c_dev->dma_phys,
>>> +						   xfer_size,
>>> +						   DMA_FROM_DEVICE);
>>> +			ret = tegra_i2c_dma_submit(i2c_dev, xfer_size);
>>> +			if (ret < 0) {
>>> +				dev_err(i2c_dev->dev,
>>> +					"Starting RX DMA failed, err %d\n",
>>> +					ret);
>>> +				goto exit;
>>> +			}
>>> +		} else {
>>> +			chan = i2c_dev->tx_dma_chan;
>>> +			tegra_i2c_config_fifo_trig(i2c_dev, xfer_size,
>>> +						   DATA_DMA_DIR_TX);
>>> +			/* Make the dma buffer to read by cpu */> +			dma_sync_single_for_cpu(i2c_dev->dev,
>>> +						i2c_dev->dma_phys,
>>> +						xfer_size,
>>> +						DMA_TO_DEVICE);
>>
>> This is not correct, you need to call dma_sync_single_for_cpu() after completion of the transfer to give back dma buffer ownership to CPU, see below. This dma_sync_single_for_cpu() invocation should be removed.
> 
> Transfer is not done yet. Dma buffer ownership is given to CPU here before copying header bytes and msg bytes into dma buffer before actually transmitting
> 

In fact dma_sync_single_for_cpu(DMA_TO_DEVICE) is not needed at all because it is a NO-OP on ARM, but technically it is needed to conform to DMA API. I think it is more logical that device owns dma buffer only during of the actual DMA transfer, the rest of the time CPU should be owner of the buffer.

>>> +
>>> +		if (i2c_dev->msg_read) {
>>> +			if (likely(i2c_dev->msg_err == I2C_ERR_NONE)) {
>>> +				dma_sync_single_for_cpu(i2c_dev->dev,
>>> +							i2c_dev->dma_phys,
>>> +							xfer_size,
>>> +							DMA_FROM_DEVICE);
>>> +
>>> +				memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
>>> +					msg->len);
>>> +			}
>>> +		}
>>
>> Here you should give back dma buffer ownership to CPU:
> 
> After transfer is done, for msg reads, dma buffer ownership is given to CPU and read data from dma buffer is copied to msg buffer
> For msg writes, no need of ownership to CPU.
>>>
>>> 		else {
>>> 			dma_sync_single_for_cpu(i2c_dev->dev,
>>> 						i2c_dev->dma_phys,
>>> 						xfer_size,
>>> 						DMA_TO_DEVICE);
>>> 		}
>>
>>>  	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
>>>  						TEGRA_I2C_TIMEOUT);
>>>  	tegra_i2c_mask_irq(i2c_dev, int_mask);
>>>  
>>>  	if (time_left == 0) {
>>>  		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
>>> +		if (dma) {
>>> +			dmaengine_terminate_all(chan);
>>> +			complete(&i2c_dev->dma_complete);
>>> +		}
>>
>> DMA transfer has been completed at this point, hence this hunk isn't needed. Please remove it.
> 
> DMA complete alone doesn’t guarantee the transfer. Packets/All packets xfer interrupt from I2C confirms complete transaction along with dma complete check.
> So still need to check for msg_complete timeout. 

You're waiting for DMA completion and then for the I2C message completion.

Hence your code is structured like this:

1. Issue DMA transfer
2. Wait for DMA completion
3. Wait for message completion

Why do you need to abort DMA in 3 if it was already completed in 2?

>>> @@ -740,6 +925,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>  	u32 int_mask;
>>>  	unsigned long time_left;
>>>  	unsigned long flags;
>>> +	size_t xfer_size;
>>> +	u32 *buffer = 0;
>>> +	int ret = 0;
>>> +	bool dma = false;
>>> +
>>> +	if (msg->flags & I2C_M_RD)
>>> +		xfer_size = msg->len;
>>> +	else
>>> +		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
>>> +
>>> +	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
>>> +	dma = (xfer_size > I2C_PIO_MODE_MAX_LEN);
>>> +	if (dma) {
>>> +		if ((msg->flags & I2C_M_RD) && !i2c_dev->rx_dma_chan)
>>> +			ret = tegra_i2c_init_dma_param(i2c_dev, true);
>>> +		else if (!i2c_dev->tx_dma_chan)
>>> +			ret = tegra_i2c_init_dma_param(i2c_dev, false);
>>
>> In the comment to V3 I mentioned that it's not a good idea to request channels dynamically because suspend-resume order is based on devices registration order, in this case APB DMA must be probed before I2C. Please move channels allocation into the probe.
>>
>> This also raises the question about the need to register I2C driver from the subsys-init level because APB driver is getting registered from the module-init level and hence I2C probing will be deferred until APB DMA driver is registered. It looks to me that the subsys-init is a relict of the past and it should be fine to move I2C driver registration into the module-init level, of course it's not strictly necessary and could be done later on if desired.
>>
>>> +		if (ret < 0) {
>>> +			dev_dbg(i2c_dev->dev, "Switching to PIO mode\n");
>>> +			dma = false;
>>> +			ret = 0;
>>> +		}
>>> +	}
>>> +
>>> +	i2c_dev->is_curr_dma_xfer = dma;
>>
>>
> Since your previous feedback suggest "let's postpone channels requesting and dma_buf allocation until they are really needed", I thought it make sense to not request channels and allocate till DMA is needed.
> So moved from probe to xfer_msg function. By the time it gets to xfer msg function, devices registration should be done already along with apb dma probe.
> 
> 

Yes, I made that comment, but then corrected myself. Seems you missed the correction: https://lkml.org/lkml/2019/1/26/217

If you're having troubles with the corporate email, maybe you could try to switch to something else like gmail.

I've tried to apply this series locally, but again it fails to apply. What's the kernel base you're using? You should make your patches on top linux-next (preferably) or mainline.
