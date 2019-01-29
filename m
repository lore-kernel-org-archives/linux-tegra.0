From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 3/3] i2c: tegra: Add DMA Support
Date: Tue, 29 Jan 2019 06:11:54 +0300
Message-ID: <778d578f-6bee-1acb-0562-6657ab4edb43@gmail.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
 <1548475073-12408-3-git-send-email-skomatineni@nvidia.com>
 <5973707c-555f-a27c-2ff3-e867d4b2cde7@gmail.com>
 <BYAPR12MB339874021C106E447529E887C2960@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB339837F4E341F7911F1E1E67C2970@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339837F4E341F7911F1E1E67C2970@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

29.01.2019 5:02, Sowjanya Komatineni пишет:
> 
> 
>>>> This patch adds DMA support for Tegra I2C.
>>>>
>>>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for 
>>>> transfer size of the max FIFO depth and DMA mode is used for 
>>>> transfer size higher than max FIFO depth to save CPU overhead.
>>>>
>>>> PIO mode needs full intervention of CPU to fill or empty FIFO's and 
>>>> also need to service multiple data requests interrupt for the same 
>>>> transaction adding overhead on CPU for large transfers.
>>>>
>>>> DMA mode is helpful for Large transfers during downloading or 
>>>> uploading FW over I2C to some external devices.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>
>>>> ---
>>>
>>> Seems there are good news, APB DMA could access IRAM. Quote from TRM: "The source may be DRAM or IRAM, and the destination location could be devices placed on > APB Bus; or vice versa". Hence it shall be much more efficient to use IRAM for the DMA buffer, please consider that variant.
>>>
>>
>> Regarding your request for Write Combined memory, it doesn’t guarantee the order.

The memory-access order doesn't matter at all in your case, all you need to care about is that actual data is read from dma-buffer and that caches are flushed after writing is done.

>> Main reason for adding DMA mode support to Tegra I2C driver is not for actual transfer performance but for not having delayed I2C transfer mainly in case of CPU fully loaded and I2C transfer during that time (FW upload/download, Sensor programming..) using PIO > mode introduces delay b/w bytes of transfer as it depends on CPU scheduling and interrupt priority which impacts on serving interrupts and filling FIFO for transfer to happen.
>>
>> Below are the cases where we see the need for DMA mode for I2C transfers (mainly during the use cases where CPU is fully loaded)
>> - Some devices need FW update over I2C and DMA mode helps in such large transfers on I2C reducing CPU intervention mainly when CPU is fully loaded.
>> - Some devices have internal timeout for no data activity on I2C bus after the start command (time restriction b/w data to data within single transaction) to avoid bus hang and they force to stop when timeout happens. with PIO mode in those cases, depending on CPU load, there could be more delay in serving interrupt for data requests and sending the data causing the device to trigger its timeout and transaction stops.
>> - Helps for reading data from I2C sensors with better BW.

Okay, since the efficiency between transfers is not the concern in your case, it doesn't really matter much where dma-buffer is located.

> Found from documentation default attribute is DMA_ATTR_WRITE_BARRIER which forces all pending writes to complete preventing race b/w completion notification and data DMA.
> Will use write-combined memory allocation for DMA buffer in revised patch..

Actually mapping is write-combined on ARM for the coherent DMA allocation with CONFIG_ARM_DMA_MEM_BUFFERABLE=y (enabled by default). I just falsely assumed that it could be writeback. Hence please keep the coherent allocation as-is. And you don't need to care about DMA_ATTR_WRITE_BARRIER, apparently it is only relevant for PCI on IA64.
