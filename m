From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V11 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 23:02:26 +0300
Message-ID: <528ecd87-3f14-9e29-fb24-34802eeb0cb7@gmail.com>
References: <1549356985-25726-1-git-send-email-skomatineni@nvidia.com>
 <1549356985-25726-3-git-send-email-skomatineni@nvidia.com>
 <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com> <20190206145343.GA3651@ulmo>
 <5e66803c-b13b-cb00-e2ff-d096a1650612@gmail.com>
 <37987664-d354-4f89-cc60-9cc37ca87322@gmail.com>
 <BYAPR12MB33987640AE0D0C76ADB42BF1C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33987640AE0D0C76ADB42BF1C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 22:56, Sowjanya Komatineni пишет:
> 
>>>>> Oh, another important moment is that physically contiguous dma_buf 
>>>>> allocation isn't guaranteed by the DMA API. This may become a 
>>>>> problem for T186+ that can transfer up to 64K. We need to enforce 
>>>>> the contiguous-allocation requirement by using
>>>>> dma_alloc_attrs(DMA_ATTR_FORCE_CONTIGUOUS) instead of the 
>>>>> dma_alloc_coherent(), please see my other comment below.
>>>>
>>>> Actually I don't think that's necessary here. 
>>>> DMA_ATTR_FORCE_CONTIGUOUS only seems relevant if you've got an IOMMU 
>>>> attached to the device to make sure the physical memory is also contiguous.
>>>>
>>>> See this extract from Documentation/DMA-attributes.txt:
>>>>
>>>> | DMA_ATTR_FORCE_CONTIGUOUS
>>>> | -------------------------
>>>> | 
>>>> | By default DMA-mapping subsystem is allowed to assemble the buffer 
>>>> | allocated by dma_alloc_attrs() function from individual pages if it 
>>>> | can be mapped as contiguous chunk into device dma address space. By 
>>>> | specifying this attribute the allocated buffer is forced to be 
>>>> | contiguous also in physical memory.
>>>>
>>>> We don't have an IOMMU attached to I2C or APBDMA, so this can't 
>>>> happen and even if we had an IOMMU attached, all we care about is the 
>>>> device's DMA address space, which means IOVA space, and that would 
>>>> still be guaranteed to be contiguous, according to the above.
>>>
>>> Yes, but doesn't T186+ have IOMMU support for the DMA controller?
>>>
>>
>> Ah, sorry I probably skimmed way too quickly thorough the message. Hmm.. well, seems I was wrong.
>>
>> Sowjanya, after all looks like it should be fine to use the default dma_alloc_coherent() helper. Please put it back in v14.
> 
> Latest V14 uses dma_alloc_coherent along with below fixes.
> - Fixed fifo trig level to do register write with constructed value from scratch as flush is done prior to that and no other bits other than trig level. So writing value direct is simpler
> - Fixed to account DVC offset for FIFO register during dma slave config source and destination addresses
> - Also in 5th patch in series, updated to use interface timing flag in hw feature as tegra114 and prior doesn’t support interface timing register so allowing programming of timing register only for later tegra chips. Tegra114 and prior uses fixed TLOW and THIGH which are part of hw feature already.
> 
> Hopefully all fixes are in. Tested by forcing DMA only and PIO Only and also DMA/PIO back-to-back.

Thanks, I'll try it out tomorrow.
