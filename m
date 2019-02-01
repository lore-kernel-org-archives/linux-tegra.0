From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Fri, 1 Feb 2019 18:02:24 +0300
Message-ID: <50def69d-8068-3dec-491e-e3b32ba4f514@gmail.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <20190131124423.GG23438@ulmo> <20190201035249.5b1cdfe2@dimatab>
 <BYAPR12MB33986DDF4267ED1F499317B0C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
 <20190201061414.05443ea1@dimatab>
 <BYAPR12MB3398955CD0EDF40EB61D15B8C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398955CD0EDF40EB61D15B8C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.02.2019 7:19, Sowjanya Komatineni пишет:
>>>>>> +	if (dma) {
>>>>>> +		if (i2c_dev->msg_read) {
>>>>>> +			chan = i2c_dev->rx_dma_chan;
>>>>>> +			tegra_i2c_config_fifo_trig(i2c_dev,
>>>>>> xfer_size,
>>>>>> +
>>>>>> DATA_DMA_DIR_RX);
>>>>>> +
>>>>>> dma_sync_single_for_device(i2c_dev->dev, + i2c_dev->dma_phys,
>>>>>> +						   xfer_size,
>>>>>> +
>>>>>> DMA_FROM_DEVICE);
>>>>>
>>>>> Do we really need this? We're not actually passing the device any 
>>>>> data, so no caches to flush here. I we're cautious about flushing 
>>>>> caches when we do write to the buffer (and I think we do that 
>>>>> properly already), then there should be no need to do it here 
>>>>> again.
>>>>
>>>> IIUC, DMA API has a concept of buffer handing which tells to use
>>> dma_sync_single_for_device() before issuing hardware job that touches 
>>> the buffer and to use dma_sync_single_for_cpu() after hardware done 
>>> the execution. In fact the CPU caches are getting flushed or 
>>> invalidated as appropriate in a result.
>>>>
>>>> dma_sync_single_for_device(DMA_FROM_DEVICE) invalidates buffer in 
>>>> the CPU cache, probably to avoid CPU evicting data from cache to 
>>>> DRAM while hardware writes to the buffer. Hence this hunk is 
>>>> correct.
>>>>>> +			err = tegra_i2c_dma_submit(i2c_dev,
>>>>>> xfer_size);
>>>>>> +			if (err < 0) {
>>>>>> +				dev_err(i2c_dev->dev,
>>>>>> +					"starting RX DMA
>>>>>> failed, err %d\n",
>>>>>> +					err);
>>>>>> +				goto unlock;
>>>>>> +			}
>>>>>> +		} else {
>>>>>> +			chan = i2c_dev->tx_dma_chan;
>>>>>> +			tegra_i2c_config_fifo_trig(i2c_dev,
>>>>>> xfer_size,
>>>>>> +
>>>>>> DATA_DMA_DIR_TX);
>>>>>> +			dma_sync_single_for_cpu(i2c_dev->dev,
>>>>>> +
>>>>>> i2c_dev->dma_phys,
>>>>>> +						xfer_size,
>>>>>> +
>>>>>> DMA_TO_DEVICE);
>>>>>
>>>>> This, on the other hand seems correct because we need to 
>>>>> invalidate the caches for this buffer to make sure the data that 
>>>>> we put there doesn't get overwritten.
>>>>
>>>> As I stated before in a comment to v6, this particular case of
>>>> dma_sync_single_for_cpu() usage is incorrect because CPU should take 
>>>> ownership of the buffer after completion of hardwate job. But in 
>>>> fact dma_sync_single_for_cpu(DMA_TO_DEVICE) is a NO-OP because CPU 
>>>> doesn't need to flush or invalidate anything to take ownership of 
>>>> the buffer if hardware did a read-only access.
>>>>>   
>>>>>> +	if (!i2c_dev->msg_read) {
>>>>>> +		if (dma) {
>>>>>> +			memcpy(buffer, msg->buf, msg->len);
>>>>>> +
>>>>>> dma_sync_single_for_device(i2c_dev->dev, + i2c_dev->dma_phys,
>>>>>> +						   xfer_size,
>>>>>> +
>>>>>> DMA_TO_DEVICE);
>>>>>
>>>>> Again, here we properly flush the caches to make sure the data 
>>>>> that we've written to the DMA buffer is visible to the DMA engine.
>>>>>   
>>>>
>>>> +1 this is correct
>>>>
>>>>
>>>>  
>>>>>> +
>>>>>> +		if (i2c_dev->msg_read) {
>>>>>> +			if (likely(i2c_dev->msg_err ==
>>>>>> I2C_ERR_NONE)) {
>>>>>> +
>>>>>> dma_sync_single_for_cpu(i2c_dev->dev,
>>>>>> +
>>>>>> i2c_dev->dma_phys,
>>>>>> +
>>>>>> xfer_size, +
>>>>>> DMA_FROM_DEVICE);
>>>>>
>>>>> Here we invalidate the caches to make sure we don't get stale data 
>>>>> that may be in the caches for data that we're copying out of the 
>>>>> DMA buffer. I think that's about all the cache maintenance that we 
>>>>> real need.
>>>>
>>>> Correct.
>>>>
>>>> And technically here should be
>>>> dma_sync_single_for_cpu(DMA_TO_DEVICE) for the TX. But again, it's a 
>>>> NO-OP.
>>>
>>> Is my below understanding correct? Can you please confirm?
>>>
>>> During Transmit to device:
>>> - Before writing msg data into dma buf by CPU, giving DMA ownership to 
>>> CPU dma_sync_single_for_cpu with dir DMA_TO_DEVICE
>>>
>>
>> I tried to take a look at it again and now thinking that your variant is more correct. Still it's a bit difficult to judge because this case is no-op.
>>
>>> - After writing to dma buf by CPU, giving back the ownership to device 
>>> to access buffer to send during DMA transmit 
>>> dma_sync_single_for_device with dir DMA_TO_DEVICE
>>
>> Correct.
>>
>>> During Receiving from Device:
>>> - before submitting RX DMA to give buffer access to DMAengine
>>> 	dma_sync_single_for_Device(DMA_FROM_DEVICE)
>>
>> Correct.
>>
>>> - after DMA RX completion, giving dma ownership to CPU for reading 
>>> dmabuf data written by DMA from device dma_sync_single_for_cpu with 
>>> dir DMA_FROM_DEVICE
>>>
>>
>> Correct.
> 
> Then what I have is exact as mentioned above. So no changes needed related to dma_sync

Yes

> Pasting again here with clear comment to explain on why I have those corresponding dma_sync

If you're going to add these comments to the actual patch, then please add brief explanation of what actually syncing is doing.

> 
>         if (i2c_dev->msg_read) {
>             tegra_i2c_config_fifo_trig(i2c_dev, xfer_size,
>                            DATA_DMA_DIR_RX);
>             /* For Reads: giving dma buf ownership to device before submitting RX DMA */

This invalidates buffer in CPU caches to avoid buffer-data eviction from the caches to DRAM while hardware writes to the buffer.

>             dma_sync_single_for_device(i2c_dev->dev,
>                            i2c_dev->dma_phys,
>                            xfer_size,
>                            DMA_FROM_DEVICE);
>             err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
>             if (err < 0) {
>                 dev_err(i2c_dev->dev,
>                     "starting RX DMA failed, err %d\n",
>                     err);
>                 goto unlock;
>             }
>         } else {
>             tegra_i2c_config_fifo_trig(i2c_dev, xfer_size,
>                            DATA_DMA_DIR_TX);
>             /* For writes: giving dma buf ownership to CPU to copy transmit data to DMA Buf */

This is a NO-OP because there is no need to flush nor to invalidate CPU caches.

>             dma_sync_single_for_cpu(i2c_dev->dev,
>                         i2c_dev->dma_phys,
>                         xfer_size,
>                         DMA_TO_DEVICE);
>             buffer = i2c_dev->dma_buf;
>         }
> 
> 
> 
>     if (!msg->flags & I2C_M_RD) {
>         if (dma) {
>             memcpy(buffer, msg->buf, msg->len);
>             /* For writes: giving ownership to device after done with copying data to DMA Buf */

This flushes out buffer from CPU caches to DRAM.

>             dma_sync_single_for_device(i2c_dev->dev,
>                            i2c_dev->dma_phys,
>                            xfer_size,
>                            DMA_TO_DEVICE);
>             err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
>             if (err < 0) {
>                 dev_err(i2c_dev->dev,
>                     "starting TX DMA failed, err %d\n",
>                     err);
>                 goto unlock;
>             }
>         } else {
>             tegra_i2c_fill_tx_fifo(i2c_dev);
>         }
> 
>         if (i2c_dev->msg_read) {
>             if (likely(i2c_dev->msg_err == I2C_ERR_NONE)) {
>             /* For Reads: giving ownership to CPU after RX DMA completion to access read data */
>                 dma_sync_single_for_cpu(i2c_dev->dev,
>                             i2c_dev->dma_phys,
>                             xfer_size,
>                             DMA_FROM_DEVICE);

This invalidates buffer in CPU caches again, even though it shall be kept invalidated after dma_sync_single_for_device(DMA_FROM_DEVICE). So it's likely to be a mostly NO-OP in hardware. 

> 
>                 memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
>                     msg->len);
>             }
>         }
> 
> 
> 

Technically we could remove the NO-OP's, but I personally would prefer to keep them for consistency with the DMA API.
