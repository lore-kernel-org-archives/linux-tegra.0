From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V11 3/5] i2c: tegra: Add DMA support
Date: Tue, 5 Feb 2019 19:54:15 +0300
Message-ID: <fe894f51-b8fe-cd31-d0dc-feed8fb106cf@gmail.com>
References: <1549356985-25726-1-git-send-email-skomatineni@nvidia.com>
 <1549356985-25726-3-git-send-email-skomatineni@nvidia.com>
 <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com>
 <BYAPR12MB339828E77EB4D67906A5F0AEC26E0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339828E77EB4D67906A5F0AEC26E0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

05.02.2019 19:41, Sowjanya Komatineni пишет:
>> Please use "./scripts/checkpatch.pl --strict *.patch" and fix all its complains, but only those that really make sense. For example ignore the "CHECK: Lines should not end with a '('" warnings. 
>>
>> Here checkpatch recommends to use the BIT() macro:
>>
>> CHECK: Prefer using the BIT macro
>> #394: FILE: drivers/i2c/busses/i2c-tegra.c:136:
>> +#define DATA_DMA_DIR_TX                                (1 << 0)
>>
>> CHECK: Prefer using the BIT macro
>> #395: FILE: drivers/i2c/busses/i2c-tegra.c:137:
>> +#define DATA_DMA_DIR_RX                                (1 << 1)
> 
> I used checkpatch script, and it didn’t showed these errors. Probably checkpatch script versions are different. I am using the one from 5.0-rc4

Please notice the "--strict" flag, it makes checkpatch to report some extra warnings. 

>> +static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t 
>> +len) {
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	enum dma_transfer_direction dir;
>> +	struct dma_chan *chan;
>> +
>> +	dev_dbg(i2c_dev->dev, "starting DMA for length: %zu\n", len);
>> +	reinit_completion(&i2c_dev->dma_complete);
>> +	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
>> +	chan = i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_chan;
>> +	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
>> +					       len, dir, DMA_PREP_INTERRUPT |
>> +					       DMA_CTRL_ACK);
>> +	if (!dma_desc) {
>> +		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
>> +		return -EIO;
>>
>> Returning the -EIO is technically incorrect because there is no hardware failure here. The dmaengine_prep_slave_single() merely allocates the DMA descriptor, hence it should be either -EINVAL (preferably) or at least -ENOMEM.
>>
>> Oh, another important moment is that physically contiguous dma_buf allocation isn't guaranteed by the DMA API. This may become a problem for T186+ that can transfer up to 64K. We need to enforce the contiguous-allocation requirement by using > dma_alloc_attrs(DMA_ATTR_FORCE_CONTIGUOUS) instead of the dma_alloc_coherent(), please see my other comment below.
> 
> Failure returned from dma submit will be returned by i2c xfer message and using EIO here as dmaengine_prep_slave_single can result in multiple failures (invalid segment length,  failing dma desc allocation, dma length/memory check, no available dma sg-reg)
> As per I2C fault codes, EIO can be used indicating when something went wrong during performing IO operation.

Sounds wrong, IO failure means that error comes from hardware. In this case it comes from software.

> Using EINVAL doesn’t suit if failure is from allocation and using ENOMEM doesn’t suit if failure is due to length/memory, segment length check.

-EINVAL is the universal error code, suitable for such cases. We are expecting that dma_desc is not NULL, and it is the invalid value from our perspective if dma_desc is NULL. 

> Will use FORCE_CONTIGUOUS.
> 
> 
> 
>>> +	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
>>> +				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>>
>> Please use dma_alloc_attrs() instead of dma_alloc_coherent() because it could return a sparse allocation. This is especially troublesome > for ARM64 platforms because IOMMU_DOMAIN_DMA is used by default there. We need to explicitly ask for the contiguous allocation:
>>
>>
>> 	dma_buf = dma_alloc_attrs(i2c_dev->dev, i2c_dev->dma_buf_size,
>> 				  &dma_phys, GFP_KERNEL,
>> 				  DMA_ATTR_FORCE_CONTIGUOUS |
>> 				  DMA_ATTR_NO_WARN);
>>
> Will switch to use dma_alloc_attrs with CONTIGUOUS
>>
>>
>>
>>
>> CHECK: multiple assignments should be avoided
>> #763: FILE: drivers/i2c/busses/i2c-tegra.c:993:
>> +               i2c_dev->is_curr_dma_xfer = dma = false
>>
>> CHECK: Unnecessary parentheses around 'i2c_dev->msg_err == I2C_ERR_NONE'
>> #877: FILE: drivers/i2c/busses/i2c-tegra.c:1105:
>> +               if (i2c_dev->msg_read && (i2c_dev->msg_err == 
>> + I2C_ERR_NONE)) {
>> CHECK: Alignment should match open parenthesis
>> #883: FILE: drivers/i2c/busses/i2c-tegra.c:1111:
>>
>>
> Somehow Checkscript didn’t showed this either when I ran. Probably due to diff script versions. I am using the one from 5.0-rc4.
> 

Please use the "--strict" flag for checkpatch, it will show this warning.
